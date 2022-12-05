package com.FirstProject.goodplace.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.FirstProject.goodplace.dao.FoodDAO;
import com.FirstProject.goodplace.model.Food;

@Service
public class FoodBO {

	@Autowired
	private FoodDAO foodDao;
	
	//음식 리스트 가져오기
	public List<Food> getFoodByPlaceId(int placeId) {
		
		
		return foodDao.selectFoodByPlaceId(placeId);
	}
	
	
}
