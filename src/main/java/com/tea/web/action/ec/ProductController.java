package com.tea.web.action.ec;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.tea.web.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@RequestMapping(value = {"/product/get" }, method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody Object getProduct() {
		String jsonString = null;
		try {
			List<Product> findAll = productService.findAll();
			jsonString = JSONObject.toJSONString(findAll);
			logger.info("getProduct()=>狀態正常");
		} catch (Exception e) {
			logger.info("getProduct()=>狀態異常，請檢查!");
		}

		return jsonString;
	}

	@ResponseStatus(value = HttpStatus.OK)
	@RequestMapping(value = { "/product/insert" }, method = RequestMethod.POST)
	public void insert(@ModelAttribute("insertForm") Product product) {
		System.out.print("OK");
		System.out.print("OK");
	}
}
