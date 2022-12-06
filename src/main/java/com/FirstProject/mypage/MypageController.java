package com.FirstProject.mypage;

import java.util.List;

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
public class MypageController {

	@Autowired
	private DailyTimeLineBO dailyTimeLineBo;
	
	@Autowired
	private TimeLineBO timeLineBo;
	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		
		
		List<DailyCardView> dailyCardViewList = dailyTimeLineBo.generateDailyCardList(userId);
		List<CardView> cardViewList = timeLineBo.generateCardList(userId);
		List<CardView> badCardViewList = timeLineBo.generateBadCardList(userId);
		int num = 0;
		for ( int i = 0; i<dailyCardViewList.size(); i++) {
			num += i;
		}
		for(int j = 0; j <cardViewList.size(); j++) {
			num += j;
		}
		for ( int h = 0; h < badCardViewList.size(); h++) {
			num += h;
		}
		model.addAttribute("dailyCardViewList", dailyCardViewList);
		model.addAttribute("num", num);
		return "mypage";
	}
}
