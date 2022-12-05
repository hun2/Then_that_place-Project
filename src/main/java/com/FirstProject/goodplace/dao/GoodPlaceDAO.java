package com.FirstProject.goodplace.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.FirstProject.common.PlaceImage;
import com.FirstProject.goodplace.model.Food;
import com.FirstProject.goodplace.model.Place;
import com.FirstProject.login.model.User;

@Repository
public interface GoodPlaceDAO {
	
	
	//게시글 insert
	public int insertPlace(Place place);
	
	
	//사진 insert
	public int insertImage(PlaceImage placeImage);
	
	//메뉴 insert
	public int insertFood(Place place);
	
	//게시글 select (모든 글 가져오기 해당 id로만)
	
	public List<Place> selectPlaceList(User user);
	
	
	//모든 글 가져오기 조건없이.
	
	public List<Place> selectList(String userId);
	
	//모든 글 가져오기 조건없이 - limit 3개만
	
	public List<Place> selectListLimit3(String userId);
	
	
	//개인 상세페이지 게시글 가져오기 placeId와 userId 파라미터값 전송
	
	public Place selectPlaceByPlaceIdAndUserId(@Param("placeId") int placeId,  @Param("userId") String userId);
	
	
	//게시글 수정
	public int updatePlaceListById(Place place);
	
	//메뉴 삭제
	public void deleteFoodListById(Place place);
	
	//게시글 삭제
	public int deletePlaceListById(Place place);
	
	
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
