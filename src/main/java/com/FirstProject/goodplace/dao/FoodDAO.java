package com.FirstProject.goodplace.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.FirstProject.goodplace.model.Food;

@Repository
public interface FoodDAO {

	
	public List<Food> selectFoodByPlaceId(int placeId);
	
}
