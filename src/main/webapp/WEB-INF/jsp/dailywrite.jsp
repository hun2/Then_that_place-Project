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
<link href="/static/css/dailywrite.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="shortcut icon" href="/static/favicon.ico" type="image/x-icon">
</head>
<body>
	<!--상단 고정바 시작  -->
	<div id="top_wrap">
		<div id="wrap_logo">
			<a class="mainLogo" href="/main"> <span> 그때그곳</span>
			</a>
		</div>
		<nav id="wrap_topCate" class=""
			style="position: static; top: initial;">
			<ul class="inner">
				<li><a href="/main"> <span class="on">메인</span></a></li>
				<li><a href="/main/daily"> <span class="on">일상 </span>
				</a></li>
				<li><a href="/main/places/good"> <span class="on">죽어서도
							기억해야 할 맛집</span></a></li>

				<li><a href="/main/places/bad"> <span class="on">죽어서도
							기억해야 할 노맛집</span></a></li>
			</ul>
		</nav>
		<nav id="wrap_util">
			<ul class="inner">
				<li class="profile-card">
					<div class="profile-pic">
						<img src="${empty sessionScope.loginUser.userProfilePhoto ?  '/static/img/no.png' : sessionScope.loginUser.userProfilePhoto }">
					</div>
					<div class="profile-name">
						<p class="username">${sessionScope.loginUser.userNickName}님
							반갑습니다!</p>
					</div>
				</li>
				<li>
					<a class="link_util link_login" href="/mypage">마이페이지</a>
				</li>
				<li>
					<a class="link_util link_login" href="/logout">로그아웃</a>
				</li>
				<li>
					<a class="btn_search" href="/search"> <span class="ico_search"><img src=""></span></a>
				</li>
			</ul>
		</nav>
	</div>
	<!--상단 고정바 끝  -->

	<!--중간 바디영역 시작 -->
	<div class="bodycontent">
		<span class="col-6">일상</span>
	</div>
	<!--중간 바디영역 끝  -->
	<!-- 중간 글쓰기 영역 시작 -->
	<div class="bodycontent2">
		<div class="bodycontent2wrapper">
			<div class="d-flex justify-content-between">
			<h2>글쓰기</h2>
			</div>
			<div class="title">제목</div>
			<input type="text" class="bodycontent2input" placeholder="제목을 입력하세요">
			<div class="title">내용</div>
			<textarea rows="5" cols="68" class="placeContent"></textarea>
			<div class="title">파일첨부</div>
			<div class="fileadd mt-3">
				<input type="file" multiple="multiple" accept=".gif, .jpg, .png, .jpeg" id="btnAtt"> 
				<div id="att_zone">
				</div>
			</div>
			<a class="submit" href="#" style="background-color: #333; border-color: #333; color: #fff;" id="submit">등록</a>
		</div>
	</div>
	<!-- 중간 글쓰기 영역 끝 -->
</body>
<script type="text/javascript">


	imageView = function imageView(att_zone, btn){
	   var attZone = document.getElementById(att_zone);
	   var btnAtt = document.getElementById(btn)
	    var sel_files = [];
	    // 이미지와 체크 박스를 감싸고 있는 div 속성
	    var div_style = 'display:inline-block;position:relative;'
	                  + 'width:150px;height:120px;margin:5px;border: none;';
	    // 미리보기 이미지 속성
	    var img_style = 'width:100%;height:100%;z-index:none';
	    // 이미지안에 표시되는 체크박스의 속성
	    var chk_style = 'width:20px;height:20px;position:absolute;font-size:24px;'
	                  + 'right:0px;bottom:0px;z-index:999;background:transparent;border:none;padding:0;line-height:20px;color:red;';
	    btnAtt.onchange = function(e){
	      var files = e.target.files;
	      var fileArr = Array.prototype.slice.call(files)
	      for(f of fileArr){
	        imageLoader(f);
	      }
	    }  
	    
	    /*첨부된 이미리즐을 배열에 넣고 미리보기 */
	    imageLoader = function(file){
	      sel_files.push(file);
	      console.log(sel_files);
	      if (sel_files.length >= 4) {
	    	  alert('사진은 4장 이상 업로드 불가합니다.');
	    	  return false;
	      }
	      var reader = new FileReader();
	      reader.onload = function(ee){
	        let img = document.createElement('img')
	        img.setAttribute('style', img_style)
	        img.src = ee.target.result;
	        attZone.appendChild(makeDiv(img, file));
	      }
	      reader.readAsDataURL(file);
	    }
	    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
	    makeDiv = function(img, file){
	      var div = document.createElement('div')
	      div.setAttribute('style', div_style)
	      
	      var btn = document.createElement('input')
	      btn.setAttribute('type', 'button')
	      btn.setAttribute('value', 'x')
	      btn.setAttribute('delFile', file.name);
	      btn.setAttribute('style', chk_style);
	      btn.onclick = function(ev){
	        var ele = ev.srcElement;
	        var delFile = ele.getAttribute('delFile');
	        for(var i=0 ;i<sel_files.length; i++){
	          if(delFile== sel_files[i].name){
	            sel_files.splice(i, 1);      
	          }
	        }
	        
	        dt = new DataTransfer();
	        for(f in sel_files) {
	          var file = sel_files[f];
	          dt.items.add(file);
	        }
	        btnAtt.files = dt.files;
	        var p = ele.parentNode;
	        attZone.removeChild(p)
	      	}
		    div.appendChild(img)
		    div.appendChild(btn)
		     return div
		    }
	//등록버튼 클릭시 AJAX 전송 및 유효성 검사
		$('.submit').on('click', function(){
			
			
			//글제목 변수
			var dailySubject = $('.bodycontent2input').val().trim();
			//글내용 변수
			var dailyContent = $('.placeContent').val();
			//formData 추가
			var formData = new FormData();
			//formData 파일추가
			for (var i = 0; i < sel_files.length; i++) {
				formData.append("file", sel_files[i]);
			}
			// 글 내용들 추가
			formData.append('dailySubject', dailySubject);
			formData.append('dailyContent', dailyContent);
			$.ajax({
				type : 'POST'
				, url : '/main/daily'
				, data : formData
				, enctype : "multipart/form-data"
				, processData : false
				, contentType : false
				//요청 후 
				,success : function(result) {
					if (result.code == '100') {
						alert('글등록이 완료 되었습니다');
						location.href='/main/daily'
						
					} else {
						alert(result.errorMessage);
						location.reload();
					}
				}
				, error : function(e) {
					alert("에러입니다. 관리자에게 문의하세요");
				}
			})  
		})
	} ('att_zone', 'btnAtt');
		////////////////////////////////////////////////////////////////////////파일 업로드 시 닫기

</script>
</html>