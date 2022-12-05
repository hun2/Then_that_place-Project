package com.FirstProject.badplace;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.FirstProject.goodplace.bo.FoodBO;
import com.FirstProject.goodplace.bo.GoodPlaceBO;
import com.FirstProject.goodplace.bo.PlaceImageBO;
import com.FirstProject.goodplace.bo.TimeLineBO;
import com.FirstProject.goodplace.model.CardView;
import com.FirstProject.goodplace.model.Food;
import com.FirstProject.goodplace.model.Place;
import com.FirstProject.goodplace.model.PlaceImage;
import com.FirstProject.login.model.User;

@Controller
public class BadPlaceController {
	
	@Autowired
	private FoodBO foodBo;
	
	@Autowired
	private PlaceImageBO placeImageBo;
	
	@Autowired
	private TimeLineBO timeLineBo;

	@Autowired
	private GoodPlaceBO goodPlaceBo;
	
	// 노맛집페이지 접속
	@RequestMapping("/main/places/bad")
	public String badPlace(Model model, User user, HttpSession session) {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		user.setUserId(userId);
		List<CardView> cardViewList = timeLineBo.generateBadCardList(userId);
		model.addAttribute("cardViewList", cardViewList);
		return "badplace";
	}

	// 노맛집페이지 글쓰기 접속
	@RequestMapping("/main/places/bad-write")
	public String badPlaceWrite() {

		return "badplacewrite";
	}

	// 노맛집페이지 - 개인글 페이지
	@GetMapping("/main/places/bad-detail")
	public String badPlaceDetail(Model model, HttpSession session, @RequestParam("placeId") int placeId) {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		Place place = goodPlaceBo.getPlaceByPlaceIdAndUserId(placeId, userId);
		List<Food> foodList = foodBo.getFoodByPlaceId(placeId);
		List<PlaceImage> imageList = placeImageBo.getPlaceImageByPlaceId(placeId);
		model.addAttribute("place", place);
		model.addAttribute("foodList", foodList);
		model.addAttribute("imageList", imageList);

		return "badplacedetail";
	}

}
