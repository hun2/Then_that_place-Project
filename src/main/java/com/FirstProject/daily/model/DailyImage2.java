package com.FirstProject.daily.model;

import java.util.Date;
import java.util.List;

public class DailyImage2 {

	private int id;
	private int dailyId;
	private String imagePath;
	private Date imageCreatedAt;
	private Date imageUpdatedAt;
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getDailyId() {
		return dailyId;
	}
	public void setDailyId(int dailyId) {
		this.dailyId = dailyId;
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
