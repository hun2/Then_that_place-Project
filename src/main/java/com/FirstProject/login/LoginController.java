package com.FirstProject.login;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

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
	
	//카카오로 로그인 접속
	@RequestMapping(value="/oauth/kakao", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session, 
			@RequestParam Map<String, String> params,
			RedirectAttributes redirect
			) throws Exception {
		
		String access_Token = ms.getAccessToken(code);
		HashMap<String, Object> userInfo = ms.getUserInfo(access_Token);
		
		//아이디
		Object id = (Object) userInfo.get("id");
		String kakaoId = String.valueOf(id);
		//닉네임
		String userNickName = (String) userInfo.get("nickname");
		//이메일
		String userEmail = (String) userInfo.get("email");
		 
		  //로그인하는 정보가 있는경우 메인페이지로
		  int row =  userBo.existKakaoUserByKakaoId(kakaoId);
		  if ( row > 0) {
			User checkingUser = userBo.getKakaoUserByKakaoId(kakaoId);
			session.setAttribute("loginUser", checkingUser);
			  return "/main";
		  } else if ( row == 0) {
			  Map<String, String> map = new HashMap<String, String>();
			  map.put("kakaoId", kakaoId);
			  map.put("userNickName", userNickName);
			  map.put("userEmail", userEmail);
			  redirect.addFlashAttribute("map", map);
			  return "redirect:/login/sign-up/kakao";
		  }
			
		  return "/main";
    }
	
	//카카오 가입
	@RequestMapping("/login/sign-up/kakao")
	public String kakaoSignUp(@RequestParam Map<String, String> params,
			HttpServletRequest request, Model model) {
		
		Map<String, ?> result = RequestContextUtils.getInputFlashMap(request);
		params= (Map<String, String>) result.get("map");
		String userEmail = params.get("userEmail");
		String userNickName = params.get("userNickName");
		String kakaoId = params.get("kakaoId");
		
		model.addAttribute("userEmail", userEmail);
		model.addAttribute("userNickName", userNickName);
		model.addAttribute("kakaoId", kakaoId);
		return "kakaosignup";
	}
	
}
