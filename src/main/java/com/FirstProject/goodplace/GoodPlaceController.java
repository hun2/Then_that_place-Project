package com.FirstProject.goodplace;

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
import com.FirstProject.goodplace.dao.FoodDAO;
import com.FirstProject.goodplace.model.CardView;
import com.FirstProject.goodplace.model.Food;
import com.FirstProject.goodplace.model.Place;
import com.FirstProject.goodplace.model.PlaceImage;
import com.FirstProject.login.model.User;

@Controller
public class GoodPlaceController {
	@Autowired
	private FoodBO foodBo;
	
	@Autowired
	private GoodPlaceBO goodPlaceBo;
	
	@Autowired
	private TimeLineBO timeLineBo;

	@Autowired
	private PlaceImageBO placeImageBo;
	// 맛집페이지 접속
	@RequestMapping("/main/places/good")
	public String goodPlace(Model model, User user, HttpSession session) {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		user.setUserId(userId);
		List<CardView> cardViewList = timeLineBo.generateCardList(userId);
		model.addAttribute("cardViewList", cardViewList);
		return "goodplace";
	}
	

	
	// 맛집페이지 글쓰기 접속
	@RequestMapping("/main/places/good-write")
	public String goodPlaceWrite() {
		
		return "goodplacewrite";
	}
	
	
	//맛집페이지 - 개인글 페이지
	@GetMapping("/main/places/good-detail")
	public String goodPlaceDetail(Model model, HttpSession session, @RequestParam("placeId") int placeId) {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		Place place = goodPlaceBo.getPlaceByPlaceIdAndUserId(placeId, userId);
		List<Food> foodList = foodBo.getFoodByPlaceId(placeId);
		List<PlaceImage> imageList = placeImageBo.getPlaceImageByPlaceId(placeId);
		model.addAttribute("place", place);
		model.addAttribute("foodList", foodList);
		model.addAttribute("imageList", imageList);
		
		return "goodplacedetail";
	}
	
}
