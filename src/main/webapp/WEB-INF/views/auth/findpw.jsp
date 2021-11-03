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
<title>findid</title>
<!-- Bootstrap CDN -->
</head>
<body>

<div class="container" style="margin-top:100px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
		<c:if test="${not empty errorMsg }">
					<div style="color: #ff0000;">
						<h3>${errorMsg }</h3>
					</div>
				</c:if>
			<div class="card shadow">
				<div class="card-body">
					<form:form action="/auth/findpw_pro" method="GET" modelAttribute="findpw">
						<div class="form-group"><form:label path="id"><spring:message code="join.id"/></form:label>
						<form:input path="id" class="form-control"/>
						<form:errors path="id" style="color:red"></form:errors>
						</div>
						<div class="form-group">
							<form:label path="email"><spring:message code="join.email"/></form:label>
							<form:input path="email" class="form-control" rows="10" style="resize:none"/>
							<form:errors path="email" style="color:red"></form:errors>
						</div>
						
						<div class="form-group">
							<form:label path="name"><spring:message code="join.name"/></form:label>
							<form:input path="name" class="form-control" rows="10" style="resize:none"/>
							<form:errors path="name" style="color:red"></form:errors>
						</div>
						
						<div class="form-group">
							<div class="text-right">
								<button type="submit" class="btn btn-primary"><spring:message code="login.findpassword"/></button>
								<a href="/auth/login" class="btn btn-info"><spring:message code="join.reset"/></a>
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

