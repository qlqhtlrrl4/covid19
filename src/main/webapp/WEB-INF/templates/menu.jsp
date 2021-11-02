<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<nav class="navbar navbar-expand-lg navbar-light">
  <a class="navbar-brand" href="/">CORONA <span class="logo-text-skyblue">TIMES</span></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link <c:if test='${active eq "home"}'>active</c:if>" href="/">코로나 19</a>
      </li>
      <li class="nav-item">
        <a class="nav-link <c:if test='${active eq "vaccine"}'>active</c:if>" href="/vaccine">백신</a>
      </li>
       <li class="nav-item">
        <a class="nav-link <c:if test='${active eq "search"}'>active</c:if>" href="/search">병원찾기</a>
      </li>
       <li class="nav-item">
        <a class="nav-link <c:if test='${active eq "qna"}'>active</c:if>" href="/qna/list">Q&A</a>
      </li>
    </ul>
  </div>
  
  	<c:if test="${path ne 'read' }">
		<div class="dropdown show">
  			<a class="btn btn-secondary dropdown-toggle" href="?lang=ko" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    			한국어
 			</a>
			<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
    			<a class="dropdown-item" href="?lang=en">English</a>
  			</div>
		</div>
	</c:if>
  
	<c:if test="${pageContext.request.userPrincipal.name == null}">
  		<div class="navbar-user-wrapper">
  			<a class="nav-link" href="/auth/login">로그인</a>
			<a class="nav-link" href="/auth/join">회원가입</a>
  		</div>							
	</c:if>
  
  		<c:if test="${pageContext.request.userPrincipal.name != null}">
  			<div class="nav-user-info-wrapper">
  				<div class="nav-info-icons-wrapper">
  					<i class="fas fa-user-circle"></i>
  					<!-- <a class="nav-link" href="#"><i class="fas fa-user-circle"></i></a> -->
  				</div>
  			
  				<div>
  					<span class="nav-info-text">안녕하세요,</span><br>
  					<span class="nav-info-text nav-info-text-name">${pageContext.request.userPrincipal.name}님</span><br/>
  				</div>	
  			
  			
  				<span class="nav-info-text">
  					<a class="nav-link" href="/logout">로그아웃</a>
  				</span>
  			</div>
  			
  		</c:if>
  	
  	<!-- <div class="navbar-user-wrapper">
  			<a class="nav-link" href="/auth/login">로그인</a>
			<a class="nav-link" href="/auth/join">회원가입</a>
  	</div> -->
  
  
</nav>