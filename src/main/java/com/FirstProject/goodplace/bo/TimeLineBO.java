package com.FirstProject.goodplace.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.FirstProject.badplace.bo.BadPlaceBO;
import com.FirstProject.goodplace.model.CardView;
import com.FirstProject.goodplace.model.Food;
import com.FirstProject.goodplace.model.Place;
import com.FirstProject.goodplace.model.PlaceImage;
import com.FirstProject.login.bo.UserBO;
import com.FirstProject.login.model.User;

@Service
public class TimeLineBO {

	@Autowired
	private FoodBO foodBo;

	@Autowired
	private PlaceImageBO placeImageBo;

	@Autowired
	private GoodPlaceBO goodPlaceBo;

	@Autowired
	private BadPlaceBO badPlaceBo;
	@Autowired
	private UserBO userBo;

	// 맛집
	public List<CardView> generateCardList(String userId) {

		// 최종 리턴 리스트 생성
		List<CardView> cardViewList = new ArrayList<>();

		// 글 목록 가져오기
		List<Place> placeList = goodPlaceBo.getList(userId);

		for (Place place : placeList) {

			CardView card = new CardView();

			// 글 정보
			card.setPlace(place);

			// 글쓴이 정보
			User user = userBo.getUserById(place.getUserId());
			card.setUser(user);

			// 사진 정보
			List<PlaceImage> ImageList = placeImageBo.getPlaceImageByPlaceId(place.getId());
			card.setPlaceImage(ImageList);

			// 음식 및 가격 정보
			List<Food> FoodList = foodBo.getFoodByPlaceId(place.getId());
			card.setFood(FoodList);

			cardViewList.add(card);
		}

		return cardViewList;
	}

	// 맛집
	public List<CardView> generateBadCardList(String userId) {

		// 최종 리턴 리스트 생성
		List<CardView> cardViewList = new ArrayList<>();

		// 글 목록 가져오기
		List<Place> placeList = badPlaceBo.getList(userId);

		for (Place place : placeList) {

			CardView card = new CardView();

			// 글 정보
			card.setPlace(place);

			// 글쓴이 정보
			User user = userBo.getUserById(place.getUserId());
			card.setUser(user);

			// 사진 정보
			List<PlaceImage> ImageList = placeImageBo.getPlaceImageByPlaceId(place.getId());
			card.setPlaceImage(ImageList);

			// 음식 및 가격 정보
			List<Food> FoodList = foodBo.getFoodByPlaceId(place.getId());
			card.setFood(FoodList);

			cardViewList.add(card);
		}

		return cardViewList;
	}

	// 맛집 - 메인페이지 띄울 것 (리스트 3개만 가져올거임)
	public List<CardView> mainCardList(String userId) {

		// 최종 리턴 리스트 생성
		List<CardView> cardViewList = new ArrayList<>();

		// 글 목록 가져오기
		List<Place> placeList = goodPlaceBo.getListLimit3(userId);

		for (Place place : placeList) {

			CardView card = new CardView();

			// 글 정보
			card.setPlace(place);

			// 글쓴이 정보
			User user = userBo.getUserById(place.getUserId());
			card.setUser(user);

			// 사진 정보
			List<PlaceImage> ImageList = placeImageBo.getPlaceImageByPlaceId(place.getId());
			card.setPlaceImage(ImageList);

			// 음식 및 가격 정보
			List<Food> FoodList = foodBo.getFoodByPlaceId(place.getId());
			card.setFood(FoodList);

			cardViewList.add(card);
		}

		return cardViewList;
	}

	// 맛집 - 메인페이지 띄울 것 (리스트 3개만 가져올거임)
	public List<CardView> mainBadCardList(String userId) {

		// 최종 리턴 리스트 생성
		List<CardView> cardViewList = new ArrayList<>();

		// 글 목록 가져오기
		List<Place> placeList = badPlaceBo.getListLimit3(userId);

		for (Place place : placeList) {

			CardView card = new CardView();

			// 글 정보
			card.setPlace(place);

			// 글쓴이 정보
			User user = userBo.getUserById(place.getUserId());
			card.setUser(user);

			// 사진 정보
			List<PlaceImage> ImageList = placeImageBo.getPlaceImageByPlaceId(place.getId());
			card.setPlaceImage(ImageList);

			// 음식 및 가격 정보
			List<Food> FoodList = foodBo.getFoodByPlaceId(place.getId());
			card.setFood(FoodList);

			cardViewList.add(card);
		}

		return cardViewList;
	}

}
