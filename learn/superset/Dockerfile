FROM apache/superset:latest

USER root

# Install additional dependencies
RUN apt-get update && \
    apt-get install -y \
    netcat-openbsd \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Copy the initialization script and entrypoint
COPY superset-init.sh /app/superset-init.sh
COPY docker-entrypoint.sh /app/docker-entrypoint.sh

# Set permissions
RUN chmod +x /app/superset-init.sh && \
    chmod +x /app/docker-entrypoint.sh

# Switch back to superset user
USER superset

ENTRYPOINT ["/app/docker-entrypoint.sh"]