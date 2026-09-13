# Use Python base image
FROM python:3.10-slim-bullseye

# Set environment variables
ENV PYTHONUNBUFFERED=1
# ENV STAN_HOME=/stan-models

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    # Stan packages
    # wget \
    # cmake \
    # gfortran \
    # libopenblas-dev \
    # liblapack-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Set up bash environment
COPY env/bashrc /root/.bashrc
ENV SHELL=/bin/bash

# Install Python packages
COPY env/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Install CmdStan
# RUN mkdir -p ${STAN_HOME} \
#     && wget https://github.com/stan-dev/cmdstan/releases/download/v2.32.2/cmdstan-2.32.2.tar.gz \
#     && tar -xzf cmdstan-2.32.2.tar.gz -C ${STAN_HOME} --strip-components=1 \
#     && rm cmdstan-2.32.2.tar.gz \
#     && cd ${STAN_HOME} \
#     && make build

# Set up CmdStan for PyStan
# RUN python -m cmdstanpy.install_cmdstan

# Expose ports
EXPOSE 8888 
# 8787 8786