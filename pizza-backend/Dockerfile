FROM eclipse-temurin:21-jre-alpine

RUN addgroup --system spring && adduser -s /sbin/nologin --system -g spring spring
USER spring:spring
ARG JAR_FILE=build/libs/*.jar

COPY ${JAR_FILE} app.jar

COPY newrelic newrelic
RUN --mount=type=secret,id=NEW_RELIC_KEY NEW_RELIC_KEY=$(cat /run/secrets/NEW_RELIC_KEY)
ENV NEW_RELIC_KEY $NEW_RELIC_KEY
RUN envsubst < /newrelic/newrelic.yml.tmp > /newrelic/newrelic.yml

EXPOSE 8080

ENTRYPOINT ["java", "-javaagent:/newrelic/newrelic.jar", "-jar","/app.jar"]