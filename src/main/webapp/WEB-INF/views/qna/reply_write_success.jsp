<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	alert('댓글작성이 완료되었습니다.')
	location.href="/qna/read?userName=${userName}&contentIdx=${contentIdx}"
</script>