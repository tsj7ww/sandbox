# Use Ubuntu as base image
FROM ubuntu:22.04

# Environment variables
ENV ES_VERSION=8.11.3 \
    LOGSTASH_VERSION=8.11.3 \
    KIBANA_VERSION=8.11.3 \
    ES_HOME=/usr/share/elasticsearch \
    LOGSTASH_HOME=/usr/share/logstash \
    KIBANA_HOME=/usr/share/kibana \
    DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    gpg \
    apt-transport-https \
    openjdk-17-jdk \
    supervisor \
    && rm -rf /var/lib/apt/lists/*

# Add Elasticsearch GPG key and repository
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-8.x.list

# Install ELK components
RUN apt-get update && apt-get install -y \
    elasticsearch=${ES_VERSION} \
    logstash=${LOGSTASH_VERSION} \
    kibana=${KIBANA_VERSION} \
    && rm -rf /var/lib/apt/lists/*

# Configure Elasticsearch
COPY <<EOF /etc/elasticsearch/elasticsearch.yml
cluster.name: "docker-elk"
node.name: "single-node"
network.host: 0.0.0.0
discovery.type: single-node
xpack.security.enabled: false
EOF

# Configure Kibana
COPY <<EOF /etc/kibana/kibana.yml
server.host: "0.0.0.0"
elasticsearch.hosts: ["http://localhost:9200"]
EOF

# Create a sample Logstash pipeline
RUN mkdir -p /etc/logstash/conf.d
COPY <<EOF /etc/logstash/conf.d/logstash.conf
input {
  beats {
    port => 5044
  }
  tcp {
    port => 5000
    codec => json
  }
  http {
    port => 8080
  }
}

filter {
  if [type] == "syslog" {
    grok {
      match => { "message" => "%{SYSLOGTIMESTAMP:syslog_timestamp} %{SYSLOGHOST:syslog_hostname} %{DATA:syslog_program}(?:\[%{POSINT:syslog_pid}\])?: %{GREEDYDATA:syslog_message}" }
    }
    date {
      match => [ "syslog_timestamp", "MMM  d HH:mm:ss", "MMM dd HH:mm:ss" ]
    }
  }
}

output {
  elasticsearch {
    hosts => ["localhost:9200"]
    index => "logstash-%{+YYYY.MM.dd}"
  }
  stdout { codec => rubydebug }
}
EOF

# Configure supervisord to manage processes
COPY <<EOF /etc/supervisor/conf.d/elk.conf
[supervisord]
nodaemon=true

[program:elasticsearch]
command=/usr/share/elasticsearch/bin/elasticsearch
user=elasticsearch
autostart=true
autorestart=true
stdout_logfile=/var/log/supervisor/elasticsearch.log
stderr_logfile=/var/log/supervisor/elasticsearch_error.log

[program:logstash]
command=/usr/share/logstash/bin/logstash -f /etc/logstash/conf.d/logstash.conf
user=root
autostart=true
autorestart=true
stdout_logfile=/var/log/supervisor/logstash.log
stderr_logfile=/var/log/supervisor/logstash_error.log

[program:kibana]
command=/usr/share/kibana/bin/kibana
user=kibana
autostart=true
autorestart=true
stdout_logfile=/var/log/supervisor/kibana.log
stderr_logfile=/var/log/supervisor/kibana_error.log
EOF

# Create necessary directories and set permissions
RUN mkdir -p /var/log/supervisor \
    && chown -R elasticsearch:elasticsearch /usr/share/elasticsearch \
    && chown -R logstash:logstash /usr/share/logstash \
    && chown -R kibana:kibana /usr/share/kibana

# Expose ports
EXPOSE 5044 5000 8080 9200 9300 5601

# Start supervisord
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]