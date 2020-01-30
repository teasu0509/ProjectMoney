package com.tea.web.service;

import java.util.List;
import java.util.UUID;

import com.tea.web.entity.ec.Product;

public interface ProductService {
	List<Product> findAll();

	List<Product> findByStatus(int status);
	
	void save(Product product);

	List<Product> findAllById(Iterable<UUID> ids);

}
