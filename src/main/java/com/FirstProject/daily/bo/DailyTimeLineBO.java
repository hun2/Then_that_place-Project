package com.FirstProject.daily.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.FirstProject.common.DailyImage;
import com.FirstProject.daily.model.CommentView;
import com.FirstProject.daily.model.Daily;
import com.FirstProject.daily.model.DailyCardView;
import com.FirstProject.daily.model.DailyImage2;
import com.FirstProject.goodplace.model.CardView;
import com.FirstProject.goodplace.model.Place;
import com.FirstProject.goodplace.model.PlaceImage;
import com.FirstProject.login.bo.UserBO;
import com.FirstProject.login.model.User;

@Service
public class DailyTimeLineBO {

	@Autowired
	private DailyBO dailyBo;
	
	@Autowired
	private UserBO userBo;
	
	@Autowired
	private DailyImageBO dailyImageBo;
	
	@Autowired
	private CommentBO commentBo;
	
	@Autowired
	private LikeBO likeBo;
	
	public List<DailyCardView> generateDailyCardList(String userId) {
		
		// 최종 리턴 리스트 생성
		List<DailyCardView> DailycardViewList = new ArrayList<>();
		
		// 글 목록 가져오기
		List<Daily> dailyList = dailyBo.getList(userId);
		
		for(Daily daily : dailyList) {
			
			DailyCardView card = new DailyCardView();
			
			//글정보
			card.setDaily(daily);
			
			// 글쓴이 정보
			User user = userBo.getUserById(daily.getUserId());
			card.setUser(user);
			
			
			// 사진 정보
			List<DailyImage2> ImageList = dailyImageBo.getPlaceImageByDailyId(daily.getId());
			card.setDailyImage(ImageList);
			
			//댓글 정보
			List<CommentView> commentList = commentBo.generateCommentViewListByDailyId(daily.getId());
			card.setCommentList(commentList);
			
			//댓글갯수
			card.setCommnetCount(commentBo.getCommentCountByDailyId(daily.getId()));
			
			//좋아요 갯수
			card.setLikeCount(likeBo.getLikeCountByDailyIdAndUserId(daily.getId()));
			
			//좋아요 눌렀는지 체크여부
			
			card.setFilledLike(likeBo.existLike(daily.getId(), userId));
			
			
			
			DailycardViewList.add(card);
		}
		return DailycardViewList;
	}
	
	//메인페이지에 들어가는것 
	public List<DailyCardView> mainCardList(String userId) {
		
		// 최종 리턴 리스트 생성
		List<DailyCardView> DailycardViewList = new ArrayList<>();
		
		// 글 목록 가져오기
		List<Daily> dailyList = dailyBo.getListLimit3(userId);
		
		for(Daily daily : dailyList) {
			
			DailyCardView card = new DailyCardView();
			
			//글정보
			card.setDaily(daily);
			
			// 글쓴이 정보
			User user = userBo.getUserById(daily.getUserId());
			card.setUser(user);
			
			// 사진 정보
			List<DailyImage2> ImageList = dailyImageBo.getPlaceImageByDailyId(daily.getId());
			card.setDailyImage(ImageList);
			DailycardViewList.add(card);
		}
		return DailycardViewList;
		
	}
	
	
	
	//남의 일상 ( 팔로우중인 사람들 글 보여주는 것 )
	public List<DailyCardView> generateOtherDailyCardList(String userId) {
		
		// 최종 리턴 리스트 생성
		List<DailyCardView> OtherDailycardViewList = new ArrayList<>();
				
		// 글 목록 가져오기
		List<Daily> dailyList = dailyBo.getOtherList(userId);
		
		for(Daily daily : dailyList) {
			
			DailyCardView card = new DailyCardView();
			
			
			//글정보
			card.setDaily(daily);
			
			//글쓴이
			User user = userBo.getUserById(daily.getUserId());
			card.setUser(user);
			
			List<DailyImage2> ImageList = dailyImageBo.getPlaceImageByDailyId(daily.getId());
			card.setDailyImage(ImageList);
			
			//댓글 정보
			List<CommentView> commentList = commentBo.generateCommentViewListByDailyId(daily.getId());
			card.setCommentList(commentList);
			
			//댓글갯수
			card.setCommnetCount(commentBo.getCommentCountByDailyId(daily.getId()));
			
			//좋아요 갯수
			card.setLikeCount(likeBo.getLikeCountByDailyIdAndUserId(daily.getId()));
			
			//좋아요 눌렀는지 체크여부
			
			card.setFilledLike(likeBo.existLike(daily.getId(), userId));
			
			OtherDailycardViewList.add(card);
		}
		
		return OtherDailycardViewList;
	}
	
	
	
	
}
