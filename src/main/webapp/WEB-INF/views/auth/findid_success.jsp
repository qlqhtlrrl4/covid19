<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
</head>
<body>
	당신의 아이디는 ${user.id } 입니다. <br />
	
	<a href="/auth/login">로그인</a> &nbsp;&nbsp;
	<a href="/auth/findpw">비밀번호찾기</a>
</html>