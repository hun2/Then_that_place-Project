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
<link href="/static/css/dailywrite.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="shortcut icon" href="/static/favicon.ico" type="image/x-icon">
</head>
<body>
	<!--상단 고정바 시작  -->
	<div id="top_wrap">
		<div id="wrap_logo">
			<a class="mainLogo" href="/main"> <span> 그때그곳</span>
			</a>
		</div>
		<nav id="wrap_topCate" style="position: static; top: initial;">
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
		<span class="col-6">일상</span>
	</div>
	<!--중간 바디영역 끝  -->
	<!-- 중간 글쓰기 영역 시작 -->
	<div class="bodycontent2">
		<div class="bodycontent2wrapper">
			<div class="d-flex justify-content-between">
			<h2>글쓰기</h2>
			</div>
			<input type="hidden" class="hiddenid" value="${dailyList.id}">
			<div class="title">제목</div>
			<input type="text" class="bodycontent2input" placeholder="제목을 입력하세요" value="${dailyList.dailySubject}">
			<div class="title">내용</div>
			<textarea rows="5" cols="68" class="placeContent">${dailyList.dailyContent}</textarea>
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
			<a class="submit" href="#" style="background-color: #333; border-color: #333; color: #fff;" id="submit">수정</a>
			<a class="submit1" href="/main/daily" style="background-color: #333; border-color: #333; color: #fff;" id="submit">목록</a>
		</div>
	</div>
	<!-- 중간 글쓰기 영역 끝 -->
</body>
<script type="text/javascript">


	
	//수정버튼 클릭시 AJAX 전송 및 유효성 검사
		$('.submit').on('click', function(){
			
			//글 아이디
			var id = $('.hiddenid').val();
			//글제목 변수
			var dailySubject = $('.bodycontent2input').val().trim();
			//글내용 변수
			var dailyContent = $('.placeContent').val();
			
			$.ajax({
				type : 'PUT'
				, url : '/main/daily'
				, data : {id, dailySubject, dailyContent}
				//요청 후 
				,success : function(result) {
					if (result.code == '100') {
						alert('글 수정이 완료 되었습니다');
						location.href='/main/daily'
						
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

</script>
</html>