# 그때그곳 #
일상, 맛집, 노맛집을 기록하는 공간입니다. <br><br>

## Getting Started ##
일상, 맛집, 노맛집을 기록하며 <br>
사용자들과 정보교류를 위한 페이지입니다. <br>
여러분들의 진짜 인생 맛집과
다신 가지 말아야 할 노맛집은 어디인가요? <br>
그때그곳에서 함께해보아요!<br><br>


## Trouble shooting ##
  <details>
  <summary> <h4>페이지 이동없이 비동기 Ajax 통신 후 Success function 결과 동적쿼리 생성 </h4></summary>
  
  기존의 방식은 이벤트 별로 페이지 이동하여, Controller의 Model값에 담아 html에 뿌리는 형식으로 진행하였다.<br>
  매번 이벤트 마다 효과적이지 못하다고 판단하여 제이쿼리 Ajax 통신을 통해<br> 
  성공시 동적쿼리를 생성하여 기존의 데이터는 remove() 하고 <br>
  실시간으로 페이지의 데이터를 append 하여 페이지를 변환시켰다. <br> 
  
```javascript
    , success : function(result) {
    var cards = result.dailyCardViewList 
    for(var i = 0; i<cards.length; i++) {		
      var card = cards[i] 
      var date = card.place.placeCreatedAt.substr(0, 10); 
      var $divGrade = $('<div class="star d-flex"/>') 
      for(var j =0; j< card.place.placeGrade; j++) { 
          $divGrade.append('<img src="/static/img/star.png" width="30px" height="30px">'); 
      } 
      if ( card.placeImage == "") { 
          var $img = $('<img src="/static/img/no.png" class="post-image">') 
      } else { 
          var $img = $('<img src="' + card.placeImage[0].imagePath + '" class="post-image"' + '">') 
      } 
      //이미지 감싸는 a태그 생성 
      var $href = $('<a href="/main/places/good-detail?placeId=' + card.place.id + '">') 
      //a태그에 이미지 추가 
      var $hrefValue = $href.append($img) 
      //카테고리 span 생성 
      var $spanValue = $('<span />').text(card.place.placeKategorie) 
      //카테고리 div 생성 및 span 추가 
      var $divCategory = $('<div class="categorie" />').append($spanValue) 
      //장소 div 생성 및 text 추가 
      var $divPlace = $('<div class="place" />').text(card.place.placeArea) 
      //날짜 div 생성 및 text 추가 
      var $divDate = $('<div class="date" />').text(date) 
      //카테고리 포괄 info div 생성 및 내용추가 
      var $divInfo = $('<div class="info" />').append($divCategory).append($divGrade).append($divPlace).append($divDate) 
      //제목 span 생성 및 text 추가 
      var $subject = $('<span class="placesubject" />').text(card.place.placeSubject) 
      var $divInfo2 = $('<div class="info" />').append($subject) 
      //post div 생성 및 info추가 
      var $divPost = $('<div class="post" />').append($divInfo).append($hrefValue).append($divInfo2) 
      //최종 wrapper 클래스에 post추가 - 반복문 진행. 
      $('.wrapper').append($divPost) 
      } 
    }
```
</details>
<details>
  <summary><h4>Swiper 동적 생성시 이미지 깨짐 및 출력오류<h4></summary>
  
  게시글의 글을 클릭시 modal창 내에 데이터를 뿌려질 수 있도록 구현하였다 <br>
  동적쿼리를 생성하여 swiper 구현한 곳에 이미지를 append 하여 추가하였지만 이미지 깨짐 과 원하는 사진형식이 되지 않았다 <br>
  동적으로 생긴 데이터를 swiper에서 구현시 update()가 필요한 걸 알게되어 <br>
  append 후 swiper.update() 를 추가하였고, 정상으로 데이터가 뿌려지게 되었다.
  
  ```javascript 
  , success : funciton(result) { 
  //이미지가 없으면 다른걸로 대체 
  if ( dailyImage == "") { 
    var $dailyimg = $('<img src="/static/img/no.png" class="swiper-lazy">') 
    var $swiperslide = $('<div class="swiper-slide" />').append($dailyimg) 
    $('.swiper-wrapper').append($swiperslide) 
  } else { 
  //이미지가 있으면 반복문 돌려서 append하기 
    for ( var i =0; i<dailyImage.length; i++) { 
      var $dailyimg = $('<img src="' + dailyImage[i].imagePath + '" class="swiper-lazy"' + '">') 
      var $swiperslide = $('<div class="swiper-slide" />').append($dailyimg) 
      $('.swiper-wrapper').append($swiperslide) 
      } 
  } 
  //swiper 업데이트 (동적이라) 
  swiper.update(); 
} 
```  
</details> 

<details>
  <summary><h4>StringUtils 적용 오류</h4></summary>
            
  컨트롤러에서 파라미터값을 전달 받아 Mybatis 로 전송 후 <br> 
  전달 받은 파라미터값을 null 그리고 "" 값 체크를 하기위해 <br> 
  StringUtils 를 gradle 추가하였고, 메소드 중 isNotBlank 를 사용하기로 하였다 <br>
  해당 메소드는 true, false 값을 리턴해주며, 컨트롤러에서 테스트 시 문제없이 결과값이 확인되어 <br>
  Mybatis 쪽에 적용하려 시도하였지만 Mybatis에서는 리턴값이 다르게 진행되어 결국 반영하지 못하고 <br>
  Mybatis 로 넘긴 파라미터값 null 그리고 "" 값 체크를 각각 진행하였다. 
            
```html 
<if test="@org.apache.commons.lang3.StringUtils@isNotBlank(place.minGrade, place.maxGrade)"> 
<if test="place.minGrade != null and !place.minGrade.equals('') and place.maxGrade != null and place.maxGrade.equals('')">           
```            
</details><details>
  <summary><h4>카카오가입 후 이동 시 문제</h4></summary>
            
  처음 방문하였을때 카카오ID로 가입과 일반 회원 가입의 jsp를 분리하여 진행하였습니다<br>
  회원가입 후 추후에 재로그인을 할때 카카오 ID로 가입받은 정보를 가지고<br>
  존재유무를 확인하지 않아, redirect가 회원가입 페이지로 가게되었습니다<br> 
  가입유무 메소드를 구성하여 kakao token id값 으로 existKakaoUserByKakaoId(kakaoId) 메소드를 호출하여<br>
  int 리턴타입으로 구성하였고, 만약 0 보다 큰 숫자가 나온다면 정보가 있는걸로 확인하고<br>
  return "main" jsp 페이지로 보내게 됬습니다. 
  
```java
//카카오로 로그인 접속 
@RequestMapping(value="/oauth/kakao", method=RequestMethod.GET) 
public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session, @RequestParam Map<String, String> params,
RedirectAttributes redirect) throws Exception 

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
  
```

</details><br><br> 
            
## 보고서 ##
<img width="778" alt="1" src="https://user-images.githubusercontent.com/104421488/208330358-274b81f6-6875-4dd0-9a3e-552a742320b0.png"><img width="778" alt="2" src="https://user-images.githubusercontent.com/104421488/208248751-358fc666-3cf2-46e4-a7aa-a7bfc5836451.png"><img width="778" alt="3" src="https://user-images.githubusercontent.com/104421488/208248844-1e6755bd-087b-49ec-8048-dfb0347f0b2c.png"><img width="778" alt="4" src="https://user-images.githubusercontent.com/104421488/208248880-f5a8aad4-92db-48fb-807b-f727fea4c8f3.png"><img width="778" alt="5" src="https://user-images.githubusercontent.com/104421488/208248911-8aa7f722-a5a4-4f8b-9d21-5e6419c3206a.png"><img width="778" alt="6" src="https://user-images.githubusercontent.com/104421488/208248943-cc8d2e69-b635-4af0-9e40-e1f62502883a.png"><img width="778" alt="7" src="https://user-images.githubusercontent.com/104421488/208248972-ae9cfc58-476d-4584-806c-29d2c9c5f0f2.png"><img width="778" alt="8" src="https://user-images.githubusercontent.com/104421488/208248993-2d2ded50-e1ba-4de7-b010-03298445f3ca.png"><img width="778" alt="9" src="https://user-images.githubusercontent.com/104421488/208249012-a69fed84-605b-4604-9b7f-910e416c90d3.png"><img width="778" alt="10" src="https://user-images.githubusercontent.com/104421488/208249039-5707d609-9da5-4fbf-8cd6-96487d40ea4e.png"><img width="778" alt="11" src="https://user-images.githubusercontent.com/104421488/208249093-2f9cc000-e2c1-494a-8e27-151ae9f0856b.png"><img width="778" alt="12" src="https://user-images.githubusercontent.com/104421488/208249127-35cd9f69-f357-4f4a-8c6e-e5dd839847ce.png"><img width="778" alt="13" src="https://user-images.githubusercontent.com/104421488/208249150-b22a3924-2b6c-40f0-bee8-a294b7b87168.png"><img width="778" alt="14" src="https://user-images.githubusercontent.com/104421488/208249192-035937f4-763a-42dd-b000-9bf7492d1d7d.png"><img width="778" alt="15" src="https://user-images.githubusercontent.com/104421488/208249227-f5c70593-2bd1-4503-987b-a352107f1864.png">


## 향후 추가 계획 ##
팔로우 팔로잉 모달 내 페이징처리 <br>
db쿼리 join문으로 변경하여 for문을 최소화 하기














