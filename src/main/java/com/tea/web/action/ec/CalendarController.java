package com.tea.web.action.ec;

import java.util.List;

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
public class CalendarController {

	@Autowired
	private UserRepository repo1;
	@Autowired
	private CalendarRepository repo2;

	@RequestMapping(value = { "/calendar/get" }, method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody Object get() {
		List<Calendar> findAll = repo2.findAll();

		String jsonString = JSONObject.toJSONString(findAll);
		return jsonString;
	}

	@ResponseStatus(value = HttpStatus.OK)
	@RequestMapping(value = { "/calendar/insert" }, method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public void insert(@RequestBody String string) {

		try {
			User user = repo1.findById(1);
			Gson g=  new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm:ss").create();
			Calendar calendar = g.fromJson(string, Calendar.class);
			calendar.setUser(user);
//			System.out.print(calendar.getStart());
//			System.out.print(calendar.getEnd());
			repo2.save(calendar);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
