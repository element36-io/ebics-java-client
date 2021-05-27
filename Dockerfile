# docker build . -t client
# docker  run -it --entrypoint sh client 
# docker run  -v $HOME/ebics:/root/ebics client --sta -o sta.txt
# sudo  docker build . -t client;sudo docker run  -v $HOME/ebics:/root/ebics client --sta -o sta.txt
# java -cp "ebics-cli-*.jar:lib/*" org.kopi.ebics.client.EbicsClient --help
# java -cp "ebics-cli-*.jar:lib/*" org.kopi.ebics.client.EbicsClient --sta -o sta.txt
FROM maven:3-jdk-8 as build
#16 as build
RUN mkdir app
COPY ./src /app/src
COPY ./pom.xml /app/
WORKDIR /app
RUN mvn compile package
FROM openjdk:8-alpine
#16-alpine
#COPY ./libpatch/local_policy.jar ./libpatch/US_export_policy.jar /opt/jdk/jre/lib/security/
RUN mkdir /app
COPY --from=build /app/target/ebics*.jar /app/
COPY --from=build /app/target/lib/ /app/lib
WORKDIR /app
#remove version form jar files in container and note the used version
RUN FN=`(ls ebics-*[0-9].jar | head -1)`;  echo $FN;  mv $FN ebics-cli.jar;  touch $FN.version
ENTRYPOINT ["java","-jar","ebics-cli.jar"]
CMD ["--help"]
