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
<link href="/static/css/daily.css" rel="stylesheet" type="text/css" />
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
	
	<!-- 중간바디 시작  -->
	<div class="bodycontent2 d-flex">
	
		<!-- 중간바디 - 왼쪽 시작  -->
		<div class="leftcontent">
			<div class="left1">
				<div onclick="clickmove('/main/daily')">나의일상</div>			
			</div>
			<div class="left2">
				<div onclick="clickmove('/main/otherdaily')">남의일상</div>		
			</div>
			<div class="left3">
				<div onclick="clickmove('/main/othergoodplace')">남의맛집</div>			
			</div>
			<div class="left4">
				<div onclick="clickmove('/main/otherbadplace')">남의노맛집</div>		
			</div>
		</div>
		<!-- 중간바디 - 왼쪽 닫기  -->
		<!-- 중간바디 - 중간 시작  -->
		<div class="middlecontent">
			<div class="wrapper">
				<c:forEach items="${OtherBadPlaceCardViewList}" var="cardView">
					<div class="post">
						<div class="info">
							<div class="user">
								<div class="profile-pic">
									<a href="/otherpage?userId=${cardView.user.userId}">
										<img src="${empty cardView.user.userProfilePhoto ?  '/static/img/no.png' : cardView.user.userProfilePhoto }">
									</a>
								</div>
								<a href="/otherpage?userId=${cardView.user.userId}">
									<p class="username">${cardView.place.userId}</p>
								</a>
							</div>
						</div>
						<!--이 부분은 추후에 페이지 따로 만들어서 구현해야함 => 남의 글 상세페이지 수정권한/삭제권한 없이 오로지 볼 수 있도록  -->
						<a href="/main/othergoodplace-detail?placeId=${cardView.place.id}">
							<img src="${empty cardView.placeImage[0].imagePath ? '/static/img/no.png' : cardView.placeImage[0].imagePath}" class="post-image">
						</a>
						<div class="post-content">
							<div class="reaction-wrapper">
								<div>
									<img src="${cardView.filledLike eq true ? '/static/img/liked.png' : '/static/img/like.png'}" class="icon" data-id="${cardView.place.id}">
									<span class="likes">${cardView.likeCount} likes</span>
								</div>
								<div class="date">
									<fmt:formatDate value="${cardView.place.placeCreatedAt}" pattern="yyyy-MM-dd" />
								</div>								
							</div>
							
							제목 : ${cardView.place.placeSubject} <br>
							내용 : ${cardView.place.placeContent} <br>
							이 부분은 제목 내용 어케나눌지 추후에 생각
							
							<!--댓글보기  -->
							<div class="text" data-id="${num}">
								<p class="description_add">
									<span> 댓글 ${cardView.commnetCount}개 모두 보기</span>
								</p>
								<c:forEach items="${cardView.commentList}" var="comment">
									<div class="description_comment">
										<span>${comment.comment.userId}</span>
										${comment.comment.comment}
									</div>
								</c:forEach>
							</div>
							
							<!--댓글쓰기  -->
							<div class="post-content-comment">
								<input type="text" placeholder="댓글달기.." class="content-commnet">
								<a class="push" data-daily-id="${cardView.place.id}">게시</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- 중간바디 - 중간 닫기  -->
		<!--중간마디 - 오른쪽 시작 -->
		<div class="rightcontent">
			<p class="suggestion-text">회원님을 위한 추천 </p>
			<c:forEach items="${userList}" var="user">
					<div class="profile-card">
						<div class="profile-pic">
							<img src="${empty user.userProfilePhoto ?  '/static/img/no.png' : user.userProfilePhoto }">
						</div>
						<div class="profile-info">
							<p class="username" data-id="${user.userId}">${user.userId}</p>
							<p class="sub-text">user외 4명이 팔로우합니다.</p>
						</div>
						<button class="action-btn">follow</button>
					</div>
			</c:forEach>
		</div>
		<!--중간마디 - 오른쪽 닫기 -->
		
		
		
		
		
		
		
		
		
		</div>
</body>
<script type="text/javascript">
	//이동 event
	function clickmove(result){
		location.href = result;	
	}

	$(function(){
		
		
		
		//댓글더보기 클릭시 댓글들 보이기
		$(".description_add").on('click', function(){
			var div = $(this).siblings('div');
			$(div).css('display') == 'none' ? $(div).css('display', 'block') : $(div).css('display', 'none')
		})
		
		//하트 클릭시 이벤트
		$('.icon[data-id]').on('click', function(){
		
			const id = $(this).data("id");
			const src = $(this).attr('src')
			const heart = "/static/img/like.png"
			const redheart = "/static/img/liked.png"
			$(this).attr('src', src === heart ? redheart : heart)
			
			$.ajax({
			
				type : "POST"
				,url : "/main/otherbadplace/like"
				, data : {id}
				, success : function(result) {
					if ( result.code == 100) {
						location.reload();
					} else {
						alert(result.errorMessage);
					}
				}
				, error : function(e) {
					alert("관리자에게 문의 하세요");
					
				} 
			})
		})
		
		
		//댓글쓰기 event
		$(".push").on("click", function(){
			var id = $(this).data('daily-id');
			//지금 클릭된 게시 버튼의 형제인 input 태그를 가져온다. (siblings)
			var comment =  $(this).siblings('input').val().trim();
			$.ajax({
				
				type : "POST"
				, url : "/main/otherbadplace/comment"
				, data : {id, comment}
				, success : function(result){
					if ( result.code == 100) {
						location.reload();
					} else {
						alert(result.errorMessage);
					}
				}
				, error : function(e) {
					alert("관리자에게 문의 하세요");
					
				} 
			}) 
			
		});
		
		
		//팔로우 버튼 클릭 이벤트
		$('.action-btn').on('click', function(){
			var userId = $(this).siblings('.profile-info').children('.username[data-id]').data('id');
			$.ajax ({
				type : "POST"
				, url : '/main/follow'
				, data : {'userId' : userId}
				,success : function(result) {
					if ( result.code == 100) {
						alert("팔로우 신청이 완료 되었습니다");
						location.reload();
					} 
					else {
						alert("팔로우 에러 입니다.");
					}
				}
				,error : function(e) {
					alert("관리자에게 문의해주세요");
				}
			})
		}) // 팔로우 버튼 클릭 이벤트 닫기
		
		
		
	})




</script>
</html>