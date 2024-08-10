package com.example.pizza;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import java.lang.Thread;

@SpringBootApplication
public class PizzaApplication {

	public static void main(String[] args) throws InterruptedException {
		Thread.sleep(30000);
		SpringApplication.run(PizzaApplication.class, args);
	}

}
