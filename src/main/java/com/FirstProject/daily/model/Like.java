package com.FirstProject.daily.model;

import java.util.Date;

public class Like {

	
	private int likeId;
	private String category;
	private int id;
	private String userId;
	private Date likeCreatedAt;
	private Date likeUpdatedAt;
	
	public int getLikeId() {
		return likeId;
	}
	public void setLikeId(int likeId) {
		this.likeId = likeId;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getLikeCreatedAt() {
		return likeCreatedAt;
	}
	public void setLikeCreatedAt(Date likeCreatedAt) {
		this.likeCreatedAt = likeCreatedAt;
	}
	public Date getLikeUpdatedAt() {
		return likeUpdatedAt;
	}
	public void setLikeUpdatedAt(Date likeUpdatedAt) {
		this.likeUpdatedAt = likeUpdatedAt;
	}
	
	
	
}
