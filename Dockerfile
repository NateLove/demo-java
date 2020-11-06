FROM alpine/git as clone
WORKDIR /app
RUN git clone https://github.com/NateLove/demo-java.git

FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY --from=clone /app/demo-java /app
RUN mvn package

FROM  tomcat:8.5
EXPOSE 8080
CMD ["catalina.sh", "run"]
