package com.FirstProject.common;

import java.util.Date;
import java.util.List;

public class PlaceImage {

	
	private int id;
	private int placeId;
	private List<String> imagePath;
	private Date placeCreatedAt;
	private Date placeUpdatedAt;
	
	
	public List<String> getImagePath() {
		return imagePath;
	}
	public void setImagePath(List<String> imagePath) {
		this.imagePath = imagePath;
	}
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
	public Date getPlaceCreatedAt() {
		return placeCreatedAt;
	}
	public void setPlaceCreatedAt(Date placeCreatedAt) {
		this.placeCreatedAt = placeCreatedAt;
	}
	public Date getPlaceUpdatedAt() {
		return placeUpdatedAt;
	}
	public void setPlaceUpdatedAt(Date placeUpdatedAt) {
		this.placeUpdatedAt = placeUpdatedAt;
	}
	
	
	
}
