package com.FirstProject.goodplace.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.FirstProject.goodplace.dao.PlaceImageDAO;
import com.FirstProject.goodplace.model.PlaceImage;

@Service
public class PlaceImageBO {

	
	@Autowired
	private PlaceImageDAO placeImageDao;
	
	public List<PlaceImage> getPlaceImageByPlaceId(int PlaceId) {
		
		return placeImageDao.selectPlaceImageByPlaceId(PlaceId);
		
	}
	
	
	
}
