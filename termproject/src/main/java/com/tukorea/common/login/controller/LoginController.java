package com.tukorea.common.login.controller;



import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tukorea.common.login.dto.LoginForm;
import com.tukorea.common.login.service.LoginService;


@Controller
public class LoginController {
	
	private LoginService service;
	
	@Autowired
	public LoginController(LoginService service) {
		this.service = service;
	}
	@GetMapping("/login")
	public String login() {
		return "common/login/LoginPage";
	}
	@ResponseBody
	@PostMapping("/login")
	public HashMap<String, Object> loginAjax(LoginForm loginForm, HttpServletRequest request) { 
	
	// login Service 메서드    호출
	HashMap<String, Object> resultMap = service.login(loginForm);
	// 성공    시    session에    회원    정보    저장
	String result_cd = resultMap.get("result_cd").toString(); 
	if ("00".equals(result_cd)) {
	HttpSession session = request.getSession();
	HashMap<String, Object> memberMap = (HashMap<String, Object>) resultMap.get("member");
	session.setAttribute("id", memberMap.get("ID"));
	session.setAttribute("name", memberMap.get("NAME"));
	session.setAttribute("address", memberMap.get("ADDRESS"));
	session.setAttribute("favor", memberMap.get("FAVOR")); 
	session.setAttribute("age", memberMap.get("AGE"));
	session.setAttribute("type", memberMap.get("TYPE")); 
	}
	return resultMap; 
	}
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) { 
	HttpSession session = request.getSession(false);
	if (session != null) { 
	session.invalidate();
	}
	return "redirect:/"; 
	}
	@GetMapping("/join")
	public String join() {
		return "common/login/JoinPage";
	}
}
