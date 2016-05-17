FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp
ENV DOCKERSPRING /spring-mongodb-docker-data-rest/target/docker
WORKDIR $DOCKERSPRING
#COPY spring-mongodb-docker-data-rest-0.1.0.jar ./docker-spring
ADD $DOCKERSPRING/spring-mongodb-docker-data-rest-0.1.0.jar /dockerspring.jar
RUN sh -c 'touch /dockerspring.jar'
ENTRYPOINT ["java","-Dspring.data.mongodb.uri=mongodb://mongodb/micros","-Djava.security.egd=file:/dev/./urandom","-jar","dockerspring.jar"]
