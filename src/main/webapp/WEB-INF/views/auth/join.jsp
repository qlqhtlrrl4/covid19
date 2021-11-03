<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link rel="icon" type="image/png" href="http://example.com/myicon.png">


<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<link rel="shortcut icon" href="#">

<title>Join</title>

<!-- Bootstrap core CSS -->
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<c:url value="/resources/css/carousel.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/css/app.css"/>" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/resources/js/waypoints.min.js"/>"></script>
</head>

<script>

function audio() {
	var rand = Math.random();

	var uAgent = navigator.userAgent;
	var soundUrl = '${pageContext.request.contextPath}/captchaAudio?rand = '+rand;
	
	if(uAgent.indexOf('Trident')>-1 || uAgent.indexOf('MSIE') > -1) {
		winPlayer(soundUrl);
	}
	else if(document.createElement('audio').canPlayType) {
		try {
			new Audio(soundUrl).play();
		}catch(e) {
			winPlayer(soundUrl);
		}
	}
}

function refreshBtn() {
	var rand = Math.random();
	var url = 'captchaImg?rand = '+rand;
	$('#captchaImg').attr('src',url);
}

function winPlayer(objUrl) {
	$('#captchaAudio').html('<bgsound src "'+objUrl+'">');
}


</script>

<!-- onsubmit="return checkRecaptcha()" -->

<body>
	<div class="logo-title-wrapper">
		<span class="logo-title">CORONA <span class="logo-text-skyblue">
				TIMES </span>
		</span>
	</div>
	<div class="join-section">
		<div class="row">
			<div class="col-lg-5 col-md-10 col-sm-11 join-card-wrapper">
				<div class="join-input-wrapper">
					<!-- modelAttribute의 값과 AdminController의 model.addAttribute("product", .. ) product 값(key)과 일치-->
					<sf:form action="/auth/join" method="post"
						modelAttribute="userInfomation">

						<div class="form-group">
							<label for="id"><spring:message code="아이디" /></label>
							<sf:input path="id" id="id" class="form-control" type="text" onchange="checkId()" />
							<sf:errors path="id" cssStyle="color:#ff0000;" />
							<span class="id_ok">사용 가능한 아이디 입니다.</span> 
							<span class="id_already">다른 유저가 사용중인 아이디 입니다.</span>
						</div>


						<div class="form-group">
							<label for="password"><spring:message code="비밀번호" /></label>
							<sf:password path="password" id="password" class="form-control" />
							<sf:errors path="password" cssStyle="color:#ff0000;" />
						</div>

						<div class="form-group">
							<label for="find_password_check"><spring:message code="비밀번호확인" /></label>
							<sf:password path="find_password_check" id="password_check" class="form-control" onchange="checkPw()" />
							<sf:errors path="find_password_check" cssStyle="color:#ff0000;" />
							<span class="password_check1">비밀번호가 일치합니다</span> 
							<span class="password_check2">비밀번호가 일치하지 않습니다.</span>
						</div>

						<div class="form-group">
							<label for="email"><spring:message code="이메일" /></label>
							<sf:input path="email" id="email" class="form-control" type="text" onchange="checkEmail()"/>
							<sf:errors path="email" cssStyle="color:#ff0000;" />
							<span class="email_ok">사용 가능한 이메일 입니다.</span> 
							<span class="email_already">다른 유저가 사용중인 이메일 입니다.</span>
						</div>

						<div class="form-group">
							<label for="name"><spring:message code="이름" /></label>
							<sf:input path="name" id="name" class="form-control" />
							<sf:errors path="name" cssStyle="color:#ff0000;" />
						</div>

						<div class="form-group">
							<label for="captchaImg"><spring:message
									code="아래 이미지를 보이는대로 입력해 주세요." /></label><br> <img id="captchaImg"
								src="/auth/captchaImg" alt="캡차이미지" />
							<div id="captchaAudio" style="display: none"></div>

							<span class="join-icons"> <a
								onclick="javascript:refreshBtn()" class="refreshBtn"> <i
									class="fas fa-redo-alt fa-2x"></i>
							</a> <a onclick="javascript:audio()" class="refreshBtn"> <i
									class="fas fa-volume-up fa-2x"></i>
							</a>
							</span>
						</div>



						<div class="form-group">

							<sf:input path="answer" class="form-control" />
							<sf:errors path="answer" cssStyle="color:#ff0000;" />
						</div>

						<a href="<c:url value="/" />" class="btn btn-primary">취소</a>
						<input type="submit" value="가입하기" class="btn btn-primary">
					</sf:form>
				</div>
			</div>
		</div>
	</div>
</body>

<script> 
var allUserId;

$(document).ready(function(){

	$.ajax({
    	url :'/auth/allUserId',
    	type:'get',
    	dataType : 'json',
    	async:false,
    	
    	success:function(data) {
    		allUserId = data;
    		
    		
    		//console.log(data['user_id']);
    		
    	}
    	
    });
	
});



function checkId() {
	var id = $('#id').val();
	
	
	if(id.trim() == "") {
		console.log("empty");
		$('.id_ok').css("display","none");
		$('.id_already').css("display","none");
	}
	
	
	else if(allUserId.some(e=>e.user_id === id) == true ){ 
		$('.id_ok').css("display","none");
    	$('.id_already').css("display", "inline-block");
    	
	} else { 
    	
    	$('.id_ok').css("display","inline-block"); 
    	$('.id_already').css("display", "none");
	}
}


var allUserEmail;

$(document).ready(function(){

	$.ajax({
    	url :'/auth/allUserEmail',
    	type:'get',
    	dataType : 'json',
    	async:false,
    	
    	success:function(data) {
    		allUserEmail = data;
    		
    		
    		//console.log(data['user_id']);
    		
    	}
    	
  });

});


function checkEmail() {
	var email = $('#email').val();
	
	
	if(email.trim() == "") {
		console.log("empty");
		$('.email_ok').css("display","none");
		$('.email_already').css("display","none");
	}
	
	
	else if(allUserEmail.some(e=>e.email === email) == true ){ 
		$('.email_ok').css("display","none");
    	$('.email_already').css("display", "inline-block");
    	
	} else { 
    	
    	$('.email_ok').css("display","inline-block"); 
    	$('.email_already').css("display", "none");
	}
}


function checkPw() {
	var p1 = $('#password').val();
	var p2 = $('#password_check').val();
	
	
	
	if(p2.trim() == "") {
		console.log("empty");
		$('.password_check1').css("display","none");
		$('.password_check2').css("display","none");
	}
	else if(p1 !== p2 ){ 
    	$('.password_check1').css("display", "none");
    	$('.password_check2').css("display", "inline-block");
    	
	} else if(p1 === p2) { 
		$('.password_check1').css("display", "inline-block");
		$('.password_check2').css("display", "none");
		
	}
}

</script>