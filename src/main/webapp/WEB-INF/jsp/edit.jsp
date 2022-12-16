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
<link href="/static/css/edit.css" rel="stylesheet" type="text/css" />
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
						<img src="${empty sessionScope.loginUser.userProfilePhoto ?  '/static/img/no.png' : sessionScope.loginUser.userProfilePhoto }" class="profile-img">
					</div>
					<div class="profile-name">
						<p class="usernickname username">${sessionScope.loginUser.userNickName} 님 반갑습니다!</p>
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
					<input type="hidden" value="${sessionScope.loginUser.userId}" class="hiddenid">					
				</li>
			</ul>
		</nav>
	</div>
	<!--상단 고정바 끝  -->
	<!-- 중간 바디 시작 -->
	<main class="main">
		<div class="mainbody">
			<div class="leftbody">
				<div class="profile-edit black">프로필 편집</div>
				<div class="password-edit">비밀번호 변경</div>
			</div>
			<div class="rightbody">
				<div class="info">
					<div class="user">
						<div class="profile-pic">
							<img src="${empty sessionScope.loginUser.userProfilePhoto ?  '/static/img/no.png' : sessionScope.loginUser.userProfilePhoto }" class="profile-img">
						</div>
					</div>
					<div class="user-bottom">
						<div class="name username">
							${sessionScope.loginUser.userId}
						</div>
						<div class="profile-photo">
								<a href="#" id="change">프로필 사진 바꾸기</a>
								<input type="file" id="file" accept=".gif, .jpg, .png, .jpeg">
						</div>
					</div>
				</div>
				<div class="info">
					<div class="info-nickname">닉네임</div>
					<div class="username">
						<input type="text" value="${sessionScope.loginUser.userNickName}" id="userNickName"> 
					</div>
				</div>
				<div class="info">
					<div class="info-email">이메일</div>
					<div class="username">
						<input type="text" value="${sessionScope.loginUser.userEmail}" id="userEmail"> 
					</div>
				</div>
				<div class="rightbody-bottom">
					<a class="submit" href="#" style="background-color: #333; border-color: #333; color: #fff;" id="modify">수정</a>
					<a class="submit" href="#" style="background-color: #333; border-color: #333; color: #fff;" id="drop">탈퇴</a>
				</div>
			</div>
		</div>
	</main>

</body>
<script type="text/javascript">
	
	
	
	$(function(){
		
		//프로필 편집 클릭 event
		$('.profile-edit').on('click', function(){
			$('.password-edit').removeClass("black");
			$(this).addClass("black");
			location.reload();
		})
		
		//프로필 사진 변경 event
		$('#file').on('change', function(){
			
			var file = $('#file').val();
			var arr = file.split('.').pop().toLowerCase();
			//확장자 유효성 확인
			if (file.split('.').length < 2 || (arr != "gif" &&
					arr != "png" &&
					arr != "jpg" &&
					arr != "jpeg")) {
				alert("이미지 파일만 업로드 할 수 있습니다.");
				$('#file').val('');
				return false;
			}
			
			//ajax 전송
			var formData = new FormData();
			var file = $('#file').val();
			formData.append('file', $('#file')[0].files[0]);
			$.ajax({
				type : "PUT"
				,url : "/account/edit"
				, data : formData
				, enctype : "multipart/form-data"
				, processData : false
				, contentType : false
				, success : function(result) {
					if (result.code == 100) {
						alert('프로필 사진 수정이 완료되었습니다.');
						$('.profile-pic').children().remove();
						var loginUser = result.loginUser
						$img = $("<img src =" + loginUser.userProfilePhoto + ">")
						$('.profile-pic').append($img)
						
					} else {
						alert(result.errorMessage);
					}
				}
				, error : function(e) {
					alert("에러입니다. 관리자에게 문의하세요");
				}
			})
		}) //프로필 사진 변경 event 닫기
		
		//프로필 닉네임 및 이메일 변경 수정 event 열기
		$('#modify').on('click', function(){
			
			var userNickName = $('#userNickName').val().trim();
			var userEmail = $('#userEmail').val().trim();
			
			//닉네임 입력 검사
			if(userNickName.length == 0 || userNickName.length > 20 || userNickName.length < 4) {
				alert('닉네임은 4자~20자리 사용해야 합니다');
				$('#userNickName').focus();
				return false;
			}
			
			//특수문자가 있는 경우
			var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
			if(special_pattern.test(userNickName) == true){
			    alert('닉네임에 특수문자는 사용불가 합니다.');
			    $('#userNickName').focus();
			    return false;
			}
			
			//이메일 입력 검사
			var regEmail = /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/;
	 	 	if (!regEmail.test(userEmail)) {
	 	 		alert('이메일 주소를 확인하세요');
	 	 		$('#userEmail').focus();
	 	 		return false;
	 	 	}
	 	 	//ajax 전송
	 	 	$.ajax({
	 	 		type : 'PUT'
	 	 		, url : "/account/modify"
	 	 		, data : {userNickName, userEmail}
	 	 		,success : function(result){
	 	 			
	 	 			if(result.code == 100) {
	 	 				
	 	 				alert('프로필 수정이 완료되었습니다.');
	 	 				var loginUser = result.loginUser
	 	 				$('.usernickname').text( loginUser.userNickName + " 님 반갑습니다!");
	 	 			} else {
						alert(result.errorMessage);
					}
	 	 		}
	 	 		, error : function(e) {
	 	 			alert("에러입니다. 관리자에게 문의하세요");
	 	 		}
	 	 	})
		})//프로필 닉네임 및 이메일 변경 수정 event 닫기
		
		
		//회원 탈퇴 event 열기
		$('#drop').on('click', function(){
			
			 if (confirm("탈퇴하시겠습니까? \n개인정보는 복구가 불가능 합니다.") == true){ 
				   
				$.ajax({
					type : "DELETE"
					, url : "/account"
					, success : function(result) {
						if(result.code == 100) {
							alert('이용해 주셔서 감사합니다.')
							location.href="/login"
						} else {
							alert(result.errorMessage);
						}
					}
					, error : function(e) {
						alert("에러입니다. 관리자에게 문의하세요");
					}
				})	 	
				
			}else {
				return false;
			}
		}) //회원 탈퇴 event 닫기
		
		//비밀번호 변경 클릭 event
		$('.password-edit').on('click', function(){
			$('.profile-edit').removeClass("black");
			$(this).addClass("black");
			
			var img = $('.profile-img').attr('src');
			var name = $('.hiddenid').val();
			//비우기
			$('.rightbody').children().remove();
			
			
			//사진 id
			$username = $('<div class="username" />').text(name)
			$userbottom = $('<div class="user-bottom2" />').append($username)
			$img = $('<img src="'+ img + '"/>')
			$profilepic = $('<div class="profile-pic" />').append($img)
			$user = $('<div class="user" />').append($profilepic)
			$info = $('<div class="info" />').append($user).append($userbottom)
			
			//이전비밀번호
			$expwd = $('<div class="info-nickname" />').text('이전 비밀번호')
			$input2 = $('<input type="password" class="password"/>')
			$username2 = $('<div class="username" />').append($input2)
			$info2 = $('<div class="info" />').append($expwd).append($username2)
			
			//새 비밀번호
			$newpwd = $('<div class="info-nickname" />').text('새 비밀번호')
			$input3 = $('<input type="password" class="newpassword"/>')
			$username3 = $('<div class="username" />').append($input3)
			$info3 = $('<div class="info" />').append($newpwd).append($username3)
			
			//새 비밀번호 확인
			$checkpwd = $('<div class="info-nickname" />').text('새 비밀번호 확인')
			$input4 = $('<input type="password" class="newcheckpassword"/>')
			$username4 = $('<div class="username" />').append($input4)
			$info4 = $('<div class="info" />').append($checkpwd).append($username4)
			
			
			//수정 및 탈퇴
			$modify = $('<a class="modify" href="#" style="background-color: #333; border-color: #333; color: #fff; "/>').text('수정');
			$bottom = $('<div class="rightbody-bottom" />').append($modify)
			
			
			//모든 항목 추가
			$('.rightbody').append($info).append($info2).append($info3).append($info4).append($bottom)
		})
		
		//비밀번호 수정 버튼 event
		$(document).on("click", '.modify', function(){
			//이전비번
			var exuserPwd = $('.password').val();
			//비밀번호
			var userPwd = $('.newpassword').val();
			//비밀번호 확인
			var userRePwd = $('.newcheckpassword').val();
			
			
			//비밀번호입력시 특수문자조합 검사
			var reg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
			
			if (!reg.test(userPwd)) {
				alert('비밀번호는 영문+숫자+특수문자 조합으로 8~16자리 사용해야 합니다.');
				$('#userPwd').focus();
				return false;
			}
			// 비밀번호입력 재 입력 비밀번호 입력 일치 검사
			if (userPwd !== userRePwd) {
				alert('비밀번호가 맞지 않습니다.');
				$('#userRePwd').focus();
				return false;
			}
			$.ajax({
				type : 'PUT'
				,url : '/account/password'
				, data : {exuserPwd, userPwd}
				,success : function(result){
					if(result.code == 100) {
						alert('비밀번호 변경완료 하였습니다');
						$('.password').val('');
						$('.newpassword').val('');
						$('.newcheckpassword').val('');
					} else {
						alert(result.errorMessage);
					}
				}
				,error : function(e) {
					alert("에러입니다. 관리자에게 문의하세요");
				}
			})
		}) //비밀번호 수정 버튼 event 닫기
		
		
		//프로필 사진 변경 클릭 event
		$('#change').on('click', function(){
			
			$('#file').click();
			
		}) //프로필 사진 변경 클릭 event 닫기
	})
</script>
</html>