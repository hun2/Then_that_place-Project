package com.FirstProject.badplace.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.FirstProject.badplace.dao.BadPlaceDAO;
import com.FirstProject.common.FileManagerServices;
import com.FirstProject.common.PlaceImage;
import com.FirstProject.goodplace.dao.GoodPlaceDAO;
import com.FirstProject.goodplace.model.Place;

@Service
public class BadPlaceBO {

	@Autowired
	private FileManagerServices fileManagerServices;

	@Autowired
	private BadPlaceDAO badPlaceDao;

	@Autowired
	private GoodPlaceDAO goodPlaceDao;

	public int addPlace(List<MultipartFile> file, Place place, PlaceImage placeImage) throws Exception {

		String imagePath = null;
		place.setPlaceWhether("b");
		// 1. 게시글내용 추가
		int insertedPlace = goodPlaceDao.insertPlace(place);
		// 2. 이미지가 하나도 없다면 바로 리턴
		if (file == null) {
			// 성공한다면 1
			return insertedPlace;
		}

		// 3. 게시글 추가가 되지 않는다면 예외처리
		if (insertedPlace < 1) {
			throw new Exception();
		}

		// 4. 이미지가 하나라도 있다면 이미지 저장 후 placeImage 테이블 insert
		if (file != null) {
			List<String> url = new ArrayList<>();
			for (int i = 0; i < file.size(); i++) {

				imagePath = fileManagerServices.saveFile(place.getUserId(), file.get(i));
				url.add(imagePath);
			}
			placeImage.setImagePath(url);
			placeImage.setPlaceId(place.getId());

		}
		int insertedImage = goodPlaceDao.insertImage(placeImage);
		// 5. 음식 및 가격 추가
		if (place.getFoods() == null) {
			int result = insertedPlace + insertedImage;
			return result;
		}
		place.getId();
		int insertedFood = goodPlaceDao.insertFood(place);
		int result = insertedPlace + insertedImage + insertedFood;

		// 6. 두가지 메소드 리턴 값 합산

		// 6. 문제없다면 메소드 합산 리턴
		return result;
	}

	// 모든 글 가져오기 조건없이.

	public List<Place> getList(String userId) {

		return badPlaceDao.selectList(userId);
	}
	//모든 글 가져오기 조건없이 ( 글 3개만 가져오기)
	public List<Place> getListLimit3(String userId) {
		
		return badPlaceDao.selectListLimit3(userId);
	}
	
	// 게시글 수정
	public int updatePlaceListById(Place place) {
		int updatedPlaceList = goodPlaceDao.updatePlaceListById(place);
		goodPlaceDao.deleteFoodListById(place);
		int insertedFoodList = goodPlaceDao.insertFood(place);
		int result = updatedPlaceList + insertedFoodList;
		return result;
	}

	// 게시글 삭제
	public int deletePlaceListById(Place place) {

		int deletePlaceList = goodPlaceDao.deletePlaceListById(place);
		goodPlaceDao.deleteFoodListById(place);
		return deletePlaceList;
	}
	
	
	
	//검색 조건으로 검색
	public List<Place> getPlaceByCategorie(String startDay, String endDay, String placeArea, String placeKategorie, Integer minPrice, Integer maxPrice, Integer minGrade, Integer maxGrade) {
			
		return badPlaceDao.selectPlaceByCategorie(startDay, endDay, placeArea, placeKategorie, minPrice, maxPrice, minGrade, maxGrade);
	}
	
	
	//검색 조건으로 리턴받은 아이로 이미지 가져오기
	public List<PlaceImage> getImageByCategorie(List<Place> CategorieList) {
			
		return badPlaceDao.selectImageByCategorie(CategorieList);
	}
	
	//게시글 id로 게시글 가져오기
	public Place getPlaceByPlaceId(int placeId) {
			
		return badPlaceDao.selectPlaceByPlaceId(placeId);
			
	}
	
	
	
}
