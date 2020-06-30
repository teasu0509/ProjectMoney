package com.tea.web.action.ec;

import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.alibaba.fastjson.JSONObject;
import com.tea.web.entity.ec.Product;
import com.tea.web.service.ProductService;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Autowired
	private ProductService productService;

	@GetMapping(value = { "/get", "/", "" }, produces = "application/json; charset=utf-8")
	public @ResponseBody Object getProduct() {
		String jsonString = null;
		try {
			// findNormal只抓status欄位為0的資料
			List<Product> list = productService.findByStatus(0);
			jsonString = JSONObject.toJSONString(list);
		} catch (Exception e) {
			logger.error("getProduct()=>狀態異常，請檢查!", e);
		}
		return jsonString;
	}

	@ResponseStatus(value = HttpStatus.OK)
	@PostMapping(value = { "/insert" })
	public void insert(@ModelAttribute("insertForm") Product product) {
		try {
			logger.info("新增商品: " + product.getName());
			// 建立商品，預設0為初始狀態。
			product.setStatus(0);
			productService.save(product);
		} catch (Exception e) {
			logger.error("insert()=>狀態異常，請檢查!", e);
		}

	}

	@ResponseStatus(value = HttpStatus.OK)
	@PostMapping(value = { "/revise" })
	public void revise(@ModelAttribute("reviseForm") Product product) {
		try {
			logger.info("修改商品: " + product.getName());
			// 修改商品，預設0為初始狀態。
			product.setStatus(0);
			productService.save(product);
		} catch (Exception e) {
			logger.error("revise()=>狀態異常，請檢查!", e);
		}

	}

	@ResponseStatus(value = HttpStatus.OK)
	@PostMapping(value = { "/delete" }, produces = "application/json; charset=utf-8")
	@ResponseBody
	public void delete(@RequestParam("datas") List<String> ids) {
		try {
			logger.info("刪除商品: " + ids);
			for (int i = 0; i < ids.size(); i++) {
				Product product = productService.getOne(UUID.fromString(ids.get(i)));
				// 刪除商品，改為1為廢棄狀態。
				product.setStatus(1);
				productService.save(product);
			}
		} catch (Exception e) {
			logger.error("刪除()=>狀態異常，請檢查!", e);
		}
	}
}
