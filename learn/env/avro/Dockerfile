FROM maven:3.9-eclipse-temurin-11
LABEL maintainer="Your Name <your.email@example.com>"

ENV AVRO_VERSION=1.11.3

WORKDIR /app

RUN wget https://downloads.apache.org/avro/avro-${AVRO_VERSION}/java/avro-tools-${AVRO_VERSION}.jar \
    && mkdir -p /opt/avro \
    && mv avro-tools-${AVRO_VERSION}.jar /opt/avro/

COPY pom.xml .
COPY src ./src

RUN mvn clean package

CMD ["java", "-jar", "target/avro-demo.jar"]
