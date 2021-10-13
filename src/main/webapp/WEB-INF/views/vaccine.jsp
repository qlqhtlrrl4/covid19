<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>


<div class="vaccine-main">
	<div class="row">
		<div class="col-lg-2dot5 col-md-3 col-sm-12">
			<div class="summary-left-pane">
				<div class="accordion" id ="vaccineAccordion">
					<div class="card">
						<div class="card-header" id ="headingOne">
							<h2 class="mb-0">
								<a class="btn btn-link btn-block text-left panel-title" type="button" data-toggle="collapse" data-targer="#collapseOne">
									<span class="card-header-title">백신</span>
									<div>
										<i class="fa fa-chevron-up arrow-icon"></i>
									</div>
								</a>
							</h2>
						</div> <!-- card-header -->
						
						<div id="collapseOne" class="collapse" data-parent="vaccineAccordion">
							<div class="card-body">
								지역
								<label class="switch">
									
								</label>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> <!-- col-lg-3 -->
		
		<div class="col-lg-9dot5 col-md-9 col-sm-12">
			<div class="row">
				<div class="col-9">
					<div class="vaccine-info-count-wrapper">
						<div class="row">
							<div class="col-6">
								<span class="vaccine-info-count-title">1차 접종현황</span>
								<span class="vaccine-color-gray counter"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vaccineData.totalFirstCnt}"/></span>
								<span class="vaccine-color-gray badge badge-pill badge-primary badge-color-gray"></span>
							</div>
							
							<div class="col-6">
								<span class="vaccine-info-count-title">접종완료 현황</span>
								<span class="vaccine-color-gray counter"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vaccineData.totalSecondCnt}"/></span>
								<span class="vaccine-color-gray badge badge-pill badge-primary badge-color-gray"></span>
							</div>
						</div>
					</div>
				</div> <!-- col-9 -->
				
				<div class="col-3">
					<div class="vaccine-info-graph-wrapper">
						접종완료 그래프 넣을곳
					</div>
				</div>
			</div>
		</div>
	</div> 
</div> <!-- vaccine main div -->

<script>
$(document).ready(function() {
	
	$.ajax({
		url:'/vaccineStatus',
		type:'get',
		dataType : 'json',
		
		success : function(data) {
			
		}
	});
});

</script>