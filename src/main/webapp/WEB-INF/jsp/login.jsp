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
<link href="/static/css/login.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="shortcut icon" href="/static/favicon.ico" type="image/x-icon">

<!--font  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&display=swap" rel="stylesheet">

</head>
<body>
	<div class="main d-flex">
		<div class="login" >
			<div class="black"></div>
			<img src="/static/img/login2.jpg" class="loginimg">
		</div>
		<div class="login-2">
			<div class="login-wrapper">
		        <h2 onclick="clickmove('/login')">그때그곳</h2>
		        <div id="login-form">
		            <input type="text" placeholder="아이디" id="userId">
		            <input type="password" placeholder="비밀번호" id="userPwd">
		            <label for="remember-check">
		                <input type="checkbox" id="remember-check">아이디 저장하기
		            </label>
		            <label for="remember-maintain">
		            	<input type="checkbox" id="remember-maintain">로그인 상태유지
		            </label>
		            <input type="submit" value="Login" id = "login">
		        </div>
		        <hr>
		        <p class="find">
		        <span><a href="/login/user-id">아이디 찾기</a></span>
		        <span><a href="/login/user-pwd">비밀번호 찾기</a></span>
		        <span><a href="/login/sign-up" >회원가입</a></span>
		    	</p>
		    </div>
	    </div>
    </div>
</body>
<script type="text/javascript">
	
	
	//인터벌
	$(document).ready(function(){
	var imgList = ["/static/img/login2.png", "/static/img/login2.jpg", "/static/img/login3.png", "/static/img/login4.jpg"];
	var num = 0;
	var changeImg = function(){
		$(".loginimg").attr("src" , imgList[num]);
		num ++;
		if (num == 4) {
			num = 0;
		}
	}
		setInterval(changeImg, "3000");
	})
	
	//이동 event
	function clickmove(result){
		location.href = result;	
	}
	
	

	
	
	//비밀번호 입력 후 엔터 입력시 로그인버튼 클릭 event
	var userPwd = document.getElementById("userPwd");
	userPwd.addEventListener("keyup", function(event){
		if(event.keyCode === 13) {
			event.preventDefault();
 			$("#login").click();
 		}
 	});
	

	
	//로그인 버튼 클릭시 로그인 event
	$('#login').on('click', function(){
		
		var userId = $('#userId').val().trim();
		var userPwd = $('#userPwd').val().trim();
		
		if (userId == '') {
			alert('아이디를 확인하세요');
			$('#userId').focus();
			return false;
		}
		if (userPwd =='') {
			alert('비밀번호를 확인하세요');
			$('#userPwd').focus();
			return false;
		}
		
		$.ajax({
			//response
			type : "GET"
			, url : "/login/success"
			, data : {"userId" : userId, "userPwd" : userPwd}
			//request
			, success : function(result) {
				//중복일때 => 즉 id 또는 비밀번호가 맞지않음 
				if (result == "") {
					
					alert("아이디 또는 비밀번호가 맞지 않습니다");
					return false;
				}
				//중복이 아닐때 => 즉 아이디랑 비밀번호가 맞음 board 페이지로 이동
				else {
					location.href="/main"
				}
			}
			, error : function(e) {
				alert("에러");
			}
		}) /*ajax 닫기  */
	}) /* login 버튼 event 닫기  */
	

</script>
</html>