package com.FirstProject.daily.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.FirstProject.daily.dao.FollowDAO;
import com.FirstProject.daily.model.Follow;

@Service
public class FollowBO {

	@Autowired
	private FollowDAO followDao;
	
	
	public int addFollow(Follow follow) {
		
		return followDao.insertFollow(follow);
	}
	
	
	public int deleteFollow(Follow follow) {
		return followDao.deleteFollow(follow);
	}
}
