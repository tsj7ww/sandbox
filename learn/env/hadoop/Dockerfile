FROM ubuntu:22.04
LABEL maintainer="Your Name <your.email@example.com>"

ENV HADOOP_VERSION=3.3.6
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

RUN apt-get update && apt-get install -y \
    openjdk-11-jdk \
    wget \
    ssh \
    pdsh \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://downloads.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz \
    && tar -xvzf hadoop-${HADOOP_VERSION}.tar.gz \
    && mv hadoop-${HADOOP_VERSION} /opt/hadoop \
    && rm hadoop-${HADOOP_VERSION}.tar.gz

ENV HADOOP_HOME=/opt/hadoop
ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

EXPOSE 9000 9870 9864 9866 9867 9868 9869

CMD ["/opt/hadoop/bin/hadoop"]