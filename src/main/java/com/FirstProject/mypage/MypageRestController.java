package com.FirstProject.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.FirstProject.common.DailyImage;
import com.FirstProject.daily.bo.CommentBO;
import com.FirstProject.daily.bo.DailyBO;
import com.FirstProject.daily.bo.DailyImageBO;
import com.FirstProject.daily.bo.DailyTimeLineBO;
import com.FirstProject.daily.bo.LikeBO;
import com.FirstProject.daily.model.Comment;
import com.FirstProject.daily.model.Daily;
import com.FirstProject.daily.model.DailyCardView;
import com.FirstProject.daily.model.DailyImage2;
import com.FirstProject.goodplace.bo.GoodPlaceBO;
import com.FirstProject.goodplace.bo.PlaceImageBO;
import com.FirstProject.goodplace.bo.TimeLineBO;
import com.FirstProject.goodplace.model.CardView;
import com.FirstProject.goodplace.model.Place;
import com.FirstProject.goodplace.model.PlaceImage;
import com.FirstProject.login.model.User;

@Controller
@ResponseBody
public class MypageRestController {

	@Autowired
	private TimeLineBO timeLineBo;
	
	@Autowired
	private DailyBO dailyBo;
	
	@Autowired
	private DailyImageBO dailyImageBo;
	
	@Autowired
	private DailyTimeLineBO dailyTimeLineBo;
	
	@Autowired
	private LikeBO likeBo;
	
	@Autowired
	private CommentBO commentBo;
	
	@Autowired
	private GoodPlaceBO goodPlaceBo;
	
	@Autowired
	private PlaceImageBO placeImageBo;
	
	
	//맛집 메뉴 클릭시
	@RequestMapping("/mypage/goodplace")
	public Map<String, Object> goodPlace(HttpSession session){
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		Map<String, Object> result =  new HashMap<>();
		List<CardView> cardViewList = timeLineBo.generateCardList(userId);
		result.put("goodPlaceList", cardViewList);
		return result;
	}
	
	//노맛집 메뉴 클릭시
	@RequestMapping("/mypage/badplace")
	public Map<String, Object> badPlace(HttpSession session){
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		Map<String, Object> result =  new HashMap<>();
		List<CardView> cardViewList = timeLineBo.generateBadCardList(userId);
		result.put("badPlaceList", cardViewList);
		return result;
	}
	
	//일상 메뉴 클릭
	@RequestMapping("/mypage/daily")
	public Map<String, Object> daily(HttpSession session){
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		Map<String, Object> result =  new HashMap<>();
		List<DailyCardView> dailyCardViewList = dailyTimeLineBo.generateDailyCardList(userId);
		result.put("dailyCardViewList", dailyCardViewList);
		return result;
	}
	
	
	
	//일상 리스트 중 글 한개 클릭시 => 모달창에 뿌려줄 것 
	@GetMapping("/mypage/dailycheck")
	public Map<String, Object> dailyCheck(int dailyId){
		
		
		Map<String, Object> result =  new HashMap<>();
		//글 정보 가져오기
		Daily daily = dailyBo.getDailyByDailyId(dailyId);
		//글 이미지 가져오기
		List<DailyImage2> dailyImage = dailyImageBo.getPlaceImageByDailyId(dailyId);
		//글 좋아요 가져오기
		int likeCount = likeBo.getLikeCountByDailyIdAndUserId(dailyId);
		//글 댓글들 가져오기
		List<Comment> comment = commentBo.getCommentListByDailyId(dailyId);
		result.put("daily", daily);
		result.put("dailyImage", dailyImage);
		result.put("likeCount", likeCount);
		result.put("comment", comment);
		return result;
	}
	
	//맛집 리스트 중 글 한개 클릭시 => 모달창에 뿌려줄 것 
	@GetMapping("/mypage/goodplacecheck")
	public Map<String, Object> goodPlaceCheck(int placeId) {
		
		Map<String, Object> result =  new HashMap<>();
		//글 정보 가져오기
		Place place = goodPlaceBo.getPlaceByPlaceId(placeId);
		//글 이미지 가져오기
		List<PlaceImage> placeImage = placeImageBo.getPlaceImageByPlaceId(placeId);
		//글 좋아요 가져오기
		
		
		result.put("place", place);
		result.put("placeImage", placeImage);
		return result;
	}
}
