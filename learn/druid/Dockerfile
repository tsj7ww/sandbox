FROM ubuntu:22.04
LABEL maintainer="Your Name <your.email@example.com>"

ENV DRUID_VERSION=28.0.0
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

RUN apt-get update && apt-get install -y \
    openjdk-11-jdk \
    wget \
    python3 \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://downloads.apache.org/druid/${DRUID_VERSION}/apache-druid-${DRUID_VERSION}-bin.tar.gz \
    && tar -xvzf apache-druid-${DRUID_VERSION}-bin.tar.gz \
    && mv apache-druid-${DRUID_VERSION} /opt/druid \
    && rm apache-druid-${DRUID_VERSION}-bin.tar.gz

ENV DRUID_HOME=/opt/druid
ENV PATH=$PATH:$DRUID_HOME/bin

EXPOSE 8081 8082 8083 8090 8091

CMD ["/opt/druid/bin/start-micro-quickstart"]