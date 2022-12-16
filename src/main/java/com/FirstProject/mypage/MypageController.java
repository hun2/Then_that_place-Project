package com.FirstProject.mypage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.FirstProject.daily.bo.DailyTimeLineBO;
import com.FirstProject.daily.bo.FollowBO;
import com.FirstProject.daily.model.DailyCardView;
import com.FirstProject.daily.model.Follow;
import com.FirstProject.goodplace.bo.TimeLineBO;
import com.FirstProject.goodplace.model.CardView;
import com.FirstProject.goodplace.model.Place;
import com.FirstProject.login.model.User;

@Controller
public class MypageController {

	@Autowired
	private DailyTimeLineBO dailyTimeLineBo;
	
	@Autowired
	private FollowBO followBo;
	
	@Autowired
	private TimeLineBO timeLineBo;
	
	//마이페이지 접속
	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		Place place = new Place();
		place.setUserId(userId);
		int page = 0;
		
		List<DailyCardView> dailyCardViewList = dailyTimeLineBo.myPageDailyCardList(userId, page);
		List<CardView> cardViewList = timeLineBo.myPageCardList(place, page);
		List<CardView> badCardViewList = timeLineBo.myPageBadCardList(place,page);
		List<User> FollowedList = followBo.getFollowListByUserId(userId);
		int FollowCount = followBo.getFollowCountByUserId(userId);
		
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
		model.addAttribute("dailyCardViewList", dailyCardViewList);
		model.addAttribute("num", num);
		model.addAttribute("FollowList", FollowList);
		model.addAttribute("FollowCount", FollowCount);
		model.addAttribute("FollowedList", FollowedList);
		model.addAttribute("FollowedCount", FollowedCount);
		
		return "mypage";
	}
	
	//마이페이지 프로필 설정
	@RequestMapping("/account/edit")
	public String edit(HttpSession session) {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		
		return "edit";
	}
}
