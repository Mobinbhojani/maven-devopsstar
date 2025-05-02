FROM maven:3.8.4-openjdk-17 AS builder

WORKDIR /app

COPY . .

RUN mvn package

# Tomcat image for deployment
FROM tomcat:9.0.56-jdk17-openjdk-slim

WORKDIR /usr/local/tomcat/webapps 

COPY --from=builder /app/webapp/target/*.war . 

EXPOSE 8080

#comamnd to run tomcat
CMD ["catalina.sh", "run"]
