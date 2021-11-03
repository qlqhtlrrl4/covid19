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

<title><tiles:insertAttribute name="title" /></title>

<!-- Bootstrap core CSS -->
<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<c:url value="/resources/css/carousel.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/app.css"/>" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
<script src="<c:url value="/resources/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/resources/js/waypoints.min.js"/>"></script>
<script src="${pageContext.request.contextPath}/resources/js/handlebars-v4.5.3.min.js" type="text/javascript"></script>

<script src="${pageContext.request.contextPath}/resources/js/handlebars-helper.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/vaccine-location.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/home-vaccine.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/details-bar-chart.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/location-bar-chart.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/location-pie-chart.js" type="text/javascript"></script>
<!-- <script src="<c:url value="/resources/js/jquery.counteup.js"/>"></script> -->
</head>
<body>

	<div>
		<tiles:insertAttribute name="menu" />
		<div class="body-wrapper">
		<tiles:insertAttribute name="body" />
		</div>
		<tiles:insertAttribute name="footer" />
	</div>

	
	
</body>
</html>
