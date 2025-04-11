FROM eclipse-temurin:21-jre-jammy
COPY ./target/HW1.jar /app/runner.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/runner.jar"]
