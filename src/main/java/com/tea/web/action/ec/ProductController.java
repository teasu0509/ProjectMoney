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

	@RequestMapping(value = { "/ec" }, method = RequestMethod.GET)
	public @ResponseBody Object getPageInfo() {
//		// 用來建立初始資料使用
//		Product product = new Product();
//		product.setName("A產品");
//		product.setPrice(1);
//		product.setDescription("A產品說明");
//		repo.save(product);

		List<Product> findAll = repo.findAll();

		String jsonString = JSONObject.toJSONString(findAll);
		return jsonString;
	}

	@ResponseStatus(value = HttpStatus.OK)
	@RequestMapping(value = { "/insert" }, method = RequestMethod.POST)
	public void insert(@ModelAttribute("insertForm") Product product) {
		System.out.print("OK");
		System.out.print("OK");
	}
}
