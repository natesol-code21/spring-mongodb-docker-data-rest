FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp
ADD spring-mongodb-docker-data-rest-0.1.0.jar app.jar As user
RUN sh -c 'touch /app.jar' As user
ENTRYPOINT ["java","-Dspring.data.mongodb.uri=mongodb://mongodb/micros","-Djava.security.egd=file:/dev/./urandom","-jar","app.jar"]
