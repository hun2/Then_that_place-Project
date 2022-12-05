package com.FirstProject.daily.model;

import java.util.Date;

public class Daily {

	private int id;
	private String userId;
	private String dailySubject;
	private String dailyContent;
	private Date dailyCreatedAt;
	private Date dailyUpdatedAt;
	
	
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
	public String getDailySubject() {
		return dailySubject;
	}
	public void setDailySubject(String dailySubject) {
		this.dailySubject = dailySubject;
	}
	public String getDailyContent() {
		return dailyContent;
	}
	public void setDailyContent(String dailyContent) {
		this.dailyContent = dailyContent;
	}
	public Date getDailyCreatedAt() {
		return dailyCreatedAt;
	}
	public void setDailyCreatedAt(Date dailyCreatedAt) {
		this.dailyCreatedAt = dailyCreatedAt;
	}
	public Date getDailyUpdatedAt() {
		return dailyUpdatedAt;
	}
	public void setDailyUpdatedAt(Date dailyUpdatedAt) {
		this.dailyUpdatedAt = dailyUpdatedAt;
	}
	
	
	
}
