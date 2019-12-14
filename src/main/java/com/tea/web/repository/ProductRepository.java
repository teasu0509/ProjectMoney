package com.tea.web.repository;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tea.web.entity.ec.Product;

public interface ProductRepository extends JpaRepository<Product, UUID> {

}
