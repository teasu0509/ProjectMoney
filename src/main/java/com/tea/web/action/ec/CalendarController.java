package com.tea.web.action.ec;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.tea.web.entity.User;
import com.tea.web.entity.ec.Calendar;
import com.tea.web.repository.CalendarRepository;
import com.tea.web.repository.UserRepository;

@Controller
@RequestMapping(value = "/calendar")
public class CalendarController {
	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);

	@Autowired
	private UserRepository repo1;
	@Autowired
	private CalendarRepository repo2;

	@RequestMapping(value = { "/get", "/", "" }, method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody Object get() {
		List<Calendar> findAll = repo2.findAll();

		String jsonString = JSONObject.toJSONString(findAll);
		return jsonString;
	}

	@ResponseStatus(value = HttpStatus.OK)
	@RequestMapping(value = { "/insert" }, method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public void insert(@RequestBody String string) {

		try {
			logger.info("新增事件");
			User user = repo1.findById(1);
			Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm:ss:SSS'Z'").create();
			Calendar calendar = g.fromJson(string, Calendar.class);
			calendar.setUser(user);
//			System.out.print(calendar.getStart());
//			System.out.print(calendar.getEnd());
			repo2.save(calendar);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	@ResponseStatus(value = HttpStatus.OK)
	@RequestMapping(value = { "/update" }, method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public void update(@RequestBody String string) {

		try {
			logger.info("修改事件");
			Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm:ss:SSS'Z'").create();
			Calendar calendar = g.fromJson(string, Calendar.class);
			repo2.saveAndFlush(calendar);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	@ResponseStatus(value = HttpStatus.OK)
	@RequestMapping(value = { "/delete" })
	public void delete(int id) {
		try {
			logger.info("刪除事件");
			repo2.deleteById(id);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
