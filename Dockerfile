FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY target/Docker.war app.war
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.war"]
 