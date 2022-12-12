package com.FirstProject.daily.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.FirstProject.daily.model.Daily;
import com.FirstProject.daily.model.Follow;
import com.FirstProject.login.model.User;

@Repository
public interface FollowDAO {

	// 팔로우 신청
	public int insertFollow(Follow follow);

	// 팔로우 삭제
	public int deleteFollow(Follow follow);

	// 팔로우 확인
	public List<User> selectFollowByUserId(String userId);

	// 팔로우 인원수
	public int selectFollowCountByUserId(String userId);

	// 팔로워 확인
	public List<User> selectFollowedByUserId(String userId);

	// 팔로워 인원수
	public int selectFollowedCountByUserId(String userId);

}
