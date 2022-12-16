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
import com.FirstProject.daily.model.PlaceCardView;
import com.FirstProject.goodplace.bo.GoodPlaceBO;
import com.FirstProject.goodplace.bo.PlaceImageBO;
import com.FirstProject.goodplace.model.Place;
import com.FirstProject.goodplace.model.PlaceImage;
import com.FirstProject.login.model.User;

@Controller
public class OtherDailyController {

	@Autowired
	private DailyTimeLineBO dailyTimeLineBo;
	@Autowired
	private DailyBO dailyBo;

	@Autowired
	private GoodPlaceBO placeBO;

	@Autowired
	private PlaceImageBO placeImageBo;

	@Autowired
	private DailyImageBO dailyImageBo;

	// 남의일상페이지
	@RequestMapping("/main/otherdaily")
	public String otherDaily(HttpSession session, User user, Model model) {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		user.setUserId(userId);
		// 팔로우 추천 리스트
		List<User> userList = dailyBo.getUserAll(user);
		model.addAttribute("userList", userList);
		int page = 0;
		List<DailyCardView> OtherDailycardViewList = dailyTimeLineBo.generateOtherDailyCardList(userId, page);
		model.addAttribute("OtherDailycardViewList", OtherDailycardViewList);

		return "otherdaily";
	}

	// 남의일상 개인 페이지
	@GetMapping("/main/otherdaily-detail")
	public String otherDailyDetail(HttpSession session, @RequestParam("dailyId") int dailyId, Model model) {

		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();

		Daily daily = dailyBo.getDailyByDailyId(dailyId);
		model.addAttribute("dailyList", daily);
		List<DailyImage2> imageList = dailyImageBo.getPlaceImageByDailyId(dailyId);
		model.addAttribute("imageList", imageList);

		return "otherdailydetail";

	}

	// 남의 맛집 페이지
	@GetMapping("/main/othergoodplace")
	public String otherGoodplace(HttpSession session, User user, Model model) {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		user.setUserId(userId);
		// 팔로우 추천 리스트
		List<User> userList = dailyBo.getUserAll(user);
		model.addAttribute("userList", userList);
		int page = 0;
		// 게시글리스트
		List<PlaceCardView> OtherGoodPlaceCardViewList = dailyTimeLineBo.generateOtherGoodPlaceCardList(userId, page);
		model.addAttribute("OtherGoodPlaceCardViewList", OtherGoodPlaceCardViewList);

		return "othergoodplace";
	}

	// 남의맛집 개인 페이지
	@GetMapping("/main/othergoodplace-detail")
	public String otherGoodPlaceDetail(HttpSession session, @RequestParam("placeId") int placeId, Model model) {

		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();

		Place place = placeBO.getPlaceByPlaceId(placeId);
		model.addAttribute("placeList", place);
		List<PlaceImage> placeList = placeImageBo.getPlaceImageByPlaceId(placeId);
		model.addAttribute("imageList", placeList);

		return "othergoodplacedetail";
	}
	
	//남의 노맛집 페이지
	@GetMapping("/main/otherbadplace")
	public String otherBadPlace(HttpSession session, User user, Model model) {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		user.setUserId(userId);
		// 팔로우 추천 리스트
		List<User> userList = dailyBo.getUserAll(user);
		model.addAttribute("userList", userList);
		int page = 0;
		// 게시글리스트
		List<PlaceCardView> OtherBadPlaceCardViewList = dailyTimeLineBo.generateOtherBadPlaceCardList(userId, page);
		model.addAttribute("OtherBadPlaceCardViewList", OtherBadPlaceCardViewList);

		return "otherbadplace";
	}
}
