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
import com.FirstProject.login.model.User;

@Controller
public class OtherDailyController {

	@Autowired
	private DailyTimeLineBO dailyTimeLineBo;
	@Autowired
	private DailyBO dailyBo;
	
	@Autowired
	private DailyImageBO dailyImageBo;
	
	//일상페이지
	@RequestMapping("/main/otherdaily")
	public String otherDaily(HttpSession session, User user, Model model) {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		user.setUserId(userId);
		List<User> userList = dailyBo.getUserAll(user);
		model.addAttribute("userList", userList);
		
		List<DailyCardView> OtherDailycardViewList = dailyTimeLineBo.generateOtherDailyCardList(userId);
		model.addAttribute("OtherDailycardViewList", OtherDailycardViewList);
		
		return "otherdaily";
	}
	
	
	//일상 개인 페이지
	@GetMapping("/main/otherdaily-detail")
	public String otherDailyDetail(HttpSession session, @RequestParam("dailyId") int dailyId , Model model) {
		
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		
		Daily daily = dailyBo.getDailyByDailyId(dailyId);
		model.addAttribute("dailyList", daily); 
		List<DailyImage2> imageList = dailyImageBo.getPlaceImageByDailyId(dailyId);
		model.addAttribute("imageList", imageList); 
		
		
		return "otherdailydetail";

	}
	
	
}
