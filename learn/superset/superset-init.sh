#!/bin/bash
set -e

echo "Installing required packages..."
pip install psycopg2-binary

# Wait for database to be ready
until nc -z db 5432; do
    echo "Waiting for postgres database to be ready..."
    sleep 2
done

echo "Database is ready, initializing Superset..."

# Initialize the database
superset db upgrade

# Create admin user
superset fab create-admin \
    --username admin \
    --firstname Superset \
    --lastname Admin \
    --email admin@superset.com \
    --password admin

# Load example data
superset load_examples

# Initialize roles
superset init

echo "Superset initialization completed successfully!"