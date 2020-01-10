package com.tea.web.action.ec;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.alibaba.fastjson.JSONObject;
import com.tea.web.entity.ec.Product;
import com.tea.web.repository.ProductRepository;

@Controller
public class ProductController {

	@Autowired
	private ProductRepository repo;

	@RequestMapping(value = { "/product/get" }, method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody Object getProduct() {
//		// 用來建立初始資料使用
//		Product product = new Product();
//		product.setName("productA");
//		product.setPrice(1600);
//		product.setDescription("productA's info");
//		repo.save(product);

		List<Product> findAll = repo.findAll();

		String jsonString = JSONObject.toJSONString(findAll);
		return jsonString;
	}

	@ResponseStatus(value = HttpStatus.OK)
	@RequestMapping(value = { "/product/insert" }, method = RequestMethod.POST)
	public void insert(@ModelAttribute("insertForm") Product product) {
		System.out.print("OK");
		System.out.print("OK");
	}
}
