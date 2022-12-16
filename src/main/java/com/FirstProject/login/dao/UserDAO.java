package com.FirstProject.login.dao;

import java.util.List;

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
	public int insertKaKaoUser(User user);

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

	//마이페이지 비밀번호 변경시 이전비밀번호 일치 여부 
	public int selectUserIdByUserPwd(@Param("userId") String userId, @Param("encryptedPwd") String encryptedPwd);
	
	//카카오 정보 존재 유무 확인
	public int selectKakaoUserByKakaoId(String kakaoId);
	
	//카카오id로 정보 가져오기
	public User selectKakaoUserTypeByKakaoId(String kakaoId);
	
	//테스트
	public List<User> selectTest(@Param("startNum") int startNum,@Param("endNum") int endNum);
}
