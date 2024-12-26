#!/bin/bash

# Exit on any error
set -e

# Function to create directory and its parent directories
create_dir() {
    mkdir -p "$1"
    echo "Created directory: $1"
}

# Function to create an empty file
create_file() {
    touch "$1"
    echo "Created file: $1"
}

# GitHub workflows
create_dir ".github/workflows"
create_file ".github/workflows/ci.yml"
create_file ".github/workflows/cd.yml"

# Root level files
create_file ".gitignore"
create_file ".env.example"
create_file ".dockerignore"
create_file "docker-compose.yaml"
create_file "docker-compose.dev.yaml"
create_file "docker-compose.test.yaml"
create_file "Makefile"
create_file "README.md"

# Docker directory structure
# Frontend
for framework in "angular" "nextjs" "react"; do
    create_dir "docker/frontend/$framework"
    create_file "docker/frontend/$framework/Dockerfile"
    create_file "docker/frontend/$framework/Dockerfile.prod"
    if [ "$framework" = "angular" ]; then
        create_file "docker/frontend/$framework/nginx.conf"
    fi
done

# Backend
for framework in "fastapi" "flask" "spring-boot" "express" "gin"; do
    create_dir "docker/backend/$framework"
    create_file "docker/backend/$framework/Dockerfile"
    create_file "docker/backend/$framework/Dockerfile.prod"
done

# Databases
DB_TYPES=("mongodb" "mysql" "postgres" "timescaledb" "redis" "minio")

# Create database directories and files
for db in "${DB_TYPES[@]}"; do
    # Init scripts
    create_dir "docker/databases/init-scripts/$db"
    if [ "$db" = "redis" ]; then
        create_file "docker/databases/init-scripts/$db/init.redis"
        create_file "docker/databases/init-scripts/$db/sentinel.conf"
    elif [ "$db" = "minio" ]; then
        create_file "docker/databases/init-scripts/$db/init.sh"
    else
        create_file "docker/databases/init-scripts/$db/init.sql"
    fi

    # Config
    create_dir "docker/databases/config/$db"
    case $db in
        "mongodb")
            create_file "docker/databases/config/$db/mongod.conf"
            ;;
        "mysql")
            create_file "docker/databases/config/$db/my.cnf"
            ;;
        "postgres")
            create_file "docker/databases/config/$db/postgresql.conf"
            ;;
        "timescaledb")
            create_file "docker/databases/config/$db/timescaledb.conf"
            ;;
        "redis")
            create_file "docker/databases/config/$db/redis.conf"
            create_file "docker/databases/config/$db/sentinel.conf"
            ;;
        "minio")
            create_file "docker/databases/config/$db/config.env"
            ;;
    esac

    # Dockerfiles
    create_dir "docker/databases/$db"
    create_file "docker/databases/$db/Dockerfile"
    create_file "docker/databases/$db/Dockerfile.prod"
done

# Source directory structure
# Frontend apps
create_dir "src/frontend/angular-app/src/app/components"
create_dir "src/frontend/angular-app/src/app/services"
create_dir "src/frontend/angular-app/src/app/shared"
create_dir "src/frontend/angular-app/src/assets"
create_dir "src/frontend/angular-app/tests"
create_file "src/frontend/angular-app/package.json"
create_file "src/frontend/angular-app/angular.json"

create_dir "src/frontend/nextjs-app/pages"
create_dir "src/frontend/nextjs-app/components"
create_dir "src/frontend/nextjs-app/public"
create_dir "src/frontend/nextjs-app/styles"
create_dir "src/frontend/nextjs-app/tests"
create_file "src/frontend/nextjs-app/package.json"

create_dir "src/frontend/react-app/src/components"
create_dir "src/frontend/react-app/src/hooks"
create_dir "src/frontend/react-app/src/pages"
create_dir "src/frontend/react-app/src/services"
create_dir "src/frontend/react-app/src/utils"
create_file "src/frontend/react-app/src/App.tsx"
create_dir "src/frontend/react-app/public"
create_dir "src/frontend/react-app/tests"
create_file "src/frontend/react-app/package.json"

# Backend shared
create_dir "src/backend/shared/models"
create_file "src/backend/shared/models/base.model.ts"
create_file "src/backend/shared/models/response.model.ts"
create_dir "src/backend/shared/interfaces"
create_file "src/backend/shared/interfaces/repository.interface.ts"
create_file "src/backend/shared/interfaces/service.interface.ts"
create_file "src/backend/shared/interfaces/cache.interface.ts"
create_file "src/backend/shared/interfaces/storage.interface.ts"
create_dir "src/backend/shared/utils"
create_file "src/backend/shared/utils/database.util.ts"
create_file "src/backend/shared/utils/redis.util.ts"
create_file "src/backend/shared/utils/minio.util.ts"

# Backend apps
# FastAPI
create_dir "src/backend/fastapi-app/app/api"
create_dir "src/backend/fastapi-app/app/core/cache"
create_file "src/backend/fastapi-app/app/core/cache/redis_manager.py"
create_dir "src/backend/fastapi-app/app/core/storage"
create_file "src/backend/fastapi-app/app/core/storage/minio_manager.py"
create_dir "src/backend/fastapi-app/app/models"
create_dir "src/backend/fastapi-app/app/services"
create_file "src/backend/fastapi-app/app/main.py"
create_dir "src/backend/fastapi-app/tests"
create_file "src/backend/fastapi-app/requirements.txt"

# Flask
create_dir "src/backend/flask-app/app/api"
create_dir "src/backend/flask-app/app/extensions"
create_file "src/backend/flask-app/app/extensions/redis_ext.py"
create_file "src/backend/flask-app/app/extensions/minio_ext.py"
create_dir "src/backend/flask-app/app/models"
create_dir "src/backend/flask-app/app/services"
create_file "src/backend/flask-app/app/__init__.py"
create_dir "src/backend/flask-app/tests"
create_file "src/backend/flask-app/requirements.txt"

# Spring Boot
create_dir "src/backend/spring-app/src/main/java/config"
create_file "src/backend/spring-app/src/main/java/config/RedisConfig.java"
create_file "src/backend/spring-app/src/main/java/config/MinioConfig.java"
create_dir "src/backend/spring-app/src/main/resources"
create_file "src/backend/spring-app/src/main/resources/application.yml"
create_dir "src/backend/spring-app/src/test"
create_file "src/backend/spring-app/pom.xml"
create_file "src/backend/spring-app/mvnw"

# Express
create_dir "src/backend/express-app/src/controllers"
create_dir "src/backend/express-app/src/middleware"
create_dir "src/backend/express-app/src/models"
create_dir "src/backend/express-app/src/routes"
create_dir "src/backend/express-app/src/services"
create_file "src/backend/express-app/src/services/redis.service.ts"
create_file "src/backend/express-app/src/services/minio.service.ts"
create_file "src/backend/express-app/src/services/db.service.ts"
create_file "src/backend/express-app/src/app.ts"
create_dir "src/backend/express-app/tests"
create_file "src/backend/express-app/package.json"

# Gin
create_dir "src/backend/gin-app/cmd/server"
create_dir "src/backend/gin-app/internal/api"
create_dir "src/backend/gin-app/internal/cache"
create_file "src/backend/gin-app/internal/cache/redis.go"
create_dir "src/backend/gin-app/internal/storage"
create_file "src/backend/gin-app/internal/storage/minio.go"
create_dir "src/backend/gin-app/internal/middleware"
create_dir "src/backend/gin-app/internal/models"
create_dir "src/backend/gin-app/internal/services"
create_dir "src/backend/gin-app/pkg"
create_file "src/backend/gin-app/go.mod"

# Kubernetes
create_dir "kubernetes/base/frontend"
create_file "kubernetes/base/frontend/deployment.yaml"
create_file "kubernetes/base/frontend/service.yaml"
create_dir "kubernetes/base/backend"
create_file "kubernetes/base/backend/deployment.yaml"
create_file "kubernetes/base/backend/service.yaml"

# Kubernetes database configurations
for db in "${DB_TYPES[@]}"; do
    create_dir "kubernetes/base/databases/$db"
    if [ "$db" = "redis" ]; then
        create_file "kubernetes/base/databases/$db/deployment.yaml"
        create_file "kubernetes/base/databases/$db/service.yaml"
        create_file "kubernetes/base/databases/$db/configmap.yaml"
    elif [ "$db" = "minio" ]; then
        create_file "kubernetes/base/databases/$db/deployment.yaml"
        create_file "kubernetes/base/databases/$db/service.yaml"
        create_file "kubernetes/base/databases/$db/ingress.yaml"
        create_file "kubernetes/base/databases/$db/pvc.yaml"
    fi
done

create_dir "kubernetes/overlays/development"
create_dir "kubernetes/overlays/staging"
create_dir "kubernetes/overlays/production"
create_file "kubernetes/kustomization.yaml"

# Terraform
create_dir "terraform/environments/dev"
create_dir "terraform/environments/staging"
create_dir "terraform/environments/prod"
create_dir "terraform/modules/networking"
create_dir "terraform/modules/kubernetes"

# Terraform database modules
for db in "${DB_TYPES[@]}"; do
    create_dir "terraform/modules/databases/$db"
    if [ "$db" = "redis" ] || [ "$db" = "minio" ]; then
        create_file "terraform/modules/databases/$db/main.tf"
        create_file "terraform/modules/databases/$db/variables.tf"
        create_file "terraform/modules/databases/$db/outputs.tf"
    fi
done

# Scripts
create_dir "scripts/setup"
create_dir "scripts/deployment"
create_dir "scripts/database/migrations"
create_dir "scripts/database/seeders"

# Tests
create_dir "tests/integration/api"
create_dir "tests/integration/database"
create_dir "tests/e2e/frontend"
create_dir "tests/e2e/backend"
create_dir "tests/load/k6-scripts"

# Documentation
create_dir "docs/api"
create_file "docs/api/openapi.yaml"
create_dir "docs/architecture"
create_file "docs/architecture/database.md"
create_file "docs/architecture/caching.md"
create_file "docs/architecture/storage.md"
create_dir "docs/deployment"
create_dir "docs/development"

# Monitoring
create_dir "monitoring/grafana/dashboards"
create_file "monitoring/grafana/dashboards/redis-dashboard.json"
create_file "monitoring/grafana/dashboards/minio-dashboard.json"
create_file "monitoring/grafana/dashboards/app-dashboard.json"
create_dir "monitoring/prometheus/rules"
create_file "monitoring/prometheus/rules/redis-alerts.yaml"
create_file "monitoring/prometheus/rules/minio-alerts.yaml"
create_file "monitoring/prometheus/rules/app-alerts.yaml"
create_dir "monitoring/loki"

# CI
create_dir "ci/jenkins/scripts"
create_file "ci/jenkins/Jenkinsfile"
create_dir "ci/github-actions/templates"

echo "Project structure created successfully!"