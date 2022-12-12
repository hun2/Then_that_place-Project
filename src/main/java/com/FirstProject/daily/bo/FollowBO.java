package com.FirstProject.daily.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.FirstProject.daily.dao.FollowDAO;
import com.FirstProject.daily.model.Follow;
import com.FirstProject.login.model.User;

@Service
public class FollowBO {

	@Autowired
	private FollowDAO followDao;

	// 팔로우 추가
	public int addFollow(Follow follow) {

		return followDao.insertFollow(follow);
	}

	// 팔로우 삭제
	public int deleteFollow(Follow follow) {
		return followDao.deleteFollow(follow);
	}

	// 팔로우중인 리스트 가져오기
	public List<User> getFollowListByUserId(String userId) {

		return followDao.selectFollowByUserId(userId);
	}

	// 팔로우 중인 사람명수 확인
	public int getFollowCountByUserId(String userId) {

		return followDao.selectFollowCountByUserId(userId);
	}

	// 팔로워중인 리스트 가져오기
	public List<User> getFollowedListByUserId(String userId) {

		return followDao.selectFollowedByUserId(userId);
	}

	// 팔로워 중인 사람명수 확인
	public int getFollowedCountByUserId(String userId) {

		return followDao.selectFollowedCountByUserId(userId);
	}
}
