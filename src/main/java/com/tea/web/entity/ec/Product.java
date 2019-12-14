package com.tea.web.entity.ec;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "ecProducts")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class Product {

  @GeneratedValue(generator = "uuid2")
  @GenericGenerator(name = "uuid2", strategy = "uuid2")
  @Column(columnDefinition = "BINARY(16)")
  @Id
  private UUID id;

  @Column(name = "name", columnDefinition = "nvarchar(255)", nullable = false)
  private String name;

  @Column(name = "price", nullable = false)
  private int price;

  @Column(name = "description", columnDefinition = "nvarchar(255)", nullable = false)
  private String description;

  public UUID getId() {
    return id;
  }

  public void setId(UUID id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getPrice() {
    return price;
  }

  public void setPrice(int price) {
    this.price = price;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

}
