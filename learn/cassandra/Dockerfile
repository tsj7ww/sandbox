FROM ubuntu:22.04
LABEL maintainer="Your Name <your.email@example.com>"

ENV CASSANDRA_VERSION=4.1.3
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

RUN apt-get update && apt-get install -y \
    openjdk-11-jdk \
    wget \
    python3 \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://downloads.apache.org/cassandra/${CASSANDRA_VERSION}/apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz \
    && tar -xvzf apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz \
    && mv apache-cassandra-${CASSANDRA_VERSION} /opt/cassandra \
    && rm apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz

ENV CASSANDRA_HOME=/opt/cassandra
ENV PATH=$PATH:$CASSANDRA_HOME/bin

EXPOSE 7000 7001 7199 9042 9160

CMD ["/opt/cassandra/bin/cassandra", "-f"]