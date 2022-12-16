package com.FirstProject.badplace.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.FirstProject.common.PlaceImage;
import com.FirstProject.goodplace.model.Place;

@Repository
public interface BadPlaceDAO {

	// 모든글 가져오기
	public List<Place> selectList(@Param("place") Place place, @Param("startNum") int startNum, @Param("endNum") int endNum);

	// 모든 글 가져오기 조건없이 ( 글 3개만 가져오기)
	public List<Place> selectListLimit3(String userId);
	
	//게시글 id로 게시글 가져오기
	public Place selectPlaceByPlaceId(int placeId);
}
