# Use official Grafana image
FROM grafana/grafana:latest

# Environment variables
ENV GF_SECURITY_ADMIN_USER=admin \
    GF_SECURITY_ADMIN_PASSWORD=admin \
    GF_INSTALL_PLUGINS=grafana-clock-panel,grafana-simple-json-datasource

# Switch to root to install additional packages
USER root

# Install additional packages if needed
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Create custom configuration
COPY <<EOF /etc/grafana/grafana.ini
[server]
protocol = http
http_port = 3000
domain = localhost

[security]
admin_user = ${GF_SECURITY_ADMIN_USER}
admin_password = ${GF_SECURITY_ADMIN_PASSWORD}

[auth.anonymous]
enabled = true
org_name = Main Org.
org_role = Viewer

[dashboards]
default_home_dashboard_path = /var/lib/grafana/dashboards/default.json
EOF

# Create a sample dashboard
RUN mkdir -p /var/lib/grafana/dashboards
COPY <<EOF /var/lib/grafana/dashboards/default.json
{
  "annotations": {
    "list": []
  },
  "editable": true,
  "fiscalYearStartMonth": 0,
  "graphTooltip": 0,
  "id": 1,
  "links": [],
  "liveNow": false,
  "panels": [],
  "refresh": "",
  "schemaVersion": 38,
  "style": "dark",
  "tags": [],
  "templating": {
    "list": []
  },
  "time": {
    "from": "now-6h",
    "to": "now"
  },
  "timepicker": {},
  "timezone": "",
  "title": "Default Dashboard",
  "uid": "default",
  "version": 0,
  "weekStart": ""
}
EOF

# Set correct permissions
RUN chown -R grafana:grafana /etc/grafana /var/lib/grafana

# Switch back to grafana user
USER grafana

# Expose Grafana port
EXPOSE 3000