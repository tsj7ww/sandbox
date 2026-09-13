# Python Development Environment and Tools: Professional Setup Guide

## Development Environment Foundation

### 1. Python Version Management

#### Pyenv
The foundation of version management:
```bash
# Installation structure
~/.pyenv/
├── versions/          # Python versions
├── shims/            # Command shims
└── plugins/          # Pyenv plugins
```

**Key Features:**
- Multiple Python versions
- Project-specific versions
- Automatic version switching
- Virtual environment integration

**Best Practices:**
- Use `.python-version` file per project
- Install latest stable releases
- Keep global packages minimal
- Include version in CI/CD

### 2. Virtual Environment Management

#### Poetry
Modern dependency management:
```toml
[tool.poetry]
name = "your-package"
version = "0.1.0"
description = ""
authors = ["Your Name <your.email@example.com>"]

[tool.poetry.dependencies]
python = "^3.8"
numpy = "^1.20"

[tool.poetry.group.dev.dependencies]
pytest = "^7.0"
black = "^22.0"
```

**Key Features:**
- Dependency resolution
- Lock file management
- Build system integration
- Publishing workflow

#### Virtualenv/venv
Traditional virtual environment:
```
.venv/
├── bin/           # Executables
├── include/       # Header files
└── lib/           # Python packages
```

### 3. IDE Configuration

#### VSCode Setup
```json
{
    "python.defaultInterpreterPath": "${workspaceFolder}/.venv/bin/python",
    "python.linting.enabled": true,
    "python.linting.pylintEnabled": true,
    "python.formatting.provider": "black",
    "editor.formatOnSave": true,
    "python.testing.pytestEnabled": true
}
```

#### PyCharm Configuration
Professional IDE setup:
- Project interpreter
- Test runners
- Debugger
- Code analysis

## Development Tools

### 1. Code Quality Tools

#### Linting
```ini
# .flake8
[flake8]
max-line-length = 88
extend-ignore = E203
per-file-ignores =
    __init__.py:F401
exclude =
    .git,
    __pycache__,
    build,
    dist
```

**Tools Stack:**
- Flake8: Style guide enforcement
- Pylint: Code analysis
- mypy: Static type checking
- bandit: Security linting

#### Formatting
```toml
# pyproject.toml
[tool.black]
line-length = 88
target-version = ['py38']
include = '\.pyi?$'

[tool.isort]
profile = "black"
multi_line_output = 3
```

**Tools:**
- Black: Code formatting
- isort: Import sorting
- docformatter: Docstring formatting

### 2. Testing Tools

#### Pytest Configuration
```ini
# pytest.ini
[pytest]
testpaths = tests
python_files = test_*.py
python_functions = test_*
addopts = 
    --verbose
    --cov=your_package
    --cov-report=term-missing
    --cov-report=xml
```

**Testing Stack:**
- pytest: Test runner
- pytest-cov: Coverage reporting
- pytest-xdist: Parallel testing
- pytest-benchmark: Performance testing

### 3. Documentation Tools

#### Sphinx Setup
```python
# conf.py
extensions = [
    'sphinx.ext.autodoc',
    'sphinx.ext.napoleon',
    'sphinx.ext.viewcode',
    'sphinx_rtd_theme',
]

html_theme = 'sphinx_rtd_theme'
```

**Documentation Stack:**
- Sphinx: Documentation generator
- MyST: Markdown support
- sphinx-autoapi: API documentation
- sphinx-gallery: Example gallery

### 4. Pre-commit Hooks

```yaml
# .pre-commit-config.yaml
repos:
  - repo: https://github.com/psf/black
    rev: 22.3.0
    hooks:
      - id: black
        language_version: python3.8

  - repo: https://github.com/PyCQA/flake8
    rev: 4.0.1
    hooks:
      - id: flake8
        additional_dependencies: [flake8-docstrings]

  - repo: https://github.com/pre-commit/mirrors-mypy
    rev: v0.950
    hooks:
      - id: mypy
        additional_dependencies: [types-all]
```

## Development Workflow Integration

### 1. Continuous Integration

#### GitHub Actions
```yaml
name: CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        python-version: [3.8, 3.9, "3.10"]

    steps:
    - uses: actions/checkout@v2
    - name: Set up Python
      uses: actions/setup-python@v2
      with:
        python-version: ${{ matrix.python-version }}
    - name: Install dependencies
      run: |
        pip install poetry
        poetry install
    - name: Run tests
      run: poetry run pytest
```

### 2. Development Database

#### Docker Development Database
```yaml
# docker-compose.yml
version: '3.8'
services:
  dev_db:
    image: postgres:13
    environment:
      POSTGRES_DB: dev_db
      POSTGRES_USER: dev_user
      POSTGRES_PASSWORD: dev_password
    ports:
      - "5432:5432"
    volumes:
      - dev_db_data:/var/lib/postgresql/data

volumes:
  dev_db_data:
```

### 3. Debugging Tools

#### VS Code Launch Configuration
```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Python: Current File",
            "type": "python",
            "request": "launch",
            "program": "${file}",
            "console": "integratedTerminal",
            "justMyCode": false
        },
        {
            "name": "Python: Debug Tests",
            "type": "python",
            "request": "launch",
            "program": "${workspaceFolder}/.venv/bin/pytest",
            "args": [
                "-v",
                "tests/"
            ],
            "console": "integratedTerminal",
            "justMyCode": false
        }
    ]
}
```

## Best Practices

### 1. Environment Management
- Use virtual environments consistently
- Document environment setup
- Version lock dependencies
- Regular dependency updates

### 2. Code Quality
- Automated code formatting
- Consistent style enforcement
- Type checking
- Security scanning

### 3. Testing
- Comprehensive test coverage
- Regular test execution
- Performance benchmarking
- Integration testing

### 4. Documentation
- API documentation
- Usage examples
- Development guides
- Change logs

### 5. Version Control
- Branching strategy
- Code review process
- Commit message standards
- Release tagging

### 6. Continuous Integration
- Automated testing
- Code quality checks
- Documentation builds
- Release automation

## Tool Selection Guide

### 1. Core Tools (Required)
- Version Control: Git
- Package Manager: Poetry/pip
- Virtual Environment: venv/virtualenv
- Test Runner: pytest

### 2. Code Quality (Recommended)
- Formatter: Black
- Linter: Flake8
- Type Checker: mypy
- Import Sorter: isort

### 3. Documentation (Recommended)
- Generator: Sphinx
- API Docs: sphinx-autoapi
- Examples: sphinx-gallery
- Markdown: MyST

### 4. Development (Optional)
- Debugger: pdb/ipdb
- Profiler: cProfile
- Benchmark: pytest-benchmark
- Coverage: pytest-cov