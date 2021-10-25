<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="new-section">
	<div class="row">
		<div class="col-lg-10 col-md-8 col-sm-11 new-card-wrapper">
			<div class="new-card-title">
				<span>Q&A</span>
			</div>
			<div class="input-group mb-3">
  				<div class="input-group-prepend">
    				<span class="input-group-text">제목</span>
  				</div>
  				<input id="qna-new-title" type="text" class="form-control" aria-label="Dollar amount (with dot and two decimal places)">
			</div>
			<div class="input-group mb-3">
  				<div class="input-group-prepend">
    				<span class="input-group-text">작성자</span>
  				</div>
  				<input type="text" class="form-control" aria-label="Dollar amount (with dot and two decimal places)">
			</div>
			<div class="input-group mb-3">
  				<div class="input-group-prepend">
    				<span class="input-group-text">내용</span>
  				</div>
  				<input id="qna-new-content" type="text" class="form-control" aria-label="Dollar amount (with dot and two decimal places)">
			</div>
			<div class="input-group mb-3">
  				<div class="input-group-prepend">
    				<span class="input-group-text">비공개 설정</span>
    			<div class="form-check form-check-inline">
  					<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
   					<label class="form-check-label" for="inlineRadio1">공개</label>
   				</div>
				<div class="form-check form-check-inline">
  					<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
 				 	<label class="form-check-label" for="inlineRadio2">비공개</label>
				</div>
				</div>
			</div>
			<div class="input-group mb-3">
  				<div class="input-group-prepend">
    				<span class="input-group-text">비밀번호</span>
  				</div>
  				<input type="password" class="form-control" aria-label="Dollar amount (with dot and two decimal places)">
			</div>
		<div class="text-right">
	 	<button type="button" class="btn btn-secondary btn-sm cancel-btn">
			<span>취소</span>
		</button>
		<button type="button" class="btn btn-secondary btn-sm save-btn">
			<span>등록</span>
		</button>
		</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function(){
	$(".cancel-btn").on("click", function(){
		if(confirm("글쓰기를 취소하시겠습니까?")) {
			location.href="/qna/list";
		}
	});
	
	$(".save-btn").on("click", function(){
		var title = $("#qna-new-title").val();
		var content = $("#qna-new-content").val();
		console.log(title);
		console.log(content);
		$.ajax({
			type: "post",
			url: "/qna/new",
			contentType: "application/json",
			dataType:"json",
			data: {
				title: title,
				content: content
			},
			success: function(result) {
				console.log(result);
				if(result.result == true) {
					
					alert("등록에 성공했습니다.");
					location.href="/qna/list";
				} else if(result.result == false) {
					alert("등록에 실패했습니다.");
				}
			}
		})
	});
});
</script>