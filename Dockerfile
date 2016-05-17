FROM maven:3.3-jdk-8-onbuild
#ENV spring-app /spring-mongodb-docker-data-rest/target/docker/spring-mongodb-docker-data-rest-0.1.0.jar
ENV spring-app /spring-mongodb-docker-data-rest/target/docker/
RUN mkdir ${spring-app}
ADD /spring-mongodb-docker-data-rest/target/docker/spring-mongodb-docker-data-rest-0.1.0.jar $spring-app/spring-mongodb-docker-data-rest-0.1.0.jar
WORKDIR ${spring-app}    
#COPY \$spring-app /
#volume /spring-mongodb-docker-data-rest/target/docker/spring-mongodb-docker-data-rest-0.1.0.jar
#RUN sh -c 'touch /spring-mongodb-docker-data-rest/target/docker/spring-mongodb-docker-data-rest-0.1.0.jar'
CMD ["java","-Dspring.data.mongodb.uri=mongodb://mongodb/micros","-Djava.security.egd=file:/dev/./urandom", "-jar","spring-mongodb-docker-data-rest-0.1.0.jar"]
