package com.FirstProject.daily.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.FirstProject.common.DailyImage;
import com.FirstProject.daily.model.Comment;
import com.FirstProject.daily.model.Daily;
import com.FirstProject.login.model.User;

@Repository
public interface DailyDAO {

	
	//본인 제외 모든 유저 정보 가져오기
	public List<User> selectUSerAll(User user);
	
	
	//게시글 추가
	
	public int insertDaily(Daily daily);
	
	
	//이미지 추가
	public int insertImage(DailyImage dailyImage);
	
	
	//모든 게시글 가져오기
	public List<Daily> selectList(String userId);
	
	//글 3개만 가져오기
	
	public List<Daily> selectListLimit3(String userId);
	
	//남의일상 게시글 가져오기
	public List<Daily> selectOtherList(String userId);
	
	
	//본인 게시글 가져오기
	public Daily selectDailyByDailyIdandUserId(
			@Param("dailyId") int dailyId, 
			@Param("userId") String userId);
	
	//남의 게시글 가져오기
	public Daily selectDailyByDaily(int dailyId);
	
	//게시글 수정
	
	public int updateDailyListById(Daily daily);
	
	//게시글 삭제
	public int deleteDailyListById(int id);
	
	
}
