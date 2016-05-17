#FROM frolvlad/alpine-oraclejdk8:slim
FROM java:8
#RUN sh -c 'touch $SPRING_JAR'
Add /test.txt /
ADD /spring-mongodb-docker-data-rest-0.1.0.jar /
#ENTRYPOINT ["java","-Dspring.data.mongodb.uri=mongodb://mongodb/micros","-Djava.security.egd=file:/dev/./urandom","-jar","$SPRING_JAR"]
ENTRYPOINT ["java","-Dspring.data.mongodb.uri=mongodb://mongodb/micros","-Djava.security.egd=file:/dev/./urandom","-jar","spring-mongodb-docker-data-rest-0.1.0.jar"]
