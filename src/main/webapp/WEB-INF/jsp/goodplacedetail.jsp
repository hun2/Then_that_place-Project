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
<link href="/static/css/goodplacewrite.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="shortcut icon" href="/static/favicon.ico" type="image/x-icon">
</head>
<body>
	<!--상단 고정바 시작  -->
	 <div id="top_wrap">
		<div id="wrap_logo">
			<a class="mainLogo" href="/main"> <span> 그때그곳</span>
			</a>
		</div>
		<nav id="wrap_topCate" class=""
			style="position: static; top: initial;">
			<ul class="inner">
				<li><a href="/main"> <span class="on">메인</span></a></li>
				<li><a href="/main/daily"> <span class="on">일상 </span>
				</a></li>
				<li><a href="/main/places/good"> <span class="on black">죽어서도
							기억해야 할 맛집</span></a></li>

				<li><a href="/main/places/bad"> <span class="on">죽어서도
							기억해야 할 노맛집</span></a></li>
			</ul>
		</nav>
		<nav id="wrap_util">
			<ul class="inner">
				<li class="profile-card">
					<div class="profile-pic">
						<img src="${empty sessionScope.loginUser.userProfilePhoto ?  '/static/img/no.png' : sessionScope.loginUser.userProfilePhoto }">
					</div>
					<div class="profile-name">
						<p class="username">${sessionScope.loginUser.userNickName}님
							반갑습니다!</p>
					</div>
				</li>
				<li><a class="link_util link_login" href="/mypage">마이페이지</a></li>
				<li><a class="link_util link_login" href="/logout">로그아웃</a></li>
				<li><a class="btn_search" href="/search"> <span class="ico_search"><img src=""></span></a></li>
			</ul>
		</nav>
	</div>
	<!--상단 고정바 끝  -->

	<!--중간 바디영역 시작 -->
	<div class="bodycontent">
		<span class="col-6">죽어서도 기억해야 할 맛집!</span>
	</div>
	<!--중간 바디영역 끝  -->
	<!-- 중간 글쓰기 영역 시작 -->
	<div class="bodycontent2">
		<div class="bodycontent2wrapper">
			<div class="d-flex justify-content-between">
				<h2>글쓰기</h2>
				<select id="category" class="form-control form-select col-3">
					<c:forEach items="한식,중식,일식,양식,카페" var="item">
						<option <c:if test="${place.placeKategorie eq item}"> selected </c:if>> ${item} </option>
					</c:forEach>
				</select>
			</div>
			<div class="title">제목</div>
			<input type="text" class="bodycontent2input" placeholder="제목을 입력하세요" value="${place.placeSubject}">
			<div class="title">내용</div>
			<textarea rows="5" cols="68" class="placeContent">${place.placeContent}</textarea>
			<div class="title">파일첨부</div>
			<div class="fileadd mt-3">
				<div id="att_zone">
					<c:forEach items="${imageList}" var="image">
						<div style="display:inline-block;position:relative;width:210px;height:200px;margin:5px;border: none;" >
							<img style="width:100%;height:100%;z-index:none" src="${image.imagePath}">
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="title">별점</div>
			<input type="hidden" class="hiddenplaceGrade" value="${place.placeGrade}">
			<div class="rating">
				<!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
				<input type="checkbox" name="rating" id="rating1" value="1"
					class="rate_radio" title="1점"> <label for="rating1"></label>
				<input type="checkbox" name="rating" id="rating2" value="2"
					class="rate_radio" title="2점"> <label for="rating2"></label>
				<input type="checkbox" name="rating" id="rating3" value="3"
					class="rate_radio" title="3점"> <label for="rating3"></label>
				<input type="checkbox" name="rating" id="rating4" value="4"
					class="rate_radio" title="4점"> <label for="rating4"></label>
				<input type="checkbox" name="rating" id="rating5" value="5"
					class="rate_radio" title="5점"> <label for="rating5"></label>
			</div>
			<div class="pricetitle">
				<span>지출</span>
				<div>
					<span onclick='addRow()'> + </span> 
					<span onclick='deleteRow()'> - </span>
				</div>
			</div>
			<table class="table" id="table-foods">
				<thead>
					<tr>
						<th class="tableleft">사용내역</th>
						<th>지출</th>
					</tr>
				</thead>
				<tbody id="my-tbody">
					<c:forEach items="${foodList}" var="food" varStatus="status">
						<tr class="hide">
							<td class="tableleft"><input type="text" placeholder="메뉴" class="menu" name="menu" value="${food.foodName}"></td>
							<td><input type="number" placeholder="0" class="tablenumber" name="price" value="${food.foodPrice }" onchange="sumRow()"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="total">
				합계 : <span class="totalprice" ></span>
			</div>
			<div class="place">
				<div>장소</div>
				<input type="text" class="placeinput" placeholder="장소를 입력하세요" value="${place.placeArea }">
			</div>
			
			
			<!--카카오맵 열기-->
			<div class="map">
				<div class="map_wrap">
    				<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

				    <div id="menu_wrap" class="bg_white">	
				        <div class="option">
				            <div>
				                <form onsubmit="searchPlaces(); return false;">
				                    키워드 : <input type="text" value="${place.placeArea}" id="keyword" size="15"> 
				                    <button type="submit" class="find">검색하기</button> 
				                </form>
				            </div>
				        </div>
				        <hr>
				        <ul id="placesList"></ul>
				        <div id="pagination"></div>
				    </div>
				</div>			
			</div>
			<!--카카오맵 닫기-->
			<div class="d-flex">
				<a class="submit2" href="#" style="background-color: #333; border-color: #333; color: #fff;" id="submit">수정</a>
				<a class="submit3" href="#" style="background-color: #333; border-color: #333; color: #fff;" id="submit" onclick="removePlace()">삭제</a>
			</div>
			<a class="submit4" href="/main/places/good" style="background-color: #333; border-color: #333; color: #fff;" id="submit">메인페이지</a>
		</div>
		<input type="hidden" class="hiddenid" value="${place.id}">
	</div>
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=439e0931464541715aa7fea40206563f&libraries=services"></script>
<script type="text/javascript" src="/static/js/kakao.js"></script>
<script type="text/javascript">
	
	//별점 마킹 모듈 프로토타입으로 생성
	function Rating(){};
	Rating.prototype.rate = 0;
	Rating.prototype.setRate = function(newrate){
	    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
	    this.rate = newrate;
	    let items = document.querySelectorAll('.rate_radio');
	    items.forEach(function(item, idx){
	        if(idx < newrate){
	            item.checked = true;
	        }else{
	            item.checked = false;
	        }
	    });
	}
	//별점 인스턴스 생성
	let rating = new Rating();
	document.addEventListener('DOMContentLoaded', function(){
	    //별점선택 이벤트 리스너
	    document.querySelector('.rating').addEventListener('click',function(e){
	        let elem = e.target;
	       
	        if(elem.classList.contains('rate_radio')){
	            rating.setRate(parseInt(elem.value));
	            let test = rating.rate;
	        }
	        
	    })
	});
	
	//row 추가
	function addRow() {
		
		var trCnt = $('#my-tbody tr').length;
		var MAX_ROW = 5;
		if ( trCnt <= MAX_ROW) {
			
			var innerHtml = "";
			innerHtml += '<tr class="hide" >';
			innerHtml += '<td class="tableleft"><input type="text" placeholder="메뉴" class="menu" name="menu"></td>';
			innerHtml += '<td><input type="number" placeholder="0" class="tablenumber" name="price" onchange="sumRow()"></td>';
			innerHtml += '</tr>';
			$('#my-tbody:last').append(innerHtml);
		} else {
			
			alert("최대 5개까지 가능합니다");
			return false;
		}
		
	}
	
	//row 삭제
	function deleteRow() {
		var trCnt = $('#my-tbody tr').length;
		if (trCnt > 1) {
			$('#my-tbody > tr:last').remove();
			sumRow();
		}
		
	}
	//합산
	function sumRow(){
		var sum = 0;
		$('input[name*="price"]').each(function(){
			
			sum += parseInt($(this).val());
		})
		
		$('.totalprice').text(sum);
	}
	
	//삭제버튼 클릭시 AJAX 전송
	function removePlace(){
		if(confirm("정말 삭제하시겠습니까??") == true) {
			
			var id = $('.hiddenid').val();
			$.ajax({
				type : 'DELETE'
				, url : '/main/places/good'
				, data : {'id' : id}
				, success : function(result) {
					if (result.code == '100') {
						location.href='/main/places/good'
					} else {
						alert(result.errorMessage);
						location.reload();
					}
				}
				, error : function(e) {
					alert("에러입니다. 관리자에게 문의하세요");
				}
			})
		} else {
			return false;
		}
	
	}
	//검색결과 이름 클릭시 장소이름 밖으로 빼기
	$(document).on("click",".placename",function(){
		
		var placename = $(this).text();
		$('.placeinput').val(placename);	
	})
	
	
	$(function(){
		//합산
		sumRow();
		//별점점수 가져온 대로 찍어주기
		var grade =  $('.hiddenplaceGrade').val();
		for ( var i = 1; i <= grade; i++) {
			$("input:checkbox[name='rating']:checkbox[value=" + i + "]").prop('checked', true);
		}

				
		//수정버튼 클릭시 AJAX 전송 및 유효성 검사
		$('.submit2').on('click', function(){
				
				//글 ID
				var id = $('.hiddenid').val();
				//글제목 변수
				var placeSubject = $('.bodycontent2input').val().trim();
				//지도주소 변수
				var placeArea =  $('.placeinput').val();
				//총토탈금액 변수
				var placePrice = $('.totalprice').text();
				if (placePrice == "") {
					var placePrice = 0;
				}
				//글내용 변수
				var placeContent = $('.placeContent').val();
				//평점 변수
				var placeGrade = rating.rate;
				//카테고리 변수
				var placeKategorie = $('#category option:selected').val();
				//음식리스트 및 가격 변수
				var foodList = []
				var foods = document.querySelectorAll('#table-foods tbody tr')
				for(var i = 0; i < foods.length; i++) {
				    var foodName = foods[i].querySelector('input[name="menu"]').value
				    var foodPrice = foods[i].querySelector('input[name="price"]').value
				    if (foodName.length > 0 && foodPrice.length > 0) {
				        foodList.push({ foodName, foodPrice })
				    }
				}
				
				//formData 추가
				var formData = new FormData();
				//formData 음식리스트 추가
				for (var i =0; i< foodList.length; i++) {
					formData.append("foods["+i+"].foodName", foodList[i].foodName);
					formData.append("foods["+i+"].foodPrice", foodList[i].foodPrice);
				}
				// 글 내용들 추가
				formData.append('id', id);
				formData.append('placeSubject', placeSubject);
				formData.append('placeArea', placeArea);
				formData.append('placePrice', placePrice);
				formData.append('placeContent', placeContent);
				formData.append('placeGrade', placeGrade);
				formData.append('placeKategorie', placeKategorie);
				//ajax 전송
				$.ajax({
					type : 'PUT'
					, url : '/main/places/good'
					, data : formData
					, enctype : "multipart/form-data"
					, processData : false
					, contentType : false
					//요청 후 
					,success : function(result) {
						if (result.code == '100') {
							alert('글수정이 완료 되었습니다');
							location.href='/main/places/good'
							
						} else {
							alert(result.errorMessage);
							location.reload();
						}
					}
					, error : function(e) {
						alert("에러입니다. 관리자에게 문의하세요");
					}
				})  
			})
			
			
			
	})
</script>
</html>