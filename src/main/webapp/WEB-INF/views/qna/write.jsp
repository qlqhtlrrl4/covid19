<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var='root' value="${pageContext.request.contextPath }/" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>미니 프로젝트</title>
<!-- Bootstrap CDN -->
</head>
<body>

<div class="container" style="margin-top:100px">
	<div class="row">
		<div class="col-12" style="margin-bottom: 60px;">
			<div class="card shadow" style="background-color: rgb(245,245,245);">
				<div class="card-body">
					<div class="text-center">
						<h3 id="font-h3">QnA Write</h3>
					</div>
					<form:form action="${root }qna/write_pro?userName=${pageContext.request.userPrincipal.name }" method="post" modelAttribute="writeContent">
					<form:hidden path="contentIdx"/>
						<div class="form-group"><form:label path="subject"><spring:message code="tmenu.qna.subject"/></form:label>
						<form:input path="subject" class="form-control"/>
						<form:errors path="subject" style="color:red"></form:errors>
						</div>
						<div class="form-group">
							<form:label path="text"><spring:message code="tmenu.qna.text"/></form:label>
							<form:textarea path="text" class="form-control" rows="10" style="resize:none"/>
							<form:errors path="text" style="color:red"></form:errors>
						</div>
						<div style="margin-bottom: 30px;">
							<span>공개여부</span>
							<div>
								<input type="radio" name="open" value="Y" class="radio" /><span class="ml_10"><spring:message code="tmenu.qna.open"/></span>&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="open" value="N" class="radio" /><span class="ml_10"><spring:message code="tmenu.qna.secret"/></span>&nbsp;
							</div>
						</div>

						<div class="form-group">
							<div class="text-center">
								<a href="${root }qna/list" id="qna-write-cancel-btn" class="btn btn-info"><spring:message code="tmenu.qna.write.reset"/></a>
								<button type="submit" id="qna-write-submit-btn" class="btn btn-primary"><spring:message code="tmenu.qna.write.write"/></button>
							</div>
						</div>
					
					</form:form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>

</body>
</html>

