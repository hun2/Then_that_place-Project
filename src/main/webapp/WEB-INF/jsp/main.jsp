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
					<a class="link_util link_login" href="/logout">마이페이지</a>
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
	<div id="body1">
		<img src="/static/img/main.png" width="500px" height="500px">
		<div class="body1content">
			<h2> 가슴깊이 </h2> 
			<h2>끓어오르는 맛</h2>
			<h2> 그때그곳 </h2>
		</div>
	</div>
	
	
	<div id="body2">
		<div class="body2content">
			<span>일상</span>
			<div id="bodycontainer">
				<c:forEach begin="1" end="3">
					<div class="item">
						<img src="/static/img/kim.jpg" class="bodyimg">
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="body2content">
			<span>죽어서도 기억해야 할 맛집</span>
			<div id="bodycontainer">
				<c:forEach begin="1" end="3">
					<div class="item">
						<img src="/static/img/food1.png" class="bodyimg">
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="body2content">
			<span>죽어서도 기억해야 할 노맛집</span>
			<div id="bodycontainer">
				<c:forEach begin="1" end="3">
					<div class="item">
						<img src="/static/img/food2.png" class="bodyimg">
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