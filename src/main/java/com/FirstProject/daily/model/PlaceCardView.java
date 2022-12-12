package com.FirstProject.daily.model;

import java.util.List;

import com.FirstProject.goodplace.model.Place;
import com.FirstProject.goodplace.model.PlaceImage;
import com.FirstProject.login.model.User;

public class PlaceCardView {
	
	//글 정보
			private Place place;
			
			//글쓴이
			private User user;
			
			//음식사진
			private List<PlaceImage> placeImage;
			
			//댓글
			private List<CommentView> commentList;
			
			//댓글 갯수
			private int commnetCount;
			
			//좋아요 갯수
			private int likeCount;
			
			//좋아요 눌렀는지 체크여부
			private boolean filledLike;

			
			public Place getPlace() {
				return place;
			}

			public void setPlace(Place place) {
				this.place = place;
			}

			public User getUser() {
				return user;
			}

			public void setUser(User user) {
				this.user = user;
			}


			public List<PlaceImage> getPlaceImage() {
				return placeImage;
			}

			public void setPlaceImage(List<PlaceImage> placeImage) {
				this.placeImage = placeImage;
			}

			public List<CommentView> getCommentList() {
				return commentList;
			}

			public void setCommentList(List<CommentView> commentList) {
				this.commentList = commentList;
			}

			public int getCommnetCount() {
				return commnetCount;
			}

			public void setCommnetCount(int commnetCount) {
				this.commnetCount = commnetCount;
			}

			public int getLikeCount() {
				return likeCount;
			}

			public void setLikeCount(int likeCount) {
				this.likeCount = likeCount;
			}

			public boolean isFilledLike() {
				return filledLike;
			}

			public void setFilledLike(boolean filledLike) {
				this.filledLike = filledLike;
			}
			
			
			
}
