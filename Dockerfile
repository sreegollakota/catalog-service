# Use the official openjdk 21 image as the base image
FROM openjdk:21

# Set the working directory to /app
#WORKDIR /app

# Copy the current directory contents into the container at /app
#COPY . /app

# Run the command to build the application
#RUN ./mvnw clean package -DskipTests

# Expose port 8080 for the application
#EXPOSE 8080

# Copy the built JAR file from the previous stage to the container
#COPY - from=build /app/target/catalog-service.jar .

# Set the command to run the application
#CMD ["java", "-jar", "catalog-service.jar"]

WORKDIR /app
 
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline
 
COPY src ./src
 
CMD ["./mvnw", "spring-boot:run"]