# Use Ubuntu as the base image
FROM ubuntu:22.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install git
RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set up git config (customize these as needed)
RUN git config --global init.defaultBranch main

# Create a non-root user
RUN useradd -m developer
USER developer
WORKDIR /home/developer

# Default command
CMD ["bash"]