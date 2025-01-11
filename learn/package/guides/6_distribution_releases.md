# Python Package Distribution and Release Management: Comprehensive Guide

## Package Distribution Structure

### 1. Package Configuration Files

#### Project Configuration
```toml
# pyproject.toml
[build-system]
requires = ["setuptools>=45", "wheel", "build"]
build-backend = "setuptools.build_meta"

[project]
name = "your-package"
dynamic = ["version"]
description = "Your package description"
authors = [
    {name = "Your Name", email = "your.email@example.com"},
]
license = {text = "MIT"}
requires-python = ">=3.8"
classifiers = [
    "Development Status :: 5 - Production/Stable",
    "Intended Audience :: Developers",
    "License :: OSI Approved :: MIT License",
    "Programming Language :: Python :: 3",
    "Programming Language :: Python :: 3.8",
    "Programming Language :: Python :: 3.9",
    "Programming Language :: Python :: 3.10",
    "Operating System :: OS Independent",
    "Topic :: Software Development :: Libraries :: Python Modules",
]

dependencies = [
    "numpy>=1.20",
    "pandas>=1.3",
    "scikit-learn>=1.0",
]

[project.optional-dependencies]
dev = [
    "pytest>=6.0",
    "pytest-cov>=2.0",
    "black>=22.0",
    "mypy>=0.900",
]

[project.urls]
Homepage = "https://github.com/username/your-package"
Documentation = "https://your-package.readthedocs.io"
Repository = "https://github.com/username/your-package.git"
Changelog = "https://github.com/username/your-package/blob/main/CHANGELOG.md"

[tool.setuptools]
packages = ["your_package"]
```

#### Package Manifest
```
# MANIFEST.in
include LICENSE
include README.md
include CHANGELOG.md
include pyproject.toml

recursive-include your_package *.py
recursive-include your_package/data *.json *.csv
recursive-include docs *.rst *.py *.bat *.csv
recursive-include tests *.py *.json

prune docs/_build
prune .github
prune .pytest_cache
```

### 2. Version Management

#### Version File
```python
# your_package/_version.py
import re
from typing import Tuple

__version__ = "1.2.3"

def parse_version(version_str: str) -> Tuple[int, int, int]:
    """Parse version string into major, minor, patch components."""
    match = re.match(r"(\d+)\.(\d+)\.(\d+)", version_str)
    if not match:
        raise ValueError(f"Invalid version string: {version_str}")
    return tuple(map(int, match.groups()))

def get_version() -> str:
    """Get the current version string."""
    return __version__

def is_compatible(required_version: str) -> bool:
    """Check if current version is compatible with required version."""
    current = parse_version(__version__)
    required = parse_version(required_version)
    
    # Major version must match
    if current[0] != required[0]:
        return False
    
    # Current minor version must be >= required
    if current[1] < required[1]:
        return False
    
    # If minor versions match, current patch must be >= required
    if current[1] == required[1] and current[2] < required[2]:
        return False
    
    return True
```

### 3. Release Process

#### Release Workflow
```python
# tools/release.py
import subprocess
from pathlib import Path
from typing import Optional

def update_version(version_type: str = 'patch') -> str:
    """Update version number in _version.py."""
    version_file = Path('your_package/_version.py')
    content = version_file.read_text()
    
    # Extract current version
    import re
    match = re.search(r'__version__ = ["\']([^"\']+)["\']', content)
    current = match.group(1)
    major, minor, patch = map(int, current.split('.'))
    
    # Update version
    if version_type == 'major':
        major += 1
        minor = patch = 0
    elif version_type == 'minor':
        minor += 1
        patch = 0
    else:  # patch
        patch += 1
    
    new_version = f'{major}.{minor}.{patch}'
    new_content = content.replace(f'__version__ = "{current}"',
                                f'__version__ = "{new_version}"')
    version_file.write_text(new_content)
    return new_version

def update_changelog(version: str, changes: str) -> None:
    """Update CHANGELOG.md with new version information."""
    changelog = Path('CHANGELOG.md')
    content = changelog.read_text()
    
    # Add new version section
    new_section = f"\n## [{version}] - {datetime.date.today()}\n\n{changes}\n"
    content = content.replace("# Changelog\n", f"# Changelog\n{new_section}")
    changelog.write_text(content)

def create_release(version_type: str = 'patch',
                  changes: Optional[str] = None) -> None:
    """Create a new release."""
    # Update version
    new_version = update_version(version_type)
    
    # Update changelog
    if changes:
        update_changelog(new_version, changes)
    
    # Commit changes
    subprocess.run(['git', 'add', '.'])
    subprocess.run(['git', 'commit', '-m', f'Release version {new_version}'])
    
    # Create tag
    subprocess.run(['git', 'tag', f'v{new_version}'])
    
    # Push changes
    subprocess.run(['git', 'push', 'origin', 'main'])
    subprocess.run(['git', 'push', 'origin', f'v{new_version}'])
```

## Distribution Best Practices

### 1. Package Organization

#### Directory Structure Best Practices
- Keep source in `src/` directory
- Separate tests from source
- Include necessary package data
- Maintain clear documentation
- Version control configuration

#### Package Data Management
```python
# setup.py
from setuptools import setup

setup(
    # ... other configuration ...
    package_data={
        'your_package': [
            'data/*.json',
            'data/*.csv',
            'config/*.yaml',
        ],
    },
    include_package_data=True,
)
```

### 2. Distribution Strategy

#### Build Process
```python
# tools/build.py
import shutil
from pathlib import Path
import subprocess

def clean_build():
    """Clean build directories."""
    dirs_to_clean = ['build', 'dist', '*.egg-info']
    for pattern in dirs_to_clean:
        for path in Path('.').glob(pattern):
            if path.is_dir():
                shutil.rmtree(path)
            else:
                path.unlink()

def build_package():
    """Build package distributions."""
    clean_build()
    
    # Build distributions
    subprocess.run(['python', '-m', 'build'])
    
    # Verify distributions
    subprocess.run(['twine', 'check', 'dist/*'])

def publish_package():
    """Publish package to PyPI."""
    subprocess.run(['twine', 'upload', 'dist/*'])
```

### 3. Release Management

#### Release Checklist
```python
# tools/release_checklist.py
import subprocess
from pathlib import Path

class ReleaseChecker:
    def __init__(self):
        self.checks = []
        self.errors = []

    def run_tests(self):
        """Run test suite."""
        result = subprocess.run(['pytest'], capture_output=True)
        if result.returncode != 0:
            self.errors.append("Tests failed")

    def check_style(self):
        """Check code style."""
        result = subprocess.run(['black', '--check', '.'], capture_output=True)
        if result.returncode != 0:
            self.errors.append("Code style check failed")

    def verify_docs(self):
        """Verify documentation builds."""
        result = subprocess.run(['sphinx-build', '-b', 'html', 'docs', 'docs/_build/html'])
        if result.returncode != 0:
            self.errors.append("Documentation build failed")

    def check_changelog(self):
        """Verify changelog is updated."""
        changelog = Path('CHANGELOG.md')
        if not changelog.exists():
            self.errors.append("Changelog file missing")

    def run_checks(self):
        """Run all pre-release checks."""
        self.run_tests()
        self.check_style()
        self.verify_docs()
        self.check_changelog()
        
        if self.errors:
            print("Release checks failed:")
            for error in self.errors:
                print(f"- {error}")
            return False
        return True
```

## Advanced Distribution Topics

### 1. Continuous Delivery

#### Automated Release Pipeline
```yaml
# .github/workflows/release.yml
name: Release

on:
  push:
    tags:
      - 'v*'

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.10'
          
      - name: Install dependencies
        run: |
          python -m pip install --upgrade pip
          pip install build twine
          
      - name: Build and publish
        env:
          TWINE_USERNAME: __token__
          TWINE_PASSWORD: ${{ secrets.PYPI_API_TOKEN }}
        run: |
          python -m build
          twine upload dist/*
```

### 2. Multi-platform Support

#### Platform-specific Dependencies
```python
# setup.py
import sys
from setuptools import setup

extra_dependencies = {}

if sys.platform.startswith('win'):
    extra_dependencies['windows'] = ['pywin32']
elif sys.platform.startswith('linux'):
    extra_dependencies['linux'] = ['python-systemd']
elif sys.platform.startswith('darwin'):
    extra_dependencies['macos'] = ['pyobjc-framework-Cocoa']

setup(
    # ... other configuration ...
    extras_require=extra_dependencies,
)
```

### 3. Binary Distribution

#### Binary Build Configuration
```ini
# setup.cfg
[bdist_wheel]
universal = 0

[build_ext]
inplace = 1
```

## Distribution Security

### 1. Package Signing

#### GPG Signing Configuration
```ini
# .pypirc
[distutils]
index-servers =
    pypi
    testpypi

[pypi]
username: __token__
password: <your-token>
sign: true
identity: <your-gpg-identity>

[testpypi]
repository: https://test.pypi.org/legacy/
username: __token__
password: <your-test-token>
```

### 2. Dependency Security

#### Requirements Scanning
```python
# tools/check_dependencies.py
import subprocess
from typing import List, Tuple

def scan_dependencies() -> List[Tuple[str, str]]:
    """Scan dependencies for security issues."""
    result = subprocess.run(['safety', 'check'], capture_output=True, text=True)
    
    vulnerabilities = []
    if result.returncode != 0:
        for line in result.stdout.splitlines():
            if ' discovered in ' in line:
                package = line.split(' discovered in ')[1].split(' version ')[0]
                version = line.split(' version ')[1].split()[0]
                vulnerabilities.append((package, version))
    
    return vulnerabilities
```

## Best Practices Summary

### 1. Version Management
- Use semantic versioning
- Maintain changelog
- Tag releases
- Document compatibility

### 2. Distribution Process
- Clean builds
- Version verification
- Documentation updates
- Security checks

### 3. Release Strategy
- Regular releases
- Clear process
- Automated checks
- User communication

### 4. Security Considerations
- Package signing
- Dependency scanning
- Security advisories
- Access control