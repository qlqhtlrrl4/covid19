 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<div class="main-section">
	<div class="row">
		<div class="col-lg-2dot5 col-md-3 col-sm-12">
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
							<input id="sex-check-box" type="checkbox" class="chart-toggle-btn primary-confirmed">
							<span id="sex-toggle" class="slider round"></span>
						</label>
				      </div>
				      <div class="card-body">
				        연령
				        <label class="switch">
							<input id="age-check-box" type="checkbox" class="chart-toggle-btn primary-confirmed">
							<span id="age-toggle" class="slider round"></span>
						</label>
				      </div>
				      <div class="card-body">
				        지역
				        <label class="switch">
							<input id="area-check-box" type="checkbox" class="chart-toggle-btn primary-confirmed">
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
				          <div class="panel-tilte-icon">
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
		<div class="col-lg-9dot5 col-md-6 col-sm-12">
			<div class="row">
				<div class="col-9">
					<div class="corona-info-count-wrapper">
						<div class="row">
							<div class="col-3">
								<span class="corona-info-count-title">확진자</span><br/>
								<span class="corona-color-pink counter"><fmt:formatNumber type="number" maxFractionDigits="3" value="${covidStatusData.decideCnt}" /></span><br/>
								<span class="corona-color-pink badge badge-pill badge-primary badge-color-pink"><i class="fas fa-arrow-up"></i><span class="corona-info-up-down-count">1,234</span></span>
							</div>
							<div class="col-3">
								<span class="corona-info-count-title">검사자</span><br/>
								<span class="corona-color-grey counter"><fmt:formatNumber type="number" maxFractionDigits="3" value="${covidStatusData.accExamCnt}" /></span><br/>
								<span class="corona-color-grey badge badge-pill badge-primary badge-color-grey"><i class="fas fa-arrow-up"></i><span class="corona-info-up-down-count">1,234</span></span>
							</div>
							<div class="col-3">
								<span class="corona-info-count-title">완치자</span><br/>
								<span class="corona-color-grey counter"><fmt:formatNumber type="number" maxFractionDigits="3" value="${covidStatusData.clearCnt}" /></span><br/>
								<span class="corona-color-grey badge badge-pill badge-primary badge-color-grey"><i class="fas fa-arrow-up"></i><span class="corona-info-up-down-count">1,234</span></span>
							</div>
							<div class="col-3">
								<span class="corona-info-count-title">사망자</span><br/>
								<span class="corona-color-grey counter"><fmt:formatNumber type="number" maxFractionDigits="3" value="${covidStatusData.deathCnt}" /></span><br/>
								<span class="corona-color-grey badge badge-pill badge-primary badge-color-grey">
									<i class="fas fa-arrow-up"></i>
									<span class="corona-info-up-down-count"><fmt:formatNumber type="number" value="${covidStatusData.deathCnt}"></fmt:formatNumber></span>
									
								</span>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-3">			
					<div class="col-lg-12 col-md-3 col-sm-12" style="padding-left: 0; padding-right: 0;">
						<div class="summary-right-pane">
							<span class="date">2021.10.05 화요일</span><br/>
							<div class="locationBtn"> 
								<i class="fas fa-map-marker-alt"></i>
								<span class="location-tilte">서울</span>
							</div>
							<div class="arrowAndamount">
								<i class="fas fa-arrow-up"></i>
								<span class="amount"><fmt:formatNumber type="number" maxFractionDigits="3" value="${covidStatusData.deathCnt}" /></span>
							</div>
							<span class="words">개인위생에 각별히 신경 쓰세요.</span>
							<a href="#" class="syringe-icon">
            					<i class="fas fa-syringe"></i>
            					<script>
									console.log("${covidStatusData.deathCnt} ||"+"${covidStatusData.decideCnt}");
									console.log("aaaa");
								</script>
        					</a>
						</div>
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
			
			<div class ="row">
				<div class="col-4">
					<div class="corona-info-chart-wrapper">
						<span class="corona-info-chart-title">
							성별 확진자 비율
						</span><br>
						<div class="piediv"></div>
					</div>
				</div>
			
				<div class="col-4">
					<div class="corona-info-chart-wrapper">
						<span class="corona-info-chart-title">
							연령별 확진자 비율
						</span><br>
						<div class="bardiv"></div>
					</div>
				</div>
				
				<div class="col-4">
					<div class="corona-info-chart-wrapper">
						<span class="corona-info-chart-title">
							지역별 확진자 비율
						</span><br>
						<div class="sidobarDiv"></div>
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
			var today = new Date();
			
			var genderData = [];
			
			
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
					
					genderData.push(currenGenderData);
							
				} 
			} 
			pieChart(genderData);
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

      // Enable export
      
      
      document.getElementById("image").onclick= 
         function exportPNG() {
           chart.exporting.export("png");
         };

      var options = chart.exporting.getFormatOptions("png");
      options.keepTainted = true;
      chart.exporting.setFormatOptions("png", options);
      
      
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
         valueAxis.min = 0;
         valueAxis.max = 50000;
         valueAxis.strictMinMax = true;
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

