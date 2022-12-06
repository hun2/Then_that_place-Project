package com.FirstProject.daily.model;

import java.util.List;
import com.FirstProject.login.model.User;

public class DailyCardView {

	
		//글 정보
		private Daily daily;
		
		//글쓴이
		private User user;
		
		//음식사진
		private List<DailyImage2> dailyImage;
		
		//댓글
		private List<CommentView> commentList;
		
		//댓글 갯수
		private int commnetCount;
		
		//좋아요 갯수
		private int likeCount;
		
		//좋아요 눌렀는지 체크여부
		private boolean filledLike;
		
		
		
		public Daily getDaily() {
			return daily;
		}

		public void setDaily(Daily daily) {
			this.daily = daily;
		}

		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}

		public List<DailyImage2> getDailyImage() {
			return dailyImage;
		}

		public void setDailyImage(List<DailyImage2> dailyImage) {
			this.dailyImage = dailyImage;
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
