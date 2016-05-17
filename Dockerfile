FROM maven:3.3-jdk-8-onbuild
MAINTAINER ddeemeks@gmail.com
VOLUME /tmp
EXPOSE 8080
ENV USER_NAME natesol15
ENV APP_HOME /home/$USER_NAME/app

RUN useradd -ms /bin/bash $USER_NAME
RUN mkdir $APP_HOME
ADD spring-mongodb-docker-data-rest-0.1.0.jar $APP_HOME/spring-mongodb-docker-data-rest-0.1.0.jar
RUN chown $USER_NAME $APP_HOME/spring-mongodb-docker-data-rest-0.1.0.jar
USER $USER_NAME
WORKDIR $APP_HOME
#ENV spring-app /spring-mongodb-docker-data-rest/target/docker/spring-mongodb-docker-data-rest-0.1.0.jar
ENV spring-app /spring-mongodb-docker-data-rest/target/docker/
RUN mkdir ${spring-app}
#ADD ./target/docker/spring-mongodb-docker-data-rest-0.1.0.jar $spring-app/spring-mongodb-docker-data-rest-0.1.0.jar
#ADD /usr/src/app/target/spring-mongodb-docker-data-rest-0.1.0.jar $spring-app/spring-mongodb-docker-data-rest-0.1.0.jar
WORKDIR ${spring-app}    
#COPY \$spring-app /
#volume /spring-mongodb-docker-data-rest/target/docker/spring-mongodb-docker-data-rest-0.1.0.jar
#RUN sh -c 'touch /spring-mongodb-docker-data-rest/target/docker/spring-mongodb-docker-data-rest-0.1.0.jar'
RUN bash -c 'touch spring-mongodb-docker-data-rest-0.1.0.jar'
CMD ["java","-Dspring.data.mongodb.uri=mongodb://mongodb/micros","-Djava.security.egd=file:/dev/./urandom", "-jar","spring-mongodb-docker-data-rest-0.1.0.jar"]
