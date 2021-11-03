<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>댓글 달기</title>
<!-- Bootstrap CDN -->
</head>
<body>

<div class="container" style="margin-top:100px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
					<form:form action="/qna/reply_write_pro?userName=${pageContext.request.userPrincipal.name }&contentIdx=${contentIdx }" method="post" modelAttribute="writeReply">
						<div class="form-group">
							<form:label path="content">댓글 내용</form:label>
							<form:textarea path="content" class="form-control" rows="10" style="resize:none"/>
							<form:errors path="content" style="color:red"></form:errors>
						</div>
						<div class="form-group">
							<div class="text-right">
								<button type="submit" class="btn btn-primary">작성하기</button>
								<a href="/qna/read?contentIdx=${contentIdx}" class="btn btn-info">취소</a>
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
