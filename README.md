## EBICS Java Client 

This library allows to interact with banks using the EBICS (Electronic Banking Internet Communication Standard). You can use the `Ebics Java Client` as command line tool with java 1.8 and maven, or inside docker - please check the [HOWTO](HOWTO.md) more details. 

```
git clone https://github.com/element36-io/ebics-java-client.git
cd ebics-java-client
docker run -it -v $PWD:/app -w /app  maven:3-jdk-8 mvn install exec:java  -Dexec.mainClass=org.kopi.ebics.client.EbicsClient -Dexec.args="--help" 
```

## Integrate as library

Used as a gradle dependency - see `Ebics Java Service`(https://github.com/element36-io/ebics-java-service) for an example how to use the client. 

```
dependencies {
    implementation 'io.github.element36-io:ebics-cli:1''
}
```


Maven (adjust version accordingly): 


```
<dependency>
    <groupId>io.github.element36-io</groupId>
    <artifactId>ebics-cli</artifactId>
    <version>1.1</version>
</dependency>
```

## Run tests for the ebics-java-client: 

```
git clone https://github.com/element36-io/ebics-java-client.git
cd ebics-java-client
docker run -it -v $PWD:/app -w /app  maven:3-jdk-8 mvn test surefire-report:report

```

See `./target` for test results. `surefire-report:report` is optional but it creates test report here: `./target/site/surefire-report.html`


## Kudos

The project is forked form [Ebics Java Client] (https://github.com/uwemaurer/ebics-java-client/), 
which was based on a [sourceforge project](https://sourceforge.net/p/ebics/). 

Main differences with this fork from ebics-java-client form uwemaurrer: 

- Fixed vulnerabilities of bouncycastle and log4j
- Support for new commands used in Switzerland.
- Jar file in maven central repository.
- Docker image is automatically built from master branch on Dockerhub. 
- Changed documentation for usage with docker
