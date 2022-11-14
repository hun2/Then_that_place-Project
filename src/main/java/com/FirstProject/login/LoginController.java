package com.FirstProject.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	//로그인 view
	@RequestMapping("login")
	public String login() {
		
		return "login";
	}
	
	
	//회원가입 view
	@RequestMapping("/login/sign-up")
	public String signUp() {
		
		return "signup";
	}
	
	
	//아이디 찾기 view
	@RequestMapping("/login/user-id")
	public String userId() {
		
		return "userid";
	}
	
	//비밀번호 찾기 view
	@RequestMapping("/login/user-pwd")
	public String userPwd() {
		
		return "userpwd";
	}
	
}
