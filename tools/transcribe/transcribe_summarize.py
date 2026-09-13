#!/usr/bin/env python3
"""
Local transcription (MLX Whisper on Apple Silicon) + cloud summarization (Claude API).

Usage:
    uv run transcribe_summarize.py lecture.m4a
    uv run transcribe_summarize.py lecture.m4a --model large-v3
    uv run transcribe_summarize.py lecture.m4a --transcribe-only
    uv run transcribe_summarize.py lecture.m4a --style detailed

    # Batch: every audio file in a directory, skipping ones already summarized
    uv run transcribe_summarize.py ./lectures/
    uv run transcribe_summarize.py ./lectures/ --recursive --force

Setup:
    brew install ffmpeg
    uv sync
    export ANTHROPIC_API_KEY="sk-ant-..."   # or: uv run --env-file .env ...

Outputs, written next to each audio file:
    <name>.transcript.txt   plain transcript
    <name>.transcript.srt   timestamped subtitles (optional, --srt)
    <name>.summary.md       Claude-generated summary
"""

from __future__ import annotations

import argparse
import os
import sys
import time
from pathlib import Path

# ----------------------------------------------------------------------------
# Configuration
# ----------------------------------------------------------------------------

# Whisper models available for MLX, roughly fastest -> most accurate.
WHISPER_MODELS = {
    "small": "mlx-community/whisper-small-mlx",
    "medium": "mlx-community/whisper-medium-mlx",
    "large-v3-turbo": "mlx-community/whisper-large-v3-turbo",  # recommended default
    "large-v3": "mlx-community/whisper-large-v3-mlx",
}

# Audio containers worth picking up in batch mode.
AUDIO_EXTS = {
    ".m4a", ".mp3", ".wav", ".aiff", ".aif", ".flac", ".aac", ".ogg",
    ".opus", ".mp4", ".m4b", ".mov", ".webm",
}

# Claude model used for summarization.
# claude-sonnet-5 has a 1M-token context window, so a 90-minute transcript
# (~25k tokens) fits comfortably in a single call with no chunking.
CLAUDE_MODEL = "claude-sonnet-5"

# On claude-sonnet-5 adaptive thinking is on by default, and max_tokens caps
# thinking AND prose together — so this has to cover both or a long "detailed"
# summary gets truncated mid-sentence. 16k is also the ceiling worth using
# without streaming; we stream anyway, which removes the HTTP-timeout risk.
MAX_OUTPUT_TOKENS = 16000

# Pricing per million tokens, used only for the cost estimate printout.
# Verify current rates at https://platform.claude.com/docs/en/about-claude/pricing
PRICE_INPUT_PER_MTOK = 3.00
PRICE_OUTPUT_PER_MTOK = 15.00

SUMMARY_PROMPTS = {
    "lecture": """You are summarizing a transcript of a recorded classroom lecture.

The transcript is machine-generated, so it may contain misheard words — especially
technical terms, proper names, and notation read aloud — along with missing
punctuation and no speaker labels. Correct obvious transcription errors silently
where the intended meaning is clear. Where a term is garbled and you cannot
recover it confidently, keep your best guess and mark it with [?] so it can be
checked against the recording.

Produce a Markdown summary with these sections:

## Overview
Two or three sentences: what this lecture covered, and how it connects to the
material around it if the instructor said so.

## Topics Covered
A `###` heading per major topic, in the order presented. Under each, explain the
substance and the reasoning — not just the labels. Preserve specifics: formulas,
figures, dates, names, notation. A student who missed the lecture should be able
to follow the argument from this alone.

## Key Concepts and Definitions
Bulleted. Term in **bold**, then the definition as the instructor actually gave
it, not a textbook definition you supply from your own knowledge.

## Worked Examples
Each problem worked through in class: the setup, the method chosen, the steps,
and the result. Keep the intermediate steps — this is the part students revisit
most, and it is the part a summary usually destroys.

## Assigned Work
Readings, problem sets, and deadlines, with dates where stated. Write "no date
given" rather than inferring one.

## Flagged for the Exam
Anything the instructor signalled as important, likely to be assessed, or a
common mistake to avoid. Quote their phrasing where the signal was explicit.

## Unclear or Garbled
Places where the audio or transcription broke down badly enough that the content
is unrecoverable. Give the surrounding context and an approximate position so it
can be checked against the recording. Write "None." if the transcript was clean.

Be concrete and specific. Do not pad with generic study advice, and do not add
material the instructor did not cover. If a section genuinely has no content,
write "None." under it rather than dropping the heading.""",
    "standard": """You are summarizing a transcript of a recorded session.

The transcript is machine-generated, so it may contain misheard words, missing
punctuation, and no speaker labels. Infer speaker changes and correct obvious
transcription errors silently where the intended meaning is clear.

Produce a Markdown summary with these sections:

## Overview
Two or three sentences on what this session was about and what it accomplished.

## Key Points
The substantive points discussed, as bullets, grouped by topic rather than in
strict chronological order. Include specifics: numbers, names, dates, decisions.

## Decisions Made
Anything that was actually settled. If nothing was decided, say so.

## Action Items
Bulleted, with the owner if one was named and the deadline if one was given.
Write "owner unclear" rather than guessing.

## Open Questions
Things raised but left unresolved.

Be concrete and specific. Do not pad with generic observations. If a section has
no content, write "None." under it rather than omitting it.""",
    "detailed": """You are summarizing a transcript of a recorded session.

The transcript is machine-generated, so it may contain misheard words, missing
punctuation, and no speaker labels. Infer speaker changes and correct obvious
transcription errors silently where the intended meaning is clear.

Produce a thorough Markdown summary:

## Overview
A paragraph on the purpose and outcome of the session.

## Detailed Notes
Walk through the substance topic by topic, with a `###` heading per topic. Under
each, capture the arguments made, the reasoning, any disagreement, and the
conclusion reached. Preserve specifics: figures, names, dates, technical detail.

## Decisions Made
## Action Items
## Open Questions

Aim for completeness over brevity — a reader who missed the session should be
able to follow what happened from this alone.""",
    "brief": """Summarize this machine-generated transcript in Markdown, tightly:

## Summary
Five bullets maximum covering what mattered.

## Action Items
Owner and deadline where stated, otherwise "owner unclear".

Nothing else. No preamble.""",
}


# ----------------------------------------------------------------------------
# Paths
# ----------------------------------------------------------------------------

def out_path(audio_path: Path, ext: str) -> Path:
    """Sibling output path for an audio file: lecture.m4a -> lecture<ext>."""
    return audio_path.with_name(audio_path.stem + ext)


def collect_audio(target: Path, recursive: bool) -> list[Path]:
    """Resolve a file-or-directory argument to a sorted list of audio files."""
    if target.is_file():
        return [target]

    walk = target.rglob("*") if recursive else target.iterdir()
    return sorted(
        p for p in walk
        if p.is_file() and p.suffix.lower() in AUDIO_EXTS
    )


# ----------------------------------------------------------------------------
# Transcription (local, free)
# ----------------------------------------------------------------------------

def format_timestamp(seconds: float) -> str:
    """Convert seconds to SRT timestamp format (HH:MM:SS,mmm)."""
    ms = int(round(seconds * 1000))
    hours, ms = divmod(ms, 3_600_000)
    minutes, ms = divmod(ms, 60_000)
    secs, ms = divmod(ms, 1000)
    return f"{hours:02d}:{minutes:02d}:{secs:02d},{ms:03d}"


def write_srt(segments: list[dict], path: Path) -> None:
    """Write Whisper segments out as an SRT subtitle file."""
    lines = []
    for i, seg in enumerate(segments, start=1):
        lines.append(str(i))
        lines.append(
            f"{format_timestamp(seg['start'])} --> {format_timestamp(seg['end'])}"
        )
        lines.append(seg["text"].strip())
        lines.append("")
    path.write_text("\n".join(lines), encoding="utf-8")


def transcribe(audio_path: Path, model_key: str, language: str | None,
               want_srt: bool) -> str:
    """Transcribe audio locally with MLX Whisper. Returns the transcript text."""
    try:
        import mlx_whisper
    except ImportError:
        sys.exit(
            "mlx-whisper is not installed.\n"
            "  uv sync\n"
            "(Requires an Apple Silicon Mac. Also run: brew install ffmpeg)"
        )

    repo = WHISPER_MODELS[model_key]
    print(f"Transcribing {audio_path.name} with {model_key} ...")
    print("(First run downloads the model — a few GB — and will take longer.)")

    started = time.time()
    result = mlx_whisper.transcribe(
        str(audio_path),
        path_or_hf_repo=repo,
        language=language,          # None = autodetect
        verbose=False,
        # Reduces the runaway-repetition failure mode on long recordings.
        condition_on_previous_text=False,
    )
    elapsed = time.time() - started

    text = result["text"].strip()
    print(f"Transcribed in {elapsed / 60:.1f} min — {len(text.split()):,} words.")

    transcript_path = out_path(audio_path, ".transcript.txt")
    transcript_path.write_text(text, encoding="utf-8")
    print(f"  -> {transcript_path}")

    if want_srt:
        srt_path = out_path(audio_path, ".transcript.srt")
        write_srt(result["segments"], srt_path)
        print(f"  -> {srt_path}")

    return text


# ----------------------------------------------------------------------------
# Summarization (Claude API)
# ----------------------------------------------------------------------------

def summarize(transcript: str, style: str, audio_path: Path) -> str:
    """Send the transcript to Claude and return a Markdown summary."""
    try:
        from anthropic import Anthropic
    except ImportError:
        sys.exit("anthropic is not installed.\n  uv sync")

    if not os.environ.get("ANTHROPIC_API_KEY"):
        sys.exit(
            "ANTHROPIC_API_KEY is not set.\n"
            '  export ANTHROPIC_API_KEY="sk-ant-..."\n'
            "Get a key at https://platform.claude.com/"
        )

    client = Anthropic()  # reads ANTHROPIC_API_KEY from the environment

    print(f"Summarizing with {CLAUDE_MODEL} ...")
    # Streaming avoids the HTTP-timeout ceiling on non-streaming requests, which
    # matters once max_tokens has to accommodate thinking as well as prose.
    with client.messages.stream(
        model=CLAUDE_MODEL,
        max_tokens=MAX_OUTPUT_TOKENS,
        # Explicit for the reader: this is already the default on sonnet-5, and
        # it is why max_tokens has to be generous.
        thinking={"type": "adaptive"},
        system=SUMMARY_PROMPTS[style],
        messages=[{
            "role": "user",
            "content": f"<transcript>\n{transcript}\n</transcript>",
        }],
    ) as stream:
        response = stream.get_final_message()

    # Thinking blocks are filtered out here — only prose reaches the file.
    summary = "".join(
        block.text for block in response.content if block.type == "text"
    )

    usage = response.usage
    cost = (
        usage.input_tokens / 1_000_000 * PRICE_INPUT_PER_MTOK
        + usage.output_tokens / 1_000_000 * PRICE_OUTPUT_PER_MTOK
    )
    print(
        f"Done — {usage.input_tokens:,} in / {usage.output_tokens:,} out "
        f"(~${cost:.3f})"
    )

    if response.stop_reason == "max_tokens":
        print(
            f"  !! Output hit the {MAX_OUTPUT_TOKENS:,}-token cap and is "
            f"truncated. Raise MAX_OUTPUT_TOKENS or use a shorter --style.",
            file=sys.stderr,
        )

    summary_path = out_path(audio_path, ".summary.md")
    summary_path.write_text(summary, encoding="utf-8")
    print(f"  -> {summary_path}")

    return summary


# ----------------------------------------------------------------------------
# Entry point
# ----------------------------------------------------------------------------

def process_one(audio: Path, args: argparse.Namespace,
                show_summary: bool) -> str:
    """Run one audio file through the pipeline. Returns 'done' or 'skipped'."""
    transcript_path = out_path(audio, ".transcript.txt")
    summary_path = out_path(audio, ".summary.md")
    srt_path = out_path(audio, ".transcript.srt")

    # The last artifact this invocation would produce. If it is already there,
    # there is nothing to do.
    final_path = transcript_path if args.transcribe_only else summary_path
    if final_path.exists() and not args.force:
        print(f"Skipping — {final_path.name} exists (--force to redo).")
        return "skipped"

    if args.summarize_only:
        if not transcript_path.exists():
            raise FileNotFoundError(f"no transcript at {transcript_path}")
        transcript = transcript_path.read_text(encoding="utf-8")
        print(f"Reusing {transcript_path.name} "
              f"({len(transcript.split()):,} words).")
    else:
        # Resuming an interrupted batch shouldn't pay for transcription twice,
        # but an existing transcript is no help if --srt still needs writing.
        reusable = (
            transcript_path.exists()
            and not args.force
            and not (args.srt and not srt_path.exists())
        )
        if reusable:
            transcript = transcript_path.read_text(encoding="utf-8")
            print(f"Reusing {transcript_path.name} "
                  f"({len(transcript.split()):,} words).")
        else:
            transcript = transcribe(audio, args.model, args.language, args.srt)

    if args.transcribe_only:
        return "done"

    if not transcript.strip():
        raise ValueError("transcript is empty — nothing to summarize")

    summary = summarize(transcript, args.style, audio)
    if show_summary:
        print("\n" + "=" * 70 + "\n")
        print(summary)
    return "done"


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Transcribe audio locally with MLX Whisper, "
                    "then summarize it with Claude.",
    )
    parser.add_argument(
        "audio", type=Path,
        help="Audio file, or a directory of audio files to process in batch",
    )
    parser.add_argument(
        "--model", default="large-v3-turbo", choices=list(WHISPER_MODELS),
        help="Whisper model (default: large-v3-turbo)",
    )
    parser.add_argument(
        "--style", default="lecture", choices=list(SUMMARY_PROMPTS),
        help="Summary style (default: lecture)",
    )
    parser.add_argument(
        "--recursive", "-r", action="store_true",
        help="When given a directory, descend into subdirectories",
    )
    parser.add_argument(
        "--force", action="store_true",
        help="Reprocess files that already have outputs",
    )
    parser.add_argument(
        "--language", default=None,
        help="Language code such as 'en'. Omit to autodetect. "
             "Setting it explicitly is slightly faster and more reliable.",
    )
    parser.add_argument(
        "--srt", action="store_true",
        help="Also write a timestamped .srt subtitle file",
    )
    parser.add_argument(
        "--transcribe-only", action="store_true",
        help="Skip the Claude summarization step",
    )
    parser.add_argument(
        "--summarize-only", action="store_true",
        help="Reuse the existing .transcript.txt instead of re-transcribing",
    )
    args = parser.parse_args()

    if args.transcribe_only and args.summarize_only:
        sys.exit("--transcribe-only and --summarize-only are contradictory.")

    if not args.audio.exists():
        sys.exit(f"Not found: {args.audio}")

    targets = collect_audio(args.audio, args.recursive)
    if not targets:
        sys.exit(
            f"No audio files in {args.audio}"
            f"{'' if args.recursive else ' (try --recursive)'}.\n"
            f"Recognized extensions: {', '.join(sorted(AUDIO_EXTS))}"
        )

    batch = len(targets) > 1
    if batch:
        print(f"Found {len(targets)} audio files.\n")

    counts = {"done": 0, "skipped": 0, "failed": 0}
    for i, audio in enumerate(targets, start=1):
        if batch:
            print(f"[{i}/{len(targets)}] {audio.name}")
            print("-" * 70)
        try:
            # In batch, printing every summary to stdout buries the progress.
            status = process_one(audio, args, show_summary=not batch)
        except KeyboardInterrupt:
            raise
        except Exception as exc:
            # One bad file shouldn't abandon the rest of the semester.
            print(f"  !! failed: {exc}", file=sys.stderr)
            status = "failed"
        counts[status] += 1
        if batch:
            print()

    if batch:
        print("=" * 70)
        print(f"{counts['done']} done, {counts['skipped']} skipped, "
              f"{counts['failed']} failed.")
    if counts["failed"]:
        sys.exit(1)


if __name__ == "__main__":
    main()
