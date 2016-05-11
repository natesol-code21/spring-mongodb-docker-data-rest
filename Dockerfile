FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp

# Install maven
CMD apt-get update  
CMD apt-get install -y maven

WORKDIR /code

# Prepare by downloading dependencies
ADD pom.xml /code/pom.xml  
CMD ["mvn", "dependency:resolve"]  
CMD ["mvn", "verify"]

# Adding source, compile and package into a fat jar
ADD src /code/src  
CMD ["mvn", "package docker:build"]
ADD spring-mongodb-docker-data-rest-0.1.0.jar app.jar
#ADD ~/target/spring-mongodb-docker-data-rest-0.1.0.jar app.jar

RUN sh -c 'touch /app.jar'
ENTRYPOINT ["java","-Dspring.data.mongodb.uri=mongodb://mongodb/micros","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
