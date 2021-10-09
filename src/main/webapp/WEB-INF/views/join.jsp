<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="icon" type="image/png" href="http://example.com/myicon.png"> 

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
/* function checkRecaptcha() {
	
	var data = {
			'data' : document.getElementById("answer")
	}
	
	$.ajax({
		url : "${pageContext.request.contextPath}/answer",
		dataType : "json",
		data : JSON.stringify(data),
		contentType : "application/json",
		type : "POST",
		async : false,
		
		success : function(data) {
			
			
			
			if(data == "ok") {
				return true;
			}
			else {
				return false;
			}
			
		}

	});	
} */

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

<div class="container-wrapper">
	<div class="container">
		<h1>Add Product</h1>
		<p class="lead">Fill the below information to add a product:</p>

		<!-- modelAttribute의 값과 AdminController의 model.addAttribute("product", .. ) product 값(key)과 일치-->
		<sf:form
			action="${pageContext.request.contextPath }/join"
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
				<img id = "captchaImg" src="/captchaImg" alt="캡차이미지"/> 
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
			<!-- <div class = "form-group"> 
				<input type="text" name = "answer" class = "form-control">
			
			</div> -->
			
			<div class="form-group">
				
				<sf:input path="answer" class="form-control" />
				<sf:errors path="answer" cssStyle="color:#ff0000;" />
			</div>
			
			<input type="submit" value="submit" class="btn btn-default">
			<a href="<c:url value="/login" />" class="btn btn-default">Cancel</a>
		</sf:form>
			
		<br />

	</div>
</div>