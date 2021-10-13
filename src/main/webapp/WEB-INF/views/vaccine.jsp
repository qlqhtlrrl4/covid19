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
					<div class="card active">
						<div class="card-header" id ="headingOne">
							<h2 class="mb-0">
								<a class="btn btn-link btn-block text-left panel-title" type="button" data-toggle="collapse" data-target="#collapseOne">
									<span class="card-header-title">백신</span>
									<div>
										<i class="fa fa-chevron-up arrow-icon"></i>
									</div>
								</a>
							</h2>
						</div> <!-- card-header -->
						
						<div id="collapseOne" class="collapse show" data-parent="#vaccineAccordion">
							<div class="card-body">
								지역
								<label class="switch">
									<input id="location-check-box" type="checkbox" class="chart-toggle-btn primary-confirmed" checked>
									<span id="location-toggle" class="slider round"></span>
								</label>
							</div>
							
							<div class="card-body">
							백신 정보
								<label class="switch">
									<input id="location-information-box" type="checkbox" class="chart-toggle-btn primary-confirmed" checked>
									<span id="information-toggle" class="slider round"></span>
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
								<span class= "vaccine-info-count-title">1차 접종</span><br/>
								<span class="vaccine-color-gray counter"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vaccineData.totalFirstCnt}"/></span><br/>
								<span class="vaccine-color-gray badge badge-pill badge-primary vaccine-color-blue">
									<i class="fas fa-arrow-up"></i>
									<span><fmt:formatNumber type="number" maxFractionDigits="3" value="${vaccineData.firstCnt}"/></span>
								</span>
							</div>
							
							<div class="col-6">
								<span class="vaccine-info-count-title">접종 완료</span><br/>
								<span class="vaccine-color-gray counter"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vaccineData.totalSecondCnt}"/></span><br>
								<span class="vaccine-color-gray badge badge-pill badge-primary vaccine-color-blue">
									<i class="fas fa-arrow-up"></i>
									<span><fmt:formatNumber type="number" maxFractionDigits="3" value="${vaccineData.secondCnt}"/></span>
								</span>
							</div>		
						</div>
					</div>
				</div> <!-- col-9 -->
				
				<div class="col-3">
					<div class="summary-right-pane">
						<div class="vaccine-pieDiv-chart"></div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-12">
					<div class="vaccine-chart-count-wrapper">
						<span class="vaccine-chart-count-title">
							백신 접종 현황
						</span> <br/>
						<div class="vaccineAllChart"></div>
					</div>
				</div>
			</div>
		</div>
	</div> 
</div> <!-- vaccine main div -->


<script>
	$(".card").on("show.bs.collapse", function() {
		
		var icon = $(this).find(".arrow-icon");
		
		icon.css("transform","rotate(180deg)");
		$(this).addClass('active');
	});
	
	$(".card").on("hide.bs.collapse", function(){
		
		var icon = $(this).find(".arrow-icon");
		icon.css("transform","rotate(0deg)");
		
		$(this).removeClass('active');
	});
	
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

<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>

<!-- Chart code -->
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

// Create chart instance
var chart = am4core.create("vaccine-pieDiv-chart", am4charts.PieChart);

// Let's cut a hole in our Pie chart the size of 40% the radius
chart.innerRadius = am4core.percent(70);



// Add and configure Series
// 차트 시리즈 생성
var pieSeries = chart.series.push(new am4charts.PieSeries());

//바인딩할 데이터 이름
pieSeries.dataFields.value = "value";

//데이터 분류(category) 이름
pieSeries.dataFields.category = "category";

//파이 부분별 구분선 색
pieSeries.slices.template.stroke = am4core.color("#fff");


// Add data
pieSeries.data = [{
  "category": "First",
  "value": 30
}, {
  "category": "Second",
  "value": 30
}];

}); // end am4core.ready()
</script>
<script>
$(document).ready(function() {
	
	$.ajax({
		url:'/vaccineStatus',
		type:'get',
		dataType : 'json',
		
		success : function(data) {
			vaccineAllLineChart(data);
		}
	});
});

</script>

<script>
function vaccineAllLineChart(data) {
   am4core.ready(function() {

      // Themes begin
      am4core.useTheme(am4themes_animated);
      // Themes end

      // Create chart instance
      var chart = am4core.create("vaccineAllChart", am4charts.XYChart);

      // Add data
      chart.data = data;

      // Set input format for the dates
      //chart.dateFormatter.inputDateFormat = "yyyy-MM-dd";

      // Create axes
      var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
      var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

      // Create series
      var series = chart.series.push(new am4charts.LineSeries());
      series.dataFields.valueY = "totalSecondCnt";
      series.dataFields.dateX = "baseDate";
      series.tooltipText = "{baseDate}"
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
      
      
      }); // end am4core.ready()
   }



</script>