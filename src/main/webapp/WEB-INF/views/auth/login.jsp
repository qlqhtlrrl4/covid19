<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!doctype html>
<html lang="ko">
<head>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<link rel="shortcut icon" href="#">

<title>Login</title>

<!-- Bootstrap core CSS -->
<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<c:url value="/resources/css/carousel.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/app.css"/>" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/resources/js/waypoints.min.js"/>"></script>
<!-- <script src="<c:url value="/resources/js/jquery.counteup.js"/>"></script> -->
</head>
<body>
<div class="logo-title-wrapper">
	<span class="logo-title">CORONA
		<span class="logo-text-skyblue">
			LIVE
		</span>
	</span>
</div>
<div class="login-section">
	<div class="row">
		<div class="col-lg-5 col-md-10 col-sm-11 login-card-wrapper">
			<div class="login-input-wrapper">
				<form>
					<div class="form-group">
						<div class="login-title">
							<span>로그인</span>
						</div>
						<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="아이디">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="exampleInputPassword1" placeholder="비밀번호">
					</div>
					<button type="submit" class="btn btn-primary">로그인</button>
				</form>
			</div>
		</div>
	</div>
</div>
<ul class="loginfindAndjoin">
	<li><a>아이디 찾기</a></li>
	<li><a>비밀번호 찾기</a></li>
	<li><a>회원가입</a></li>
</ul>
</body>
</html>
