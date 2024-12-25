# Use Ubuntu as the base image
FROM ubuntu:22.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    libgconf-2-4 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libgdk-pixbuf2.0-0 \
    libgtk-3-0 \
    libgbm1 \
    libnss3 \
    libxss1 \
    fonts-liberation \
    libasound2 \
    libx11-xcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxtst6 \
    xdg-utils \
    && rm -rf /var/lib/apt/lists/*

# Download and install Postman
RUN wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz \
    && tar -xzf postman.tar.gz \
    && rm postman.tar.gz \
    && mv Postman /opt/Postman

# Add Postman to PATH
ENV PATH="/opt/Postman:${PATH}"

# Create a non-root user to run Postman
RUN useradd -m postman
USER postman

# Set the working directory
WORKDIR /home/postman

# Command to run Postman
CMD ["postman"]