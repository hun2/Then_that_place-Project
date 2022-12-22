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


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="/static/css/goodplacewrite.css" rel="stylesheet"
	type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
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
				<li>
					<a class="link_util link_login" href="/mypage">마이페이지</a>
				</li>
				<li>
					<a class="link_util link_login" href="/logout">로그아웃</a>
				</li>
				<li>
					<a class="btn_search" href="/search"> <span class="ico_search"><img src=""></span></a>
				</li>
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
				<option selected>한식</option>
				<option>중식</option>
				<option>일식</option>
				<option>양식</option>
				<option>카페</option>
			</select>
			</div>
			<div class="title">제목</div>
			<input type="text" class="bodycontent2input" placeholder="제목을 입력하세요">
			<div class="title">내용</div>
			<textarea rows="5" cols="68" class="placeContent"></textarea>
			<div class="title">파일첨부</div>
			<div class="fileadd mt-3">
				<input type="file" multiple="multiple" accept=".gif, .jpg, .png, .jpeg" id="btnAtt"> 
				<div id="att_zone">
				</div>
			</div>
			<div class="title">별점</div>
			<div class="rating">
				<!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
				<input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점"> <label for="rating1"></label>
				<input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점"> <label for="rating2"></label>
				<input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점"> <label for="rating3"></label>
				<input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점"> <label for="rating4"></label>
				<input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점"> <label for="rating5"></label>
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
					<tr class="hide">
						<td class="tableleft"><input type="text" placeholder="메뉴" class="menu" name="menu"></td>
						<td><input type="number" placeholder="0" class="tablenumber" name="price" onchange="sumRow()"></td>
					</tr>
				</tbody>
			</table>
			<div class="total">
				합계 : <span class="totalprice"></span>
			</div>
			<div class="place">
				<div>장소</div>
				<input type="text" class="placeinput" placeholder="장소를 입력하세요">
			</div>
			
			<div class="map">
				<div class="map_wrap">
    				<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				    <div id="menu_wrap" class="bg_white">	
				        <div class="option">
				            <div>
				                <form onsubmit="searchPlaces(); return false;">
				                    키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
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
			<a class="submit" href="#" style="background-color: #333; border-color: #333; color: #fff;" id="submit">등록</a>
		</div>
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
	let rating = new Rating();//별점 인스턴스 생성
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
			innerHtml += '<tr class="hide">';
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
		
	//카카오맵 이름 클릭시 장소입력	 
	$(document).on("click",".placename",function(){
			
		var placename = $(this).text();
		$('.placeinput').val(placename);	
	})
		
//////////////////////////////////////////////////////////////////////////////////파일 업로드 시 미리보기 
	imageView = function imageView(att_zone, btn){
		   var attZone = document.getElementById(att_zone);
		   var btnAtt = document.getElementById(btn)
		    var sel_files = [];
		    // 이미지와 체크 박스를 감싸고 있는 div 속성
		    var div_style = 'display:inline-block;position:relative;'
		                  + 'width:150px;height:120px;margin:5px;border: none;';
		    // 미리보기 이미지 속성
		    var img_style = 'width:100%;height:100%;z-index:none;object-fit:contain';
		    // 이미지안에 표시되는 체크박스의 속성
		    var chk_style = 'width:20px;height:20px;position:absolute;font-size:24px;'
		                  + 'right:0px;bottom:0px;z-index:999;background:transparent;border:none;padding:0;line-height:20px;color:red;';
		    btnAtt.onchange = function(e){
		      var files = e.target.files;
		      var fileArr = Array.prototype.slice.call(files)
		      for(f of fileArr){
		        imageLoader(f);
		      }
		    }  
		    
		    /*첨부된 이미리즐을 배열에 넣고 미리보기 */
		    imageLoader = function(file){
		      sel_files.push(file);
		      console.log(sel_files);
		      if (sel_files.length > 3) {
		    	  alert('사진은 4장 이상 업로드 불가합니다.');
		    	  return false;
		      }
		      var reader = new FileReader();
		      reader.onload = function(ee){
		        let img = document.createElement('img')
		        img.setAttribute('style', img_style)
		        img.src = ee.target.result;
		        attZone.appendChild(makeDiv(img, file));
		      }
		      reader.readAsDataURL(file);
		    }
		    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
		    makeDiv = function(img, file){
		      var div = document.createElement('div')
		      div.setAttribute('style', div_style)
		      
		      var btn = document.createElement('input')
		      btn.setAttribute('type', 'button')
		      btn.setAttribute('value', 'x')
		      btn.setAttribute('delFile', file.name);
		      btn.setAttribute('style', chk_style);
		      btn.onclick = function(ev){
		        var ele = ev.srcElement;
		        var delFile = ele.getAttribute('delFile');
		        for(var i=0 ;i<sel_files.length; i++){
		          if(delFile== sel_files[i].name){
		            sel_files.splice(i, 1);      
		          }
		        }
		        
		        dt = new DataTransfer();
		        for(f in sel_files) {
		          var file = sel_files[f];
		          dt.items.add(file);
		        }
		        btnAtt.files = dt.files;
		        var p = ele.parentNode;
		        attZone.removeChild(p)
		      	}
			    div.appendChild(img)
			    div.appendChild(btn)
			     return div
			    }
		//등록버튼 클릭시 AJAX 전송 및 유효성 검사
			$('.submit').on('click', function(){
				
				
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
				//formData 파일추가
				for (var i = 0; i < sel_files.length; i++) {
					formData.append("file", sel_files[i]);
				}
				//formData 음식리스트 추가
				for (var i =0; i< foodList.length; i++) {
					formData.append("foods["+i+"].foodName", foodList[i].foodName);
					formData.append("foods["+i+"].foodPrice", foodList[i].foodPrice);
				}
				// 글 내용들 추가
				formData.append('placeSubject', placeSubject);
				formData.append('placeArea', placeArea);
				formData.append('placePrice', placePrice);
				formData.append('placeContent', placeContent);
				formData.append('placeGrade', placeGrade);
				formData.append('placeKategorie', placeKategorie);
				
				$.ajax({
					type : 'POST'
					, url : '/main/places/good'
					, data : formData
					, enctype : "multipart/form-data"
					, processData : false
					, contentType : false
					//요청 후 
					,success : function(result) {
						if (result.code == '100') {
							alert('글등록이 완료 되었습니다');
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
		} ('att_zone', 'btnAtt');
			////////////////////////////////////////////////////////////////////////파일 업로드 시 닫기
</script>
</html>