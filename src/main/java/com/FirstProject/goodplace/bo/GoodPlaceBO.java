package com.FirstProject.goodplace.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.FirstProject.common.FileManagerServices;
import com.FirstProject.common.PlaceImage;
import com.FirstProject.goodplace.dao.GoodPlaceDAO;
import com.FirstProject.goodplace.model.Place;
import com.FirstProject.login.model.User;

@Service
public class GoodPlaceBO {
	
	@Autowired
	private GoodPlaceDAO goodPlaceDao;
	
	@Autowired
	private FileManagerServices fileManagerServices;
	
	// 글쓰기 insert
	public int addPlace(List<MultipartFile> file, Place place, PlaceImage placeImage) throws Exception {
		
		String imagePath = null;
		place.setPlaceWhether("g");
		//1. 게시글내용 추가
		int insertedPlace = goodPlaceDao.insertPlace(place);
		//2. 이미지가 하나도 없다면 바로 리턴
		if (file == null) {
			//성공한다면 1
			return insertedPlace;
		}
		
		//3. 게시글 추가가 되지 않는다면 예외처리
		if ( insertedPlace < 1 ) {
			throw new Exception();
		}
		
		//4. 이미지가 하나라도 있다면 이미지 저장 후 placeImage 테이블 insert
		if (file != null) {
			List<String> url = new ArrayList<>();
			for ( int i =0 ; i< file.size(); i++) {
				
				imagePath = fileManagerServices.saveFile(place.getUserId(), file.get(i));
				url.add(imagePath);
			}
			placeImage.setImagePath(url);
			placeImage.setPlaceId(place.getId());
			
		}
		int insertedImage = goodPlaceDao.insertImage(placeImage);
		
		//5. 두가지 메소드 리턴 값 합산
		int result = insertedPlace + insertedImage;
		
		//6. 문제없다면 메소드 합산 리턴
		return result;
	}
}
