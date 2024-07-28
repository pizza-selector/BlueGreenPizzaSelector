package com.example.pizza;
import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {
    Logger logger = LoggerFactory.getLogger(HomeController.class);

    @GetMapping("/")
	public String index() {
        logger.info("An INFO Message from home!");
		return "Greetings from Spring Boot!";
	}
}