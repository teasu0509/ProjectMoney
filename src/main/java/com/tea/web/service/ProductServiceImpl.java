package com.tea.web.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;

import com.tea.web.entity.ec.Product;
import com.tea.web.repository.ProductRepository;

public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductRepository repo;

	@Override
	public List<Product> findAll() {
//		// 用來建立初始資料使用
//		Product product = new Product();
//		product.setName("玩偶");
//		product.setPrice(500);
//		product.setDescription("好玩的玩具");
//		repo.save(product);

		return repo.findAll();
	}

	@Override
	public List<Product> findByStatus(int status) {
		// TODO Auto-generated method stub
		return repo.findByStatus(status);
	}

	@Override
	public List<Product> findAllById(Iterable<UUID> ids) {
		return repo.findAllById(ids);
	}

	@Override
	public void save(Product product) {
		repo.save(product);
	}
}
