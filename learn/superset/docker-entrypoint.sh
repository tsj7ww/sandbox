#!/bin/bash
set -e

# Run the initialization script if the database hasn't been initialized
if [ ! -f /app/superset_home/.initialized ]; then
    echo "Initializing Superset..."
    /app/superset-init.sh
    touch /app/superset_home/.initialized
else
    echo "Superset already initialized, starting normally..."
fi

# Start Superset using gunicorn
gunicorn \
    --bind "0.0.0.0:8088" \
    --workers 10 \
    --timeout 120 \
    --limit-request-line 0 \
    --limit-request-field_size 0 \
    "superset.app:create_app()"