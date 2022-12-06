package com.FirstProject.goodplace.model;

import java.util.Date;

public class PlaceImage {
	
	private int id;
	private int placeId;
	private String imagePath;
	private Date imageCreatedAt;
	private Date imageUpdatedAt;
	
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPlaceId() {
		return placeId;
	}
	public void setPlaceId(int placeId) {
		this.placeId = placeId;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public Date getImageCreatedAt() {
		return imageCreatedAt;
	}
	public void setImageCreatedAt(Date imageCreatedAt) {
		this.imageCreatedAt = imageCreatedAt;
	}
	public Date getImageUpdatedAt() {
		return imageUpdatedAt;
	}
	public void setImageUpdatedAt(Date imageUpdatedAt) {
		this.imageUpdatedAt = imageUpdatedAt;
	}
	
	
	
}
