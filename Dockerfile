
FROM adoptopenjdk:11 as build
WORKDIR /app

COPY HelloController.java .

RUN javac HelloController.java

RUN jar cfe app.jar HelloController *.class

FROM adoptopenjdk:11-jre-hotspot
WORKDIR /app

COPY --from=build /app/app.jar .

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]


