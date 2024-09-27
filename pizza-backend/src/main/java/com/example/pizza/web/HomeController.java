package com.example.pizza.web;

import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.pizza.jpa.JpaPizzaRepository;
import com.example.pizza.models.BadException;
import com.example.pizza.models.PizzaDto;
import java.util.Random;

@RestController
public class HomeController {
    Logger logger = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    private JpaPizzaRepository pizzaRepository;

    @GetMapping("/")
	public String index() {
        logger.info("An INFO Message from home!");
		return "Delayed greetings from Spring Boot!";
	}

    @GetMapping("/danger")
	public void dangerZone() throws BadException {
        throw new BadException("Should not have called it!..");
	}

    @GetMapping("/pizza")
	public PizzaDto getPizza() {
        var allPizzas = pizzaRepository.findAll();
        Random rand = new Random();
        var randomPizza = allPizzas.get(rand.nextInt(allPizzas.size()));
		return PizzaDto.builder().name(randomPizza.getName()).ingridients(randomPizza.getIngridients()).build();
	}
}