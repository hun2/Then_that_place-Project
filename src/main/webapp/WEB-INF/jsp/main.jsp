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
<link href="/static/css/main.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="shortcut icon" href="/static/favicon.ico" type="image/x-icon">
</head>
<body>
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
					 <a class="link_util link_login" href="https://kauth.kakao.com/oauth/logout?client_id=e56521988fe16e2c16007460891b5a7f&logout_redirect_uri=http://localhost:8080/logout">로그아웃</a>
				</li>
				<li><a class="btn_search" href="/search">
					<span class="ico_search"><img src=""></span></a>
				</li>
			</ul>
		</nav>
	</div>
	<div id="body1">
		<img src="/static/img/main1.jpg" class="body1img">
	</div>
	
	
	<div id="body2">
		<div class="body2content">
			<span>일상</span>
			<div id="bodycontainer">
				<c:forEach items="${dailyList}" var="daily">
					<div class="item">
						<div class="date">
							<fmt:formatDate value="${daily.daily.dailyCreatedAt}" pattern="yyyy-MM-dd" />
						</div>
							<a href="/main/daily-detail?dailyId=${daily.daily.id}"><img src="${empty daily.dailyImage[0].imagePath ? '/static/img/no.png' : daily.dailyImage[0].imagePath  }" class="bodyimg"> </a>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="body2content">
			<span>죽어서도 기억해야 할 맛집</span>
			<div id="bodycontainer">
				<c:forEach items="${goodPlaceList}" var="goodPlace">
					<div class="item">
						<div class="date">
								<fmt:formatDate value="${goodPlace.place.placeCreatedAt}" pattern="yyyy-MM-dd" />
						</div>
						<a href="/main/places/good-detail?placeId=${goodPlace.place.id}"><img src="${empty goodPlace.placeImage[0].imagePath ? '/static/img/no.png' : goodPlace.placeImage[0].imagePath }" class="bodyimg"> </a>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="body2content">
			<span>죽어서도 기억해야 할 노맛집</span>
			<div id="bodycontainer">
				<c:forEach items="${badPlaceList}" var="badPlace">
					<div class="item">
						<div class="date">
							<fmt:formatDate value="${badPlace.place.placeCreatedAt}" pattern="yyyy-MM-dd" />
						</div>
						<a href="/main/places/bad-detail?placeId=${badPlace.place.id}"><img src="${empty badPlace.placeImage[0].imagePath ? '/static/img/no.png' : goodPlace.placeImage[0].imagePath }" class="bodyimg"> </a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	
	<div class="footer">
		<p class="footertext">
			㈜ 그때그곳컴퍼니 <br>
			서울특별시 중구 마른내로 34 KT&G 을지로타워 14F <br>
			대표이사: 김기훈 <br>
			사업자 등록번호: 123-45-12312 <br>
			통신판매업 신고번호: 2022-서울중구-01234 <br>
			고객센터: 02-222-3333 <br><br>
			© 2022 thenThatPlace Co., Ltd. All rights reserved.
		</p>
	</div>
	
</body>


<script type="text/javascript">
	




</script>
</html>