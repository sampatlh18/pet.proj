FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn -B -DskipTests package

FROM tomcat:10.1-jre17-temurin
COPY --from=build /app/target/PetHubProject.war /usr/local/tomcat/webapps/PetHubProject.war
EXPOSE 8080
