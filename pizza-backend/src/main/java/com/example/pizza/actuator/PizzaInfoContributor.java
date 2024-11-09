package com.example.pizza.actuator;

import org.springframework.boot.actuate.info.Info.Builder;
import org.springframework.boot.actuate.info.InfoContributor;
import org.springframework.stereotype.Component;

@Component
public class PizzaInfoContributor implements InfoContributor{

    @Override
    public void contribute(Builder builder) {
        builder.withDetail("version", "42");
    }
    
}
