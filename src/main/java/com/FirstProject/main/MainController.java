package com.FirstProject.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.FirstProject.login.model.User;

@Controller
public class MainController {

	// 메인페이지 접속
	@RequestMapping("/main")
	public String main(HttpSession session, Model model) {

		User user = (User) session.getAttribute("loginUser");

		return "main";
	}

	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {

		HttpSession session = request.getSession();
		session.removeAttribute("loginUser");
		return "redirect:/login";
	}

	
	// 일상페이지 접속
	@RequestMapping("/main/daily")
	public String daily() {
		
		return "daily";
	}
	
	
	// 맛집페이지 접속
	@RequestMapping("/main/places/good")
	public String goodPlace() {
		
		return "goodplace";
	}
	
	// 노맛집페이지 접속
	@RequestMapping("/main/places/bad")
	public String badPlace() {
		
		return "badplace";
	}
	
	
	
	// 맛집페이지 글쓰기 접속
	@RequestMapping("/main/places/good-write")
	public String goodPlaceWrite() {
		
		return "goodplacewrite";
	}
	
	
	
	
}
