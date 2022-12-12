package com.FirstProject.daily.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.FirstProject.daily.model.Like;


@Repository
public interface LikeDAO {

	//insert
	public int insertLikeByDailyIdAndUserId(@Param("id") int id, @Param("userId") String userId, @Param("category") String category);
	
	//delete
	public int deleteLikeByDailyIdAndUserId(@Param("id") int id, @Param("userId") String userId, @Param("category") String category);
	
	//check
	public boolean existLike(@Param("id") int id, @Param("userId") String userId, @Param("category") String category );
	
	//count
	public int selectLikeCountByDailyIdAndUserId(@Param("id") int id , @Param("category") String category);
}
