package com.tea.web.schedule;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class schedule {

//	@Scheduled(fixedRate = 5000)
	public void test() {
		System.out.print("OK");
	}

}
