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
  <div class="nav-info-card">
  	<div class="row">
  		<div class="col-4">
  			<div class="nav-info-icons-wrapper">
  				<i class="fas fa-user-circle"></i>
  			</div>
  		</div>
  		<div class="col-8">
  			<span class="nav-info-text">안녕하세요,</span><br/>
  			<span class="nav-info-text nav-info-text-name">김선호님</span>
  		</div>
  	</div>
  
  </div>
</nav>