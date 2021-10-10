<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>	
<!DOCTYPE html>
<html lang="ko">
<head>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link rel="icon" type="image/png" href="http://example.com/myicon.png"> 


<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<link rel="shortcut icon" href="#">

<title>Login</title>

<!-- Bootstrap core CSS -->
<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<c:url value="/resources/css/carousel.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/app.css"/>" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
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

<div class="container-wrapper">
	<div class="container">
		
		<!-- modelAttribute의 값과 AdminController의 model.addAttribute("product", .. ) product 값(key)과 일치-->
		<sf:form
			action="/auth/join"
			method="post" modelAttribute="userInfomation">

			<div class="form-group">
				<label for="id"><spring:message code="join.id" /></label>
				<sf:input path="id" id="id" class="form-control" />
				<sf:errors path="id" cssStyle="color:#ff0000;" />
			</div>


			<div class="form-group">
				<label for="password"><spring:message code="join.password" /></label>
				<sf:password path="password" id="password" class="form-control" />
				<sf:errors path="password" cssStyle="color:#ff0000;" />
			</div>

			<div class="form-group">
				<label for="email"><spring:message code="join.email" /></label>
				<sf:input path="email" id="email" class="form-control" />
				<sf:errors path="email" cssStyle="color:#ff0000;" />
			</div>
			
			<div class="form-group">
				<label for="name"><spring:message code="join.name" /></label>
				<sf:input path="name" id="name" class="form-control" />
				<sf:errors path="name" cssStyle="color:#ff0000;" />
			</div>
			
			<div class="form-group">
				<label for="captchaImg"><spring:message code="join.captcha" /></label><br>
				<img id = "captchaImg" src="/auth/captchaImg" alt="캡차이미지"/> 
				<div id="captchaAudio" style="display:none"></div> 
			</div>
			
			<div class="form-group">
				<a onclick = "javascript:refreshBtn()" class = "refreshBtn">
				<input type="button" value="refresh"/>
				</a>
				<a onclick = "javascript:audio()" class = "refreshBtn">
				<input type="button" value="listen"/>
				</a>
				
			</div>
						
			<div class="form-group">
				
				<sf:input path="answer" class="form-control" />
				<sf:errors path="answer" cssStyle="color:#ff0000;" />
			</div>
			
			<input type="submit" value="submit" class="btn btn-default">
			<a href="<c:url value="/auth/login" />" class="btn btn-default">Cancel</a>
		</sf:form>
			
		<br />

	</div>
</div>
</body>