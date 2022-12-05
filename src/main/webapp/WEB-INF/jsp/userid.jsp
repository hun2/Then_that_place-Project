<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>그때그곳 아이디찾기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="/static/css/userid.css" rel="stylesheet" type="text/css" />
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
            <input type="text" placeholder="회원정보에 등록한 이메일" id="userEmail">
            <div class="anwser">
	            <span>등록하신 Id </span><br>
	            <input type="text" placeholder="" id="anwserId">
            </div>
            <input type="submit" value="아이디 찾기" id = "login">
        </div>
        <hr>
        <p class="find">
        <span><a href="/login">홈</a></span>
        <span><a href="/login/user-pwd">비밀번호 찾기</a></span>
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
		
		var userEmail = $('#userEmail').val().trim();
		//이메일 공백 입력 검사
		if (userEmail == '') {
			
			alert('이메일 주소를 확인해주세요');
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
		
 	 	//아이디 찾기 event
		$.ajax({
			
			type : 'GET'
			, url : '/login/user-id-check'
			, data : {'userEmail' : userEmail }
			, success : function(result) {
				var userId = result.userId;
				 if(result == '') {
					alert('일치하는 아이디가 없습니다.');
					return false;
				} else {
					$('.anwser').show();
					$('#anwserId').val(userId);
				}  
			}
			, error : function(e) {
				alert('에러');
			}
		}) /* ajax 닫기  */
	}) /* login 버튼 클릭 닫기 */
	
	
	


</script>
</html>