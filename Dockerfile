# Use a lightweight Java runtime base image
FROM openjdk:17-jdk-slim

# Set working directory inside the container
WORKDIR /app

# Copy the JAR file from the target folder to the container and rename it
COPY target/code-quality-demo-1.0-SNAPSHOT.jar app.jar

# Set the command to run the JAR
ENTRYPOINT ["java", "-jar", "app.jar"]
