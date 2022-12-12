package com.FirstProject.daily.model;

import java.util.Date;

public class Comment {

	
	
	private int commentId;
	private String category;
	private int Id;
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
	
	
	
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
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
