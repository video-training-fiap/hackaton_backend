FROM gradle:jdk17-alpine
VOLUME gradle-cache:/home/gradle/.gradle
VOLUME /tmp

ADD . /home/gradle/project
WORKDIR /home/gradle/project
RUN chown gradle:gradle -R /home/gradle
USER gradle
RUN gradle bootJar
RUN mv /home/gradle/project/build/libs/*.jar /home/gradle/project/app.jar
EXPOSE 8080