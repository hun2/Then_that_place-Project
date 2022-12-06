<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그때그곳 비밀번호 찾기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="/static/css/userpwd.css" rel="stylesheet" type="text/css" />
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
	<div class="login-wrapper">
        <h2 onclick="clickmove('/login')">그때그곳</h2>
        <div id="login-form">
            <input type="text" placeholder="아이디" id="userId">
            <input type="text" placeholder="회원정보에 등록한 이메일" id="userEmail">
            <input type="submit" value="비밀번호 찾기" id ="login">
        </div>
        <hr>
        <p class="find">
        <span><a href="/login">홈</a></span>
        <span><a href="/login/user-id">아이디 찾기</a></span>
        <span><a href="/login/sign-up" >회원가입</a></span>
    	</p>
    </div>
</body>
<script type="text/javascript">
	
	var userEmail = document.getElementById("userEmail");
	userEmail.addEventListener("keyup", function(event){
		if(event.keyCode === 13) {
			event.preventDefault();
			$("#login").click();
		}
	});
	
	$('#login').on('click', function(){
		
		var userId = $('#userId').val().trim();
		var userEmail = $('#userEmail').val().trim();
		
		//아이디 공백검사
		if ( userId == '') {
			alert('아이디를 확인하세요');
			$('#userId').focus();
			return false;
		}
		//이메일 공백검사
		if ( userEmail == '') {
			alert('이메일을 확인하세요');
			$('#userEmail').focus();
			return false;
		}
		
		//이메일 입력 검사
		var regEmail = /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/;
 	 	if (!regEmail.test(userEmail)) {
 	 		alert('이메일 주소를 확인하세요');
 	 		$('#userEmail').focus();
 	 		return false;
 	 	}
 	 	
 	 	//비밀번호 찾기 ( 아이디 와 이메일 일치 여부 확인)
 	 	$.ajax({
 	 		
 	 		type : 'GET'
 	 		, url : '/login/user-pwd-check'
 	 		, data : {'userId' : userId , 'userEmail' : userEmail }
 	 		,success : function(result) {
 	 			
 	 			if(result =='') {
 	 				
 	 				alert('아이디 또는 이메일을 확인하세요');
 	 				return false;
 	 			} else {
					
 	 				$.ajax({
 	 					type : 'POST'
 	 					, url : "/sendEmail"
 	 					, data : {'userId' : userId , 'userEmail' : userEmail }
 	 					, success : function() {
 	 						alert('임시 이메일 전송완료!');
 	 					}
 	 					, error : function() {
 	 						alert('관리자에게 문의하세요');
 	 					}
 	 				})
 	 			}
 	 		}
 	 		, error : function(e) {
				alert('관리자에게 문의하세요'); 	 			
 	 		}
 	 	})
		
		
		
		
		
	});


</script>
</html>