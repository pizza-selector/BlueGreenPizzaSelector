package com.example.pizza.models;

public class BadException extends Exception {
    public BadException(String errorMessage) {
        super(errorMessage);
    }
}
