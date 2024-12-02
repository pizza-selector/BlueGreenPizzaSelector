package com.example.pizza.actuator;

import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.boot.actuate.health.Health;
import org.springframework.boot.actuate.health.HealthIndicator;
import org.springframework.stereotype.Component;

@Component
public class DependencyIndicator implements HealthIndicator {

    @Override
    public Health health() {
        try {
            var url = new URL("http://www.google.com/humans.txt");
            HttpURLConnection http = (HttpURLConnection)url.openConnection();
            int statusCode = http.getResponseCode();
            if (statusCode != 200) {
                return Health.down().withDetail("reason", "Oh no! Google is down").build();
            }
            return Health.up().withDetail("reason", "Phew! Google is up").build();
        } catch (Exception e) {            
            return Health.down().withDetail("reason", "Oh no! Google is down").build();
        }      
    }
}