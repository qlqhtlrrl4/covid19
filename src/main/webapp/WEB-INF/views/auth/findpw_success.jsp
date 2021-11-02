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
<title>findpw</title>
<!-- Bootstrap CDN -->
</head>
<body>

<div class="container" style="margin-top:100px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
				
					<form:form action="/auth/findpw_pro2?id=${id}" method="post" modelAttribute="findpw">
						<div class="form-group"><form:label path="name">비밀번호 재설정</form:label>
						<form:input path="password" class="form-control"/>
						<form:errors path="password"/>
						</div>
						<div class="form-group">
							<form:input path="password_check" class="form-control" rows="10" style="resize:none"/>
							<form:errors path="password_check"/>
						</div>
						
						<div class="form-group">
							<div class="text-right">
								<button type="submit" class="btn btn-primary">완료</button>
								<a href="/auth/login" class="btn btn-info">취소</a>
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

