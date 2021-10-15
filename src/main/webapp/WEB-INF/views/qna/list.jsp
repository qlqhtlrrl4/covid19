<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<div class="qna-section">
	<div class="row">
		<div class="col-lg-10 col-md-8 col-sm-11 qna-card-wrapper">
			<div class="qna-card-title">
				<span>Q&A</span>
			</div>
			<div class="qna-card-dropdown">
  			<select class="form-select" aria-label="Default select example">
  				<option selected>Filters</option>
  				<option value="1">제목</option>
  				<option value="2">내용</option>
  				<option value="3">제목+내용</option>
  				<option value="4">작성자</option>
			</select>
  			<div class="input-group rounded">
    			<input type="search" class="form-control rounded" placeholder="Search" aria-label="Search"
      			aria-describedby="search-addon" />
    			<span class="input-group-text border-0" id="search-addon">
      				<i class="fas fa-search"></i>
    			</span>
  			</div>
			</div>
			<div class="qna-card">
  				<div class="qna-card-head">
    				<span class="qna-head-number">번호</span>
    				<span class="qna-head-title">제목</span>
    				<span class="qna-head-writer">작성자</span>
    				<span class="qna-head-date">작성일</span>
    				<span class="qna-head-hits">조회수</span>
  				</div>
  				<div class="qna-card-list">
  					<span class="qna-list-number">3</span>
  					<span class="qna-list-title"><a>질문 있어요!</a></span>
  					<span class="qna-list-writer">김**</span>
  					<span class="qna-list-date">21.05.05</span>
  					<span class="qna-list-hits">2455</span>
  				</div>
  				<div class="qna-card-list">
  					<span class="qna-list-number">3</span>
  					<span class="qna-list-title"><a>비밀글 입니다.</a></span>
  					<span class="qna-list-writer">이**</span>
  					<span class="qna-list-date">21.05.05</span>
  					<span class="qna-list-hits">2455</span>
  				</div>
  				<div class="qna-card-list">
  					<span class="qna-list-number">3</span>
  					<span class="qna-list-title"><a>파일 다운로드가 안돼요.</a></span>
  					<span class="qna-list-writer">최**</span>
  					<span class="qna-list-date">21.05.05</span>
  					<span class="qna-list-hits">2455</span>
  				</div>
			</div>
			<button type="button" class="btn btn-secondary btn-sm">
				<span>글쓰기</span>
				<i class="fas fa-pen"></i>
			</button>
			<nav aria-label="Page navigation example">
  				<ul class="pagination">
    				<li class="page-item">
      					<a class="page-link" href="#" aria-label="Previous">
        					<span aria-hidden="true">&laquo;</span>
        					<span class="sr-only">Previous</span>
      					</a>
    				</li>
    				<li class="page-item"><a class="page-link" href="#">1</a></li>
    				<li class="page-item"><a class="page-link" href="#">2</a></li>
    				<li class="page-item"><a class="page-link" href="#">3</a></li>
    				<li class="page-item">
      					<a class="page-link" href="#" aria-label="Next">
        					<span aria-hidden="true">&raquo;</span>
        					<span class="sr-only">Next</span>
      					</a>
    				</li>
 				 </ul>
			</nav>
		</div>
	</div>
</div>