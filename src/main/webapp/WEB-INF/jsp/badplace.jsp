<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그때그곳</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="/static/css/goodplace.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="shortcut icon" href="/static/favicon.ico" type="image/x-icon">
<!--datepicker  -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<body>
	<!--상단 고정바 시작  -->
	<div id="top_wrap">
		<div id="wrap_logo">
			<a class="mainLogo" href="/main">
				<span> 그때그곳</span>
			</a>
		</div>
		<nav id="wrap_topCate" class="" style="position: static; top: initial;">
			<ul class="inner">
				<li>
					<a href="/main"> <span class="on">메인</span></a> 
				</li>
				<li>
					<a href="/main/daily"> <span class="on">일상 </span> </a>
				</li>
				<li>
					<a href="/main/places/good">  <span class="on">죽어서도 기억해야 할 맛집</span></a> 
				</li>
				
				<li>
					<a href="/main/places/bad"> <span class="on">죽어서도 기억해야 할 노맛집</span></a>
				</li>
			</ul>
		</nav>
		<nav id="wrap_util">
			<ul class="inner">
				<li class="profile-card">
					<div class="profile-pic">
						<img src="${empty sessionScope.loginUser.userProfilePhoto ?  '/static/img/no.png' : sessionScope.loginUser.userProfilePhoto }">
					</div>
					<div class="profile-name">
						<p class="username">${sessionScope.loginUser.userNickName} 님 반갑습니다!</p>
					</div>
				</li>
				<li>
					<a class="link_util link_login" href="/mypage">마이페이지</a>
				</li>
				<li>
					<a class="link_util link_login" href="/logout">로그아웃</a>
				</li>
				<li><a class="btn_search" href="/search">
					<span class="ico_search"><img src=""></span></a>
				</li>
			</ul>
		</nav>
	</div>
	<!--상단 고정바 끝  -->
	
	<!--중간 바디영역 시작 -->
	<div class="bodycontent">
		<span class="col-6">죽어서도 기억해야 할 노맛집!</span>
		<a class="link_util link_login col-1" href="/main/places/bad-write" style="background-color: #333; border-color: #333; color: #fff;" id="write">글쓰기</a>
	</div>
	<!--중간 바디영역 끝  -->
	<!--중간 바디-2 영역 시작-->
	<div class="bodycontent2 d-flex" >
		<!--중간바디-2 왼쪽 시작  -->
		<div class="section w-30">
			<div class="sectionbody">
				<span class="subject">날짜</span> <br>
				<span>시작일</span> <span class="end">종료일</span> <br>
				<input type="text" class="col-4" id="startday"> ~
				<input type="text" class="col-4" id="endday"> <br>
			</div>
			<div class="sectionbody">
				<span class="subject">지역</span> <br>
				<input type="text" id="sample5_address">
				<input type="button" value="주소 검색" class="add" onclick="resizeMap()"><br>
			</div>
			<div class="sectionbody">
				<span class="subject">카테고리</span><br>
				<div class="onebody">
					<c:forEach items="한식, 중식, 일식, 양식, 카페" var="item">
						<div class="one mr-3">
							<span>${item}</span>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="sectionbody">
				<span class="subject">가격</span> <br>
				<input type="number" class="price1 col-4"> ~
				<input type="number" class="price2 col-4"> <br>
			</div>
			<div class="sectionbody">
				<span class="subject">평점</span> <br>
				<input type="number" class="grade1 col-4"> ~
				<input type="number" class="grade2 col-4"> <br>
			</div>
			<a class="submit" href="#" style="background-color: #333; border-color: #333; color: #fff;" id="submit">조회</a>
		</div>
		<!--중간 바디-2 왼쪽 끝  -->
		<!--중간 바디-2 오른쪽 시작  -->
		<div class="section2 w-70">
			<div class="wrapper">
				<c:forEach items="${cardViewList}" var="cardView">
					<div class="post">
						<div class="info"> 
							<!--카테고리 if 시작  -->
							<div class="categorie">
								<span>${cardView.place.placeKategorie}</span>
							</div>
							<!--카테고리 if 닫기  -->
							<!--별점 if 시작  -->
							<div class="star d-flex">
								<c:forEach begin="1" end="${cardView.place.placeGrade}">
									<img src="/static/img/star.png" width="30px" height="30px">
								</c:forEach>
							</div>
							<!--별점 if 닫기  -->
							 <div class="place">
							 	${cardView.place.placeArea}
							 </div>
							 <!--  날짜 시작 -->
							<div class="date">
								<fmt:formatDate value="${cardView.place.placeCreatedAt}" pattern="yyyy-MM-dd" />
							</div>
							<!--  날짜 닫기 -->
						</div>
						<!-- 이미지 if 시작 -->
						<a href="/main/places/bad-detail?placeId=${cardView.place.id}">
							<img src="${empty cardView.placeImage[0].imagePath ? '/static/img/no.png' : cardView.placeImage[0].imagePath}" class="post-image">
						</a>
						<!-- 이미지 if 닫기 -->
						<!--  제목 -->
						<div class="info">
							<span class="placesubject">${cardView.place.placeSubject}</span>
						</div>
						<!--  제목닫기 -->
					</div>
				</c:forEach> 
			</div>
		</div>
	</div>
	<!--중간바디-2 영역 끝 -->
	
	<!-- 지도모달 영역 시작 -->
	<div class="modal">
		<div class="modal_body">
			<div class="map_wrap">
			    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
			    <div id="menu_wrap" class="bg_white">
			        <div class="option">
			            <div>
			                <form onsubmit="searchPlaces(); return false;">
			                    키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
			                    <button type="submit">검색하기</button> 
			                </form>
			            </div>
			        </div>
			        <hr>
			        <ul id="placesList"></ul>
			        <div id="pagination"></div>
			        
			    </div>
			</div>
			
		</div>
	</div>
	<!-- 지도모달 영역 끝 -->
	
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=439e0931464541715aa7fea40206563f&libraries=services"></script>
<script type="text/javascript" src="/static/js/kakao.js"></script>
<script type="text/javascript">
	

const body = document.querySelector('body');
const modal = document.querySelector('.modal');
const addPopup = document.querySelector('.add');

addPopup.addEventListener('click', () => {
	modal.classList.toggle('show');
	resizeMap();
	relayout();
	 if (modal.classList.contains('show')) {
          body.style.overflow = 'hidden';
     }
});

modal.addEventListener('click', (event) => {
    if (event.target === modal) {
      modal.classList.toggle('show');
    }
    if (!modal.classList.contains('show')) {
        body.style.overflow = 'auto';
     }
});

$(document).on("click",".placename",function(){
	
	
	var placename = $(this).text();
	$('#sample5_address').val(placename);
	const modal = document.querySelector('.modal');
	const body = document.querySelector('body');
	modal.classList.toggle('show');
	 body.style.overflow = 'auto';
	
})

$(document).ready(function() {

	//datepicker event 
	$('#startday').on('click', function(){
		 $("#startday").datepicker({
             dateFormat: "yy-mm-dd"
           	 , showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
             , dayNamesMin: ['일', '월', '화', '수', '목', '금', '토']
             , monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
             , changeYear: true //option값 년 선택 가능
             , changeMonth: true //option값  월 선택 가능 
             , monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
			 , maxDate : 0
         	 , onSelect: function (date) {
     			var endDate = $('#endday');
    			var startDate = $(this).datepicker('getDate');
    			var minDate = $(this).datepicker('getDate');
    			endDate.datepicker('setDate', minDate);
    			startDate.setDate(startDate.getDate());
    			endDate.datepicker('option', 'maxDate', new Date());
    			endDate.datepicker('option', 'minDate', minDate);
    		}            	
		 })
         $('#endday').datepicker({
        	 dateFormat: "yy-mm-dd"
        	 , showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
             , dayNamesMin: ['일', '월', '화', '수', '목', '금', '토']
             , monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
         	 , changeYear: true //option값 년 선택 가능
             , changeMonth: true //option값  월 선택 가능 
             , monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
         	 , maxDate : 0
         	 
         })
	})
	
	
	//카테고리 클릭 event
	$('.one').on('click', function(){
		$('span.change-color').removeClass('change-color');
		$(this).children('span').addClass('change-color');
	})
	
	//평점 글자수 event
	$('.grade1, .grade2').on('keyup', function() {
	    if (/\D/.test(this.value)) {
	        this.value = this.value.replace(/\D/g, '')
	    }
	  if (this.value > 5) {
	      this.value = 5;
	      alert('5까지만 가능합니다.');
	  }
	});
	
	//가격 글자수 event
	$('.price1, .price2').on('keyup', function() {
	    if (/\D/.test(this.value)) {
	        this.value = this.value.replace(/\D/g, '')
	    }
	});
	
	
	//왼쪽바 조회 버튼 클릭시 ajax 전송 =>
	$('#submit').on('click', function(){
		
		var startDay = $('#startday').val();
		var endDay = $('#endday').val();
		var placeArea = $('#sample5_address').val();
		var placeKategorie = $('.change-color').text().trim();
		var minPrice = $('.price1').val();
		var maxPrice = $('.price2').val();
		var minGrade= $('.grade1').val();
		var maxGrade= $('.grade2').val();
		
		//유효성 검사
		//최소가격 > 최대가격일시 false
		if ( +minPrice > +maxPrice) {
			alert("최소가격이 최대가격보다 큽니다.");
			$('.pirce1').focus();
			return false;
		}
		//최소별점 > 최대별점일시 false
		if( +minGrade > +maxGrade) {
			alert("최소별점이 최대별점보다 큽니다.");
			$('.grade1').focus();
			return false;
		}
		//ajax 전송
		$.ajax({
			type : "GET"
			, url : "/main/places/bad-find"
			, data : {
				startDay,
				endDay,
				placeArea,
				placeKategorie,
				minPrice,
				maxPrice,
				minGrade,
				maxGrade,
			}
			, success : function(result) {
				
				
				$('.post').remove();
				//카테고리에 해당되는 리스트들
				var categorie = result.CategorieList
				var image = result.ImageList
				for( var i =0; i< categorie.length; i ++) {
					
					//날짜 자르기
					var date = categorie[i].placeCreatedAt.substr(0, 10);
					//별점 div 생성
					var $divGrade = $('<div class="star d-flex"/>')
					//별점 div 내부 이미지 추가 
					for(var j =0; j< categorie[i].placeGrade; j++) {
						$divGrade.append('<img src="/static/img/star.png" width="30px" height="30px">');
					}
					//이미지 생성
					var $img = $('<img src="' + image[i].imagePath + '" class="post-image"' + '">')
					//이미지 감싸는 a태그 생성
					var $href = $('<a href="/main/places/good-detail?placeId=' + image[i].id + '">')
					//a태그에 이미지 추가
					var $hrefValue = $href.append($img)
					//카테고리 span 생성
					var $spanValue = $('<span />').text(categorie[i].placeKategorie)
					//카테고리 div 생성 및 span 추가
					var $divCategory = $('<div class="categorie" />').append($spanValue)
					//장소 div 생성 및 text 추가
					var $divPlace = $('<div class="place" />').text(categorie[i].placeArea)
					//날짜 div 생성 및 text 추가
					var $divDate = $('<div class="date" />').text(date)
					//카테고리 포괄 info div 생성 및 내용추가
					var $divInfo = $('<div class="info" />').append($divCategory).append($divGrade).append($divPlace).append($divDate)
					//제목 span 생성 및 text 추가
					var $subject = $('<span class="placesubject" />').text(categorie[i].placeSubject)
					var $divInfo2 = $('<div class="info" />').append($subject)
					//post div 생성 및 info추가
					var $divPost = $('<div class="post" />').append($divInfo).append($hrefValue).append($divInfo2)
					//최종 wrapper 클래스에 post추가 - 반복문 진행.
					$('.wrapper').append($divPost)
				}
				
			}
			,error : function(e) {
				alert("에러입니다. 관리자에게 문의하세요");
			}
		})
	}) //ajax 닫기
})//document ready 닫기
</script>
</html>