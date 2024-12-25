# Use official Prometheus image
FROM prom/prometheus:latest

# Set working directory
WORKDIR /prometheus

# Copy prometheus configuration
COPY <<EOF /etc/prometheus/prometheus.yml
global:
  scrape_interval: 15s
  evaluation_interval: 15s

# Alertmanager configuration
alerting:
  alertmanagers:
    - static_configs:
        - targets:
          # - alertmanager:9093

# Load rules once and periodically evaluate them
rule_files:
  # - "first_rules.yml"
  # - "second_rules.yml"

# A scrape configuration containing exactly one endpoint to scrape
scrape_configs:
  - job_name: "prometheus"
    static_configs:
      - targets: ["localhost:9090"]

  - job_name: "node"
    static_configs:
      - targets: ["node-exporter:9100"]

  - job_name: "container"
    static_configs:
      - targets: ["cadvisor:8080"]
EOF

# Expose Prometheus port
EXPOSE 9090

# Set permissions for Prometheus user
RUN chown -R nobody:nobody /prometheus /etc/prometheus

# Switch to non-root user
USER nobody

# Command to run Prometheus
CMD ["--config.file=/etc/prometheus/prometheus.yml", \
     "--storage.tsdb.path=/prometheus", \
     "--web.console.libraries=/usr/share/prometheus/console_libraries", \
     "--web.console.templates=/usr/share/prometheus/consoles"]