package com.FirstProject.daily;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.FirstProject.common.DailyImage;
import com.FirstProject.daily.bo.CommentBO;
import com.FirstProject.daily.bo.DailyBO;
import com.FirstProject.daily.bo.DailyTimeLineBO;
import com.FirstProject.daily.bo.FollowBO;
import com.FirstProject.daily.bo.LikeBO;
import com.FirstProject.daily.model.Comment;
import com.FirstProject.daily.model.Daily;
import com.FirstProject.daily.model.DailyCardView;
import com.FirstProject.daily.model.Follow;
import com.FirstProject.login.model.User;

@Controller
@ResponseBody
public class DailyRestController {

	
	@Autowired
	private FollowBO followBo;
	
	@Autowired
	private DailyBO dailyBo;
	
	@Autowired
	private CommentBO commentBo;
	
	@Autowired
	private LikeBO likeBo;
	
	@Autowired
	private DailyTimeLineBO dailyTimeLineBo;
	//팔로우 추가
	@PostMapping("/main/follow")
	public Map<String, Object> followAdd(HttpSession session, Follow follow, User user) {
		
		// 세션들고오기 => 팔로우에서 팔로우 아이디값 셋팅
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		follow.setUSERID_FOLLOWER(userId);

		// board 게시판에서 user 정보를 ajax에서 보낸 후 그 값을 팔로워아이디로 set
		Map<String, Object> result = new HashMap<>();
		follow.setUSERID_FOLLOWED(user.getUserId());

		int row = followBo.addFollow(follow);
		if (row > 0) {
			result.put("code", 100);
		}
		return result;
	}
	
	
	//팔로우 삭제
	@DeleteMapping("/main/follow")
	public Map<String, Object> followDelete(HttpSession session, Follow follow, User user) {
		// 세션들고오기 => 팔로우에서 팔로우 아이디값 셋팅
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		follow.setUSERID_FOLLOWER(userId);
		
		Map<String, Object> result = new HashMap<>();
		follow.setUSERID_FOLLOWED(user.getUserId());
		int row = followBo.deleteFollow(follow);
		if (row > 0) {
			result.put("code", 100);
		}
		return result;
	}
	
	//글쓰기
	@PostMapping("/main/daily")
	public Map<String, Object> daily (@RequestParam(value="file", required = false) List<MultipartFile> file, HttpSession session, Daily daily, DailyImage dailyImage) throws Exception {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		daily.setUserId(userId);
		
		Map<String, Object> result =  new HashMap<>();
		int num = dailyBo.addDaily(file, daily, dailyImage);
		if(num > 0) {
			result.put("code", 100);
		} else {
			result.put("errorMessage", "글쓰기에 실패하였습니다, 관리자에게 문의하세요");
		}
		return result;
	}
	
	
	//글수정
	@PutMapping("/main/daily")
	public Map<String, Object> daily(Daily daily, HttpSession session) {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		daily.setUserId(userId);
		
		Map<String, Object> result =  new HashMap<>();
		int num = dailyBo.updateDailyListById(daily);
		if(num > 0) {
			result.put("code", 100);
		} else {
			result.put("errorMessage", "글쓰기에 실패하였습니다, 관리자에게 문의하세요");
		}
		return result;
		
	}
	
	//글삭제
	@DeleteMapping("/main/daily")
	public Map<String, Object> daily(int id) {
		
		Map<String, Object> result =  new HashMap<>();
		
		int num = dailyBo.deleteDailyListById(id);
		if(num > 0) {
			result.put("code", 100);
		} else {
			result.put("errorMessage", "글삭제에 실패하였습니다, 관리자에게 문의하세요");
		}
		return result;
	}
	
	//댓글달기
	@PostMapping("/main/daily-comment")
	public Map<String , Object> comment (HttpSession session, Comment comment) {
		
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		comment.setUserId(userId);
		comment.setCategory("d");
		Map<String, Object> result =  new HashMap<>();
		int num = commentBo.addCommentByDailyIdandUserId(comment);
		if(num > 0) {
			result.put("code", 100);
		} else {
			result.put("errorMessage", "글삭제에 실패하였습니다, 관리자에게 문의하세요");
		}
		return result;
	}
	
	//좋아요 체크
	@PostMapping("/main/daily/like")
	public Map<String, Object> lije (HttpSession session, @RequestParam("id") int id) {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		Map<String, Object> result =  new HashMap<>();
		int num = likeBo.likeToggle(userId, id);
		int sum = likeBo.getLikeCountByDailyIdAndUserId(id);
		if(num > 0) {
			result.put("code", 100);
			result.put("sum", sum);
		} else {
			result.put("errorMessage", "글삭제에 실패하였습니다, 관리자에게 문의하세요");
		}
		return result;
	}
	
	
	//페이징
	@GetMapping("/main/daily/paging")
	public Map<String , Object> paging(@RequestParam("page") int page, HttpSession session) {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		List<DailyCardView> dailyCardViewList = dailyTimeLineBo.generateDailyCardList(userId, page);
		Map<String, Object> result =  new HashMap<>();
		result.put("dailyCardViewList", dailyCardViewList);
		return result;
	}
}
