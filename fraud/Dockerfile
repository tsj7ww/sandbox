# Use an official Python runtime as a parent image
FROM python:3.10-slim-bullseye

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV POETRY_VERSION=1.7.1

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

# Add Poetry to PATH
ENV PATH="${PATH}:/root/.local/bin"

# Copy project files
COPY pyproject.toml poetry.lock* ./

# Install project dependencies
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi

# Install Jupyter Lab and IPython kernel
RUN poetry run pip install jupyterlab ipykernel

# Create a custom IPython kernel named 'fraud'
RUN poetry run python -m ipykernel install --user --name fraud --display-name "Fraud Detection Kernel"

# Copy the rest of the application
COPY . .

# Expose Jupyter Lab port
EXPOSE 8888

# Set up default command
CMD ["poetry", "run", "jupyter", "lab", "--ip", "0.0.0.0", "--port", "8888", "--no-browser", "--allow-root"]