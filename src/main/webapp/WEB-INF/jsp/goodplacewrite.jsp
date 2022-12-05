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
				<li><a href="/main/places/good"> <span class="on">죽어서도
							기억해야 할 맛집</span></a></li>

				<li><a href="/main/places/bad"> <span class="on">죽어서도
							기억해야 할 노맛집</span></a></li>
			</ul>
		</nav>
		<nav id="wrap_util">
			<ul class="inner">
				<li class="profile-card">
					<div class="profile-pic">
						<c:if test="${sessionScope.loginUser.userProfilePhoto == null}">
							<img src="/static/img/no.png">
						</c:if>
						<c:if test="${sessionScope.loginUser.userProfilePhoto != null}">
							<img src="${sessionScope.loginUser.userProfilePhoto}">
						</c:if>
					</div>
					<div class="profile-name">
						<p class="username">${sessionScope.loginUser.userNickName}님
							반갑습니다!</p>
					</div>
				</li>


				<li><a class="link_util link_login" href="/mypage">마이페이지</a></li>
				<li><a class="link_util link_login" href="/logout">로그아웃</a></li>
				<li><a class="btn_search" href="/search"> <span
						class="ico_search"><img src=""></span></a></li>
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
			<h2>글쓰기</h2>
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
					<span onclick='addRow()'> + </span> <span onclick='deleteRow()'>
						- </span>
				</div>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th class="tableleft">사용내역</th>
						<th>지출</th>
					</tr>
				</thead>
				<tbody id="my-tbody">
					<tr class="hide">
						<td class="tableleft"><input type="text" placeholder="메뉴" class="menu"></td>
						<td><input type="number" placeholder="0" class="tablenumber"></td>
					</tr>
					<tr class="hide1">
						<td class="tableleft"><input type="text" placeholder="메뉴" class="menu1"></td>
						<td><input type="number" placeholder="0" class="tablenumber1"></td>
					</tr>
					<tr class="hide2">
						<td class="tableleft"><input type="text" placeholder="메뉴" class="menu2"></td>
						<td><input type="number" placeholder="0" class="tablenumber2"></td>
					</tr>
					<tr class="hide3">
						<td class="tableleft"><input type="text" placeholder="메뉴" class="menu3"></td>
						<td><input type="number" placeholder="0" class="tablenumber3"></td>
					</tr>
					<tr class="hide4">
						<td class="tableleft"><input type="text" placeholder="메뉴" class="menu4"></td>
						<td><input type="number" placeholder="0" class="tablenumber4"></td>
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
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=439e0931464541715aa7fea40206563f&libraries=services"></script>
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
	
	
	
	
	
	
	
	//지출 추가 event
	function addRow() {
		if (!$('.hide1').is(':visible')) {
			 $('.hide1').show();
			 return false;
		}
		if (!$('.hide2').is(':visible')) {
			 $('.hide2').show();
			 return false;
		}
		if (!$('.hide3').is(':visible')) {
			 $('.hide3').show();
			 return false;
		}
		if (!$('.hide4').is(':visible')) {
			 $('.hide4').show();
			 return false;
		}
	}
	
	//지출 마이너스 event
	function deleteRow(){
		if ($('.hide4').is(':visible')) {
			 $('.hide4').hide();
			 return false;
		}
		if ($('.hide3').is(':visible')) {
			 $('.hide3').hide();
			 return false;
		}
		if ($('.hide2').is(':visible')) {
			 $('.hide2').hide();
			 return false;
		}
		if ($('.hide1').is(':visible')) {
			 $('.hide1').hide();
			 return false;
		}
	}
	
	//지출 합산 event
	$('.tablenumber, .tablenumber1, .tablenumber2, .tablenumber3, .tablenumber4').change(function(){
		
		
		var price = $('.tablenumber').val();
		var price1 = $('.tablenumber1').val();
		var price2 = $('.tablenumber2').val();
		var price3 = $('.tablenumber3').val();
		var price4 = $('.tablenumber4').val();
		
		var result = +price + +price1 + +price2 + +price3 + +price4; 
		$('.totalprice').text(result);
		
	})
	
	
	
	
		////////////////////////////////////////////////////////////////////////카카오 map 시작
	
		// 마커를 담을 배열입니다
		var markers = [];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();  

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});

		// 키워드로 장소를 검색합니다
		searchPlaces();

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

		    var keyword = document.getElementById('keyword').value;

		    if (!keyword.replace(/^\s+|\s+$/g, '')) {
		        alert('키워드를 입력해주세요!');
		        return false;
		    }

		    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		    ps.keywordSearch( keyword, placesSearchCB); 
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {

		        // 정상적으로 검색이 완료됐으면
		        // 검색 목록과 마커를 표출합니다
		        displayPlaces(data);

		        // 페이지 번호를 표출합니다
		        displayPagination(pagination);

		    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

		        alert('검색 결과가 존재하지 않습니다.');
		        return;

		    } else if (status === kakao.maps.services.Status.ERROR) {

		        alert('검색 결과 중 오류가 발생했습니다.');
		        return;

		    }
		}
	
		
		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

		    var listEl = document.getElementById('placesList'), 
		    menuEl = document.getElementById('menu_wrap'),
		    fragment = document.createDocumentFragment(), 
		    bounds = new kakao.maps.LatLngBounds(), 
		    listStr = '';
		    
		    // 검색 결과 목록에 추가된 항목들을 제거합니다
		    removeAllChildNods(listEl);

		    // 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
		    
		    for ( var i=0; i<places.length; i++ ) {

		        // 마커를 생성하고 지도에 표시합니다
		        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
		            marker = addMarker(placePosition, i), 
		            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        bounds.extend(placePosition);

		        // 마커와 검색결과 항목에 mouseover 했을때
		        // 해당 장소에 인포윈도우에 장소명을 표시합니다
		        // mouseout 했을 때는 인포윈도우를 닫습니다
		        (function(marker, title) {
		            kakao.maps.event.addListener(marker, 'mouseover', function() {
		                displayInfowindow(marker, title);
		            });

		            kakao.maps.event.addListener(marker, 'mouseout', function() {
		                infowindow.close();
		            });

		            itemEl.onmouseover =  function () {
		                displayInfowindow(marker, title);
		            };

		            itemEl.onmouseout =  function () {
		                infowindow.close();
		            };
		        })(marker, places[i].place_name);

		        fragment.appendChild(itemEl);
		    }

		    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
		    listEl.appendChild(fragment);
		    menuEl.scrollTop = 0;

		    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		    map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

		    var el = document.createElement('li'),
		    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
		                '<div class="info">' +
		                '   <h5 class="placename">' + places.place_name + '</h5>';

		    if (places.road_address_name) {
		        itemStr += '    <span>' + places.road_address_name + '</span>' +
		                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
		    } else {
		        itemStr += '    <span>' +  places.address_name  + '</span>'; 
		    }
		                 
		      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
		                '</div>';           

		    el.innerHTML = itemStr;
		    el.className = 'item';

		    return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
		    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
		        imgOptions =  {
		            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
		            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker = new kakao.maps.Marker({
		            position: position, // 마커의 위치
		            image: markerImage 
		        });

		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

		    return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
		    var paginationEl = document.getElementById('pagination'),
		        fragment = document.createDocumentFragment(),
		        i; 

		    // 기존에 추가된 페이지번호를 삭제합니다
		    while (paginationEl.hasChildNodes()) {
		        paginationEl.removeChild (paginationEl.lastChild);
		    }

		    for (i=1; i<=pagination.last; i++) {
		        var el = document.createElement('a');
		        el.href = "#";
		        el.innerHTML = i;

		        if (i===pagination.current) {
		            el.className = 'on';
		        } else {
		            el.onclick = (function(i) {
		                return function() {
		                    pagination.gotoPage(i);
		                }
		            })(i);
		        }

		        fragment.appendChild(el);
		    }
		    paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
		    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

		    infowindow.setContent(content);
		    infowindow.open(map, marker);
		}

		 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {   
		    while (el.hasChildNodes()) {
		        el.removeChild (el.lastChild);
		    }
		}
		
		
		 
		$(document).on("click",".placename",function(){
			
			var placename = $(this).text();
			$('.placeinput').val(placename);	
		})
		
		////////////////////////////////////////////////////////////////////////카카오 map 닫기
		////////////////////////////////////////////////////////////////////////파일 업로드 시 미리보기 
		
		imageView = function imageView(att_zone, btn){

		    var attZone = document.getElementById(att_zone);
		    var btnAtt = document.getElementById(btn)
		    var sel_files = [];
		    // 이미지와 체크 박스를 감싸고 있는 div 속성
		    var div_style = 'display:inline-block;position:relative;'
		                  + 'width:150px;height:120px;margin:5px;border: none;';
		    // 미리보기 이미지 속성
		    var img_style = 'width:100%;height:100%;z-index:none';
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
		      if (sel_files.length >= 4) {
		    	  alert('사진을 4장 이상 올릴 수 없다 이놈아');
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
				
				var placeSubject = $('.bodycontent2input').val().trim();
				var placeArea =  $('.placeinput').val();
				var placePrice = $('.totalprice').text();
				var placeContent = $('.placeContent').val();
				var placeGrade = rating.rate;
				//메뉴 값
				var menu = $('.menu').val();
				var menu1 = $('.menu1').val();
				var menu2 = $('.menu2').val();
				var menu3 = $('.menu3').val();
				var menu4 = $('.menu4').val();
				
				//메뉴의 가격
				var memuPrice = $('.tablenumber').val();
				var memuPrice1 = $('.tablenumber1').val();
				var memuPrice2 = $('.tablenumber2').val();
				var memuPrice3 = $('.tablenumber3').val();
				var memuPrice4 = $('.tablenumber4').val();
				var foodList = []
				
				foodList.push({'menu' : menu, 'menuPrice' : memuPrice});
				foodList.push({'menu' : menu1, 'menuPrice' : memuPrice1});
				foodList.push({'menu' : menu2, 'menuPrice' : memuPrice2});
				foodList.push({'menu' : menu3, 'menuPrice' : memuPrice3});
				foodList.push({'menu' : menu4, 'menuPrice' : memuPrice4});
				console.log(foodList);
				
				
				var formData = new FormData();
				for (var i = 0; i < sel_files.length; i++) {
					formData.append("file", sel_files[i]);
				}
				
				/* formData.append('placeSubject', placeSubject);
				formData.append('placeArea', placeArea);
				formData.append('placePrice', placePrice);
				formData.append('placeContent', placeContent);
				formData.append('placeGrade', placeGrade);
				formData.append('placeFood', foodList);
				
				$.ajax({
					type : 'POST'
					, url : '/test'
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
				})  */
				 
				
				
				
			})
		
		
		
		
		} ('att_zone', 'btnAtt');
			////////////////////////////////////////////////////////////////////////파일 업로드 시 닫기
			
			
			
		
		
		
</script>

</html>