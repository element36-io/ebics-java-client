EBICS Java Client 

This library allows to interact with banks using the EBICS (Electronic Banking Internet Communication Standard)

You can use the `EbicsClient` as command line tool, using docker or use it from your Java application.

```
git clone git@github.com:element36-io/ebics-java-client.git
cd ebics-java-client
docker run -it -v $PWD:/app -w /app  maven:3-jdk-8 mvn install exec:java  -Dexec.mainClass=org.kopi.ebics.client.EbicsClient -Dexec.args="--help" 
```

Gradle:
```
dependencies {
    implementation 'io.github.element36-io:ebics-cli:1.1''
}
```

Maven

```
<dependency>
    <groupId>io.github.element36-io</groupId>
    <artifactId>ebics-cli</artifactId>
    <version>1.1</version>
</dependency>
```

Run tests for the ebics-java-client: 

```
git clone git@github.com:element36-io/ebics-java-client.git
cd ebics-java-client
docker run -it -v $PWD:/app -w /app  maven:3-jdk-8 mvn test surefire-report:report

```

See ./target for test results. `surefire-report:report` is optional but it creates test report here: ./target/site/surefire-report.html  


The project is forked form https://github.com/uwemaurer/ebics-java-client/
which was based on https://sourceforge.net/p/ebics/

Main differences with this fork from ebics-java-client:

- Support for new commands used in Switzerland.
- Jar file in maven central repository.
- Docker image is automatically built from master branch on Dockerhub. 
- Changed documentation for usage with docker
