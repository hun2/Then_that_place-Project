package com.FirstProject.goodplace.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.FirstProject.common.FileManagerServices;
import com.FirstProject.common.PlaceImage;
import com.FirstProject.goodplace.dao.GoodPlaceDAO;
import com.FirstProject.goodplace.model.Food;
import com.FirstProject.goodplace.model.Place;
import com.FirstProject.login.model.User;

@Service
public class GoodPlaceBO {

	@Autowired
	private GoodPlaceDAO goodPlaceDao;

	@Autowired
	private FileManagerServices fileManagerServices;
	
	@Autowired
	private PlaceImageBO placeImageBo;
	// 글쓰기 insert
	public int addPlace(List<MultipartFile> file, Place place, PlaceImage placeImage) throws Exception {

		String imagePath = null;
		place.setPlaceWhether("g");
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

	// 모든 글 가져오기
	public List<Place> getPlaceList(User user) {

		return goodPlaceDao.selectPlaceList(user);
	}

	// 모든 글 가져오기 조건없이.

	public List<Place> getList(Place place, int startNum, int endNum) {

		return goodPlaceDao.selectList(place, startNum, endNum);
	}

	// 모든 글 가져오기 조건없이 ( 글 3개만 가져오기)

	public List<Place> getListLimit3(String userId) {

		return goodPlaceDao.selectListLimit3(userId);
	}

	// 개인 페이지 글 가져오기 placeId와 userId 값을 던저서 해당되는 값
	public Place getPlaceByPlaceIdAndUserId(int placeId, String userId) {

		return goodPlaceDao.selectPlaceByPlaceIdAndUserId(placeId, userId);
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
		if ( goodPlaceDao.existPlaceImageListById(place) > 0) {
			goodPlaceDao.deletePlaceImageListById(place);
		}
		return deletePlaceList;
	}


	// 게시글 id로 게시글 가져오기
	public Place getPlaceByPlaceId(int placeId) {

		return goodPlaceDao.selectPlaceByPlaceId(placeId);

	}

	/*
	 * // join 쿼리를 이용한 리스트 가져오기
	 * 
	 * public List<Place> getAllJoinList(Place place, int startNum, int endNum) {
	 * 
	 * return goodPlaceDao.selectAllJoinList(place, startNum, endNum); }
	 */
}
