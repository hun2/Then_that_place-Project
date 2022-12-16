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
import com.FirstProject.daily.model.PlaceCardView;
import com.FirstProject.goodplace.bo.GoodPlaceBO;
import com.FirstProject.goodplace.bo.PlaceImageBO;
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
	
	@Autowired
	private PlaceImageBO placeImageBo;
	
	public List<DailyCardView> generateDailyCardList(String userId, int page) {
		
		// 최종 리턴 리스트 생성
		List<DailyCardView> DailycardViewList = new ArrayList<>();
		int items_per_page = 3; 
		int endNum = items_per_page;
		int startNum = 0;
		if (page == 0) {
			startNum = 0;
		} else {
			startNum = page * items_per_page;
		}
		
		// 글 목록 가져오기
		List<Daily> dailyList = dailyBo.getList(userId, startNum, endNum);
		
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
	
	
	
	//남의 일상글 ( 팔로우중인 사람들 글 보여주는 것 )
	public List<DailyCardView> generateOtherDailyCardList(String userId, int page) {
		
		// 최종 리턴 리스트 생성
		List<DailyCardView> OtherDailycardViewList = new ArrayList<>();
		
		int items_per_page = 3; 
		int endNum = items_per_page;
		int startNum = 0;
		if (page == 0) {
			startNum = 0;
		} else {
			startNum = page * items_per_page;
		}
		
		// 글 목록 가져오기
		List<Daily> dailyList = dailyBo.getOtherList(userId, startNum, endNum);
		
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
	
	//남의 맛집글 ( 팔로우중인 사람들 글 보여주는 것 )
	public List<PlaceCardView> generateOtherGoodPlaceCardList(String userId , int page) {
			
			// 최종 리턴 리스트 생성
			List<PlaceCardView> OtherGoodPlacecardViewList = new ArrayList<>();
			
			int items_per_page = 3; 
			int endNum = items_per_page;
			int startNum = 0;
			if (page == 0) {
				startNum = 0;
			} else {
				startNum = page * items_per_page;
			}
			
			// 글 목록 가져오기
			List<Place> dailyList = dailyBo.getOtherPlaceList(userId, startNum, endNum);
			
			for(Place place : dailyList) {
				
				PlaceCardView card = new PlaceCardView();
				
				
				//글정보
				card.setPlace(place);
				
				//글쓴이
				User user = userBo.getUserById(place.getUserId());
				card.setUser(user);
				
				//사진들 정보
				List<PlaceImage> ImageList = placeImageBo.getPlaceImageByPlaceId(place.getId());
				card.setPlaceImage(ImageList);
				
				//댓글 정보
				List<CommentView> commentList = commentBo.generateGoodPlaceCommentViewListByPlaceId(place.getId());
				card.setCommentList(commentList);
				
				//댓글갯수
				card.setCommnetCount(commentBo.getGoodPlaceCommentCountByPlaceId(place.getId()));
				
				//좋아요 갯수
				card.setLikeCount(likeBo.getLikeCountGoodPlaceByPlaceIdAndUserId(place.getId()));
				
				//좋아요 눌렀는지 체크여부
				
				card.setFilledLike(likeBo.existGoodPlaceLike(place.getId(), userId));
				
				OtherGoodPlacecardViewList.add(card);
			}
			return OtherGoodPlacecardViewList;
		}
	
	//남의 노맛집글 ( 팔로우중인 사람들 글 보여주는 것 )
		public List<PlaceCardView> generateOtherBadPlaceCardList(String userId, int page) {
				
				// 최종 리턴 리스트 생성
				List<PlaceCardView> OtherBadPlacecardViewList = new ArrayList<>();
				
				int items_per_page = 3; 
				int endNum = items_per_page;
				int startNum = 0;
				if (page == 0) {
					startNum = 0;
				} else {
					startNum = page * items_per_page;
				}
				
				// 글 목록 가져오기
				List<Place> dailyList = dailyBo.getOtherBadPlaceList(userId, startNum, endNum);
				
				for(Place place : dailyList) {
					
					PlaceCardView card = new PlaceCardView();
					
					
					//글정보
					card.setPlace(place);
					
					//글쓴이
					User user = userBo.getUserById(place.getUserId());
					card.setUser(user);
					
					//사진들정보
					List<PlaceImage> ImageList = placeImageBo.getPlaceImageByPlaceId(place.getId());
					card.setPlaceImage(ImageList);
					
					//댓글 정보
					List<CommentView> commentList = commentBo.generateBadPlaceCommentViewListByPlaceId(place.getId());
					card.setCommentList(commentList);
					
					//댓글갯수
					card.setCommnetCount(commentBo.getBadPlaceCommentCountByPlaceId(place.getId()));
					
					//좋아요 갯수
					card.setLikeCount(likeBo.getLikeCountbadPlaceByPlaceIdAndUserId(place.getId()));
					
					//좋아요 눌렀는지 체크여부
					
					card.setFilledLike(likeBo.existbadPlaceLike(place.getId(), userId));
					
					OtherBadPlacecardViewList.add(card);
				}
				return OtherBadPlacecardViewList;
			}
		
		//마이페이지 일상
		public List<DailyCardView> myPageDailyCardList(String userId, int page) {
			
			// 최종 리턴 리스트 생성
			List<DailyCardView> DailycardViewList = new ArrayList<>();
			int items_per_page = 9; 
			int endNum = items_per_page;
			int startNum = 0;
			if (page == 0) {
				startNum = 0;
			} else {
				startNum = page * items_per_page;
			}
			
			// 글 목록 가져오기
			List<Daily> dailyList = dailyBo.getList(userId, startNum, endNum);
			
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
		
		
		
		
}
