#!/bin/bash

# Create base directory and cd into it
mkdir -p package_name && cd package_name

# Create all directories (maintaining hierarchy)
mkdir -p \
    .github/ISSUE_TEMPLATE \
    .github/workflows \
    docs/_static \
    docs/_templates \
    docs/api \
    docs/examples \
    docs/tutorials \
    examples/basic \
    examples/advanced \
    src/your_package/{core,interfaces,utils,io,processing,cli} \
    tests/{unit,integration,data} \
    benchmarks/data \
    requirements \
    scripts

# Create empty files to maintain structure
touch \
    docs/conf.py \
    docs/index.rst \
    src/your_package/__init__.py \
    src/your_package/_version.py \
    src/your_package/_typing.py \
    src/your_package/_config.py \
    src/your_package/core/{__init__.py,base.py,exceptions.py,registry.py} \
    src/your_package/interfaces/{__init__.py,protocols.py} \
    src/your_package/utils/{__init__.py,decorators.py,validation.py,helpers.py} \
    src/your_package/io/{__init__.py,readers.py,writers.py} \
    src/your_package/processing/{__init__.py,pipeline.py,transforms.py} \
    src/your_package/cli/{__init__.py,commands.py} \
    tests/conftest.py \
    tests/unit/{test_core.py,test_utils.py} \
    tests/integration/test_pipeline.py \
    benchmarks/benchmarks.py \
    requirements/{base.txt,dev.txt,docs.txt,test.txt} \
    scripts/{lint.sh,build_docs.sh} \
    .gitignore \
    .pre-commit-config.yaml \
    pyproject.toml \
    setup.py \
    setup.cfg \
    MANIFEST.in \
    README.md \
    LICENSE \
    CHANGELOG.md

# Make scripts executable
chmod +x scripts/*.sh

echo "Package structure created in ./package_name"