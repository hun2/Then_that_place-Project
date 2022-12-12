package com.FirstProject.daily.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.FirstProject.daily.dao.CommentDAO;
import com.FirstProject.daily.model.Comment;
import com.FirstProject.daily.model.CommentView;

@Service
public class CommentBO {

	@Autowired
	private CommentDAO commentDao;

	// 댓글쓰기
	public int addCommentByDailyIdandUserId(Comment comment) {

		return commentDao.insertCommentByDailyIdandUserId(comment);
	}

	// 데일리 댓글갯수
	public int getCommentCountByDailyId(int dailyId) {

		return commentDao.selectCommentCountByDailyId(dailyId);
	}

	// 맛집 댓글 갯수

	public int getGoodPlaceCommentCountByPlaceId(int placeId) {

		return commentDao.selectGoodPlaceCommentCountByPlaceId(placeId);
	}

	// 노맛집 댓글 갯수

	public int getBadPlaceCommentCountByPlaceId(int placeId) {

		return commentDao.selectBadPlaceCommentCountByPlaceId(placeId);
	}

	// 데일리 댓글 가져오기
	public List<Comment> getCommentListByDailyId(int dailyId) {

		return commentDao.selectCommentListByDailyId(dailyId);
	}

	// 맛집 댓글 가져오기 ( 쿼리가 다름)
	public List<Comment> getGoodPlaceCommentListByPlaceId(int placeId) {

		return commentDao.selectGoodPlaceCommentListByPlaceId(placeId);
	}

	// 노맛집 댓글 가져오기 (쿼리가 다름)
	public List<Comment> getbadPlaceCommentListByPlaceId(int placeId) {

		return commentDao.selectbadPlaceCommentListByPlaceId(placeId);
	}

	// 일상 댓글리스트
	public List<CommentView> generateCommentViewListByDailyId(int dailyId) {

		// 결과물
		List<CommentView> commentViewList = new ArrayList<>();

		// 댓글 목록 가져오기
		List<Comment> commentList = getCommentListByDailyId(dailyId);

		// 반복문
		for (Comment co : commentList) {
			CommentView commentView = new CommentView();
			commentView.setComment(co);
			// 결과물에 담기
			commentViewList.add(commentView);

		}
		return commentViewList;
	}

	// 맛집 댓글리스트
	public List<CommentView> generateGoodPlaceCommentViewListByPlaceId(int placeId) {

		// 결과물
		List<CommentView> commentViewList = new ArrayList<>();

		// 댓글 목록 가져오기
		List<Comment> commentList = getGoodPlaceCommentListByPlaceId(placeId);

		// 반복문
		for (Comment co : commentList) {
			CommentView commentView = new CommentView();
			commentView.setComment(co);
			// 결과물에 담기
			commentViewList.add(commentView);

		}
		return commentViewList;
	}

	// 다른사람 맛집 댓글 가져오기 (쿼리가 다름)
	public List<Comment> getCommentOtherGoodPlaceListByPlaceId(int placeId) {

		return commentDao.selectCommentOtherGoodPlaceListByPlaceId(placeId);
	}

	// 노맛집 댓글리스트
	public List<CommentView> generateBadPlaceCommentViewListByPlaceId(int placeId) {

		// 결과물
		List<CommentView> commentViewList = new ArrayList<>();

		// 댓글 목록 가져오기
		List<Comment> commentList = getbadPlaceCommentListByPlaceId(placeId);

		// 반복문
		for (Comment co : commentList) {
			CommentView commentView = new CommentView();
			commentView.setComment(co);
			// 결과물에 담기
			commentViewList.add(commentView);

		}
		return commentViewList;
	}

	// 다른사람 노맛집 댓글 가져오기 (쿼리가 다름)
	public List<Comment> getCommentOtherbadPlaceListByPlaceId(int placeId) {

		return commentDao.selectCommentOtherbadPlaceListByPlaceId(placeId);
	}
}
