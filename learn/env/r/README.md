# RStudio Server Docker Setup

This Docker setup provides a containerized RStudio Server environment with commonly used R packages pre-installed.

## Prerequisites
- Docker
- Docker Compose

## Directory Structure
```
.
├── Dockerfile
├── docker-compose.yml
├── .env
├── .dockerignore
├── .gitignore
├── README.md
├── workspace/
└── r-packages/
```

## Usage

1. Clone this repository
2. Edit the `.env` file to set a secure password
3. Run the container:
   ```bash
   docker-compose up -d
   ```
4. Access RStudio at http://localhost:8787
   - Username: rstudio
   - Password: (the one you set in .env)

## Customization

To install additional R packages, add them to the Dockerfile in the `install.packages()` command.

## Persistence

- The `workspace` directory is mounted as a volume and will persist your work
- The `r-packages` directory stores installed R packages