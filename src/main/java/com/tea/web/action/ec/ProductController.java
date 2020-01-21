package com.tea.web.action.ec;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

    @RequestMapping(value = {
            "/product/get" }, method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    public @ResponseBody Object getProduct() {
        String jsonString = null;
        try {
            int a = 0;
            List<Product> findAll = productService.findAll();
            // findNormal只抓Fettle欄位為0的資料
            List<Product> findNormal = new ArrayList<Product>();
            for (int i = 0; i < findAll.size(); i++) {
                a = findAll.get(i).getFettle();
                if (a == 0) {
                    findNormal.add(findAll.get(i));
                }
            }
            jsonString = JSONObject.toJSONString(findNormal);
        }
        catch (Exception e) {
            logger.info("getProduct()=>狀態異常，請檢查!");
        }

        return jsonString;
    }

    @ResponseStatus(value = HttpStatus.OK)
    @RequestMapping(value = { "/product/insert" }, method = RequestMethod.POST)
    public void insert(@ModelAttribute("insertForm") Product product) {
        try {
            // 建立商品，預設0為初始狀態。
            product.setFettle(0);
            productService.save(product);
        }
        catch (Exception e) {
            logger.info("insert()=>狀態異常，請檢查!");
        }


    }
    

    @ResponseStatus(value = HttpStatus.OK)
    @RequestMapping(value = { "/product/revise" }, method = RequestMethod.POST)
    public void revise(@ModelAttribute("reviseForm") Product product) {
        try {
            // 建立商品，預設0為初始狀態。
            product.setFettle(0);
            productService.save(product);
        }
        catch (Exception e) {
            logger.info("revise()=>狀態異常，請檢查!");
        }


    }

    @ResponseStatus(value = HttpStatus.OK)
    @RequestMapping(value = { "/product/delete" }, method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @ResponseBody
    public void delete(@RequestParam("datas") ArrayList<String> ids) {
	         try {
	             for(int i = 0 ; i < ids.size(); i++) {
	                Product product = new Product();
	                product = productService.findAllById(Arrays.asList(UUID.fromString(ids.get(i)))).get(0);
	             // 刪除商品，改為1為廢棄狀態。
	                product.setFettle(1);
	                productService.save(product);
	             }
	         }catch(Exception e) {
	             System.out.print(e);
	             logger.info("刪除()=>狀態異常，請檢查!");
	         }

    }

}
