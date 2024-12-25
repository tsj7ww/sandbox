# Use Ubuntu as base image
FROM ubuntu:22.04

# Set kubectl version
ENV KUBECTL_VERSION=1.29.0

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install essential packages
RUN apt-get update && apt-get install -y \
    curl \
    git \
    bash \
    wget \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl" \
    && chmod +x kubectl \
    && mv kubectl /usr/local/bin/

# Install Helm
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# Install k9s for better cluster management (optional but useful)
RUN wget https://github.com/derailed/k9s/releases/latest/download/k9s_Linux_amd64.tar.gz \
    && tar -xf k9s_Linux_amd64.tar.gz \
    && mv k9s /usr/local/bin/ \
    && rm k9s_Linux_amd64.tar.gz

# Create .kube directory for config
RUN mkdir -p /root/.kube

# Set working directory
WORKDIR /k8s

# Verify installations
RUN kubectl version --client \
    && helm version \
    && k9s version

# Default command
CMD ["bash"]