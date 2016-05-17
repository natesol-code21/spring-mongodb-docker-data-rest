FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp
ENV DOCKERSPRING /spring-mongodb-docker-data-rest/target/docker
WORKDIR $DOCKERSPRING
#COPY spring-mongodb-docker-data-rest-0.1.0.jar ./docker-spring
ADD $DOCKERSPRING  /dockers
RUN sh -c 'touch /dockerspring.jar'
ENTRYPOINT ["java","-Dspring.data.mongodb.uri=mongodb://mongodb/micros","-Djava.security.egd=file:/dev/./urandom","-jar","dockers/spring-mongodb-docker-data-rest-0.1.0.jar"]
