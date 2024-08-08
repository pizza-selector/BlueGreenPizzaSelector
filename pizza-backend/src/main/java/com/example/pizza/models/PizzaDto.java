package com.example.pizza.models;

import lombok.Builder;

@Builder(toBuilder = true)
public class PizzaDto {
    public String name;
    public String ingridients;
}
