package com.FirstProject.mypage.dao;

import org.springframework.stereotype.Repository;

import com.FirstProject.login.model.User;

@Repository
public interface MypageDAO {

	//프로필 사진 업데이트
	public int updateMyProfileByUserId(User user);
	
	
	//프로필 나머지 정보 업데이트
	public int updateMyOtherInfoByUserId(User user);
	
	//회원탈퇴
	public int deleteUserIdByUserId(User user);
	
	//비밀번호 변경
	public int updatePasswordInfoByUserId(User user);
}
