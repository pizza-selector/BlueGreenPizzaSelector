package com.example.pizza.actuator;

import org.springframework.boot.actuate.health.Health;
import org.springframework.boot.actuate.health.HealthIndicator;
import org.springframework.stereotype.Component;

/*
@Component
public class FailingHealthIndicator implements HealthIndicator {

    @Override
    public Health health() {
        return Health.down().withDetail("reason", "Not today").build();        
    }
}
*/