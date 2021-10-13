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
 					<div class="hospital-list-title">
 						<span>접종기관 목록</span>
 					</div>
 					<div class="input-group rounded">
						<input type="search" class="form-control rounded" placeholder="Search" aria-label="Search"
						  aria-describedby="search-addon" />
						<span class="input-group-text border-0" id="search-addon">
						    <i class="fas fa-search"></i>
						</span>
					</div>
 					<div class="list-group">
					  
					  <c:forEach var="covidHospital" items="${covidhospitals}" varStatus="status">
						<div class="list-group-item list-group-item-action">
							<div class="hospital-title">
								<h6 class="mb-1"><c:out value="${covidHospital.orgnm}"/></h6>
								<i class="fas fa-arrow-circle-right"></i>
							</div>
							<div class="hospital-info">
								<p class="mb-1"><c:out value="${covidHospital.orgZipaddr}"/></p>
								<small><c:out value="${covidHospital.orgTlno}"/></small>
							</div>
							<div class="hospital-icon">
								<a href="/search/${covidHospital.id}/detail" style="color: #495057;">
									<i class="far fa-hospital"></i>
								</a>
							</div>
						</div>
					</c:forEach>
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