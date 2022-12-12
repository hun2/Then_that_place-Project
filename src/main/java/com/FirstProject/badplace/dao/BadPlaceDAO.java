package com.FirstProject.badplace.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.FirstProject.common.PlaceImage;
import com.FirstProject.goodplace.model.Place;

@Repository
public interface BadPlaceDAO {

	// 모든글 가져오기
	public List<Place> selectList(String userId);

	// 모든 글 가져오기 조건없이 ( 글 3개만 가져오기)
	public List<Place> selectListLimit3(String userId);
	
	//검색 조건으로 검색
	public List<Place> selectPlaceByCategorie(
				@Param("startDay") String startDay, 
				@Param("endDay") String endDay, 
				@Param("placeArea") String placeArea, 
				@Param("placeKategorie") String placeKategorie, 
				@Param("minPrice") Integer minPrice, 
				@Param("maxPrice") Integer maxPrice, 
				@Param("minGrade") Integer minGrade, 
				@Param("maxGrade") Integer maxGrade);
	//검색조건으로 가져온 리스트들로 이미지리스트 가져오기
	public List<PlaceImage> selectImageByCategorie(List<Place> CategorieList);
	
	
	//게시글 id로 게시글 가져오기
	public Place selectPlaceByPlaceId(int placeId);
}
