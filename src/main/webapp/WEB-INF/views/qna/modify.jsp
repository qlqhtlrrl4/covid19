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
		<div class="col-12" style="margin-bottom: 60px">
			<div class="card shadow" style="background-color: rgb(245,245,245);">
				<div class="card-body">
					<form:form action="${root }qna/modify_pro" method="get" modelAttribute="modifyContent">
					<form:hidden path="contentIdx"/>
						<div class="form-group">
							<form:label path="writerIdx.name"><spring:message code="tmenu.qna.writerName"/></form:label>
							<input type="text" class="form-control" value="${modiContent.writerIdx.name }" disabled="disabled"/>
						</div>
						<div class="form-group">
							<form:label path="date"><spring:message code="tmenu.qna.date"/></form:label>
							<form:input path="date" class="form-control" readonly="true"/>
						</div>
						<div class="form-group">
							<form:label path="subject"><spring:message code="tmenu.qna.subject"/></form:label>
							<form:input path="subject" class="form-control"/>
						</div>
						<div class="form-group">
							<form:label path="text"><spring:message code="tmenu.qna.text"/></form:label>
							<form:textarea path="text" class="form-control" rows="10" style="resize:none"/>
						</div>
						<div class="form-group">
							<div class="text-center">
								<a id="qna-modify-cancel-btn" href="${root }qna/list" class="btn btn-info"><spring:message code="tmenu.qna.modify.reset"/></a>
								<button id="qna-modify-submit-btn" type="submit" class="btn btn-primary"><spring:message code="tmenu.qna.modify.submit"/></button>
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

