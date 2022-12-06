package com.FirstProject.daily.model;

import java.util.Date;

public class Comment {

	
	
	private int commentId;
	private int dailyId;
	private String userId;
	private String comment;
	private Date commentCreatedAt;
	private Date commentUpdatedAt;
	
	
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public int getDailyId() {
		return dailyId;
	}
	public void setDailyId(int dailyId) {
		this.dailyId = dailyId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getCommentCreatedAt() {
		return commentCreatedAt;
	}
	public void setCommentCreatedAt(Date commentCreatedAt) {
		this.commentCreatedAt = commentCreatedAt;
	}
	public Date getCommentUpdatedAt() {
		return commentUpdatedAt;
	}
	public void setCommentUpdatedAt(Date commentUpdatedAt) {
		this.commentUpdatedAt = commentUpdatedAt;
	}
	
	
	
}
