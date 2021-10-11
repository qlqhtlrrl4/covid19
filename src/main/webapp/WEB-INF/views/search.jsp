<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=fjpe07eakb"></script>

 <div class="search-main">
 	<div class="row">
 		<div class="col-lg-8 col-md-9 col-sm-12" >
	 		<div class="map">
	 			<div id="map" style="width:100%;height:400px;"></div>
	 		</div>
 		</div>
 		<div class="col-lg-4 col-md-6 col-sm-12">
 			<div class="row justify-content-end">
 				<div class="hospital-list">
 					<div class="list-group">
					  <a href="#" class="list-group-item list-group-item-action" data-lat="37.568528578992485" data-lng="126.96748460011354">
					    <div class="d-flex w-100 justify-content-between">
					      <h5 class="mb-1">강북삼성병원</h5>
					      <small>종합병원</small>
					    </div>
					    <p class="mb-1">서울 종로구 새문안로 29 강북삼성병원</p>
					    <small>1599-8114</small>
					  </a>
					  <a href="#" class="list-group-item list-group-item-action" data-lat="37.5623824610252" data-lng="126.94086915797588">
					    <div class="d-flex w-100 justify-content-between">
					      <h5 class="mb-1">세브란스병원</h5>
					      <small class="text-muted">종합병원</small>
					    </div>
					    <p class="mb-1">서울 서대문구 연세로 50-1</p>
					    <small class="text-muted">1599-1004</small>
					  </a>
					  <a href="#" class="list-group-item list-group-item-action" data-lat="37.57972146304682" data-lng="126.99910293184942">
					    <div class="d-flex w-100 justify-content-between">
					      <h5 class="mb-1">서울대학병원</h5>
					      <small class="text-muted">종합병원</small>
					    </div>
					    <p class="mb-1">서울 종로구 대학로 101</p>
					    <small class="text-muted">1588-5700</small>
					  </a>
					</div>			
 				</div>
 			</div>
 		</div>
 	</div>
 </div>
 
 <script>
    $(function() {
	    var loca = new naver.maps.LatLng(37.557731, 126.924392);
	    var mapOptions = {
	        center: loca,
	        zoom: 17
	    };
	    
	    var map = new naver.maps.Map('map', mapOptions);
	    var marker = new naver.maps.Marker({
	        position: loca,
	        map: map
	    });
	    
	    $(".list-group-item-action").on('click', function(){
	    	$(".list-group-item-action").removeClass('active');
	    	$(this).addClass('active');
	    	
	    	var lat = $(this).data('lat');
	    	var lng = $(this).data('lng');
	    	
	    	var loca = new naver.maps.LatLng(lat, lng);
		    var mapOptions = {
		        center: loca,
		        zoom: 17
		    };
		
		    var map = new naver.maps.Map('map', mapOptions);
		    var marker = new naver.maps.Marker({
		        position: loca,
		        map: map
		    });
	    });
    });
    
    

</script>