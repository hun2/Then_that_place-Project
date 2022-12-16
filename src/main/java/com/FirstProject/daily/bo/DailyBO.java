package com.FirstProject.daily.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.FirstProject.common.DailyImage;
import com.FirstProject.common.FileManagerServices;
import com.FirstProject.daily.dao.DailyDAO;
import com.FirstProject.daily.model.Comment;
import com.FirstProject.daily.model.Daily;
import com.FirstProject.goodplace.model.Place;
import com.FirstProject.login.model.User;

@Service
public class DailyBO {

	@Autowired
	private DailyDAO dailyDao;
	
	@Autowired
	private FileManagerServices fileManagerServices;
	
	//본인 제외 모든 유저 정보 가져오기
	public List<User> getUserAll(User user) {
		
		return dailyDao.selectUSerAll(user);
	}
	
	
	
	//글쓰기
	public int addDaily(List<MultipartFile> file, Daily daily, DailyImage dailyImage) throws Exception {
		
		String imagePath = null;
		
		//1. 게시글 추가
		int insertedDaily = dailyDao.insertDaily(daily);
		//2. 이미지가 하나도 없다면 바로 리턴
		if (file == null) {
			//성공한다면 1
			return insertedDaily;
		}
		
		//3. 게시글 추가가 되지 않는다면 예외처리
		if ( insertedDaily < 1 ) {
			throw new Exception();
		}
		
		
		//4. 이미지가 하나라도 있다면 이미지 저장 후 placeImage 테이블 insert
		if (file != null) {
			List<String> url = new ArrayList<>();
			for ( int i =0 ; i< file.size(); i++) {
						
				imagePath = fileManagerServices.saveFile(daily.getUserId(), file.get(i));
				url.add(imagePath);
			}
			dailyImage.setImagePath(url);
			dailyImage.setDailyId(daily.getId());
		}
		int insertedImage = dailyDao.insertImage(dailyImage);
		
		
		
		
		
		int result = insertedDaily + insertedImage;
		return result;
	}
	
	
	
	//모든 글 가져오기
	public List<Daily> getList(String userId, int startNum , int endNum) {
		
		return dailyDao.selectList(userId, startNum, endNum);
	}
	
	//글 3개만 가져오기
	public List<Daily> getListLimit3(String userId){
		
		return dailyDao.selectListLimit3(userId);
	}
	
	//남의일상 게시글 가져오기
	public List<Daily> getOtherList(String userId, int startNum, int endNum) {
		
		return dailyDao.selectOtherList(userId, startNum, endNum);
	}
	
	//남의맛집 게시글 가져오기
	public List<Place> getOtherPlaceList(String userId, int startNum, int endNum) {
		
		return dailyDao.selectOtherPlaceList(userId, startNum, endNum);
	}
	//남의 노맛집 게시글 가져오기
	public List<Place> getOtherBadPlaceList(String userId, int startNum, int endNum) {
		
		return dailyDao.selectOtherBadPlaceList(userId, startNum, endNum);
	}
	
	
	
	//개인 글 가져오기
	
	public Daily getDailyByDailyIdandUserId(int dailyId, String userId) {
		
		return dailyDao.selectDailyByDailyIdandUserId(dailyId, userId);
	}
	
	//남의 글 가져오기
	public Daily getDailyByDailyId(int dailyId) {
		return dailyDao.selectDailyByDaily(dailyId);
	}
	
	//게시글 수정
	public int updateDailyListById(Daily daily) {
		return dailyDao.updateDailyListById(daily);
	}
	
	//게시글 삭제
	public int deleteDailyListById(int id) {
		
		return dailyDao.deleteDailyListById(id);
	}
	
	
		
}
