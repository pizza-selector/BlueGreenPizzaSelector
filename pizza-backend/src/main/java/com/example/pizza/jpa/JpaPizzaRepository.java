package com.example.pizza.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.UUID;

public interface JpaPizzaRepository extends JpaRepository<JpaPizza, UUID> {

    JpaPizza findByName(String name);

}