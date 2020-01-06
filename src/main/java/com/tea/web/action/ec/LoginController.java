package com.tea.web.action.ec;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tea.web.entity.User;
import com.tea.web.repository.UserRepository;

@Controller
public class LoginController {

	@Autowired
	private UserRepository repo;

	@RequestMapping(value = "/login")
	public String login(@ModelAttribute("userFormData") User user) {
		try {
			User result = repo.findByUsernameAndPassword(user.getUsername(), user.getPassword());
			List<User> result2 = repo.findAll(Example.of(user));
			
		} catch (Exception e) {
			System.out.print(e);
		}
		return "home";
	}

}