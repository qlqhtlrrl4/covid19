<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
			<!-- 게시글 리스트 -->
   <div class="container">
      <br />
      <h3 id="font-h3">QnA</h3>
      <!-- 검색 영역 시작-->
      <form action="/qna/list" class="form-inline d-flex justify-content-end" method="GET">
         <select name="field" id="field" class="form-control form-control-sm">
            <option value="subject"><spring:message code="tmenu.qna.subject"/></option>
            <option value="text"><spring:message code="tmenu.qna.text"/></option>
            <option value="writer"><spring:message code="tmenu.qna.writerName"/></option>
         </select> 
         <input type="text" id="word" name="word" class="form-control form-control-sm" style="margin: 10px;">
         <input type="submit" class="btn btn-outline-info btn-sm" value="<spring:message code="tmenu.qna.search"/>">
      </form>
      <!-- 검색 영역 끝 -->
      <!-- 테이블 영역 시작-->
      <table class="table table-hover">
         <caption><spring:message code="tmenu.qna.totalContent"/>: ${contentlist.totalElements}</caption>
     
         <!-- 게시글 수 -->
         <tr>
            <th><spring:message code="tmenu.qna.contentIdx"/></th>
            <th><spring:message code="tmenu.qna.subject"/></th>
            <th><spring:message code="tmenu.qna.text"/></th>
            <th><spring:message code="tmenu.qna.writerName"/></th>
            <th><spring:message code="tmenu.qna.date"/></th>
            <th><spring:message code="tmenu.qna.count"/></th>
         </tr>
         <c:forEach items="${contentlist.content}" var="cont" varStatus="status">
            <tr>
               <c:if test="${cont.open == 'N'}" >
            <c:choose>
               <c:when test="${cont.writerIdx.id == pageContext.request.userPrincipal.name || pageContext.request.userPrincipal.name == 'admin' }">
                 <td>${contentlist.totalElements-(((pageNumber)*10) + status.index)}</td>
               <c:if test="${lang == 'ko' || lang == null }">
               <td><a href="/qna/read?contentIdx=${cont.contentIdx}"><c:out value="${cont.subject}"/></a></td>
               <td><c:out value="${cont.text}"/></td>
               </c:if>
               <c:if test="${lang == 'en'}">
               <td><a href="/qna/read?contentIdx=${cont.contentIdx}&lang=en"><c:out value="${cont.ensubject}"/></a></td>
               <td><c:out value="${cont.entext}"/></td>
               </c:if>
               <td><c:out value="${cont.writer}"/></td>
               <td><c:out value="${cont.date}"/></td>
               <fmt:parseNumber var="percent" value="${cont.count div 2}" integerOnly="true" />
               <td><c:out value="${percent }"/></td>
               </c:when>
               <c:otherwise>
              	<td>${contentlist.totalElements-(((pageNumber)*10) + status.index)}</td>
               <td colspan="5"><spring:message code="tmenu.qna.privateContent"/></td>
               </c:otherwise>
            </c:choose>
        </c:if>
        <c:if test="${cont.open == 'Y'}" >
        	   <td>${contentlist.totalElements-(((pageNumber)*10) + status.index)}</td>
               <c:if test="${lang == 'ko' || lang == null }">
               <td><a href="/qna/read?contentIdx=${cont.contentIdx}"><c:out value="${cont.subject}"/></a></td>
               <td><c:out value="${cont.text}"/></td>
               </c:if>
               <c:if test="${lang == 'en'}">
               <td><a href="/qna/read?contentIdx=${cont.contentIdx}&lang=en"><c:out value="${cont.ensubject}"/></a></td>
               <td><c:out value="${cont.entext}"/></td>
               </c:if>
               <td>${cont.writer }</td>
               <td>${cont.date}</td>
               <fmt:parseNumber var="percent" value="${cont.count div 2}" integerOnly="true" />
               <td><c:out value="${percent }"/></td>
        </c:if>
            </tr>
       
         </c:forEach>
      </table>
      <!-- 테이블 영역 끝 -->
      <!-- 페이징 영역 시작 -->
      <div class="text-xs-center">
         <ul class="pagination justify-content-center">
            <!-- 이전 -->
            <c:choose>
               <c:when test="${contentlist.first}"></c:when>
               <c:otherwise>
                  <li class="page-item"><a class="page-link"
                     href="/qna/list/?field=${param.field}&word=${param.word}&page=0"><spring:message code="tmenu.qna.first"/></a></li>
                  <li class="page-item"><a class="page-link"
                     href="/qna/list/?field=${param.field}&word=${param.word}&page=${contentlist.number-1}">&larr;</a></li>
               </c:otherwise>
            </c:choose>
            <!-- 페이지 그룹 -->
            <c:forEach begin="${startBlockPage}" end="${endBlockPage}" var="i">
               <c:choose>
                  <c:when test="${contentlist.pageable.pageNumber+1 == i}">
                     <li class="page-item disabled"><a class="page-link"
                        href="/qna/list/?field=${param.field}&word=${param.word}&page=${i-1}">${i}</a></li>
                  </c:when>
                  <c:otherwise>
                     <li class="page-item"><a class="page-link"
                        href="/qna/list/?field=${param.field}&word=${param.word}&page=${i-1}">${i}</a></li>
                  </c:otherwise>
               </c:choose>
            </c:forEach>
            <!-- 다음 -->
            <c:choose>
               <c:when test="${contentlist.last}"></c:when>
               <c:otherwise>
                  <li class="page-item "><a class="page-link"
                     href="/qna/list/?field=${param.field}&word=${param.word}&page=${contentlist.number+1}">&rarr;</a></li>
                  <li class="page-item "><a class="page-link"
                     href="/qna/list/?field=${param.field}&word=${param.word}&page=${contentlist.totalPages-1}"><spring:message code="tmenu.qna.last"/></a></li>
               </c:otherwise>
            </c:choose>
         </ul>
      </div>
      <!-- 페이징 영역 끝 -->
			<div class="text-right">
				<c:if test="${pageContext.request.userPrincipal.name != null }">
				<a href="${root }qna/write" class="btn btn-primary"><spring:message code="tmenu.qna.write"/></a>
				</c:if>
			</div>
			
		</div>
</body>
</html>






