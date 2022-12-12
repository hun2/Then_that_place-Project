package com.FirstProject.mypage.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.FirstProject.common.FileManagerServices;
import com.FirstProject.login.bo.UserBO;
import com.FirstProject.login.model.User;
import com.FirstProject.mypage.dao.MypageDAO;

@Service
public class MypageBO {

	
	@Autowired
	private UserBO userBo;
	@Autowired
	private FileManagerServices fileManagerServices;
	
	@Autowired
	private MypageDAO mypageDao;
	
	//프로필 사진 업데이트
	public int updateMyProfileByUserId(User user, MultipartFile file) {
		
		//아이디 값이 없을시 0으로 떨궈서 미리 사전방지.
		User profile = userBo.getUserByUser(user);
		if(profile == null) {
			return 0;
		}
		
		
		String profilePhoto = null;
		if(file != null) {
			profilePhoto = fileManagerServices.saveFile(user.getUserId(), file);
			if (profilePhoto != null && profile.getUserProfilePhoto() != null) {
				
				fileManagerServices.deleteFile(profile.getUserProfilePhoto());
			}
		}
		user.setUserProfilePhoto(profilePhoto);
		return mypageDao.updateMyProfileByUserId(user);
	}
	
	//프로필 정보 업데이트
	public int updateMyOtherInfoByUserId(User user) {
		
		return mypageDao.updateMyOtherInfoByUserId(user);
	}
	
	//회원정보 삭제
	public int deleteUserIdByUserId(User user) {
		
		User profile = userBo.getUserByUser(user);
		//사진이 있는경우 사진폴더까지 날리기.
		if (profile.getUserProfilePhoto() != null) {
			fileManagerServices.deleteFile(profile.getUserProfilePhoto());
		}
		
		return mypageDao.deleteUserIdByUserId(user);
	}
	
	//비밀번호 변경
	public int updatePasswordInfoByUserId(User user) {
			
		return mypageDao.updatePasswordInfoByUserId(user);
	}
}
