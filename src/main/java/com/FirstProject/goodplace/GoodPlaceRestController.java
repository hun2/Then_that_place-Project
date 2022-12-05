package com.FirstProject.goodplace;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.FirstProject.common.PlaceImage;
import com.FirstProject.goodplace.bo.GoodPlaceBO;
import com.FirstProject.goodplace.model.Food;
import com.FirstProject.goodplace.model.Place;
import com.FirstProject.login.model.User;

@Controller
@ResponseBody
public class GoodPlaceRestController {

	
	@Autowired
	private GoodPlaceBO goodPlaceBo;


	//글쓰기
	@PostMapping("/main/places/good")
	public Map<String, Object> goodPlace (@RequestParam(value="file", required = false) List<MultipartFile> file, HttpSession session, Place place, PlaceImage placeImage) throws Exception {
		User users = (User) session.getAttribute("loginUser");
		place.setUserId(users.getUserId());
		
		Map<String, Object> result =  new HashMap<>();
		int num = goodPlaceBo.addPlace(file, place, placeImage);
		
		if(num > 0) {
			result.put("code", 100);
		} else {
			result.put("errorMessage", "글쓰기에 실패하였습니다, 관리자에게 문의하세요");
		}
		
		
		return result;
	}
	
	
	//글수정
	@PutMapping("/main/places/good")
	public Map<String, Object> goodPlaceModifiy(HttpSession session, Place place){
		User users = (User) session.getAttribute("loginUser");
		place.setUserId(users.getUserId());
		
		Map<String, Object> result =  new HashMap<>();
		int num = goodPlaceBo.updatePlaceListById(place);
		if(num > 0) {
			result.put("code", 100);
		} else {
			result.put("errorMessage", "글 수정에 실패하였습니다, 관리자에게 문의하세요");
		}
		
		return result;
	}
	
	
	//글삭제
	@DeleteMapping("/main/places/good")
	public Map<String, Object> goodPlaceDelete(HttpSession session, Place place) {
		User users = (User) session.getAttribute("loginUser");
		place.setUserId(users.getUserId());
		Map<String, Object> result =  new HashMap<>();
		int num = goodPlaceBo.deletePlaceListById(place);
		if(num > 0) {
			result.put("code", 100);
		} else {
			result.put("errorMessage", "글 수정에 실패하였습니다, 관리자에게 문의하세요");
		}
		
		
		
		return result;
	}
	
	
	
	// 글 카테고리 선택 후 조회
	@GetMapping("/main/places/good-find")
	public Map<String, Object> goodPlaceGet(
			@RequestParam(value = "startDay", required = false) String startDay,
			@RequestParam(value = "endDay", required = false) String endDay,
			@RequestParam(value = "placeArea", required = false) String placeArea,
			@RequestParam(value = "placeKategorie", required = false) String placeKategorie,
			@RequestParam(value = "minPrice", required = false) Integer minPrice,
			@RequestParam(value = "maxPrice", required = false) Integer maxPrice,
			@RequestParam(value = "minGrade", required = false) Integer minGrade,
			@RequestParam(value = "maxGrade", required = false) Integer maxGrade) {
		
		Map<String, Object> result =  new HashMap<>();
		List<Place> CategorieList =  goodPlaceBo.getPlaceByCategorie(startDay, endDay, placeArea, placeKategorie, minPrice, maxPrice, minGrade, maxGrade);
		result.put("CategorieList", CategorieList);
		if (!CategorieList.isEmpty()) {
			List<PlaceImage> ImageList = goodPlaceBo.getImageByCategorie(CategorieList);
			result.put("ImageList", ImageList);
		}
		
		return result;
	}
	
}
