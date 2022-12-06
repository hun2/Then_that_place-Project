package com.FirstProject.daily.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.FirstProject.common.DailyImage;
import com.FirstProject.daily.model.DailyImage2;

@Repository
public interface DailyImageDAO {

	
	
	public List<DailyImage2> selectPlaceImageByDailyId(int dailyId);
}
