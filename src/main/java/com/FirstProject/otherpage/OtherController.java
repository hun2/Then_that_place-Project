package com.FirstProject.otherpage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.FirstProject.daily.bo.DailyTimeLineBO;
import com.FirstProject.daily.bo.FollowBO;
import com.FirstProject.daily.model.DailyCardView;
import com.FirstProject.goodplace.bo.TimeLineBO;
import com.FirstProject.goodplace.model.CardView;
import com.FirstProject.goodplace.model.Place;
import com.FirstProject.login.bo.UserBO;
import com.FirstProject.login.model.User;

@Controller
public class OtherController {

	@Autowired
	private DailyTimeLineBO dailyTimeLineBo;
	
	@Autowired
	private FollowBO followBo;
	
	@Autowired
	private TimeLineBO timeLineBo;
	
	@Autowired
	private UserBO userBo;
	
	@RequestMapping("/otherpage")
	public String otherpage( HttpSession session, Model model ,@RequestParam("userId") String userId) {
		//세션
		User users = (User) session.getAttribute("loginUser");
		//파라미터넘긴 userId의 정보 
		User uid = userBo.getUserById(userId);
		int page = 0;
		Place place = new Place();
		place.setUserId(userId);
		//일상게시글들
		List<DailyCardView> dailyCardViewList = dailyTimeLineBo.myPageDailyCardList(userId, page);
		//맛집게시글들
		List<CardView> cardViewList = timeLineBo.myPageCardList(place, page);
		//노맛집게시글들
		List<CardView> badCardViewList = timeLineBo.myPageBadCardList(place, page);
		//팔로워리스트들
		List<User> FollowedList = followBo.getFollowListByUserId(userId);
		int FollowCount = followBo.getFollowCountByUserId(userId);
		
		//팔로우리스트들
		List<User> FollowList = followBo.getFollowedListByUserId(userId);
		int FollowedCount = followBo.getFollowedCountByUserId(userId);
		
		int num = 0;
		for ( int i = 0; i<dailyCardViewList.size(); i++) {
			num ++;
		}
		for(int j = 0; j <cardViewList.size(); j++) {
			num ++;
		}
		for ( int h = 0; h < badCardViewList.size(); h++) {
			num ++;
		}
		model.addAttribute("uid", uid);
		model.addAttribute("dailyCardViewList", dailyCardViewList);
		model.addAttribute("num", num);
		model.addAttribute("FollowList", FollowList);
		model.addAttribute("FollowCount", FollowCount);
		model.addAttribute("FollowedList", FollowedList);
		model.addAttribute("FollowedCount", FollowedCount);
		
		
		return "otherpage";
	}
}
