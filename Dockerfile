FROM maven:3-jdk-8-alpine  as maven
RUN mkdir /app
COPY ./pom.xml /app/
COPY ./src /app/src/
WORKDIR /app
RUN mvn compile package
FROM openjdk:8-alpine
RUN mkdir /app
COPY --from=maven /app/target/*.jar /app/
COPY --from=maven /app/target/lib /app/lib/
WORKDIR /app
ENTRYPOINT ["java","-cp","*:lib/*", "org.kopi.ebics.client.EbicsClient"]
CMD ["--help"]
