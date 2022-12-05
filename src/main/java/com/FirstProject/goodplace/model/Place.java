package com.FirstProject.goodplace.model;

import java.util.Date;
import java.util.List;

public class Place {
	
	
	
	private int id;
	private String userId;
	private String placeWhether;
	private String placeKategorie;
	private String placeArea;
	private List<Food> foods;
	private int placeGrade;
	private int placePrice;
	private String placeSubject;
	private String placeContent;
	private Date placeCreatedAt;
	private Date placeUpdatedAt;
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
	public String getPlaceWhether() {
		return placeWhether;
	}
	public void setPlaceWhether(String placeWhether) {
		this.placeWhether = placeWhether;
	}
	public String getPlaceKategorie() {
		return placeKategorie;
	}
	public void setPlaceKategorie(String placeKategorie) {
		this.placeKategorie = placeKategorie;
	}
	public String getPlaceArea() {
		return placeArea;
	}
	public void setPlaceArea(String placeArea) {
		this.placeArea = placeArea;
	}
	public int getPlaceGrade() {
		return placeGrade;
	}
	public void setPlaceGrade(int placeGrade) {
		this.placeGrade = placeGrade;
	}
	public int getPlacePrice() {
		return placePrice;
	}
	public void setPlacePrice(int placePrice) {
		this.placePrice = placePrice;
	}
	public String getPlaceSubject() {
		return placeSubject;
	}
	public void setPlaceSubject(String placeSubject) {
		this.placeSubject = placeSubject;
	}
	public String getPlaceContent() {
		return placeContent;
	}
	public void setPlaceContent(String placeContent) {
		this.placeContent = placeContent;
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
	public List<Food> getFoods() {
		return foods;
	}
	public void setFoods(List<Food> foods) {
		this.foods = foods;
	}
	
	

	
	
}
