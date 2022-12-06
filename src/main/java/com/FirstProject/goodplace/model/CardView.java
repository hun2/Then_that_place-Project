package com.FirstProject.goodplace.model;

import java.util.List;

import com.FirstProject.login.model.User;

public class CardView {

	//글 정보
	private Place place;
	
	//글쓴이
	private User user;
	
	//음식사진
	private List<PlaceImage> placeImage;
	
	//음식정보
	private List<Food> food;

	
	
	
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

	public List<Food> getFood() {
		return food;
	}

	public void setFood(List<Food> food) {
		this.food = food;
	}
	
	
	
	
	
	
}
