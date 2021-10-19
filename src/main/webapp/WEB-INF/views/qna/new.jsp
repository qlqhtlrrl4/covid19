<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<form>
	 <div class="form-group">
		 <label for="formGroupExampleInput">제목</label>
		 <input type="text" class="form-control" id="qna-new-title" placeholder="Example input">
	 </div>
	 <div class="form-group">
		<label for="exampleFormControlTextarea1">내용</label>
		<textarea class="form-control" id="qna-new-content" rows="10"></textarea>
	 </div>
	 <div class="text-right">
	 	<button type="button" class="btn btn-secondary btn-sm cancel-btn">
			<span>취소</span>
		</button>
		<button type="button" class="btn btn-secondary btn-sm save-btn">
			<span>등록</span>
		</button>
	</div>
</form>

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