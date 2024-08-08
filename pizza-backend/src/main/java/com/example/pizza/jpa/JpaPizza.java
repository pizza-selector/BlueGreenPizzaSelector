package com.example.pizza.jpa;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import java.util.UUID;

@Generated
@Getter
@FieldDefaults(level = AccessLevel.PRIVATE)
@Builder(toBuilder = true)
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
@Entity
@Table(name = "pizza", schema = "pizzadata")
public class JpaPizza {
  @Id
  @Column(name = "id")
  UUID id;

  @Column(name = "name")
  String name;

  @Column(name = "ingridients")
  String ingridients;
}
