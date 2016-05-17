FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp
#ENV DOCKERSPRING /spring-mongodb-docker-data-rest/target/docker
#WORKDIR $DOCKERSPRING
#COPY spring-mongodb-docker-data-rest-0.1.0.jar ./docker-spring
#ADD $DOCKERSPRING  /dockers
ENV SPRING_JAR spring-mongodb-docker-data-rest-0.1.0.jar
ENV SPRING_HOME /usr/spring-mongodb-docker-data-rest
Add ./Users/Nathaniel_Solomon/docker-mongo/spring-mongodb-docker-data-rest/target/docker/$SPRING_JAR $SPRING_HOME
WORKDIR $SPRING_HOME
#COPY README ./
#COPY ./docker-test/spring-mongodb-docker-data-rest-0.1.0.jar ./
#COPY springmongo ./
#COPY . ./
RUN sh -c 'touch $SPRING_JAR'
#ENTRYPOINT ["java","-Dspring.data.mongodb.uri=mongodb://mongodb/micros","-Djava.security.egd=file:/dev/./urandom","-jar","$SPRING_JAR"]
ENTRYPOINT ["java","-Dspring.data.mongodb.uri=mongodb://mongodb/micros","-Djava.security.egd=file:/dev/./urandom","-jar","$SPRING_JAR"]
