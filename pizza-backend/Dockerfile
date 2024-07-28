FROM eclipse-temurin:21-jre-alpine

RUN addgroup --system spring && adduser -s /sbin/nologin --system -g spring spring
USER spring:spring
ARG JAR_FILE=build/libs/*.jar

COPY ${JAR_FILE} app.jar

COPY /newrelic /newrelic

EXPOSE 8080

ENTRYPOINT ["java", "-javaagent:/newrelic/newrelic.jar", "-jar","/app.jar"]