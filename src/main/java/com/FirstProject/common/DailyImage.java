package com.FirstProject.common;

import java.util.Date;
import java.util.List;

public class DailyImage {

	private int id;
	private int dailyId;
	private List<String> imagePath;
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
	public List<String> getImagePath() {
		return imagePath;
	}
	public void setImagePath(List<String> imagePath) {
		this.imagePath = imagePath;
	}
	
	
	
}
