package com.FirstProject.daily.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.FirstProject.daily.dao.LikeDAO;

@Service
public class LikeBO {

	@Autowired
	private LikeDAO likeDao;
	
	//좋아요 insert
	public int addLikeByDailyIdAndUserId(int dailyId, String userId) {
		
		return likeDao.insertLikeByDailyIdAndUserId(dailyId, userId);
	}
	
	//좋아요 delete
	public int deleteLikeByDailyIdAndUserId(int dailyId, String userId) {
		return likeDao.deleteLikeByDailyIdAndUserId(dailyId, userId);
	}
	
	//좋아요 체크
	public boolean existLike(int dailyId, String userId) {
		
		return likeDao.existLike(dailyId, userId);
	}
	//좋아요 갯수
	public int getLikeCountByDailyIdAndUserId(int dailyId) {
		return likeDao.selectLikeCountByDailyIdAndUserId(dailyId);
	}
	
	
	//좋아요 있으면 삭제, 없으면 추가 메소드
	public int likeToggle(String userId, int dailyId) {
		
		boolean isLike = existLike(dailyId, userId);
		if ( isLike == true) {
			
			return deleteLikeByDailyIdAndUserId(dailyId, userId);
		} else {
			
			return addLikeByDailyIdAndUserId(dailyId, userId);
		}
	}
}
