package com.FirstProject.goodplace.model;

import java.util.Date;

public class Food {
	
	
	private int id;
	private String userId;
	private int placeId;
	private String foodName;
	private int foodPrice;
	private Date foodCreatedAt;
	private Date foodUpdatedAt;
	
	
	
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
	public int getPlaceId() {
		return placeId;
	}
	public void setPlaceId(int placeId) {
		this.placeId = placeId;
	}
	public Date getFoodCreatedAt() {
		return foodCreatedAt;
	}
	public void setFoodCreatedAt(Date foodCreatedAt) {
		this.foodCreatedAt = foodCreatedAt;
	}
	public Date getFoodUpdatedAt() {
		return foodUpdatedAt;
	}
	public void setFoodUpdatedAt(Date foodUpdatedAt) {
		this.foodUpdatedAt = foodUpdatedAt;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public int getFoodPrice() {
		return foodPrice;
	}
	public void setFoodPrice(int foodPrice) {
		this.foodPrice = foodPrice;
	}
	
	
	
}
