package com.tea.web.action.ec;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tea.web.entity.ec.Product;
import com.tea.web.repository.ProductRepository;

@Controller
@RequestMapping(value = { "/ec/product", "/ec" })
public class ProductController {

  @Autowired
  private ProductRepository repo;

  @RequestMapping(method = RequestMethod.GET)
  public String list(ModelMap modelMap) {
    // Product product = new Product();
    // product.setName("A產品");
    // product.setPrice(1);
    // product.setDescription("A產品說明");
    // repo.save(product);
    List<Product> findAll = repo.findAll();
    modelMap.put("list", findAll);
    return "product";
  }
}
