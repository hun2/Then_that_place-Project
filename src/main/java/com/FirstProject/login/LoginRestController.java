package com.FirstProject.login;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.FirstProject.common.SHA256;
import com.FirstProject.login.bo.SendEmail;
import com.FirstProject.login.bo.UserBO;
import com.FirstProject.login.model.Mail;
import com.FirstProject.login.model.User;


@Controller
@ResponseBody
public class LoginRestController {

	@Autowired
	private UserBO userBo;
	
	@Autowired
	private SendEmail sendEmail;
	
	
	//회원가입 - id 중복확인
	@GetMapping("/login/userid-duplication")
	public Map<String, Object> duplication(@RequestParam("userId") String userId){
		
		Map<String, Object> result = new HashMap<>();
		int isDuplication = userBo.existUserByUserId(userId);
		result.put("isDuplication", isDuplication);
		
		return result;
	}
	
	
	//회원가입 - insert
	@PostMapping("/login/user")
	public Map<String, Object> login(User user , @RequestParam(value="file", required = false) MultipartFile file) throws NoSuchAlgorithmException {
		
		Map<String, Object> result = new HashMap<>();
		
		//비밀번호 암호화
		SHA256 sha256 = new SHA256();
		String encryptedPwd = sha256.encrypt(user.getUserPwd());
		user.setUserPwd(encryptedPwd);
		
		//db insert
		int row = userBo.addUser(user, file);
		if ( row >0) {
			result.put("code", 100);
		} else {
			result.put("errorMessage", "회원가입에 실패하였습니다, 관리자에게 문의하세요");
		}
		return result;
	}
	
	
	
	// 로그인  - 아이디 / 비밀번호 일치 확인
	@GetMapping("/login/success")
	public User loginSuccess(User user, HttpSession session) throws NoSuchAlgorithmException {
	
		SHA256 sha256 = new SHA256();
		String encryptedPwd = sha256.encrypt(user.getUserPwd());
		user.setUserPwd(encryptedPwd);
		
		User checkingUser = userBo.getLoginUserByUserIdUserPwd(user);
		session.setAttribute("loginUser", checkingUser);
		return checkingUser;
	}
	
	
	// 아이디 찾기
	@GetMapping("/login/user-id-check")
	public User userIdCheck(User user) {
		User checkingUser = userBo.getUserIdByUserEmail(user);
		return checkingUser;
	}
	
	
	//비밀번호 찾기 - 아이디와 이메일 일치여부
	@GetMapping("/login/user-pwd-check")
	public User pwd_check(User user) {
		
		User checkingPwd = userBo.getUserPwdCheckByUserIdUserEmail(user);
		return checkingPwd;
	}
	
	//임시비밀번호 이메일 보내기
	@PostMapping("/sendEmail")
	public void sendEmail(User user) throws NoSuchAlgorithmException {
		Mail mail = sendEmail.createMailAndChangePassword(user);
		sendEmail.mailSend(mail);
		
	}
	
}
