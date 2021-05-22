FROM maven:3-jdk-8 as build
RUN mkdir app
COPY ./src /app/src
COPY ./pom.xml /app/
WORKDIR /app
RUN mvn compile package
FROM openjdk:8-alpine
#COPY ./libpatch/local_policy.jar ./libpatch/US_export_policy.jar /opt/jdk/jre/lib/security/
RUN mkdir /app
COPY --from=build /app/target/ebics*.jar /app/
COPY --from=build /app/target/lib/ /app/lib
WORKDIR /app
ENTRYPOINT ["java","-jar","ebics-cli-1.1.jar"]
CMD ["--help"]
