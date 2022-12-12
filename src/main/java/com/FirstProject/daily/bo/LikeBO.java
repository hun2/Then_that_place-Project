package com.FirstProject.daily.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.FirstProject.daily.dao.LikeDAO;
import com.FirstProject.daily.model.Like;

@Service
public class LikeBO {

	@Autowired
	private LikeDAO likeDao;

	// daily 좋아요 insert
	public int addLikeByDailyIdAndUserId(int id, String userId) {
		String category = "d";
		return likeDao.insertLikeByDailyIdAndUserId(id, userId, category);
	}

	// daily 좋아요 delete
	public int deleteLikeByDailyIdAndUserId(int id, String userId) {
		String category = "d";
		return likeDao.deleteLikeByDailyIdAndUserId(id, userId, category);
	}

	// daily 좋아요 체크
	public boolean existLike(int id, String userId) {
		String category = "d";
		return likeDao.existLike(id, userId, category);
	}

	// daily 좋아요 갯수
	public int getLikeCountByDailyIdAndUserId(int id) {
		String category = "d";
		return likeDao.selectLikeCountByDailyIdAndUserId(id, category);
	}

	// 맛집 좋아요 체크
	public boolean existGoodPlaceLike(int id, String userId) {
		String category = "g";
		return likeDao.existLike(id, userId, category);
	}

	// 맛집 좋아요 갯수
	public int getLikeCountGoodPlaceByPlaceIdAndUserId(int id) {
		String category = "g";
		return likeDao.selectLikeCountByDailyIdAndUserId(id, category);
	}

	// 맛집 좋아요 insert
	public int addGoodPlaceLikeByPlaceIdAndUserId(int id, String userId) {
		String category = "g";
		return likeDao.insertLikeByDailyIdAndUserId(id, userId, category);
	}

	// 맛집 좋아요 delete
	public int deleteGoodPlaceLikeByDailyIdAndUserId(int id, String userId) {
		String category = "g";
		return likeDao.deleteLikeByDailyIdAndUserId(id, userId, category);
	}

	// 노맛집 좋아요 체크
	public boolean existbadPlaceLike(int id, String userId) {
		String category = "b";
		return likeDao.existLike(id, userId, category);
	}

	// 노맛집 좋아요 갯수
	public int getLikeCountbadPlaceByPlaceIdAndUserId(int id) {
		String category = "b";
		return likeDao.selectLikeCountByDailyIdAndUserId(id, category);
	}

	// 노맛집 좋아요 insert
	public int addBadPlaceLikeByPlaceIdAndUserId(int id, String userId) {
		String category = "b";
		return likeDao.insertLikeByDailyIdAndUserId(id, userId, category);
	}

	// 노맛집 좋아요 delete
	public int deleteBadPlaceLikeByDailyIdAndUserId(int id, String userId) {
		String category = "b";
		return likeDao.deleteLikeByDailyIdAndUserId(id, userId, category);
	}

	// 일상 좋아요 있으면 삭제, 없으면 추가 메소드
	public int likeToggle(String userId, int id) {

		boolean isLike = existLike(id, userId);
		if (isLike == true) {

			return deleteLikeByDailyIdAndUserId(id, userId);
		} else {

			return addLikeByDailyIdAndUserId(id, userId);
		}
	}

	// 맛집 좋아요 있으면 삭제, 없으면 추가 메소드
	public int likeGoodPlaceToggle(String userId, int id) {

		boolean isLike = existGoodPlaceLike(id, userId);
		if (isLike == true) {

			return deleteGoodPlaceLikeByDailyIdAndUserId(id, userId);
		} else {

			return addGoodPlaceLikeByPlaceIdAndUserId(id, userId);
		}
	}

	// 노맛집 좋아요 있으면 삭제, 없으면 추가 메소드
	public int likeBadPlaceToggle(String userId, int id) {

		boolean isLike = existbadPlaceLike(id, userId);
		if (isLike == true) {

			return deleteBadPlaceLikeByDailyIdAndUserId(id, userId);
		} else {

			return addBadPlaceLikeByPlaceIdAndUserId(id, userId);
		}
	}
}
