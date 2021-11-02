<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
					<div class="form-group">
						<label for="subject"><spring:message code="tmenu.qna.writerName"/></label>
						<input type="text" id="" name="" class="form-control" value="${readContent.writer}" disabled="disabled"/>
					</div>
					<div class="form-group">
						<label for="date"><spring:message code="tmenu.qna.date"/></label>
						<input type="text" id="date" name="date" class="form-control" value="${readContent.date }" disabled="disabled"/>
					</div>
					
					<c:if test="${lang eq 'ko' || lang eq null }">
					<div class="form-group">
						<label for="subject"><spring:message code="tmenu.qna.subject"/></label>
						<input type="text" id="subject" name="subject" class="form-control" value="${readContent.subject }" disabled="disabled"/>
					</div>
					<div class="form-group">
						<label for="text"><spring:message code="tmenu.qna.text"/></label>
						<textarea id="text" name="text" class="form-control" rows="10" style="resize:none" disabled="disabled">${readContent.text }</textarea>
						
					</div>
					</c:if>
					
					<c:if test="${lang eq 'en'}">
					<div class="form-group">
						<label for="subject"><spring:message code="tmenu.qna.subject"/></label>
						<input type="text" id="ensubject" name="ensubject" class="form-control" value="${readContent.ensubject }" disabled="disabled"/>
					
					</div>
					<div class="form-group">
						<label for="text"><spring:message code="tmenu.qna.text"/></label>
						<textarea id="entext" name="entext" class="form-control" rows="10" style="resize:none" disabled="disabled">${readContent.entext }</textarea>
					</div>
					</c:if>
					
					
					
					<a href="/qna/read?contentIdx=${readContent.contentIdx }&lang=ko">한국어</a> 
					<a href="/qna/read?contentIdx=${readContent.contentIdx }&lang=en">영어</a> 
					
					
					<div class="form-group">
						<div class="text-right">
							<a href="${root }qna/list" class="btn btn-primary"><spring:message code="tmenu.qna.read.list"/></a>
							<c:if test="${readContent.writerIdx.id == pageContext.request.userPrincipal.name || pageContext.request.userPrincipal.name == 'admin' || pageContext.request.userPrincipal.name != null }">
							<a href="/qna/reply_write?contentIdx=${readContent.contentIdx}" class="btn btn-info"><spring:message code="tmenu.qna.read.comment"/></a>
							</c:if>
							<c:if test="${readContent.writerIdx.id == pageContext.request.userPrincipal.name || pageContext.request.userPrincipal.name == 'admin'}">
							<a href="${root }qna/modify?contentIdx=${readContent.contentIdx}" class="btn btn-info"><spring:message code="tmenu.qna.read.modify"/></a>
							<a href="${root }qna/delete?contentIdx=${readContent.contentIdx}" class="btn btn-danger"><spring:message code="tmenu.qna.read.delete"/></a>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>
<c:if test="${replyList ne null }">
    <c:forEach items="${replyList}" var="replyList" >
        작성자 : ${replyList.name} &nbsp; &nbsp; &nbsp; ${replyList.content} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 작성 날짜 : ${replyList.date } 
         &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a href="/qna/reply_delete?contentIdx=${readContent.contentIdx}&replyIdx=${replyList.replyIdx}">삭제하기</a><br>
    </c:forEach>   
</c:if>
</body>
</html>

