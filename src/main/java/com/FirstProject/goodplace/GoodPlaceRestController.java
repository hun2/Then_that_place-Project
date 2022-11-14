package com.FirstProject.goodplace;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.FirstProject.common.PlaceImage;
import com.FirstProject.goodplace.bo.GoodPlaceBO;
import com.FirstProject.goodplace.model.Place;
import com.FirstProject.login.model.User;

@Controller
@ResponseBody
public class GoodPlaceRestController {

	
	@Autowired
	private GoodPlaceBO goodPlaceBo;


	//테스트
	@PostMapping("/test")
	public Map<String, Object> test (@RequestParam(value="file", required = false) List<MultipartFile> file, HttpSession session, Place place, PlaceImage placeImage) throws Exception {
		User users = (User) session.getAttribute("loginUser");
		place.setUserId(users.getUserId());
		
		int num = goodPlaceBo.addPlace(file, place, placeImage);
		Map<String, Object> result =  new HashMap<>();
		
		if(num > 0) {
			
			result.put("code", 100);
		} else {
			result.put("errorMessage", "회원가입에 실패하였습니다, 관리자에게 문의하세요");
		}
		
		
		return result;
	}
}
