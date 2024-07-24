FROM eclipse-temurin:21-jre-alpine

RUN addgroup --system spring && adduser -s /sbin/nologin --system -g spring spring
USER spring:spring
ARG JAR_FILE=build/libs/*.jar

COPY ${JAR_FILE} app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar","/app.jar"]