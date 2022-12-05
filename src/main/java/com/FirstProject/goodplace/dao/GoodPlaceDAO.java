package com.FirstProject.goodplace.dao;

import org.springframework.stereotype.Repository;
import com.FirstProject.common.PlaceImage;
import com.FirstProject.goodplace.model.Place;

@Repository
public interface GoodPlaceDAO {
	
	
	//게시글 insert
	public int insertPlace(Place place);
	
	
	//사진 insert
	public int insertImage(PlaceImage placeImage);
}
