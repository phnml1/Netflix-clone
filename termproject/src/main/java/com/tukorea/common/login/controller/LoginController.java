package com.tukorea.common.login.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class LoginController {
	
	@GetMapping("/login")
	public String login() {
		return "common/login/LoginPage";
	}
	@GetMapping("/join")
	public String join() {
		return "common/login/JoinPage";
	}
}
