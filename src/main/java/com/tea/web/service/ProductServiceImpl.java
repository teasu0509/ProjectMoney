package com.tea.web.service;

import java.util.List;

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
		
		List<Product> list = repo.findAll();
		return list;
	}

}
