package com.FirstProject.daily.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.FirstProject.daily.model.Comment;

@Repository
public interface CommentDAO {

	
	//댓글 쓰기
	public int insertCommentByDailyIdandUserId(Comment comment);
	
	
	//댓글 갯수
	public int selectCommentCountByDailyId(int dailyId);
	
	//댓글 리스트
	
	public List<Comment> selectCommentListByDailyId(int dailyId);
}
