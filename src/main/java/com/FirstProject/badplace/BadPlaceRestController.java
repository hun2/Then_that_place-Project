package com.FirstProject.badplace;

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

import com.FirstProject.badplace.bo.BadPlaceBO;
import com.FirstProject.common.PlaceImage;
import com.FirstProject.goodplace.bo.TimeLineBO;
import com.FirstProject.goodplace.model.CardView;
import com.FirstProject.goodplace.model.Place;
import com.FirstProject.login.model.User;

@Controller
@ResponseBody
public class BadPlaceRestController {

		@Autowired
		private BadPlaceBO badPlaceBo;
		
		@Autowired
		private TimeLineBO timeLineBo;
		
		//글쓰기
		@PostMapping("/main/places/bad")
		public Map<String, Object> badPlace (@RequestParam(value="file", required = false) List<MultipartFile> file, HttpSession session, Place place, PlaceImage placeImage) throws Exception {
			User users = (User) session.getAttribute("loginUser");
			place.setUserId(users.getUserId());
			
			Map<String, Object> result =  new HashMap<>();
			int num = badPlaceBo.addPlace(file, place, placeImage);
			
			if(num > 0) {
				result.put("code", 100);
			} else {
				result.put("errorMessage", "글쓰기에 실패하였습니다, 관리자에게 문의하세요");
			}
			
			
			return result;
		}
		
		//글수정
		@PutMapping("/main/places/bad")
		public Map<String, Object> goodPlaceModifiy(HttpSession session, Place place){
			User users = (User) session.getAttribute("loginUser");
			place.setUserId(users.getUserId());
			
			Map<String, Object> result =  new HashMap<>();
			int num = badPlaceBo.updatePlaceListById(place);
			if(num > 0) {
				result.put("code", 100);
			} else {
				result.put("errorMessage", "글 수정에 실패하였습니다, 관리자에게 문의하세요");
			}
			
			return result;
		}
		
		
		//글삭제
		@DeleteMapping("/main/places/bad")
		public Map<String, Object> goodPlaceDelete(HttpSession session, Place place) {
			User users = (User) session.getAttribute("loginUser");
			place.setUserId(users.getUserId());
			Map<String, Object> result =  new HashMap<>();
			int num = badPlaceBo.deletePlaceListById(place);
			if(num > 0) {
				result.put("code", 100);
			} else {
				result.put("errorMessage", "글 수정에 실패하였습니다, 관리자에게 문의하세요");
			}
			return result;
		}
		
		
		/*
		 * // 글 카테고리 선택 후 조회
		 * 
		 * @GetMapping("/main/places/bad-find") public Map<String, Object>
		 * goodPlaceGet(Place place, int page, HttpSession session) {
		 * 
		 * Map<String, Object> result = new HashMap<>(); List<CardView>
		 * dailyCardViewList = timeLineBo.generateBadCardList(place, page);
		 * result.put("dailyCardViewList", dailyCardViewList); return result; }
		 */
		
		
		
		//노맛집 페이징
		@GetMapping("/main/places/badpaing")
		public Map<String, Object> paginBad(@RequestParam("page") int page, HttpSession session, Place place) {
			User users = (User) session.getAttribute("loginUser");
			String userId = users.getUserId();
			place.setUserId(userId);
			Map<String, Object> result = new HashMap<>();
			List<CardView> dailyCardViewList = timeLineBo.generateBadCardList(place, page);
			result.put("dailyCardViewList", dailyCardViewList);
			
			return result;
		}
		
}
