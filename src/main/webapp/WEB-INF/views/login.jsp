<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="container-wrapper">
	<div class="container">
		<h2><spring:message code="login.index" /></h2>

		<c:if test="${not empty errorMsg }">
			<div style="color: #ff0000;">
				<h3>${errorMsg }</h3>
			</div>
		</c:if>
		
		<c:if test="${not empty logoutMsg }">
			<div style="color: #0000ff;">
				<h3>${logoutMsg }</h3>
			</div>
		</c:if>

		<form action="<c:url value="login"/>" method="post">
			<div class="form-group">
				<label for="username"><spring:message code="login.id" /> :</label> <input type="text" class="form-control" id="id" placeholder="<spring:message code='login.Idplaceholder' />" name="username" style="width: 50%">
			</div>
			<div class="form-group">
				<label for="password"><spring:message code="login.password" />:</label> <input type="password" class="form-control" id="password" placeholder="<spring:message code='login.Pwplaceholder' />" name="password" style="width: 50%">
			</div>

			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

			<button type="submit" class="btn btn-primary"><spring:message code="login.submit" /></button>

		</form>
	
			<a href ="${pageContext.request.contextPath}/join"> <spring:message code="login.join" /> </a>
	</div>
</div>