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

<title>Join</title>

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

<div class="join-section">
	<div class="row">
		<div class="col-lg-5 col-md-10 col-sm-11 join-card-wrapper">
			<div class="logo-title-wrapper">
				<span class="logo-title">CORONA
					<span class="logo-text-skyblue">
						LIVE
					</span>
				</span>
			</div>
			
			<div class="join-input-wrapper">
				<!-- modelAttribute의 값과 AdminController의 model.addAttribute("product", .. ) product 값(key)과 일치-->
				<sf:form action="/auth/join" method="post" modelAttribute="userInfomation">

					<div class="form-group">
						<label for="id"><spring:message code="join.id" /></label>
						<sf:input path="id" id="id" class="form-control" type="text" onchange="checkId()"/>
						<sf:errors path="id" cssStyle="color:#ff0000;" /> 
						<span class="id_ok">사용 가능한 아이디입니다.</span>
						<span class="id_already">누군가 이 아이디를 사용하고 있어요.</span>
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
						
						<span>
							<a onclick = "javascript:refreshBtn()" class = "refreshBtn">
				          		<i class="fas fa-redo-alt fa-2x"></i>
							</a>
							<a onclick = "javascript:audio()" class = "refreshBtn">
								<i class="fas fa-volume-up fa-2x"></i>
							</a>
						</span>
					</div>
				
					
							
					<div class="form-group">
					
						<sf:input path="answer" class="form-control" />
						<sf:errors path="answer" cssStyle="color:#ff0000;" />
					</div>
			
					<input type="submit" value="submit" class="btn btn-default">
					<a href="<c:url value="/auth/login" />" class="btn btn-default">Cancel</a>
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
	/* $.ajax({
    	url:'/auth/idCheck',
    	type:'post',
    	data:{id:id},
    	
    	success:function(data){ //컨트롤러에서 넘어온 cnt값을 받는다 
    		console.log(data);
    	
    		if(id.trim() == "") {
    			console.log("empty");
    			$('.id_ok').css("display","none");
    			$('.id_already').css("display","none");
    		}
    		else if(Number(data.documentElement.innerHTML) == 1){ // cnt가 1일 경우 -> 이미 존재하는 아이디
    			$('.id_ok').css("display","none");
            	$('.id_already').css("display", "inline-block");
            	
        	} else { //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
            	
            	$('.id_ok').css("display","inline-block"); 
            	$('.id_already').css("display", "none");
        	}
    	},
    	
    	error:function(){
        	alert("에러입니다");
    	}
	}); */
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

</script>