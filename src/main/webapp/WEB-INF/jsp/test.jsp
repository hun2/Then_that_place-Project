<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="/static/css/daily.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="shortcut icon" href="/static/favicon.ico" type="image/x-icon">
</head>
<body>
	<div class="main">
		<c:forEach begin="1" end="30">
			테스트 <br>
		</c:forEach>
		<c:forEach items="${user}" var="users">
			${users.userId} <br>
		</c:forEach>
	
	
	</div>
	
</body>
<script type="text/javascript">
	
	window.addEventListener('scroll', Scroll);
	
	var page = '1'
	var isDuplicate = true;
	
	function Scroll(){
		const currentScroll = window.scrollY;
		const windowHeight = window.innerHeight;
		const bodyHeight = document.body.clientHeight;
		const paddingBottom = 200;
		
		if ( currentScroll + windowHeight + paddingBottom >= bodyHeight ) {
			if(isDuplicate) {
				isDuplicate = false;
				$.ajax({
					type : "GET"
					,url : "/tests"
					, data : {page}
					, success : function(result) {
						var user = result.user
						for(var i = 0; i<user.length; i++) {
							$('.main').append(user[i].userId + '<br>')
						}
						page ++;
						console.log(page)
					}
					, error : function(e) {
						
					}
				})
				
				isDuplicate = true;
			}
		}
	}
	
	$('#button').on('click', function(){
		
		
		
	})


</script>
</html>