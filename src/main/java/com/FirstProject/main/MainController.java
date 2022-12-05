package com.FirstProject.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.FirstProject.daily.bo.DailyTimeLineBO;
import com.FirstProject.daily.model.DailyCardView;
import com.FirstProject.goodplace.bo.TimeLineBO;
import com.FirstProject.goodplace.model.CardView;
import com.FirstProject.login.model.User;

@Controller
public class MainController {
	
	@Autowired
	private TimeLineBO timeLineBo;
	
	@Autowired
	private DailyTimeLineBO dailyTimeLineBo;
	
	// 메인페이지 접속
	@RequestMapping("/main")
	public String main(HttpSession session, Model model, User user) {

		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		user.setUserId(userId);
		List<CardView> goodPlaceList = timeLineBo.mainCardList(userId);
		List<CardView> badPlaceList = timeLineBo.mainBadCardList(userId);
		List<DailyCardView> dailyList = dailyTimeLineBo.mainCardList(userId);
		model.addAttribute("goodPlaceList", goodPlaceList);
		model.addAttribute("badPlaceList", badPlaceList);
		model.addAttribute("dailyList", dailyList);
		
		return "main";
	}

	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {

		HttpSession session = request.getSession();
		session.removeAttribute("loginUser");
		return "redirect:/login";
	}

	
	
	
	
	
	
	
	
	
	
}
