package com.example.pizza.web;


import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.Test;
import org.junit.jupiter.api.BeforeEach;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

@SpringBootTest
@ActiveProfiles("test")
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
        assertEquals(result, "");
	}

}