package com.FirstProject.goodplace.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.FirstProject.goodplace.model.PlaceImage;

@Repository
public interface PlaceImageDAO {

	public List<PlaceImage> selectPlaceImageByPlaceId(int PlaceId);
	
}
