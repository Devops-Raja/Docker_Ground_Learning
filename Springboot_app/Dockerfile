# Stage 1: Build Stage
# Use Eclipse Temurin JDK 11 base image with Ubuntu Focal for compiling and building the application
FROM eclipse-temurin:11-jdk-focal as build

# Set the working directory inside the container  
WORKDIR /emp

# Copy the entire project directory from host to container
COPY ./ /emp

# Download and resolve all project dependencies defined in Gradle
RUN ./gradlew dependencies

# Define a build argument for application version ( by default: 0.0.1)
# example while building manually with specific version ---> docker build --build-arg APP_VERSION=1.2.3 .

ARG APP_VERSION=0.0.1

# Build the Spring Boot application with 'prod' profile and specific version
# This will clean any previous builds and create a bootable jar
RUN ./gradlew -Pprod -Pversion=${APP_VERSION} clean bootJar


# Stage 2: Final Runtime Stage
# Use a lighter Eclipse Temurin JRE 11 base image for running the application
FROM eclipse-temurin:11-jre-focal as final

# Reuse the same build argument for application version  
ARG APP_VERSION=0.0.1

# Copy the built jar from the 'build' stage to this final image
COPY --from=build /emp/build/libs/emp-${APP_VERSION}.jar ./build/libs/

# Expose port 8080 to allow communication to/from the container
EXPOSE 8080

# Define the entrypoint to run the Spring Boot application
ENTRYPOINT ["java", "-jar", "build/libs/emp-${APP_VERSION}.jar"]
