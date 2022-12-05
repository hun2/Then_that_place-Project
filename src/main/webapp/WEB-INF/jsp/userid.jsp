<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�׶��װ� ���̵�ã��</title>
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
        <h2 onclick="clickmove('/login')">�׶��װ�</h2>
        <div id="login-form">
            <input type="text" placeholder="ȸ�������� ����� �̸���" id="userEmail">
            <div class="anwser">
	            <span>����Ͻ� Id </span><br>
	            <input type="text" placeholder="" id="anwserId">
            </div>
            <input type="submit" value="���̵� ã��" id = "login">
        </div>
        <hr>
        <p class="find">
        <span><a href="/login">Ȩ</a></span>
        <span><a href="/login/user-pwd">��й�ȣ ã��</a></span>
        <span><a href="/login/sign-up" >ȸ������</a></span>
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
		//�̸��� ���� �Է� �˻�
		if (userEmail == '') {
			
			alert('�̸��� �ּҸ� Ȯ�����ּ���');
			$('#userEmail').focus();
			return false;
		}
		
		//�̸��� �Է� �˻�
		var regEmail = /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/;
 	 	if (!regEmail.test(userEmail)) {
 	 		alert('�̸��� �ּҸ� Ȯ���ϼ���');
 	 		$('#userEmail').focus();
 	 		return false;
 	 	}
		
 	 	//���̵� ã�� event
		$.ajax({
			
			type : 'GET'
			, url : '/login/user-id-check'
			, data : {'userEmail' : userEmail }
			, success : function(result) {
				var userId = result.userId;
				 if(result == '') {
					alert('��ġ�ϴ� ���̵� �����ϴ�.');
					return false;
				} else {
					$('.anwser').show();
					$('#anwserId').val(userId);
				}  
			}
			, error : function(e) {
				alert('����');
			}
		}) /* ajax �ݱ�  */
	}) /* login ��ư Ŭ�� �ݱ� */
	
	
	


</script>
</html>