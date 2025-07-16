FROM openjdk:17-jdk-slim
COPY hello-springboot-1.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]

