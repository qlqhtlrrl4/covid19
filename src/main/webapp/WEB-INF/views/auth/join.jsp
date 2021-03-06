<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
   var soundUrl = 'captchaAudio?rand = '+rand;
   
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
            TIMES 
         </span>
      </span>
   </div>
	<div class="join-section">
	   	<div class="row">
			<div class="col-lg-5 col-md-10 col-sm-11 join-card-wrapper">
				<div class="join-input-wrapper">
	            	<!-- modelAttribute??? ?????? AdminController??? model.addAttribute("product", .. ) product ???(key)??? ??????-->
	            <sf:form action="/auth/join" method="post" modelAttribute="userInfomation">
	
	            	<div class="form-group">
	                	<label for="id"><spring:message code="?????????" /></label>
	                  	<sf:input path="id" id="id" class="form-control" type="text" onchange="checkId()"/>
	                  	<sf:errors path="id" cssStyle="color:#ff0000;" /> 
	                  	<span class="id_ok">?????? ????????? ????????? ?????????.</span>
	                  	<span class="id_already">?????? ????????? ???????????? ????????? ?????????.</span>
	                  	<span class="id_size">8???????????? 15?????? ?????????????????????.</span>
	               	</div>
	
	
	               	<div class="form-group">
	                  	<label for="password"><spring:message code="????????????" /></label>
	                  	<sf:password path="password" id="password" class="form-control" />
	               		<sf:errors path="password" cssStyle="color:#ff0000;" />
	               	</div>
	               
	               	<div class="form-group">
						<label for="find_password_check"><spring:message code="??????????????????" /></label>
						<sf:password path="find_password_check" id="password_check" class="form-control" onchange="checkPw()" />
						<sf:errors path="find_password_check" cssStyle="color:#ff0000;" />
						<span class="password_check1">??????????????? ???????????????</span> 
	     		   		<span class="password_check2">??????????????? ???????????? ????????????.</span>
				   	</div>
	
	               	<div class="form-group">
							<label for="email"><spring:message code="?????????" /></label>
							<sf:input path="email" id="email" class="form-control" type="text" onchange="checkEmail()"/>
							<sf:errors path="email" cssStyle="color:#ff0000;" />
							<span class="email_pattern">????????? ????????? ????????????</span>
							<span class="email_ok">?????? ????????? ????????? ?????????.</span> 
							<span class="email_already">?????? ????????? ???????????? ????????? ?????????.</span>
					</div>
	               
	    
	               <div class="form-group">
	                  <label for="name"><spring:message code="??????" /></label>
	                  <sf:input path="name" id="name" class="form-control" />
	                  <sf:errors path="name" cssStyle="color:#ff0000;" />
	               </div>
	               
	               <div class="form-group">
	                  <label for="vaccine"><spring:message code="????????????" /></label>
	                  <sf:input	path="vaccine" id="vaccine" class="form-control"
	                   			type="text"  onKeyup="inputYMDNumber(this);" onchange="checkDate();" value="" placeholder="YYYY-MM-DD"/>
	                   <span class="date-over">???????????? over</span>
	                   <span class="date-formatError">?????? ????????? ??????????????? (yyyy-mm-dd)</span>
	       
	               </div>
	         
	               <div class="form-group">
	                  <label for="captchaImg"><spring:message code="?????? ???????????? ??????????????? ????????? ?????????." /></label><br>
	                  <img id = "captchaImg" src="/auth/captchaImg" alt="???????????????"/> 
	                  <div id="captchaAudio" style="display:none"></div> 
	                  
	                  <span class="join-icons">
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
	         
	               <div class="row">
						<div class="col-lg-6 col-md-6 col-sm-12">
							<a href="<c:url value="/" />" class="btn btn-primary">??????</a>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<button type="submit" class="btn btn-primary">????????????</button>
						</div>
					</div>
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
          console.log(data);
                    
       }
    });
});

	function checkId() {
	   debugger;
	   var id = $('#id').val();
	   var size = $('#id').val().length;
	   console.log(size);
	   
	   if(id.trim() == "") {
	      console.log("empty");
	      $('.id_ok').css("display","none");
	      $('.id_already').css("display","none");
	      $('.id_size').css("display","inline-block");
	      
	   }
	   
	   
	   else if(allUserId.some(e=>e.user_id === id) == true ){ 
	      
	      $('.id_ok').css("display","none");
	       $('.id_already').css("display", "inline-block");
	       $('.id_size').css("display","none");
	       
	   } 
	   else if(size <8 || size>15) {
	      $('.id_ok').css("display","none");
	       $('.id_already').css("display", "none");
	       $('.id_size').css("display","inline-block")
	   }
	   
	   else { 
	       
	       $('.id_ok').css("display","inline-block"); 
	       $('.id_already').css("display", "none");
	       $('.id_size').css("display","none");
	   }
	}

	function checkDate() {
		debugger;
		var y;
		var d;
		var m;
		var id = $('#vaccine').val();
		var size = $('#vaccine').val().length;
		
		if(size !=10) {
			$('.date-formatError').css("display","inline-block");
		}
		else {
	        
	        if (id.length == 8) { 
	            if (!yyyymmdd.match(/[0-9]{8}/g)) {
	                return 3;
	            } 
	            
	            y = id.substring(0, 4); 
	            m = id.substring(4, 6); 
	            d = id.substring(6, 8); 
	        } 
	        else if (id.length == 10) {
	            if (!id.match(/[0-9]{4}[-/][0-9]{2}[-/][0-9]{2}/g)) {
	                return 3;
	            }
	            y = id.split('-')[0]; 
	            m = id.split('-')[1];
	            d = id.split('-')[2];
	        } 
	        else { 
	            return 3; 
	        }
	        
	        var limit_day;
	        switch (eval(m)) { 
	            case 1: case 3: case 5: case 7: case 8: case 10: case 12: {
	                limit_day = 31;
	            }break; 
	            case 2: {
	                if ((y - 2008) % 4 == 0) {
	                    limit_day = 29;
	                }
	                else {
	                    limit_day = 28;
	                }break;
	            }
	            case 4: case 6: case 9: case 11: {
	                limit_day = 30;
	            }break; 
	            default: {
	            	$('.date-formatError').css("display","inline-block");
	            	return 2;
	            }break; 
	        } 
	        if (eval(d) > limit_day) { 
	        	$('.date-formatError').css("display","inline-block");
	            return 1;
	        } 
	        if (eval(d) < 1) {
	        	$('.date-formatError').css("display","inline-block");
	            return 4; 
	        } 
	        return 0; 
	        }
		}
	
	function inputYMDNumber(obj) {
	
		debugger;
	   
	    if(event.keyCode != 8) {
			
	    	if(obj.value.replace(/[0-9 \-]/g, "").length == 0) {
				
				let number = obj.value.replace(/[^0-9]/g,"");
	            let ymd = "";
	            
	            if(number.length < 4) {
	                return number;
	            } 
	            else if(number.length < 6){
	                ymd += number.substr(0, 4);
	                ymd += "-";
	                ymd += number.substr(4);
	            } 
	            else {
	                ymd += number.substr(0, 4);
	                ymd += "-";
	                ymd += number.substr(4, 2);
	                ymd += "-";
	                ymd += number.substr(6);
	            }
	            
	            if(ymd.length == 10) {
					
	                const birthDay = new Date(number.substr(0,4)+"/"+number.substr(4,2)+"/"+number.substr(6));
	                const limitDay = new Date();
					var today = limitDay.getFullYear()+"/"+limitDay.getMonth()+1+"/"+limitDay.getDay();
	    
	                if(birthDay > limitDay) {
	                    obj.value = "";
	                    $('.date-over').css("display","inline-block");
	                    $('.date-formatError').css("display","none");
	                    obj.focus();
	                    return false;
	                }
				} 
        
				obj.value = ymd; 
	            $('.date-formatError').css("display","none");
	            $('.date-over').css("display","none");
			}
	    				
			else {
				
	            $('.date-formatError').css("display","inline-block");
	            $('.date-over').css("display","none");
	            
	            obj.value = obj.value.replace(/[^0-9 ^\-]/g,"");
	            return false;
			}
	    } 
	    else {
			return false;
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
			debugger;
			var lowerEmail = email.toLowerCase();
		
			var regex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			
			var emailReg 
			
			console.log(email.match(emailReg));
			
			if(lowerEmail.trim() == "") {
				console.log("empty");
				$('.email_ok').css("display","none");
				$('.email_already').css("display","none");
				$('.email_pattern').css("display","none");
				
			}
			
			
			else if(allUserEmail.some(e=>e.email === lowerEmail) == true ){ 
				$('.email_ok').css("display","none");
		    	$('.email_already').css("display", "inline-block");
		    	$('.email_pattern').css("display","none");
			}
			else if(!regex.test(lowerEmail)) {
				$('.email_ok').css("display","none");
		    	$('.email_already').css("display", "none");
		    	$('.email_pattern').css("display","inline-block");
			}
			
			else { 
		    	
		    	$('.email_ok').css("display","inline-block"); 
		    	$('.email_already').css("display", "none");
		    	$('.email_pattern').css("display","none");
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