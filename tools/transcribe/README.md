# transcribe

Transcribe lecture audio locally with MLX Whisper (Apple Silicon / Metal), then
summarize it with the Claude API.

Transcription runs entirely on-device and is free. Only the summary step calls
out to the network.

## Requirements

- Apple Silicon Mac (MLX uses Metal; see [Why not Docker](#why-not-docker))
- `ffmpeg` on `PATH` — `brew install ffmpeg`
- `uv` — `brew install uv`
- A Claude API key, for the summarize step only

## Setup

.env
```bash
ANTHROPIC_API_KEY="sk-ant-..."
```

`.env` is gitignored; `.env.example` is **not**, so never put a real key there.

`uv sync` builds `.venv/` from `uv.lock`, which pins all 66 transitive
dependencies by hash. No manual venv activation is needed — `uv run` uses it
automatically.

## Usage

```bash
uv run --env-file .env python transcribe_summarize.py lecture.m4a
uv run --env-file .env python transcribe_summarize.py lecture.m4a --model large-v3
uv run --env-file .env python transcribe_summarize.py lecture.m4a --style detailed
uv run --env-file .env python transcribe_summarize.py lecture.m4a --srt --transcribe-only
uv run --env-file .env python transcribe_summarize.py lecture.m4a --summarize-only
```

Outputs are written next to the audio file:

| File | Contents |
| --- | --- |
| `<name>.transcript.txt` | Plain transcript |
| `<name>.transcript.srt` | Timestamped subtitles (`--srt` only) |
| `<name>.summary.md` | Claude-generated summary |

Passing `--language en` is slightly faster and more reliable than autodetection.

### Batch mode

Pass a directory instead of a file. Files that already have their final output
are skipped, so an interrupted run resumes cheaply:

```bash
uv run --env-file .env python transcribe_summarize.py ./lectures/
uv run --env-file .env python transcribe_summarize.py ./lectures/ --recursive
uv run --env-file .env python transcribe_summarize.py ./lectures/ --force
```

- Recognized audio: `.m4a .mp3 .wav .aiff .aif .flac .aac .ogg .opus .mp4 .m4b .mov .webm`. Everything else in the directory is ignored.
- `--recursive` descends into subdirectories; without it only the top level is read.
- An existing transcript is reused rather than re-transcribed, so a batch that
  died partway through the summarize step doesn't redo the expensive half.
- `--force` reprocesses everything regardless.
- One bad file logs a failure and the batch continues. Exit status is `1` if
  anything failed, so this is safe to drive from a script.

### Styles

`--style` selects the summary prompt:

| Style | Shape |
| --- | --- |
| `lecture` (default) | Topics, key concepts and definitions, worked examples, assigned work, exam flags, garbled-audio notes |
| `standard` | Meeting-shaped: key points, decisions, action items, open questions |
| `detailed` | Same as `standard` but exhaustive, with a `###` section per topic |
| `brief` | Five bullets and action items, nothing else |

`standard`, `detailed`, and `brief` are meeting-shaped and will mostly emit
"None." under *Decisions Made* and *Action Items* for a lecture recording.

### Models

`--model` selects the Whisper checkpoint, fastest to most accurate:
`small`, `medium`, `large-v3-turbo` (default), `large-v3`.

Checkpoints download from Hugging Face on first use and are cached in
`~/.cache/huggingface`. `large-v3-turbo` is roughly 1.5 GB, so the first run of
a given model is much slower than subsequent ones.

### Summary token budget

`claude-sonnet-5` runs adaptive thinking by default, and `max_tokens` caps
thinking *and* prose together — so a budget sized only for the visible summary
can truncate it mid-sentence. `MAX_OUTPUT_TOKENS` is set to 16,000 to cover
both, and the request streams, which removes the HTTP-timeout ceiling that
applies to large non-streaming requests.

If a summary is ever cut off, the script says so explicitly on stderr rather
than leaving you to notice a half-finished file.

## Reproducibility

- `pyproject.toml` declares direct dependencies and the supported Python range.
- `uv.lock` pins the full resolved graph. **Commit it.** It is what makes
  `uv sync` reproducible across machines and over time.
- `.venv/` is gitignored and disposable — delete and re-`uv sync` at any time.

To update dependencies deliberately: `uv lock --upgrade && uv sync`.

`ffmpeg` is a system dependency and is *not* covered by the lockfile — it is
installed via Homebrew and can drift independently.

## Why not Docker

MLX requires Metal. Docker Desktop on macOS runs a Linux VM with no Metal
passthrough, so a containerized `mlx-whisper` silently falls back to its CPU
backend and loses most of its speed — it does not error, it just gets slow.

`mlx` does publish Linux wheels, so the container would *build and run*. That is
exactly what makes the trap easy to fall into.

If portability ever matters more than speed, the fix is a second transcription
backend (`faster-whisper` / CTranslate2, which is CPU-first and containerizes
cleanly) selected at runtime, rather than trying to containerize MLX.
