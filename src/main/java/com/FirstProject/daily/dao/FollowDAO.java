package com.FirstProject.daily.dao;

import org.springframework.stereotype.Repository;

import com.FirstProject.daily.model.Daily;
import com.FirstProject.daily.model.Follow;

@Repository
public interface FollowDAO {

	
	//팔로우 신청
	public int insertFollow(Follow follow);
	
	//팔로우 삭제
	public int deleteFollow(Follow follow);
	
	
	
}
