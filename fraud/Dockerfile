# Base image with Python
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install essential system tools and shell packages
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    vim \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Clone a GitHub repository
RUN git clone https://github.com/<username>/<repo-name>.git /app/repo

# Install Python packages
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Install JupyterLab
RUN pip install jupyterlab

# Expose the JupyterLab default port
EXPOSE 8888

# Set entrypoint to bash
CMD ["bash"]