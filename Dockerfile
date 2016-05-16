FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp
RUN mkdir -p /docker-spring
WORKDIR /docker-spring
#COPY spring-mongodb-docker-data-rest-0.1.0.jar ./docker-spring
ADD ./spring-mongodb-docker-data-rest-0.1.0.jar /docker-spring
RUN sh -c 'touch /app.jar'
ENTRYPOINT ["java","-Dspring.data.mongodb.uri=mongodb://mongodb/micros","-Djava.security.egd=file:/dev/./urandom","-jar","spring-mongodb-docker-data-rest-0.1.0.jar"]
