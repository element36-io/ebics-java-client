FROM openjdk:8-alpine
RUN mkdir /app
COPY ./target/*.jar /app/
COPY ./target/lib /app/lib
WORKDIR /app
ENTRYPOINT ["java","-cp","*:lib/*", "org.kopi.ebics.client.EbicsClient"]
CMD ["--help"]
