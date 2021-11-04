<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
</head>
<body>
	
	<script>
		alert("아이디"+${user.id}+"입니다")
		location.href="${pageContext.request.contextPath}"	
	</script>
</html> -->
<script>
		alert("아이디는 "+"${user.id}"+"입니다")
		location.href="/auth/login"	
	</script>