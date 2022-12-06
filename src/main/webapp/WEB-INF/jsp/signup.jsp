<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그때그곳 회원가입</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="/static/css/signup.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<link rel="shortcut icon" href="/static/favicon.ico" type="image/x-icon">

<!--font  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&display=swap"
	rel="stylesheet">
</head>
<body>



	<div class="member">
		<!-- 1. 로고 -->
		<h2 class="logo" onclick="clickmove('/login')">그때그곳</h2>
		<!-- 2. 필드 -->
		<div class="field">
			<b>아이디</b> <span class="placehold-text"><input type="text"
				id="userId"></span> <small id="limitText" class="showLimit d-none">4~12자의
				영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.</small> <small id="isDuplicationText"
				class="showTrue d-none">이미 사용중인 아이디입니다. </small> <small
				id="availableText" class="showFalse d-none">멋진 아이디네요!</small>
		</div>
		<!--비밀번호-->
		<div class="field">
			<b>비밀번호</b> <input class="userpw" type="password" id="userPwd">
		</div>
		<!--비밀번호 확인-->
		<div class="field">
			<b>비밀번호 재확인</b> <input class="userpw-confirm" type="password"
				id="userRePwd">
		</div>
		<!--닉네임-->
		<div class="field">
			<b>닉네임</b> <input type="text" id="userNickName">
		</div>

		<!--이메일-->
		<div class="field">
			<b>이메일</b> <input type="email" placeholder="sample@naver.com"
				id='userEmail'>
		</div>

		<!-- 프로필 사진 -->
		<div class="field tel-number">
			<b>프로필 사진</b>
			<div class="profilediv">
				<div class="uploadimg">
					<img src="/static/img/no.png" id="modifyimg">
				</div>
				<input type="file" id="file" accept=".gif, .jpg, .png, .jpeg"
					onchange="readURL2(this);">
			</div>
		</div>

		<!-- 가입하기 버튼 -->
		<input type="button" value="가입하기" id="submit">

		<!-- 7. 푸터 -->
		<div class="member-footer">
			<div>
				<a href="#none">이용약관</a> <a href="#none">개인정보처리방침</a> <a
					href="#none">법적고지</a> <a href="#none">회원정보 고객센터</a>
			</div>
			<span><a href="#none">그때그곳 Corp.</a></span>
		</div>
	</div>
</body>
<script type="text/javascript">

	
	
	//onclick href event
	function clickmove(result){
		location.href = result;	
	}
	
	
	//회원가입시 프로필 사진 미리보기 event
	function readURL2(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById('modifyimg').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		} else {
			document.getElementById('modifyimg').src = '/img/no.png';
		}
	}
	//중복확인 검사 event
	$('#userId').on('keyup', function(){
		var userId = $('#userId').val().trim();
		
		//한글입력시 유효성 검사
		 var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; 
		 if(check.test(userId)) {
			 $('#userId').val("");
			 alert('한글은 입력이 불가능합니다.');
			 $('#userId').focus();
			 return false;
		 }
		
		 //아이디가 0일때 id 체크멘트 지우기
		 if(userId.length == 0) {
			$('#limitText').addClass('d-none');
			$('#isDuplicationText').addClass('d-none')
			$('#availableText').addClass('d-none')
			return false;
		 }
		
		//중복검사
		$.ajax({
			type : 'GET'
			, url : '/login/userid-duplication'		
			, data : {'userId' : userId}
			, success : function(result) {
				if (result.isDuplication > 0) {
					/*중복일때  */
					if (userId.length < 4 || userId.length > 12) {
						$('#limitText').removeClass('d-none');	
						$('#isDuplicationText').addClass('d-none');
						$('#availableText').addClass('d-none');
					} else {
						$('#isDuplicationText').removeClass('d-none');
						$('#availableText').addClass('d-none');
						$('#limitText').addClass('d-none');
					}
				} else {
					/*중복이 아닐때  */
					if (userId.length < 4 || userId.length > 12) {
						$('#limitText').removeClass('d-none');	
						$('#isDuplicationText').addClass('d-none');
						$('#availableText').addClass('d-none');
					} else {
						$('#limitText').addClass('d-none');	
						$('#isDuplicationText').addClass('d-none');
						$('#availableText').removeClass('d-none');
					}
				}
			}
			, error : function(e) {
				alert('관리자에게 문의하세요.');
			}
		}) /* ajax 닫기*/
	})
	
	//회원 가입 버튼 클릭시 유효성 검사 (id 중복검사 및 나머지)
	$('#submit').on('click', function(){
		
		var userId = $('#userId').val().trim();
		var userPwd = $('#userPwd').val().trim();
		var userRePwd = $('#userRePwd').val().trim();
		var userNickName = $('#userNickName').val().trim();
		var userEmail = $('#userEmail').val().trim();
		var file = $('#file').val();
		if (userPwd.length == 0) {
			alert('비밀번호를 확인하세요.');
			$('#userPwd').focus();
			return false;
		}
		
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
		
		//닉네임 입력 검사
		if(userNickName.length == 0 || userNickName.length > 20 || userNickName.length < 4) {
			alert('닉네임은 4자~20자리 사용해야 합니다');
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
 	 	
 	 	//아이디 중복검사가 완료되면 회원가입 실행 시키기
 	 	if ( $("#availableText").hasClass('d-none') ) {
 			
 			alert("ID를 확인해주세요.");
 			$("#userId").focus();
 			return false;
 		}
 		
 	 	//파일 유효성 검사
		if ( file != "") {
	 	 		
	 	 //잘려있는 배열중 가장 마지막 배열
	 	 file.split('.').pop();
	 	 //마지막 배열을 소문자로 강제 변환
	 	 const ext = file.split('.').pop().toLowerCase();
	 	 		
	 	 //배열안에 포함된게 없다면 -1로 찍힘. 
	 	 if ( $.inArray(ext, ['gif', 'jpg', 'jpeg', 'png']) == -1) { 
			alert("gif, jpg, jpeg, png 파일만 가능합니다");
			$('#file').val(''); // 업로드 된 파일을 비워준다.
			return false;
			} 
	 	 }
 	 	
 	 	//아무 문제 없으면 insert 시키기
 	 	
 	 	var formData = new FormData();
 		formData.append('userId', userId);
 		formData.append('userPwd', userPwd);
 		formData.append('userEmail', userEmail);
 		formData.append('userNickName', userNickName);
 		formData.append('file', $('#file')[0].files[0]);
 	 	
 	 	$.ajax({
 	 		
 	 		type : 'POST'
 	 		, url : '/login/user'
 	 		, data : formData
 	 		, enctype : "multipart/form-data"  // 파일 업로드를 위한 필수 설정
 			, processData : false // 파일 업로드를 위한 필수 설정
 			, contentType : false
 	 			
 				
 			//요청 후 
 			 , success : function(result) {
 					
 				if(result.code ==  100) {
 					alert("회원가입 성공하였습니다.")
 	 	 			location.href = "/login";
 				} else {
 					alert(result.errorMessage);
 				}
 			}
 	 		, error : function(e) {
 	 			alert("에러입니다.")
 	 		} 
 	 	}) /* ajax 닫기  */
 	 	
		
	})	

	
	
		
		
		
		
		
		
		
	
		
	
	
	




</script>
</html>