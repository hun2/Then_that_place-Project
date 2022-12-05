package com.FirstProject.daily;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.FirstProject.daily.bo.DailyBO;
import com.FirstProject.daily.bo.DailyImageBO;
import com.FirstProject.daily.bo.DailyTimeLineBO;
import com.FirstProject.daily.model.Daily;
import com.FirstProject.daily.model.DailyCardView;
import com.FirstProject.daily.model.DailyImage2;
import com.FirstProject.goodplace.model.Food;
import com.FirstProject.goodplace.model.Place;
import com.FirstProject.goodplace.model.PlaceImage;
import com.FirstProject.login.model.User;

@Controller
public class DailyController {

	@Autowired
	private DailyBO dailyBo;

	@Autowired
	private DailyImageBO dailyImageBo;
	
	
	@Autowired
	private DailyTimeLineBO dailyTimeLineBo;

	// 일상페이지 접속
	@RequestMapping("/main/daily")
	public String daily(HttpSession session, User user, Model model) {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		user.setUserId(userId);
		List<User> userList = dailyBo.getUserAll(user);
		model.addAttribute("userList", userList);

		List<DailyCardView> dailyCardViewList = dailyTimeLineBo.generateDailyCardList(userId);
		model.addAttribute("dailyCardViewList", dailyCardViewList);

		return "daily";
	}

	// 일상 페이지 글쓰기 접속
	@RequestMapping("/main/daily/write")
	public String dailyWirte() {
		return "dailywrite";
	}

	// 일상페이지 - 개인글 페이지
	@GetMapping("/main/daily-detail")
	public String goodPlaceDetail(Model model, HttpSession session, @RequestParam("dailyId") int dailyId) {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		
		Daily daily = dailyBo.getDailyByDailyIdandUserId(dailyId, userId);
		model.addAttribute("dailyList", daily); 
		List<DailyImage2> imageList = dailyImageBo.getPlaceImageByDailyId(dailyId);
		model.addAttribute("imageList", imageList); 

		return "dailydetail";
	}

}
