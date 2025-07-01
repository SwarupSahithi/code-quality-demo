# ---------- Stage 1: Build & Test ----------
FROM maven:3.9.6-eclipse-temurin-8 AS builder

WORKDIR /app

# Copy your source and pom.xml
COPY . .

# Run tests during the build
RUN mvn clean install

# ---------- Stage 2: Runtime (Optional) ----------
FROM openjdk:8-jdk-slim

WORKDIR /app

# Copy only compiled classes or packaged JAR if exists
COPY --from=builder /app/target /app/target

# Keep the container alive (or you can set your app JAR to run if needed)
CMD ["tail", "-f", "/dev/null"]
