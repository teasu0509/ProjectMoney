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
import com.tea.web.entity.ec.Schedule;
import com.tea.web.repository.ScheduleRepository;
import com.tea.web.repository.UserRepository;

@Controller
public class ScheduleController {

	@Autowired
	private UserRepository repo1;
	@Autowired
	private ScheduleRepository repo2;

	@RequestMapping(value = {"/schedule/get" }, method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody Object get() {
//		Date date = new Date(0);
//		User user = repo1.findById(1234);
//		// 用來建立初始資料使用
//		Schedule schedule = new Schedule();
//		schedule.setEvent("eventB");
//		schedule.setEventValue(2);
//		schedule.setUser(user);
//		schedule.setCreateDate(date);
//		schedule.setAlterDate(date);
//		schedule.setScheduleDate(date);
//		
//		repo2.save(schedule);

		List<Schedule> findAll = repo2.findAll();

		String jsonString = JSONObject.toJSONString(findAll);
		return jsonString;
	}

	@ResponseBody
	@ResponseStatus(value = HttpStatus.OK)
	@RequestMapping(value = { "/schedule/insert" })
	public void insert(@RequestBody Schedule schedule) {
		System.out.print("OK");
		System.out.print("OK");
	}
}
