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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
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
					<a class="link_util link_login blackborder" href="/mypage">마이페이지</a>
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
					<span class="userId">${sessionScope.loginUser.userId} </span>
					<a href="/account/edit">
						<img src="/static/img/set.png" class="icon2" width="17px" height="17px">
					</a>
				</div>
				<div class="profilecontent">
					<div class="profilecontentname">게시글</div>
					<span class="profilecontentcount"> ${num} </span>
					<div class="profilecontentname">팔로워</div>
					<span class="follow profilecontentcount"> ${FollowedCount}</span>
					<div class="profilecontentname">팔로우</div>
					<span class="followed profilecontentcount"> ${FollowCount} </span>
				</div>
				<div class="profilenickname">
					<div>${sessionScope.loginUser.userNickName }</div>
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
				<!-- 클래스명은 변경하면 안 됨 -->
				<div class="swiper-container">
					<div class="swiper-wrapper">
					</div>
					<!-- 네비게이션 버튼 -->
					<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
					<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
					<!-- 페이징 -->
					<div class="swiper-pagination"></div>
				</div>
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
	
	
	
	<div class="modal4">
		<div class="modal4_body">
			<div class="followertitle">
				팔로우
			</div>
			<c:forEach items="${FollowList}" var="follow">
				<div class="user">
					<div class="userfollow">
						<div class="profile-pic">
							<a href="/otherpage?userId=${follow.userId}">
								<img src="${empty follow.userProfilePhoto ?  '/static/img/no.png' : follow.userProfilePhoto}">
							</a>
						</div>
						<p class="followusername">
							<a href="/otherpage?userId=${follow.userId}">${follow.userId}</a>
						</p> 
					</div>
					<div>
						<input type="text" value="삭제" class="deletefollow" data-id="${follow.userId}"> 
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div class="modal5">
		<div class="modal5_body">
			<div class="followertitle">
				팔로워
			</div>
			<c:forEach items="${FollowedList}" var="followed">
				<div class="user">
					<div class="userfollow">
						<div class="profile-pic">
							<a href="/otherpage?userId=${followed.userId}">
								<img src="${empty followed.userProfilePhoto ?  '/static/img/no.png' : followed.userProfilePhoto}">
							</a>
						</div>
						<p class="followusername">
							<a href="/otherpage?userId=${followed.userId}">${followed.userId}</a>
						</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
</body>
<script type="text/javascript">
	
	const body = document.querySelector('body');
	const modal3 = document.querySelector('.modal3');
	const modal4 = document.querySelector('.modal4');
	const modal5 = document.querySelector('.modal5');
	
	modal3.addEventListener('click', (event) => {
	    if (event.target === modal3) {
	      modal3.classList.toggle('show');
	    }
	    if (!modal3.classList.contains('show')) {
	        body.style.overflow = 'auto';
	     }
	});
	
	modal4.addEventListener('click', (event) => {
	    if (event.target === modal4) {
	      modal4.classList.toggle('show');
	    }
	    if (!modal4.classList.contains('show')) {
	        body.style.overflow = 'auto';
	     }
	});
	
	
	modal5.addEventListener('click', (event) => {
	    if (event.target === modal5) {
	      modal5.classList.toggle('show');
	    }
	    if (!modal5.classList.contains('show')) {
	        body.style.overflow = 'auto';
	     }
	});
	
	
	
	var swiper = new Swiper('.swiper-container', {
		
		// ★동적로딩 설정
		lazy : {
			loadPrevNext : true // 이전, 다음 이미지는 미리 로딩
		},

		// 페이징 설정
		pagination : {
			el : '.swiper-pagination',
			clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
		},

		// 네비게이션 설정
		navigation : {
			nextEl : '.swiper-button-next', // 다음 버튼 클래스명
			prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
		},
	});
	
	$(function(){
		
		
		window.addEventListener('scroll', Scroll);
		
		
		var isDuplicate = true;
		var page = '1'
		var dailyfunction = function(result) {
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
			page ++;
		}
		var goodfunction = function(result) {
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
			page ++;
		}
		var badfunction = function(result) {
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
			page ++;
		}
		
		
		function Scroll(){
			const currentScroll = window.scrollY;
			const windowHeight = window.innerHeight;
			const bodyHeight = document.body.clientHeight;
			const paddingBottom = 200;
			var black = $('.black').text();
			var url = null;
			var checkMenu = null
			if ( currentScroll + windowHeight + paddingBottom >= bodyHeight ) {
				if(isDuplicate) {
					isDuplicate = false;
					if(black == '일상') {
						url = "/mypage/daily"
							checkMenu = dailyfunction
					} else if ( black == '맛집') {
						url ="/mypage/goodplace"
							checkMenu = goodfunction
					} else if (black =='노맛집') {
						url = "/mypage/badplace"
							checkMenu = badfunction
					}
					$.ajax({
						type : "GET"
						,url : url
						, data : {page}
						, success : function(result) {
							checkMenu(result)
							console.log(page)
							isDuplicate = true;
						}
						, error : function(e) {
							isDuplicate = true;
							alert('문제');
						}
					})
				}
			}
		}
		
		
		
		//메뉴탭 클릭시 글씨색 변경 event
		$('.menu').on('click', function(){
			$('li.black').removeClass('black');
			$(this).addClass('black');
		})
		
		
		//맛집 클릭 시 리스트 event
		$('.goodplace').on('click', function(){
			page = 1;
			var pagenum = 0;
			$.ajax({
				type : "GET"
				, url : "/mypage/goodplace"
				, data : {"page" : pagenum}
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
			page = 1;
			var pagenum = 0;
			$.ajax({
				type : "GET"
				, url : "/mypage/badplace"
				, data : {"page" : pagenum}
				, success : function(result) {
					
					$('.item').remove();
					var badPlaceList = result.badPlaceList
					for(var i =0; i< badPlaceList.length; i++) {
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
			page = 1;
			var pagenum = 0;
			$.ajax({
				type : "GET"
				, url : "/mypage/daily"
				, data : {"page" : pagenum}
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
						$('.info2').children().remove();
						$('.sample').children().remove();
						$('.swiper-wrapper').children().remove();
						var daily = result.daily;
						var dailyImage = result.dailyImage;
						var likeCount = result.likeCount;
						var commentList = result.comment;
						
						//좋아요갯수 변경
						var $like = $('<p class="likes" />').text(likeCount + ' likes')
						$('.info2').append($like);
						//글 내용
						var $content = $('<span class="content" />').text(daily.dailyContent)
						var $divContent = $('<div class="description" />').append($content)
						$('.info2').append($divContent);
						//댓글 리스트
						$.each(commentList, function(index, value){
							$('.sample').append($( "<div>" + "<span class='spanid'>" + value.userId + "</span>"+ "<span>" + value.comment + "</span>" + "</div>"))
						})
						
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
						$('.sample').children().remove();
						$('.swiper-wrapper').children().remove();
						
						var place = result.place
						var placeImage = result.placeImage
						var date = place.placeCreatedAt.substr(0, 10);
						var commentList = result.comment;
						//이미지 생성
						var $img = $('<img src="/static/img/gps.png" class="gps" width="20px" height="20px">')
						var $area = $('<span class="area" />').text(place.placeArea)
						var $imgarea = $('<div />').append($img).append($area)
						var $day = $('<span class="day" />').text(date)
						var $placeArea = $('<div class="placeArea" />').append($imgarea).append($day)
						var $content = $('<div class="content" />').text(place.placeContent)
						$('.info2').append($placeArea)
						$('.info2').append($content)
						
						//댓글 리스트
						$.each(commentList, function(index, value){
							$('.sample').append($( "<div>" + "<span class='spanid'>" + value.userId + "</span>"+ "<span>" + value.comment + "</span>" + "</div>"))
						})
						
						//이미지가 없으면 다른걸로 대체
						if ( placeImage == "") {
							var $placeimg = $('<img src="/static/img/no.png" class="swiper-lazy">')
							var $swiperslide = $('<div class="swiper-slide" />').append($placeimg)
							$('.swiper-wrapper').append($swiperslide)
						} else {
							//이미지가 있으면 반복문 돌려서 append하기
							for ( var i =0; i<placeImage.length; i++) {
								var $placeimg = $('<img src="' + placeImage[i].imagePath + '" class="swiper-lazy"' + '">')
								var $swiperslide = $('<div class="swiper-slide" />').append($placeimg)
								$('.swiper-wrapper').append($swiperslide)
							} 
						}
						//swiper 업데이트 (동적이라)
						swiper.update();	
					}
					,error : function(e) {
						alert("에러입니다. 관리자에게 문의하세요");
					}
				})
			} /*else 닫기  */
			else if (black == '노맛집') {
				$.ajax({
					type : "GET"
					,url : "/mypage/badplacecheck"
					, data : {"placeId" : id}
					, success : function(result) {
						$('.info2').children().remove();
						$('.sample').children().remove();
						$('.swiper-wrapper').children().remove();
						
						
						var place = result.place
						var placeImage = result.placeImage
						var date = place.placeCreatedAt.substr(0, 10);
						var commentList = result.comment;
						//이미지 생성
						var $img = $('<img src="/static/img/gps.png" class="gps" width="20px" height="20px">')
						var $area = $('<span class="area" />').text(place.placeArea)
						var $imgarea = $('<div />').append($img).append($area)
						var $day = $('<span class="day" />').text(date)
						var $placeArea = $('<div class="placeArea" />').append($imgarea).append($day)
						var $content = $('<div class="content" />').text(place.placeContent)
						$('.info2').append($placeArea)
						$('.info2').append($content)
						
						//댓글 리스트
						$.each(commentList, function(index, value){
							$('.sample').append($( "<div>" + "<span class='spanid'>" + value.userId + "</span>"+ "<span>" + value.comment + "</span>" + "</div>"))
						})
						
						//이미지가 없으면 다른걸로 대체
						if ( placeImage == "") {
							var $placeimg = $('<img src="/static/img/no.png" class="swiper-lazy">')
							var $swiperslide = $('<div class="swiper-slide" />').append($placeimg)
							$('.swiper-wrapper').append($swiperslide)
						} else {
							//이미지가 있으면 반복문 돌려서 append하기
							for ( var i =0; i<placeImage.length; i++) {
								var $placeimg = $('<img src="' + placeImage[i].imagePath + '" class="swiper-lazy"' + '">')
								var $swiperslide = $('<div class="swiper-slide" />').append($placeimg)
								$('.swiper-wrapper').append($swiperslide)
							} 
						}
						//swiper 업데이트 (동적이라)
						swiper.update();
					}
					, error : function(e) {
						alert("에러입니다. 관리자에게 문의하세요");
					}
				})
			}/* else if 노맛집 닫기  */
		}) /*게시글 클릭 event 닫기  */
		
		//팔로워 클릭시 모달창 event
		$('.followed').on('click', function(){
			modal4.classList.toggle('show');
			if (modal4.classList.contains('show')) {
				body.style.overflow = "hidden";
			}
		})
		//팔로우수 클릭시 모달창 event
		$('.follow').on('click', function(){
			modal5.classList.toggle('show');
			if (modal5.classList.contains('show')) {
				body.style.overflow = "hidden";
			}
		})
		
		//팔로우 삭제 클릭시 event
		$('.deletefollow').on('click', function(){
			
			var USERID_FOLLOWED = $(this).data('id');
			var div = $(this).parent().parent()
			$.ajax({
				type : "DELETE"
				, url : "/mypage/followed"
				,data : {USERID_FOLLOWED}
				, success : function(result) {
					div.remove();
					var count = result.FollowCount
					$('.followed').text(count)
				}
				, error : function(e) {
					alert("에러입니다. 관리자에게 문의하세요");
				}
			}) 
		})
		
		
		//글클릭후 댓글 추가 event
		$(document).on("click",".push",function(){
			var id = $('.bodyimg').data('id');
			var black = $('.black').text();
			var comment = $('.content-commnet').val().trim();
			var userId =  $('.userId').text();
			
			if (comment == "") {
				alert('댓글을 입력하세요');
				return false;
			}
			
			if (black == '일상') {
				$.ajax({
					type : "POST"
					,url : "/mypage/dailycomment"
					,data : {id,comment}
					,success : function(result) {
						$('.sample').append($( "<div>" + "<span class='spanid'>" + userId + "</span>"+ "<span>" + comment + "</span>" + "</div>"))
						$('.content-commnet').val('');
					}
					, error : function(e) {
					}
				})
			} else if (black == '맛집') {
				$.ajax({
					type : "POST"
					,url : "/mypage/goodplacecomment"
					,data : {id,comment}
					,success : function(result) {
						$('.sample').append($( "<div>" + "<span class='spanid'>" + userId + "</span>"+ "<span>" + comment + "</span>" + "</div>"))
						$('.content-commnet').val('');
					}
					, error : function(e) {
					}
				})
			} else if (black =='노맛집') {
				$.ajax({
					type : "POST"
					,url : "/mypage/badplacecomment"
					,data : {id,comment}
					,success : function(result) {
						$('.sample').append($( "<div>" + "<span class='spanid'>" + userId + "</span>"+ "<span>" + comment + "</span>" + "</div>"))
						$('.content-commnet').val('');
					}
					, error : function(e) {
					}
				})
			}
		})
		
		
	}) /*function 닫기  */
	
	
	
</script>
</html>