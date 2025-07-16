# Use lightweight Java runtime
FROM eclipse-temurin:17-jdk-alpine

# Set working directory inside container
WORKDIR /app

# Copy the JAR file into the container
COPY hello-springboot-1.jar app.jar

# Expose the port (change if needed)
EXPOSE 9090

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
