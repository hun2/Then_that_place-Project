package com.FirstProject.login.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.FirstProject.login.model.User;

@Repository
public interface UserDAO {

	// 회원가입 - 중복확인
	public int selectUserByUserId(String userId);

	// 회원가입 - insert

	public int insertUser(User user);

	// 카카오 회원가입 - insert
	public int insertKaKaoUser(@Param("userId") String userId, @Param("userNickName") String userNickName,
			@Param("userEmail") String userEmail);

	// 로그인 - 아이디 및 패스워드 일치여부
	public User selectLoginUserByUserIdUserPwd(User user);

	// 아이디 찾기

	public User selectUserIdByUserEmail(User user);

	// 비밀번호 찾기 - 아이디 및 이메일 일치여부

	public User selectUserPwdCheckByUserIdUserEmail(User user);

	// 비밀번호 업데이트시 필요한 id 값 가져오기
	public String selectUserByUserEmail(String userEmail);

	// 비밀번호 업데이트
	public void updataUserPassword(@Param("userId") String userId, @Param("userPwd") String userPwd);

	// 유저 하나 가져오기

	public User selectUserById(String uid);

	// 마이페이지 이미지 업데이트 시 필요한 쿼리
	public User selectUserByUser(User user);

}
