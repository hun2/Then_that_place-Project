package com.FirstProject.login.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.FirstProject.common.FileManagerServices;
import com.FirstProject.login.dao.UserDAO;
import com.FirstProject.login.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private FileManagerServices fileManagerServices;
	
	//회원가입 - 아이디 중복검사
	public int existUserByUserId(String userId) {
		
		return  userDao.selectUserByUserId(userId);
		
	}
	
	//회원가입 - insert
	public int addUser(User user, MultipartFile file) {
		
		String userProfilePhoto = null;
		if (file != null) {
			userProfilePhoto = fileManagerServices.saveFile(user.getUserId(), file);
			user.setUserProfilePhoto(userProfilePhoto);
			
		}
		
		
		return userDao.insertUser(user);
	}
	
	
	//로그인 - 아이디 및 패스워드 일치여부
	public User getLoginUserByUserIdUserPwd(User user) {
		
		return userDao.selectLoginUserByUserIdUserPwd(user);
		
	}
	
	//아이디 찾기
	public User getUserIdByUserEmail(User user) {
		return userDao.selectUserIdByUserEmail(user);
	}
	
	//비밀번호 찾기 - 아이디와 이메일 일치여부
	
	public User getUserPwdCheckByUserIdUserEmail(User user) {
		
		return userDao.selectUserPwdCheckByUserIdUserEmail(user);
	}
	
	//비밀번호 업데이트시 필요한 id 값 가져오기
	public String findUserByUserId(String userEmail) {
		
		return userDao.selectUserByUserEmail(userEmail);
	}
	
	
	//비밀번호 업데이트
	public void updataUserPassword(String userId, String userPwd) {
		userDao.updataUserPassword(userId, userPwd);
	}
	
	
	//아이디 하나 가져오기
	public User getUserById(String uid) {
		
		return userDao.selectUserById(uid);
	}
}
