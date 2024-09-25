package com.example.pizza.web;


import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;

public class HomeControllerTests {
    public HomeControllerTests() {}

    private HomeController controller;

    @BeforeEach
    public void setup() {
        controller = new HomeController();
    }

	@Test
	public void index_returnsString() {
        var result = controller.index();
        assertEquals("Delayed greetings from Spring Boot!", result);
	}

}