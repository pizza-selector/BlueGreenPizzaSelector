FROM eclipse-temurin:21-jre-alpine

RUN addgroup --system spring && adduser -s /sbin/nologin --system -g spring spring
USER spring:spring
ARG JAR_FILE=build/libs/*.jar

COPY ${JAR_FILE} app.jar

COPY newrelic newrelic
ARG NEW_RELIC_KEY=test
ENV NEW_RELIC_KEY $NEW_RELIC_KEY
RUN envsubst < /newrelic/newrelic.yml > /newrelic/newrelic.yml

EXPOSE 8080

ENTRYPOINT ["java", "-javaagent:/newrelic/newrelic.jar", "-jar","/app.jar"]