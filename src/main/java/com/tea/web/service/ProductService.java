package com.tea.web.service;

import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tea.web.entity.ec.Product;
import com.tea.web.repository.ProductRepository;

@Service
public class ProductService {
  private static final Logger logger = LoggerFactory.getLogger(ProductService.class);
  @Autowired
  private ProductRepository repo;

  public List<Product> findAll() {
    logger.debug("call findAll");
    return repo.findAll();
  }

  public List<Product> findByStatus(int status) {
    logger.debug("call findByStatus");
    return repo.findByStatus(status);
  }

  public Product getOne(UUID id) {
    logger.debug("call getOne");
    return repo.getOne(id);
  }

  public List<Product> findAllById(Iterable<UUID> ids) {
    logger.debug("call findAllById");
    return repo.findAllById(ids);
  }

  public void save(Product product) {
    logger.debug("call save");
    repo.save(product);
  }
}
