package com.FirstProject.mypage;

import java.security.NoSuchAlgorithmException;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.FirstProject.badplace.bo.BadPlaceBO;
import com.FirstProject.common.SHA256;
import com.FirstProject.daily.bo.CommentBO;
import com.FirstProject.daily.bo.DailyBO;
import com.FirstProject.daily.bo.DailyImageBO;
import com.FirstProject.daily.bo.DailyTimeLineBO;
import com.FirstProject.daily.bo.FollowBO;
import com.FirstProject.daily.bo.LikeBO;
import com.FirstProject.daily.model.Comment;
import com.FirstProject.daily.model.Daily;
import com.FirstProject.daily.model.DailyCardView;
import com.FirstProject.daily.model.DailyImage2;
import com.FirstProject.daily.model.Follow;
import com.FirstProject.goodplace.bo.GoodPlaceBO;
import com.FirstProject.goodplace.bo.PlaceImageBO;
import com.FirstProject.goodplace.bo.TimeLineBO;
import com.FirstProject.goodplace.model.CardView;
import com.FirstProject.goodplace.model.Place;
import com.FirstProject.goodplace.model.PlaceImage;
import com.FirstProject.login.bo.UserBO;
import com.FirstProject.login.model.User;
import com.FirstProject.mypage.bo.MypageBO;

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

	@Autowired
	private BadPlaceBO badPlaceBo;

	@Autowired
	private FollowBO followBo;
	
	@Autowired
	private MypageBO mypageBo;
	
	@Autowired
	private UserBO userBo;
	// 맛집 메뉴 클릭시
	@RequestMapping("/mypage/goodplace")
	public Map<String, Object> goodPlace(HttpSession session, int page) {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		Place place = new Place();
		place.setUserId(userId);
		Map<String, Object> result = new HashMap<>();
		List<CardView> cardViewList = timeLineBo.myPageCardList(place, page);
		result.put("goodPlaceList", cardViewList);
		return result;
	}

	// 노맛집 메뉴 클릭시
	@RequestMapping("/mypage/badplace")
	public Map<String, Object> badPlace(HttpSession session, int page) {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		Place place = new Place();
		place.setUserId(userId);
		Map<String, Object> result = new HashMap<>();
		List<CardView> cardViewList = timeLineBo.myPageBadCardList(place,page);
		result.put("badPlaceList", cardViewList);
		return result;
	}

	// 일상 메뉴 클릭
	@RequestMapping("/mypage/daily")
	public Map<String, Object> daily(HttpSession session, int page) {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		Map<String, Object> result = new HashMap<>();
		List<DailyCardView> dailyCardViewList = dailyTimeLineBo.myPageDailyCardList(userId, page);
		result.put("dailyCardViewList", dailyCardViewList);
		return result;
	}

	// 일상 리스트 중 글 한개 클릭시 => 모달창에 뿌려줄 것
	@GetMapping("/mypage/dailycheck")
	public Map<String, Object> dailyCheck(int dailyId) {

		Map<String, Object> result = new HashMap<>();
		// 글 정보 가져오기
		Daily daily = dailyBo.getDailyByDailyId(dailyId);
		// 글 이미지 가져오기
		List<DailyImage2> dailyImage = dailyImageBo.getPlaceImageByDailyId(dailyId);
		// 글 좋아요 가져오기
		int likeCount = likeBo.getLikeCountByDailyIdAndUserId(dailyId);
		// 글 댓글들 가져오기
		List<Comment> comment = commentBo.getCommentListByDailyId(dailyId);
		result.put("daily", daily);
		result.put("dailyImage", dailyImage);
		result.put("likeCount", likeCount);
		result.put("comment", comment);
		return result;
	}

	// 맛집 리스트 중 글 한개 클릭시 => 모달창에 뿌려줄 것
	@GetMapping("/mypage/goodplacecheck")
	public Map<String, Object> goodPlaceCheck(int placeId) {

		Map<String, Object> result = new HashMap<>();
		// 글 정보 가져오기
		Place place = goodPlaceBo.getPlaceByPlaceId(placeId);
		// 글 이미지 가져오기
		List<PlaceImage> placeImage = placeImageBo.getPlaceImageByPlaceId(placeId);
		
		// 글 댓글들 가져오기
		List<Comment> comment = commentBo.getGoodPlaceCommentListByPlaceId(placeId);
		// 글 좋아요 가져오기

		result.put("place", place);
		result.put("placeImage", placeImage);
		result.put("comment", comment);
		return result;
	}

	// 노맛집 리스트 중 글 한개 클릭시 => 모달창에 뿌려줄 것
	@GetMapping("/mypage/badplacecheck")
	public Map<String, Object> badPlaceCheck(int placeId) {
		Map<String, Object> result = new HashMap<>();
		// 글 정보 가져오기
		Place place = badPlaceBo.getPlaceByPlaceId(placeId);
		// 글 이미지 가져오기
		List<PlaceImage> placeImage = placeImageBo.getPlaceImageByPlaceId(placeId);
		
		// 글 댓글들 가져오기
		List<Comment> comment = commentBo.getbadPlaceCommentListByPlaceId(placeId);
		
		
		result.put("place", place);
		result.put("placeImage", placeImage);
		result.put("comment", comment);
		return result;
	}

	// 팔로우 삭제
	@DeleteMapping("/mypage/followed")
	public Map<String, Object> followedDelete(Follow follow, String USERID_FOLLOWED, HttpSession session) {

		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		follow.setUSERID_FOLLOWER(userId);
		follow.setUSERID_FOLLOWED(USERID_FOLLOWED);
		followBo.deleteFollow(follow);
		int FollowCount = followBo.getFollowCountByUserId(userId);

		Map<String, Object> result = new HashMap<>();
		result.put("FollowCount", FollowCount);

		return result;
	}

	// 댓글추가
	@PostMapping("/mypage/dailycomment")
	public Map<String, Object> dailycomment(Comment comment, HttpSession session) {

		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		Map<String, Object> result = new HashMap<>();
		comment.setUserId(userId);
		comment.setCategory("d");
		int num = commentBo.addCommentByDailyIdandUserId(comment);
		if (num > 0) {
			result.put("code", 100);
		} else {
			result.put("errorMessage", "글삭제에 실패하였습니다, 관리자에게 문의하세요");
		}
		return result;
	}

	// 댓글추가
	@PostMapping("/mypage/goodplacecomment")
	public Map<String, Object> goodplacecomment(Comment comment, HttpSession session) {

		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		Map<String, Object> result = new HashMap<>();
		comment.setUserId(userId);
		comment.setCategory("g");
		int num = commentBo.addCommentByDailyIdandUserId(comment);
		if (num > 0) {
			result.put("code", 100);
		} else {
			result.put("errorMessage", "글삭제에 실패하였습니다, 관리자에게 문의하세요");
		}
		return result;
	}

	// 댓글추가
	@PostMapping("/mypage/badplacecomment")
	public Map<String, Object> badplacecomment(Comment comment, HttpSession session) {

		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		Map<String, Object> result = new HashMap<>();
		comment.setUserId(userId);
		comment.setCategory("b");
		int num = commentBo.addCommentByDailyIdandUserId(comment);
		if (num > 0) {
			result.put("code", 100);
		} else {
			result.put("errorMessage", "글삭제에 실패하였습니다, 관리자에게 문의하세요");
		}
		return result;
	}
	
	
	//프로필 수정(사진)
	@PutMapping("/account/edit")
	public Map<String, Object> accountProfilePhotoEdit(HttpSession session,@RequestParam(value="file", required = false) MultipartFile file, User user){
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		user.setUserId(userId);
		Map<String, Object> result = new HashMap<>();
		int row = mypageBo.updateMyProfileByUserId(user, file);
		if ( row > 0) {
			session.removeAttribute("loginUser");
			User loginUser = userBo.getUserById(userId);
			session.setAttribute("loginUser", loginUser);
			result.put("loginUser", loginUser);
			result.put("code", 100);
		} else {
			result.put("errorMessage", "프로필 변경에 실패하였습니다, 관리자에게 문의하세요");
		}
		
		return result;
	}
	
	//프로필 수정(내용)
	@PutMapping("/account/modify")
	public Map<String, Object> accountOtherEdit(HttpSession session, User user) {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		user.setUserId(userId);
		Map<String, Object> result = new HashMap<>();
		int row = mypageBo.updateMyOtherInfoByUserId(user);
		if ( row > 0) {
			session.removeAttribute("loginUser");
			User loginUser = userBo.getUserById(userId);
			session.setAttribute("loginUser", loginUser);
			result.put("loginUser", loginUser);
			result.put("code", 100);
			
		} else {
			result.put("errorMessage", "프로필 변경에 실패하였습니다, 관리자에게 문의하세요");
		}
		return result;
	}
	
	//회원탈퇴
	@DeleteMapping("/account")
	public Map<String, Object> accountDelete(HttpSession session, User user) {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		user.setUserId(userId);
		Map<String, Object> result = new HashMap<>();
		int row = mypageBo.deleteUserIdByUserId(user);
		if ( row > 0) {
			session.removeAttribute("loginUser");
			result.put("code", 100);
		} else {
			result.put("errorMessage", "프로필 변경에 실패하였습니다, 관리자에게 문의하세요");
		}
		return result;
	}
	
	//비밀번호 변경
	@PutMapping("/account/password")
	public Map<String, Object> accountPassword(HttpSession session,
			@RequestParam("exuserPwd") String exuserPwd, User user) throws Exception {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUserId();
		Map<String, Object> result = new HashMap<>();
		//비밀번호 암호화
		SHA256 sha256 = new SHA256();
		String encryptedPwd = sha256.encrypt(exuserPwd);
		
		//기존비밀번호 체크 
		int row = userBo.getUserIdByUserPwd(userId, encryptedPwd);
		if ( row > 0 ) {
			SHA256 sha2566 = new SHA256();
			String Pwd = sha2566.encrypt(user.getUserPwd());
			user.setUserPwd(Pwd);
			user.setUserId(userId);
			int num = mypageBo.updatePasswordInfoByUserId(user);
				if ( num > 0) {
					result.put("code", 100);
				} else {
					result.put("errorMessage", "비밀번호 변경을 실패하였습니다. 관리자에게 문의하세요.");
				}
		} else {
			result.put("errorMessage", "기존 비밀번호가 틀립니다. 비밀번호 확인 부탁 드립니다.");
		}
		return result;
	}
	
}
