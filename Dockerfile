
# CCAvenue serve Ip is 54.157.29.255

# Use an official OpenJDK runtime as the base image
From tomcat:8.0.51-jre8-alpine
#From tomcat:9.0.8-jre8-alpine

#FROM tomcat:10.1.12-jdk17-temurin-jammy
RUN rm -rf /usr/local/tomcat/webapps/*
COPY ./build/EasebuzzCcavenuePayment.war /usr/local/tomcat/webapps/ROOT.war
CMD ["catalina.sh","run"]



################################################################################################################################







###############################################################################################################################










# Set the working directory in the container
#WORKDIR /app

# Copy the Spring Boot executable JAR file into the container
#COPY target/PaymentGateway-0.jar /app/PaymentGateway-0.jar
#COPY src/main/resources/templates/ccavutil.jar /app/ccavutil.jar

# Expose the port that the Spring Boot application will run on
#EXPOSE 5006

# Specify the command to run your Spring Boot application
#CMD ["java", "-jar", "PaymentGateway-0.jar"]

#From tomcat:8.0.51-jre8-alpine
#RUN rm -rf /usr/local/tomcat/webapps/*
#COPY ./target/employee-producer-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
#CMD ["catalina.sh","run"]