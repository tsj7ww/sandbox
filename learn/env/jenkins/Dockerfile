# Use the official Jenkins LTS image
FROM jenkins/jenkins:lts

# Switch to root to install additional packages
USER root

# Install necessary tools and dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    zip \
    unzip \
    docker.io \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install Docker Compose
RUN curl -L "https://github.com/docker/compose/releases/download/v2.23.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

# Add Jenkins user to docker group
RUN usermod -aG docker jenkins

# Install Jenkins plugins
COPY <<EOF /usr/share/jenkins/ref/plugins.txt
git:latest
docker-workflow:latest
workflow-aggregator:latest
credentials-binding:latest
timestamper:latest
pipeline-stage-view:latest
blue-ocean:latest
github-branch-source:latest
docker-plugin:latest
kubernetes:latest
job-dsl:latest
configuration-as-code:latest
role-strategy:latest
EOF

RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

# Create a default Jenkins configuration
COPY <<EOF /usr/share/jenkins/ref/jenkins.yaml
jenkins:
  systemMessage: "Jenkins configured automatically with Docker"
  numExecutors: 2
  scmCheckoutRetryCount: 2
  mode: NORMAL

security:
  realm:
    local:
      allowsSignup: false
      users:
        - id: "admin"
          password: "\${JENKINS_ADMIN_PASSWORD}"
EOF

# Set up environment variables
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
ENV JENKINS_ADMIN_ID="admin"
ENV JENKINS_ADMIN_PASSWORD="admin"

# Create a sample pipeline
RUN mkdir -p /usr/share/jenkins/ref/jobs/sample-pipeline
COPY <<EOF /usr/share/jenkins/ref/jobs/sample-pipeline/config.xml
<?xml version='1.1' encoding='UTF-8'?>
<flow-definition plugin="workflow-job">
  <description>Sample Pipeline</description>
  <definition class="org.jenkinsci.plugins.workflow.cps.CpsFlowDefinition" plugin="workflow-cps">
    <script>
pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying..'
            }
        }
    }
}
    </script>
    <sandbox>true</sandbox>
  </definition>
  <triggers/>
</flow-definition>
EOF

# Switch back to Jenkins user
USER jenkins

# Expose Jenkins ports
EXPOSE 8080 50000