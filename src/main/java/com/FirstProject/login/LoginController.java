package com.FirstProject.login;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.FirstProject.login.bo.MemberService;
import com.FirstProject.login.bo.UserBO;
import com.FirstProject.login.model.User;

@Controller
public class LoginController {

	

	@Autowired
	private MemberService ms;
	
	@Autowired
	private UserBO userBo;
	
	//로그인 view
	@RequestMapping("login")
	public String login() {
		
		return "login";
	}
	
	
	//회원가입 view
	@RequestMapping("/login/sign-up")
	public String signUp() {
		
		return "signup";
	}
	
	
	//아이디 찾기 view
	@RequestMapping("/login/user-id")
	public String userId() {
		
		return "userid";
	}
	
	//비밀번호 찾기 view
	@RequestMapping("/login/user-pwd")
	public String userPwd() {
		
		return "userpwd";
	}
	
	
	@RequestMapping(value="/oauth/kakao", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session) throws Exception {
		
		String access_Token = ms.getAccessToken(code);
		HashMap<String, Object> userInfo = ms.getUserInfo(access_Token);
		
		//아이디
		Object id = (Object) userInfo.get("id");
		String userId = String.valueOf(id);
		//닉네임
		String userNickName = (String) userInfo.get("nickname");
		//이메일
		String userEmail = (String) userInfo.get("email");
		 
		  //로그인하는 정보가 있는경우 메인페이지로
		  int row =  userBo.existUserByUserId(userId);
		  if ( row > 0) {
			User checkingUser = userBo.getUserById(userId);
			session.setAttribute("loginUser", checkingUser);
			  return "/main";
		  } else if ( row == 0) {
			  //로그인하는 정보가 없는경우 db에 insert
			userBo.addKaKaoUser(userId, userNickName, userEmail);
			User checkingUser = userBo.getUserById(userId);
			session.setAttribute("loginUser", checkingUser);
		  }
			
		  return "/main";
    }
	
}
