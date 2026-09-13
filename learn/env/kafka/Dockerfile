FROM ubuntu:22.04
LABEL maintainer="Your Name <your.email@example.com>"

ENV KAFKA_VERSION=3.6.1
ENV SCALA_VERSION=2.13
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

RUN apt-get update && apt-get install -y \
    openjdk-11-jdk \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://downloads.apache.org/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz \
    && tar -xvzf kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz \
    && mv kafka_${SCALA_VERSION}-${KAFKA_VERSION} /opt/kafka \
    && rm kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz

ENV KAFKA_HOME=/opt/kafka
ENV PATH=$PATH:$KAFKA_HOME/bin

EXPOSE 9092

CMD ["/opt/kafka/bin/kafka-server-start.sh", "/opt/kafka/config/server.properties"]
