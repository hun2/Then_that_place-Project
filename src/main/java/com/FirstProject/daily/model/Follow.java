package com.FirstProject.daily.model;

public class Follow {

	
	
	private int ID;
	private String USERID_FOLLOWER;
	private String USERID_FOLLOWED;
	private String FOLLOWCREATEDAT;
	
	
	
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getUSERID_FOLLOWER() {
		return USERID_FOLLOWER;
	}
	public void setUSERID_FOLLOWER(String uSERID_FOLLOWER) {
		USERID_FOLLOWER = uSERID_FOLLOWER;
	}
	public String getUSERID_FOLLOWED() {
		return USERID_FOLLOWED;
	}
	public void setUSERID_FOLLOWED(String uSERID_FOLLOWED) {
		USERID_FOLLOWED = uSERID_FOLLOWED;
	}
	public String getFOLLOWCREATEDAT() {
		return FOLLOWCREATEDAT;
	}
	public void setFOLLOWCREATEDAT(String fOLLOWCREATEDAT) {
		FOLLOWCREATEDAT = fOLLOWCREATEDAT;
	}
	
	
	
}
