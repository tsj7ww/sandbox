FROM ubuntu:22.04
LABEL maintainer="Your Name <your.email@example.com>"

ENV NIFI_VERSION=1.25.0
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

RUN apt-get update && apt-get install -y \
    openjdk-11-jdk \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://downloads.apache.org/nifi/${NIFI_VERSION}/nifi-${NIFI_VERSION}-bin.tar.gz \
    && tar -xvzf nifi-${NIFI_VERSION}-bin.tar.gz \
    && mv nifi-${NIFI_VERSION} /opt/nifi \
    && rm nifi-${NIFI_VERSION}-bin.tar.gz

ENV NIFI_HOME=/opt/nifi
ENV PATH=$PATH:$NIFI_HOME/bin

EXPOSE 8080 8443

CMD ["/opt/nifi/bin/nifi.sh", "run"]