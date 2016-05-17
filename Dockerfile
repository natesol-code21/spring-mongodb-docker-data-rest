FROM maven:3.3-jdk-8-onbuild
CMD ["java","-jar","/spring-mongodb-docker-data-rest/target/docker/spring-mongodb-docker-data-rest-0.1.0.jar"]
