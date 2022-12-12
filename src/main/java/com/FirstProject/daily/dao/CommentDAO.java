package com.FirstProject.daily.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.FirstProject.daily.model.Comment;

@Repository
public interface CommentDAO {

	// 댓글 쓰기
	public int insertCommentByDailyIdandUserId(Comment comment);

	// 데일리 댓글 갯수
	public int selectCommentCountByDailyId(int dailyId);
	
	//맛집 댓글 갯수
	public int selectGoodPlaceCommentCountByPlaceId(int placeId);
	
	//노맛집 댓글 갯수
	public int selectBadPlaceCommentCountByPlaceId(int placeId);

	// 일상 댓글 리스트

	public List<Comment> selectCommentListByDailyId(int dailyId);

	// 맛집 댓글 가져오기 ( 쿼리가 다름)
	public List<Comment> selectGoodPlaceCommentListByPlaceId(int placeId);

	// 노맛집 댓글 가져오기 (쿼리가 다름)
	public List<Comment> selectbadPlaceCommentListByPlaceId(int placeId);

	// 다른사람 맛집 댓글 가져오기 (쿼리가 다름)
	public List<Comment> selectCommentOtherGoodPlaceListByPlaceId(int placeId);

	// 다른사람 맛집 댓글 가져오기 (쿼리가 다름)
	public List<Comment> selectCommentOtherbadPlaceListByPlaceId(int placeId);
}
