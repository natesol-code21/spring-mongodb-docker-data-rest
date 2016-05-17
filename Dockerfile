FROM maven:3.3-jdk-8-onbuild
#ADD /spring-mongodb-docker-data-rest/target/docker/spring-mongodb-docker-data-rest-0.1.0.jar spring-app.jar
RUN sh -c 'touch /spring-mongodb-docker-data-rest/target/docker/spring-mongodb-docker-data-rest-0.1.0.jar'
RUN ["java","-Dspring.data.mongodb.uri=mongodb://mongodb/micros","-Djava.security.egd=file:/dev/./urandom", "-jar","/spring-mongodb-docker-data-rest/target/docker/spring-mongodb-docker-data-rest-0.1.0.jar"]
