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

<!--datepicker  -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<!-- 카카오 지도 api -->


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
						<c:if test="${sessionScope.loginUser.userProfilePhoto == null}">
								<img src="/static/img/no.png">
						</c:if>
						<c:if test="${sessionScope.loginUser.userProfilePhoto != null}">
							<img src="${sessionScope.loginUser.userProfilePhoto}">
						</c:if>				
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
		<span class="col-6">죽어서도 기억해야 할 맛집!</span>
		<a class="link_util link_login col-1" href="/main/places/good-write" style="background-color: #333; border-color: #333; color: #fff;" id="write">글쓰기</a>
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
				<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
			</div>
			<div class="sectionbody">
				<span class="subject">카테고리</span> <br>
				<div class="onebody">
					<div class="one mr-3">
						<span>한식</span>
					</div>
					<div class="one mr-3">
						<span>중식</span>
					</div>
					<div class="one mr-3">
						<span>일식</span>
					</div>
					<div class="one mr-3">
						<span>양식</span>
					</div>
					<div class="one mr-3">
						<span>카페</span>
					</div>
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
				<div class="wrappertilte">
					<a href="#"><span>최신순</span></a>
					<a href="#"><span class="ml-2">오래된순</span></a>
					
				</div>
				<c:forEach begin="1" end="3">
					<div class="post">
						<div class="info"> 
							<span>여기는 바디영역 게시글의 상단바</span>
							<span>2022-11-09</span>
						</div>
						<img src="/static/img/food2.png" class="post-image">
					</div>
				</c:forEach>
			
			</div>
		</div>
	</div>
	<!--중간바디-2 영역 끝 -->
	
	
	
	
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=439e0931464541715aa7fea40206563f&libraries=services"></script>
<script type="text/javascript">
	

    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
            }
        }).open();
    }




	$(document).ready(function() {
	
		//datepicker event 
		$('#startday').on('click', function(){
			 $("#startday").datepicker({
                 dateFormat: "yy-mm-dd"
               	 ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
                 , dayNamesMin: ['일', '월', '화', '수', '목', '금', '토']
                 , monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
                 ,changeYear: true //option값 년 선택 가능
                 ,changeMonth: true //option값  월 선택 가능 
                 ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
				 ,	 maxDate : 0
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
            	 ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
                 , dayNamesMin: ['일', '월', '화', '수', '목', '금', '토']
                 , monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
             	 , changeYear: true //option값 년 선택 가능
                 , changeMonth: true //option값  월 선택 가능 
                 , monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
             	 , maxDate : 0
             	 ,
             })
		})
		
		
		//카테고리 클릭 event
		$('.one').on('click', function(){
			const get = $(this).get();
			$(this).children('span').first().css('color', 'red')
			$('.one').not(get).find('span:nth-child(1)').css('color', 'white')
		})
		
		//평점 글자수 event
		$('.grade1, .grade2').on('keyup', function() {
		    if (/\D/.test(this.value)) {
		        this.value = this.value.replace(/\D/g, '')
		        alert('숫자만 입력가능합니다.');
		    }
		  if (this.value > 5) {
		      this.value = 5;
		      alert('5까지만 가능합니다.');
		  }
		});
		
		//평점 글자수 event
		$('.price1, .price2').on('keyup', function() {
		    if (/\D/.test(this.value)) {
		        this.value = this.value.replace(/\D/g, '')
		        alert('숫자만 입력가능합니다.');
		    }
		});
		
		
		
		
	})	




</script>
</html>