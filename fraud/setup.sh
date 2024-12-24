#!/bin/bash

# Function to display usage information
usage() {
    echo "Usage: $0 {build|up|down|restart|jupyter}"
    exit 1
}

# Check if Docker and Docker Compose are installed
check_docker() {
    if ! command -v docker &> /dev/null; then
        echo "Docker is not installed. Please install Docker first."
        exit 1
    fi

    if ! command -v docker-compose &> /dev/null; then
        echo "Docker Compose is not installed. Please install Docker Compose first."
        exit 1
    fi
}

# Build Docker image
build() {
    check_docker
    echo "Building Docker image..."
    docker-compose build
}

# Start Docker containers
up() {
    check_docker
    echo "Starting Docker containers..."
    docker-compose up -d
}

# Stop Docker containers
down() {
    check_docker
    echo "Stopping Docker containers..."
    docker-compose down
}

# Restart Docker containers
restart() {
    down
    up
}

# Start Jupyter Lab
jupyter() {
    check_docker
    echo "Starting Jupyter Lab..."
    docker-compose exec ml-app poetry run jupyter lab --ip 0.0.0.0 --port 8888 --no-browser --allow-root
}

# Main script logic
case "$1" in
    build)
        build
        ;;
    up)
        up
        ;;
    down)
        down
        ;;
    restart)
        restart
        ;;
    jupyter)
        jupyter
        ;;
    *)
        usage
        ;;
esac

exit 0