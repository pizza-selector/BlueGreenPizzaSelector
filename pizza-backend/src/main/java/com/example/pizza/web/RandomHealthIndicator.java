package com.example.pizza.web;

import java.net.UnknownHostException;

import org.springframework.boot.actuate.health.Health;
import org.springframework.boot.actuate.health.HealthIndicator;
import org.springframework.stereotype.Component;

@Component
public class RandomHealthIndicator implements HealthIndicator {

    @Override
    public Health health() {
        java.net.InetAddress localMachine;
        try {
            localMachine = java.net.InetAddress.getLocalHost();
        } catch (UnknownHostException e) {
            return Health.down().withDetail("reason", e.getMessage()).build();
        }
        Health.Builder status = Health.up();
        status.withDetail("Hostname",  localMachine.getHostName());
        return status.build();
    }
}