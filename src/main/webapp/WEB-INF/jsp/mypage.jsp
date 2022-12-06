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
<link href="/static/css/mypage.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="shortcut icon" href="/static/favicon.ico" type="image/x-icon">
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
	<!-- 중간 바디 시작-->
	<section class="section">
		<header class="profileheader">
			<div class="profileleft">
				<div class="profile-pic">
					<img src="${empty sessionScope.loginUser.userProfilePhoto ?  '/static/img/no.png' : sessionScope.loginUser.userProfilePhoto }">
				</div>
			</div>
			<div class="profileright">
				<div class="profilename">
					${sessionScope.loginUser.userId} <img src="/static/img/set.png" class="icon2"
						width="17px" height="17px">
				</div>
				<div class="profilecontent">
					<div class="profilecontentname">게시글</div>
					<span class="profilecontentcount"> ${num} </span>
					<div class="profilecontentname">팔로우</div>
					<span class="profilecontentcount"> 9 </span>
					<div class="profilecontentname">팔로워</div>
					<span class="profilecontentcount"> 8 </span>
				</div>
				<div class="profilenickname">
					<div>테스트</div>
				</div>
			</div>
		</header>
		<aside class="bodycontent">
			<ul class="bodytitle d-flex justify-content-center">
				<li class="menu daily black">일상</li>
				<li class="menu goodplace">맛집</li>
				<li class="menu badplace">노맛집</li>
			</ul>
			<div class="bodycontainer">
				<c:forEach items="${dailyCardViewList}" var="cardView">
					<div class="item">
						<img src="${empty cardView.dailyImage[0].imagePath ? '/static/img/no.png' : cardView.dailyImage[0].imagePath}" class="bodyimg" data-id="${cardView.daily.id}">
					</div>
				</c:forEach>
			</div>
		</aside>
	</section>
	
	
	<div class="modal3">
		<div class="modal3_body">
			<div class="modal3_left">
				<img src="/static/img/kim.jpg" class="modal3_leftimg">			
			</div>
			<div class="modal3_right">
				<div class="info">
					<div class="user">
							<div class="profile-pic">
								<img src="${empty sessionScope.loginUser.userProfilePhoto ?  '/static/img/no.png' : sessionScope.loginUser.userProfilePhoto }">
							</div>
							<span class="username">${sessionScope.loginUser.userId}</span>
					</div>
					<img src="/static/img/option.png" class="option">
					<div class="dropdown-submenu2">
								<a href="/main/daily-detail?dailyId=${cardView.daily.id}" class="dropdown-modify"> 수정</a> 
								<a href="#none" class="dropdown-delete" id="${cardView.daily.id}"> 삭제</a>
					</div>
				</div>
				<div class="post-content">
					<div class="info2">
						<p class="likes">10 likes</p>
						<div class="description">
							<span class="content">게시글의 content 내용 가져와야함</span>
						</div>
					</div>
					<div class="sample">
					
					
					</div>
				</div>
				<div class="post-content-comment">
					<input type="text" placeholder="댓글달기.." class="content-commnet">
					<a class="push" data-board-id="${List.board.boardId}">추가</a>
				</div>
			</div>
		</div>
	</div>
	
	
	
</body>
<script type="text/javascript">
	
	const body = document.querySelector('body');
	const modal3 = document.querySelector('.modal3');
	modal3.addEventListener('click', (event) => {
	    if (event.target === modal3) {
	      modal3.classList.toggle('show');
	    }
	    if (!modal3.classList.contains('show')) {
	        body.style.overflow = 'auto';
	     }
	});
	
	
	$(function(){
		
		//메뉴탭 클릭시 글씨색 변경 event
		$('.menu').on('click', function(){
			$('li.black').removeClass('black');
			$(this).addClass('black');
		})
		
		
		//맛집 클릭 시 리스트 event
		$('.goodplace').on('click', function(){
			$.ajax({
				type : "GET"
				, url : "/mypage/goodplace"
				, success : function(result) {
					
					$('.item').remove();
					var goodPlaceList = result.goodPlaceList
					for(var i =0; i< goodPlaceList.length; i++) {
						//이미지 생성
						if(goodPlaceList[i].placeImage[0] == null) {
							var $img = $('<img src="/static/img/no.png" class="bodyimg" data-id=' + goodPlaceList[i].place.id + '>')
						} else {
							var $img = $('<img src="' + goodPlaceList[i].placeImage[0].imagePath + '" class="bodyimg" data-id=' + goodPlaceList[i].place.id + '>')
						}
						//이미지 div 생성
						var $div = $('<div class="item" />').append($img)
						//이미지 div 추가
						$('.bodycontainer').append($div);
					}
				}
				, error : function(e) {
					alert("에러입니다. 관리자에게 문의하세요");
				}
			})
		}) //맛집 클릭 시 리스트 event 닫기
		
		//노맛집 클릭시 리스트 event
		$('.badplace').on('click', function(){
			$.ajax({
				type : "GET"
				, url : "/mypage/badplace"
				, success : function(result) {
					
					$('.item').remove();
					var badPlaceList = result.badPlaceList
					for(var i =0; i< badPlaceList.length; i++) {
						console.log();
						//이미지 생성
						if(badPlaceList[i].placeImage[0] == null) {
							var $img = $('<img src="/static/img/no.png" class="bodyimg" data-id=' + badPlaceList[i].place.id + '>')
						} else {
							var $img = $('<img src="' + badPlaceList[i].placeImage[0].imagePath + '" class="bodyimg" data-id=' + badPlaceList[i].place.id  + '>')
						}
						//이미지 div 생성
						var $div = $('<div class="item" />').append($img)
						//이미지 div 추가
						$('.bodycontainer').append($div)
					}
				}
				,error : function(e) {
					alert("에러입니다. 관리자에게 문의하세요");
				}
			})
		}) // 노맛집 클릭스 리스트 event 닫기
		
		//일상 클릭시 리스트 event
		$('.daily').on('click', function(){
			$.ajax({
				type : "GET"
				, url : "/mypage/daily"
				, success : function(result) {
					
					$('.item').remove();
					var dailyCardViewList = result.dailyCardViewList
					for(var i =0; i< dailyCardViewList.length; i++) {
						//이미지 생성
						if(dailyCardViewList[i].dailyImage[0] == null) {
							var $img = $('<img src="/static/img/no.png" class="bodyimg" data-id=' + dailyCardViewList[i].daily.id + '>')
						} else {
							var $img = $('<img src="' + dailyCardViewList[i].dailyImage[0].imagePath + '" class="bodyimg" data-id=' + dailyCardViewList[i].daily.id + '>')
						} 
						//이미지 div 생성
						var $div = $('<div class="item" />').append($img)
						//이미지 div 추가
						$('.bodycontainer').append($div);
					}
				}
				,error : function(e) {
					alert("에러입니다. 관리자에게 문의하세요");
				}
			})
		}) //일상 클릭 리스트 event 닫기
		
		//게시글 클릭 event
		$(document).on("click",".bodyimg",function(){ 
			var id = $(this).data('id');
			var black = $('.black').text();
			modal3.classList.toggle('show');
			if (modal3.classList.contains('show')) {
				body.style.overflow = "hidden";
			}
			
			if ( black == '일상') {
				
				//ajax 실행
				$.ajax({
					type : "GET"
					,url : "/mypage/dailycheck"
					, data : {"dailyId" : id}
					, success : function(result) {
						
						$('.sample').children().remove();
						var daily = result.daily;
						var dailyImage = result.dailyImage;
						var likeCount = result.likeCount;
						var commentList = result.comment;
						
						//사진변경
						$('.modal3_leftimg').attr('src', dailyImage == '' ? '/static/img/no.png' : dailyImage[0].imagePath); 
						//좋아요갯수 변경
						$('.likes').text(likeCount + ' likes');
						//글 내용
						$('.content').text(daily.dailyContent);
						
						//댓글 리스트
						$.each(commentList, function(index, value){
							$('.sample').append($( "<div>" + "<span class='spanid'>" + value.userId + "</span>"+ "<span>" + value.comment + "</span>" + "</div>"))
						})
					}
					, error : function(e) {
						alert("에러입니다. 관리자에게 문의하세요");
					}
				})
				
			} else if (black == '맛집') {
				
				//ajax 실행
				$.ajax({
					type : "GET"
					,url : "/mypage/goodplacecheck"
					, data : {"placeId" : id}
					, success : function(result) {
						$('.info2').children().remove();
						var place = result.place
						var placeImage = result.placeImage
						
						console.log(place);
						//사진변경
						$('.modal3_leftimg').attr('src', placeImage == '' ? '/static/img/no.png' : placeImage[0].imagePath);
						
					}
					,error : function(e) {
						
					}
				})
				
				
				
			}
			
			
		})
	})
</script>
</html>