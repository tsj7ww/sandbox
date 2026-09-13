# Use Alpine Linux as the base image for a smaller footprint
FROM alpine:3.19

# Set Terraform version
ENV TERRAFORM_VERSION=1.7.0

# Install required packages
RUN apk add --no-cache \
    curl \
    bash \
    git \
    openssh-client \
    wget \
    unzip

# Download and install Terraform
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && mv terraform /usr/local/bin/ \
    && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Create working directory
WORKDIR /terraform

# Verify Terraform installation
RUN terraform version

# Set default command
CMD ["bash"]