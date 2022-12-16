package com.FirstProject.daily;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.FirstProject.daily.bo.CommentBO;
import com.FirstProject.daily.bo.DailyTimeLineBO;
import com.FirstProject.daily.bo.LikeBO;
import com.FirstProject.daily.model.Comment;
import com.FirstProject.daily.model.DailyCardView;
import com.FirstProject.daily.model.PlaceCardView;
import com.FirstProject.login.model.User;

@Controller
@ResponseBody
public class OtherDailyRestController {

	@Autowired
	private LikeBO likeBo;

	@Autowired
	private CommentBO commentBo;

	@Autowired
	private DailyTimeLineBO dailyTimeLineBo;

	// 남의맛집 좋아요 체크
	@PostMapping("/main/othergoodplace/like")
	public Map<String, Object> goodPlaceLike(HttpSession session, @RequestParam("id") int id) {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		Map<String, Object> result = new HashMap<>();
		int num = likeBo.likeGoodPlaceToggle(userId, id);
		int sum = likeBo.getLikeCountGoodPlaceByPlaceIdAndUserId(id);
		if (num > 0) {
			result.put("code", 100);
			result.put("sum", sum);
		} else {
			result.put("errorMessage", "글삭제에 실패하였습니다, 관리자에게 문의하세요");
		}
		return result;
	}

	// 남의 맛집글 댓글달기
	@PostMapping("/main/othergoodplace/comment")
	public Map<String, Object> goodPlaceComment(HttpSession session, Comment comment) {

		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		comment.setUserId(userId);
		comment.setCategory("g");
		Map<String, Object> result = new HashMap<>();
		int num = commentBo.addCommentByDailyIdandUserId(comment);
		if (num > 0) {
			result.put("code", 100);
		} else {
			result.put("errorMessage", "글삭제에 실패하였습니다, 관리자에게 문의하세요");
		}
		return result;
	}

	// 남의 노맛집 좋아요 체크
	@PostMapping("/main/otherbadplace/like")
	public Map<String, Object> badPlaceLike(HttpSession session, @RequestParam("id") int id) {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		Map<String, Object> result = new HashMap<>();
		int num = likeBo.likeBadPlaceToggle(userId, id);
		int sum = likeBo.getLikeCountbadPlaceByPlaceIdAndUserId(id);
		if (num > 0) {
			result.put("code", 100);
			result.put("sum", sum);
		} else {
			result.put("errorMessage", "글삭제에 실패하였습니다, 관리자에게 문의하세요");
		}
		return result;
	}

	// 남의 노집글 댓글달기
	@PostMapping("/main/otherbadplace/comment")
	public Map<String, Object> badPlaceComment(HttpSession session, Comment comment) {

		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		comment.setUserId(userId);
		comment.setCategory("b");
		Map<String, Object> result = new HashMap<>();
		int num = commentBo.addCommentByDailyIdandUserId(comment);
		if (num > 0) {
			result.put("code", 100);
		} else {
			result.put("errorMessage", "글삭제에 실패하였습니다, 관리자에게 문의하세요");
		}
		return result;
	}

	// 남의 일상 페이징
	@GetMapping("/main/otherdaily/paging")
	public Map<String, Object> paging(@RequestParam("page") int page, HttpSession session) {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		List<DailyCardView> dailyCardViewList = dailyTimeLineBo.generateOtherDailyCardList(userId, page);
		Map<String, Object> result = new HashMap<>();
		result.put("dailyCardViewList", dailyCardViewList);
		return result;
	}

	// 남의 맛집 페이징
	@GetMapping("/main/othergood/paging")
	public Map<String, Object> pagingGood(@RequestParam("page") int page, HttpSession session) {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		List<PlaceCardView> dailyCardViewList = dailyTimeLineBo.generateOtherGoodPlaceCardList(userId, page);
		Map<String, Object> result = new HashMap<>();
		result.put("dailyCardViewList", dailyCardViewList);
		return result;
	}

	// 남의 노맛집 페이징
	@GetMapping("/main/otherbad/paging")
	public Map<String, Object> pagingBad(@RequestParam("page") int page, HttpSession session) {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		List<PlaceCardView> dailyCardViewList = dailyTimeLineBo.generateOtherBadPlaceCardList(userId, page);
		Map<String, Object> result = new HashMap<>();
		result.put("dailyCardViewList", dailyCardViewList);
		return result;
	}
}
