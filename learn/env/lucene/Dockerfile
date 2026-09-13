FROM maven:3.9-eclipse-temurin-11
LABEL maintainer="Your Name <your.email@example.com>"

ENV LUCENE_VERSION=9.9.0

WORKDIR /app

RUN wget https://downloads.apache.org/lucene/java/${LUCENE_VERSION}/lucene-${LUCENE_VERSION}.tgz \
    && tar -xvzf lucene-${LUCENE_VERSION}.tgz \
    && rm lucene-${LUCENE_VERSION}.tgz

COPY pom.xml .
COPY src ./src

RUN mvn clean package

CMD ["java", "-jar", "target/lucene-demo.jar"]