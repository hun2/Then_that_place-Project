package com.FirstProject.daily.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.FirstProject.common.DailyImage;
import com.FirstProject.daily.dao.DailyImageDAO;
import com.FirstProject.daily.model.DailyImage2;

@Service
public class DailyImageBO {

	@Autowired
	private DailyImageDAO dailyImageDao;
	
	public List<DailyImage2> getPlaceImageByDailyId(int dailyId) {
		
		return dailyImageDao.selectPlaceImageByDailyId(dailyId);
	}
	
	
	
}
