FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp
#ENV DOCKERSPRING /spring-mongodb-docker-data-rest/target/docker
#WORKDIR $DOCKERSPRING
#COPY spring-mongodb-docker-data-rest-0.1.0.jar ./docker-spring
#ADD $DOCKERSPRING  /dockers
RUN mkdir -p /docker-test
WORKDIR /docker-test
COPY README ./
COPY ./docker-test/spring-mongodb-docker-data-rest-0.1.0.jar ./
COPY . ./
RUN sh -c 'touch spring-mongodb-docker-data-rest-0.1.0.jar'
ENTRYPOINT ["java","-Dspring.data.mongodb.uri=mongodb://mongodb/micros","-Djava.security.egd=file:/dev/./urandom","-jar","spring-mongodb-docker-data-rest-0.1.0.jar"]
