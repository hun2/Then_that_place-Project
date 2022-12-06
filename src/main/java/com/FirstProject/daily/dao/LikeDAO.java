package com.FirstProject.daily.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface LikeDAO {

	//insert
	public int insertLikeByDailyIdAndUserId(@Param("dailyId") int dailyId, @Param("userId") String userId);
	
	//delete
	public int deleteLikeByDailyIdAndUserId(@Param("dailyId") int dailyId, @Param("userId") String userId);
	
	//check
	public boolean existLike(@Param("dailyId") int dailyId, @Param("userId") String userId);
	
	//count
	public int selectLikeCountByDailyIdAndUserId(int dailyId);
}
