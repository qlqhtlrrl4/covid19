<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<div class="main-section">
	<div class="row">
		<div class="col-lg-2dot5 col-md-3 col-sm-12 media-margin-bottom-20">
			<div class="summary-left-pane">
				<div class="accordion" id="accordionExample">
				  <div class="card active">
				    <div class="card-header" id="headingOne">
				      <h2 class="mb-0">
				        <a class="btn btn-link btn-block text-left panel-title" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				          <span class="card-header-title">국내</span>
				          <div>
				          	<i class="fa fa-chevron-up arrow-icon"></i>
				          </div>
				        </a>
				      </h2>
				    </div>
				
				    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
				      <div class="card-body">
				        성별 
				        <label class="switch">
							<input id="sex-check-box" type="checkbox" class="chart-toggle-btn primary-confirmed" checked>
							<span id="sex-toggle" class="slider round"></span>
						</label>
				      </div>
				      <div class="card-body">
				        연령
				        <label class="switch">
							<input id="age-check-box" type="checkbox" class="chart-toggle-btn primary-confirmed "checked>
							<span id="age-toggle" class="slider round"></span>
						</label>
				      </div>
				      <div class="card-body">
				        지역
				        <label class="switch">
							<input id="area-check-box" type="checkbox" class="chart-toggle-btn primary-confirmed" checked>
							<span id="area-toggle" class="slider round"></span>
						</label>
				      </div>
				    </div>
				  </div>
				  <div class="card">
				    <div class="card-header" id="headingTwo">
				      <h2 class="mb-0">
				        <a class="btn btn-link btn-block text-left panel-title" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
				          <span class="card-header-title">해외</span>
				          <div>
				          	<i class="fa fa-chevron-up arrow-icon"></i>
				          </div>
				        </a>
				      </h2>
				    </div>
				    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
				      <div class="card-body">
				        아시아
				        <label class="switch">
							<input type="checkbox" class="chart-toggle-btn primary-keep-distance">
							<span class="slider round"></span>
						</label>
				      </div>
				      <div class="card-body">
				        유럽
				        <label class="switch">
							<input type="checkbox" class="chart-toggle-btn primary-keep-distance">
							<span class="slider round"></span>
						</label>
				      </div>
				      <div class="card-body">
				        남아메리카
				        <label class="switch">
							<input type="checkbox" class="chart-toggle-btn primary-keep-distance">
							<span class="slider round"></span>
						</label>
				      </div>
				      <div class="card-body">
				        북아메리카
				        <label class="switch">
							<input type="checkbox" class="chart-toggle-btn primary-keep-distance">
							<span class="slider round"></span>
						</label>
				      </div>
				      <div class="card-body">
				        아프리카
				        <label class="switch">
							<input type="checkbox" class="chart-toggle-btn primary-keep-distance">
							<span class="slider round"></span>
						</label>
				      </div>
				      <div class="card-body">
				        오세아니아
				        <label class="switch">
							<input type="checkbox" class="chart-toggle-btn primary-keep-distance">
							<span class="slider round"></span>
						</label>
				      </div>
				    </div>
				  </div>
				  <div class="card">
				  	<div class="card-header" id="headingThree">
				      <h2 class="mb-0">
				        <a class="btn btn-link btn-block text-left panel-title" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
				          <span class="card-header-title">거리두기</span>
				          <div class="panel-title-icon">
				          	<i class="fa fa-chevron-up arrow-icon"></i>
				          </div>
				        </a>
				      </h2>
				    </div>
				    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
				      <div class="card-body">
				       단계별 정보
				       <label class="switch">
							<input type="checkbox" class="chart-toggle-btn primary-keep-distance">
							<span class="slider round"></span>
						</label>
				      </div>
				    </div>
				  </div>
				</div>
			</div>
		</div>
		<div class="col-lg-9dot5 col-md-9 col-sm-12">
			<div class="row">
				<div class="col-lg-9 col-md-12 media-margin-bottom-20">
					<div class="corona-info-count-wrapper">
						<div class="row">
							<div class="col-lg-3 col-md-6 col-sm-12 corona-info-wrapper">
								<span class="corona-info-count-title">확진자</span><br/>
								<span class="corona-color-pink counter" style="font-size: 26px;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${covidStatusData.decideCnt}" /></span><br/>
								<span class="corona-color-pink badge badge-pill badge-primary badge-color-pink"><i class="fas fa-arrow-up"></i><span class="corona-info-up-down-count"><fmt:formatNumber type="number" maxFractionDigits="3" value="${covidStatusData.decideCnt-covidYesterDayData.decideCnt }"/></span></span>
							</div>
							<div class="col-lg-3 col-md-6 col-sm-12 corona-info-wrapper">
								<span class="corona-info-count-title">검사자</span><br/>
								<span class="corona-color-grey counter" style="font-size: 26px;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${covidStatusData.accExamCnt}" /></span><br/>
								<span class="corona-color-grey badge badge-pill badge-primary badge-color-grey"><i class="fas fa-arrow-up"></i><span class="corona-info-up-down-count"><fmt:formatNumber type="number" maxFractionDigits="3" value="${covidStatusData.accExamCnt-covidYesterDayData.accExamCnt }"/></span></span>
							</div>
							<div class="col-lg-3 col-md-6 col-sm-12 corona-info-wrapper">
								<span class="corona-info-count-title">완치자</span><br/>
								<span class="corona-color-grey counter" style="font-size: 26px;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${covidStatusData.clearCnt}" /></span><br/>
								<span class="corona-color-grey badge badge-pill badge-primary badge-color-grey"><i class="fas fa-arrow-up"></i><span class="corona-info-up-down-count"><fmt:formatNumber type="number" maxFractionDigits="3" value="${covidStatusData.clearCnt-covidYesterDayData.clearCnt }"/></span></span>
							</div>
							<div class="col-lg-3 col-md-6 col-sm-12 corona-info-wrapper">
								<span class="corona-info-count-title">사망자</span><br/>
								<span class="corona-color-grey counter" style="font-size: 26px;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${covidStatusData.deathCnt}" /></span><br/>
								<span class="corona-color-grey badge badge-pill badge-primary badge-color-grey">
									<i class="fas fa-arrow-up"></i>
									<span class="corona-info-up-down-count"><fmt:formatNumber type="number" value="${covidStatusData.deathCnt-covidYesterDayData.deathCnt }"></fmt:formatNumber></span>
									
								</span>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-12">
					<div class="col-12" style="padding-left: 0; padding-right: 0;">
						<div class="summary-right-pane">
							<span class="date">${now}</span><br/>
							<div class="locationBtn"> 
								<i class="fas fa-map-marker-alt"></i>
								<span class="location-tilte">서울</span>
							</div>
							<div class="arrowAndamount">
								<i class="fas fa-arrow-up"></i>
								<span class="amount"><fmt:formatNumber type="number" maxFractionDigits="3" value="${covidStatusData.deathCnt}" /></span>
							</div>
							<span class="words">개인위생에 각별히 신경 쓰세요.</span>
							<button class="syringe-icon nav-link" id="vaccineBtn" disabled="disabled">
                                <i id="vaccineIcon" class="fas fa-syringe"></i>   
                            </button>
                            <c:if test="${pageContext.request.userPrincipal.name == null}">
                                <script>
                                $('#vaccineBtn').prop('disabled',true);
                                                         
                                </script>
                            </c:if>
                     
                            <c:if test="${pageContext.request.userPrincipal.name != null}">
                                <script>
                                    $('#vaccineBtn').prop('disabled',false);

                                </script>
                            </c:if>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div id="asia-country-list" style="background-color: var(--white-color);border-radius: 25px;text-align: center;padding: 30px;margin-top: 15px;">
						<table class="table">
							<thead>
								<tr>
									<th scope="col" style="width: 20%"></th>
									<th scope="col" style="width: 40%">국가명</th>
									<th scope="col" style="width: 40%">사망자수</th>
<%--									<th scope="col">사망비율</th>--%>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="asiaCountry" items="${asiaCountryList}" varStatus="status">
									<tr>
										<th scope="row"><img class="img-fluid" style="width: 60px;" src='<c:out value="${asiaCountry.imageFilepath}"/>'/></th>
<%--										<th scope="row"><c:out value="${asiaCountry.imageFilepath}"/></th>--%>
										<td><c:out value="${asiaCountry.nationNm}"/></td>
										<td><c:out value="${asiaCountry.natDeathCnt}"/></td>
<%--										<td><c:out value="${asiaCountry.natDeathRate}"/></td>--%>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-12">
					<div id="east-country-list" style="background-color: var(--white-color);border-radius: 25px;text-align: center;padding: 30px;margin-top: 15px;">
						<table class="table">
							<thead>
							<tr>
								<th scope="col" style="width: 20%"></th>
								<th scope="col" style="width: 40%">국가명</th>
								<th scope="col" style="width: 40%">사망자수</th>
								<%--									<th scope="col">사망비율</th>--%>
							</tr>
							</thead>
							<tbody>
							<c:forEach var="eastCountry" items="${eastCountryList}" varStatus="status">
								<tr>
									<th scope="row"><img class="img-fluid" style="width: 60px;" src='<c:out value="${eastCountry.imageFilepath}"/>'/></th>
										<%--										<th scope="row"><c:out value="${asiaCountry.imageFilepath}"/></th>--%>
									<td><c:out value="${eastCountry.nationNm}"/></td>
									<td><c:out value="${eastCountry.natDeathCnt}"/></td>
										<%--										<td><c:out value="${asiaCountry.natDeathRate}"/></td>--%>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-12">
					<div id="america-country-list" style="background-color: var(--white-color);border-radius: 25px;text-align: center;padding: 30px;margin-top: 15px;">
						<table class="table">
							<thead>
							<tr>
								<th scope="col" style="width: 20%"></th>
								<th scope="col" style="width: 40%">국가명</th>
								<th scope="col" style="width: 40%">사망자수</th>
								<%--									<th scope="col">사망비율</th>--%>
							</tr>
							</thead>
							<tbody>
							<c:forEach var="americaCountry" items="${americaCountryList}" varStatus="status">
								<tr>
									<th scope="row"><img class="img-fluid" style="width: 60px;" src='<c:out value="${americaCountry.imageFilepath}"/>'/></th>
										<%--										<th scope="row"><c:out value="${asiaCountry.imageFilepath}"/></th>--%>
									<td><c:out value="${americaCountry.nationNm}"/></td>
									<td><c:out value="${americaCountry.natDeathCnt}"/></td>
										<%--										<td><c:out value="${asiaCountry.natDeathRate}"/></td>--%>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-12">
					<div id="europe-country-list" style="background-color: var(--white-color);border-radius: 25px;text-align: center;padding: 30px;margin-top: 15px;">
						<table class="table">
							<thead>
							<tr>
								<th scope="col" style="width: 20%"></th>
								<th scope="col" style="width: 40%">국가명</th>
								<th scope="col" style="width: 40%">사망자수</th>
								<%--									<th scope="col">사망비율</th>--%>
							</tr>
							</thead>
							<tbody>
							<c:forEach var="europeCountry" items="${europeCountryList}" varStatus="status">
								<tr>
									<th scope="row"><img class="img-fluid" style="width: 60px;" src='<c:out value="${europeCountry.imageFilepath}"/>'/></th>
										<%--										<th scope="row"><c:out value="${asiaCountry.imageFilepath}"/></th>--%>
									<td><c:out value="${europeCountry.nationNm}"/></td>
									<td><c:out value="${europeCountry.natDeathCnt}"/></td>
										<%--										<td><c:out value="${asiaCountry.natDeathRate}"/></td>--%>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-12">
					<div id="oceania-country-list" style="background-color: var(--white-color);border-radius: 25px;text-align: center;padding: 30px;margin-top: 15px;">
						<table class="table">
							<thead>
							<tr>
								<th scope="col" style="width: 20%"></th>
								<th scope="col" style="width: 40%">국가명</th>
								<th scope="col" style="width: 40%">사망자수</th>
								<%--									<th scope="col">사망비율</th>--%>
							</tr>
							</thead>
							<tbody>
							<c:forEach var="oceaniaCountry" items="${oceaniaCountryList}" varStatus="status">
								<tr>
									<th scope="row"><img class="img-fluid" style="width: 60px;" src='<c:out value="${oceaniaCountry.imageFilepath}"/>'/></th>
										<%--										<th scope="row"><c:out value="${asiaCountry.imageFilepath}"/></th>--%>
									<td><c:out value="${oceaniaCountry.nationNm}"/></td>
									<td><c:out value="${oceaniaCountry.natDeathCnt}"/></td>
										<%--										<td><c:out value="${asiaCountry.natDeathRate}"/></td>--%>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-12">
					<div id="africa-country-list" style="background-color: var(--white-color);border-radius: 25px;text-align: center;padding: 30px;margin-top: 15px;">
						<table class="table">
							<thead>
							<tr>
								<th scope="col" style="width: 20%"></th>
								<th scope="col" style="width: 40%">국가명</th>
								<th scope="col" style="width: 40%">사망자수</th>
								<%--									<th scope="col">사망비율</th>--%>
							</tr>
							</thead>
							<tbody>
							<c:forEach var="africaCountry" items="${africaCountryList}" varStatus="status">
								<tr>
									<th scope="row"><img class="img-fluid" style="width: 60px;" src='<c:out value="${africaCountry.imageFilepath}"/>'/></th>
										<%--										<th scope="row"><c:out value="${asiaCountry.imageFilepath}"/></th>--%>
									<td><c:out value="${africaCountry.nationNm}"/></td>
									<td><c:out value="${africaCountry.natDeathCnt}"/></td>
										<%--										<td><c:out value="${asiaCountry.natDeathRate}"/></td>--%>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="corona-info-chart-wrapper">
						<span class="corona-info-chart-title">
							현황
						</span>	<br>
						
						<div class="chartdiv"></div>
							
					</div>
				</div>
			</div>
			
			<div class ="row" id="details-collection">
                <div class="col-lg-4 col-md-12">
                    <div class="corona-info-chart-wrapper" id="sex-chart-card">
                        <span class="corona-info-chart-title">
                            성별 확진자 비율
                        </span><br>
                        <div id="sex-bar-chart"></div>
                    </div>
                </div>
             
                <div class="col-lg-4 col-md-12">
                    <div class="corona-info-chart-wrapper">
                        <span class="corona-info-chart-title" id="age-chart-card">
                        연령별 확진자 비율
                        </span><br>
                        <div id="age-bar-chart"></div>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-12">
                   <div class="corona-info-chart-wrapper" id="area-chart-card">
                        <span class="corona-info-chart-title">
                            지역별 확진자 비율
                        </span><br>
                        <div id="area-bar-chart"></div>
                    </div>
                </div>
            </div>
		</div>
	</div>
</div>


<script>

	$(".card").on("show.bs.collapse", function() {
		var icon = $(this).find(".arrow-icon");
	
		icon.css("transform", "rotate(180deg)");
		$(this).addClass('active');
	});
	
	$(".card").on("hide.bs.collapse", function() {
		var icon = $(this).find(".arrow-icon");
	
		icon.css("transform", "rotate(0deg)");
		$(this).removeClass('active');
	});
	
	/*!
	* jquery.counterup.js 1.0
	*
	* Copyright 2013, Benjamin Intal http://gambit.ph @bfintal
	* Released under the GPL v2 License
	*
	* Date: Nov 26, 2013
	*/
	(function( $ ){
	  "use strict";

	  $.fn.counterUp = function( options ) {

	    // Defaults
	    var settings = $.extend({
	        'time': 400,
	        'delay': 10
	    }, options);

	    return this.each(function(){

	        // Store the object
	        var $this = $(this);
	        var $settings = settings;

	        var counterUpper = function() {
	            var nums = [];
	            var divisions = $settings.time / $settings.delay;
	            var num = $this.text();
	            var isComma = /[0-9]+,[0-9]+/.test(num);
	            num = num.replace(/,/g, '');
	            var isInt = /^[0-9]+$/.test(num);
	            var isFloat = /^[0-9]+\.[0-9]+$/.test(num);
	            var decimalPlaces = isFloat ? (num.split('.')[1] || []).length : 0;

	            // Generate list of incremental numbers to display
	            for (var i = divisions; i >= 1; i--) {

	                // Preserve as int if input was int
	                var newNum = parseInt(num / divisions * i);

	                // Preserve float if input was float
	                if (isFloat) {
	                    newNum = parseFloat(num / divisions * i).toFixed(decimalPlaces);
	                }

	                // Preserve commas if input had commas
	                if (isComma) {
	                    while (/(\d+)(\d{3})/.test(newNum.toString())) {
	                        newNum = newNum.toString().replace(/(\d+)(\d{3})/, '$1'+','+'$2');
	                    }
	                }

	                nums.unshift(newNum);
	            }

	            $this.data('counterup-nums', nums);
	            $this.text('0');

	            // Updates the number until we're done
	            var f = function() {
	                $this.text($this.data('counterup-nums').shift());
	                if ($this.data('counterup-nums').length) {
	                    setTimeout($this.data('counterup-func'), $settings.delay);
	                } else {
	                    delete $this.data('counterup-nums');
	                    $this.data('counterup-nums', null);
	                    $this.data('counterup-func', null);
	                }
	            };
	            $this.data('counterup-func', f);

	            // Start the count up
	            setTimeout($this.data('counterup-func'), $settings.delay);
	        };

	        // Perform counts when the element gets into view
	        $this.waypoint(counterUpper, { offset: '100%', triggerOnce: true });
	    });

	  };

	})( jQuery );
	

	$(".counter").counterUp({
		delay: 10,
		time: 1000
	});
	
	
</script>

<script>
$(document).ready(function(){
	$.ajax({
		
		url:'/leastDay',
		type : 'get',
		dataType:'json',
		
		success : function(data) {
			lineChart(data);
			
		}
		
	});
	
	$.ajax({
		
		url:'/rangeAge',
		type:'get',
		dataType:'json',
		
		success : function(data) {
			var today = new Date();
			
			var ageRangeData = [];
		
			var month = today.getMonth()+1;
			month = month >= 10 ? month : '0' + month;
			
			var date = today.getDate()-1;
			date = date >=10? date : '0'+date;
			
			var recentDay = today.getFullYear()+"-"+month+"-"+date;
			
			for(var i=0;i<data.length;i++) {
				
				var createD = data[i].createDt.toString();
				var changeC = createD.substring(0,10);
				
				 if(changeC == recentDay) {
					
					var currenGenderData = data[i]
					
					ageRangeData.push(currenGenderData);			
				} 
			} 
			barChart(ageRangeData);
			
		}
		
	});
	
	$.ajax({
		
		url:'/sido',
		type:'get',
		dataType:'json',
		
		success : function(data) {
			
			var today = new Date();
			var sidoData= [];
			
			var month = today.getMonth()+1;
			month = month >= 10 ? month : '0' + month;
			
			var date = today.getDate();
			date = date >=10? date : '0'+date;
			
			var recentDay = today.getFullYear()+"-"+month+"-"+date;
			
			for(var i=0;i<data.length;i++) {
				
				var createD = data[i].createDt.toString();
				var changeC = createD.substring(0,10);
				
				 if(changeC == recentDay) {
					
					var currentsidoData = data[i]
					
					sidoData.push(currentsidoData);
				
				} 
			} 
		
			sidoBarChart(sidoData);
		}
	});
	
	$.ajax({
      
        url:'/gender',
        type:'get',
        dataType:'json',
      
        success : function(data) {
         
            pieChart(data);
        }
      
      
    });
});

 
</script>

<!-- Resources -->
<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>

<!-- Chart code -->
<script>
   function barChart(data) {
      am4core.ready(function() {

         // Themes begin
         am4core.useTheme(am4themes_animated);
         // Themes end

         var chart = am4core.create("bardiv", am4charts.XYChart);
         chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

         chart.data = data;

         var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
         categoryAxis.renderer.grid.template.location = 0;
         categoryAxis.dataFields.category = "gubun";
         categoryAxis.renderer.minGridDistance = 40;
         categoryAxis.fontSize = 11;

         var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
         valueAxis.min = 0;
         valueAxis.max = 80000;
         valueAxis.strictMinMax = true;
         valueAxis.renderer.minGridDistance = 30;
         
         var series = chart.series.push(new am4charts.ColumnSeries());
         series.dataFields.categoryX = "gubun";
         series.dataFields.valueY = "confCase";
         series.columns.template.tooltipText = "{valueY.value}";
         series.columns.template.tooltipY = 0;
         series.columns.template.strokeOpacity = 0;

         // as by default columns of the same series are of the same color, we add adapter which takes colors from chart.colors color set
         series.columns.template.adapter.add("fill", function(fill, target) {
            return chart.colors.getIndex(target.dataItem.index);
         });
         
         

      }); // end am4core.ready()
   }
</script>

<!-- Chart code -->
<script>
function lineChart(data) {
   am4core.ready(function() {

    // Themes begin
    am4core.useTheme(am4themes_animated);
    // Themes end
    // Create chart instance
    var chart = am4core.create("linediv", am4charts.XYChart);

    // Add data
    chart.data = data;
    // Set input format for the dates
    //chart.dateFormatter.inputDateFormat = "yyyy-MM-dd";

    // Create axes
    var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
    var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

    // Create series
    var series = chart.series.push(new am4charts.LineSeries());
    series.dataFields.valueY = "decideCnt";
    series.dataFields.dateX = "createDt";
    series.tooltipText = "{createDt}"
    series.strokeWidth = 2;
    series.minBulletDistance = 10;

    // Drop-shaped tooltips
    series.tooltip.background.cornerRadius = 20;
    series.tooltip.background.strokeOpacity = 0;
    series.tooltip.pointerOrientation = "vertical";
    series.tooltip.label.minWidth = 40;
    series.tooltip.label.minHeight = 40;
    series.tooltip.label.textAlign = "middle";
    series.tooltip.label.textValign = "middle";

    // Make bullets grow on hover
    var bullet = series.bullets.push(new am4charts.CircleBullet());
    bullet.circle.strokeWidth = 2;
    bullet.circle.radius = 4;
    bullet.circle.fill = am4core.color("#fff");

    var bullethover = bullet.states.create("hover");
    bullethover.properties.scale = 1.3;

      // Make a panning cursor
    chart.cursor = new am4charts.XYCursor();
    chart.cursor.behavior = "panXY";
    chart.cursor.xAxis = dateAxis;
    chart.cursor.snapToSeries = series;

     
    dateAxis.keepSelection = true;

    
      
      
      
      
      
        }); // end am4core.ready()
    }



</script>

<script>
function pieChart(data) {
	am4core.ready(function() {

		// Themes begin
		am4core.useTheme(am4themes_animated);
		// Themes end

		// Create chart instance
		var chart = am4core.create("piediv", am4charts.PieChart);

		// Add data
		chart.data = data;

		// Add and configure Series
		var pieSeries = chart.series.push(new am4charts.PieSeries());
		pieSeries.dataFields.value = "confCase";
		pieSeries.dataFields.category = "gubun";
		pieSeries.slices.template.stroke = am4core.color("#fff");
		pieSeries.slices.template.strokeOpacity = 1;

		// This creates initial animation
		pieSeries.hiddenState.properties.opacity = 1;
		pieSeries.hiddenState.properties.endAngle = -90;
		pieSeries.hiddenState.properties.startAngle = -90;

		chart.hiddenState.properties.radius = am4core.percent(0);
		
		chart.legend = new am4charts.Legend();

	}); // end am4core.ready()
	

}
</script>

<script>
   function sidoBarChart(data) {
      am4core.ready(function() {

         // Themes begin
         am4core.useTheme(am4themes_animated);
         // Themes end

         var chart = am4core.create("sidobarDiv", am4charts.XYChart);
         chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

         chart.data = data;
		
         var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
         categoryAxis.renderer.grid.template.location = 0;
         categoryAxis.dataFields.category = "gubun";
         categoryAxis.renderer.minGridDistance = 40;
         categoryAxis.fontSize = 11;

         var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
         
         //valueAxis.strictMinMax = true;
         valueAxis.renderer.minGridDistance = 30;
         
         var series = chart.series.push(new am4charts.ColumnSeries());
         series.dataFields.categoryX = "gubun";
         series.dataFields.valueY = "defCnt";
         series.columns.template.tooltipText = "{gubun}";
         series.columns.template.tooltipY = 0;
         series.columns.template.strokeOpacity = 0;

         // as by default columns of the same series are of the same color, we add adapter which takes colors from chart.colors color set
         series.columns.template.adapter.add("fill", function(fill, target) {
            return chart.colors.getIndex(target.dataItem.index);
         });
         
         

      }); // end am4core.ready()
   }
</script>

<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

$.ajax({
	url: "/covidStatutsLeast7Day",
	type: "get",
	dataType: "json",
	success: function(data) {
		// Create chart instance
		var chart = am4core.create("chartdiv", am4charts.XYChart);
		var colors = [
			am4core.color("#F9F871"),
	        am4core.color("#BBFC9C"),
	        am4core.color("#83C0A4")
		];

		// Add data
		chart.data = data;
		chart.colors.list = colors;
		// Create axes

		var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
		categoryAxis.dataFields.category = "stateDt";
		categoryAxis.renderer.grid.template.location = 0;
		categoryAxis.renderer.minGridDistance = 30;
		

		categoryAxis.renderer.labels.template.adapter.add("dy", function(dy, target) {
		  if (target.dataItem && target.dataItem.index & 2 == 2) {
		    return dy + 25;
		  }
		  return dy;
		});

		var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

		// Create series
		var series = chart.series.push(new am4charts.ColumnSeries());
		series.dataFields.valueY = "decideCnt";
		series.dataFields.categoryX = "stateDt";
		series.name = "decideCnt";
		series.columns.template.tooltipText = "{categoryX}: [bold]{valueY}[/]";
		series.columns.template.fillOpacity = 1;

		var columnTemplate = series.columns.template;
		columnTemplate.strokeWidth = 2;
		columnTemplate.strokeOpacity = .0;
		
		series.columns.template.adapter.add('fill', function(fill, target) {
			return chart.colors.getIndex(target.dataItem.index);
		});

	}
});




}); // end am4core.ready()
</script>

<script>
    $(document).ready(function(){
    
        $('#vaccineBtn').click(function(){
          
            $('#vaccineDate').toggle();
        });
       
        $.ajax({
            url :'/userInfo',
            type:'get',
               
            success:function(data) {
                
                console.log(data);
                var id = "${pageContext.request.userPrincipal.name}";
                var date = new Date();
                 
                for(var i=0; data.length;i++) {
                    
                    if(id == data[i].user_id.toString()) {
                        $('#vaccineDate').text(data[i].vaccine);
                        console.log(data[i]);
                        var vaccineDate = new Date(data[i].vaccine);
                        var plusDate = date.getTime() - vaccineDate.getTime();
                        var result = Math.floor(plusDate/(1000*60*60*24));
                        console.log(result);
                       
                        $('#vaccineIcon').prop('title','D+'+result);
                      
                    }
                }
            }
        });
    });
    
   
    
</script>

<script>
$(function () {
	
	var homeChartManager = new HomeChartManager();
});
</script>
    
