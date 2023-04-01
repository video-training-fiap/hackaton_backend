FROM adoptopenjdk:17-jdk-hotspot

WORKDIR /app

COPY . /app

RUN ./gradlew build

CMD ["java", "-jar", "build/libs/app.jar"]