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
							
							
						</div>
					</div> <!-- card active -->
				</div>
				
				<div class="card">
					<div class="card-header">							
						<h2 class = "mb-0">
							<a class = "btn btn-link btn-block text-left panel-title" type="button">
								<span class="card-header-title">백신 정보</span>
							</a>
						</h2>
					</div>
				</div>
			</div>
			<!-- <div class="card">
				<div class="card-header">
					<h2></h2>
				</div>
			</div> -->
		</div> <!-- col-lg-2dot5 -->
		
		<div class="col-lg-9dot5 col-md-9 col-sm-12">
			<div class="row">
				<div class="col-6">
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
						
						<canvas class="vaccine-percent-chart" id="canvas"></canvas>
						<span class ="vaccine-complete-text">접종 완료</span>
						<span class="vaccine-percent-text" id="percent"></span>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-9">
					<div class="vaccine-chart-count-wrapper">
						<span class="vaccine-chart-count-title">
							백신 접종 현황
						</span> <br/>
						<div class="vaccineAllChart"></div>
						
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-9">
					<div class="vaccine-info-wrapper">
						<ul class="nav nav-tabs nav-justified vaccine-info-nav">
							<li class="nav-item">
								<a class="nav-link active vaccine-info-link-color" data-toggle="tab" href="#pfizer" >화이자</a>
							</li>
							<li class="nav-item">
								<a class="nav-link vaccine-info-link-color" data-toggle="tab" href="#astra" >아스트라제네카</a>
							</li>
							<li class="nav-item">
								<a class="nav-link vaccine-info-link-color" data-toggle="tab" href="#janssen">얀센</a>
							</li>
							<li class="nav-item">
								<a class="nav-link vaccine-info-link-color" data-toggle="tab" href="#moderna" >모더나</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade show active" id="pfizer" >
								<table class="table table-borderless">
									<tbody>
										
										<tr>
											<td>개발국</td>
											<td class="td-text-left">미국/독일</td>
										</tr>
										<tr>
											<td>수량</td>
											<td class="td-text-left">6,600만회 분</td>
										</tr>
										<tr>
											<td>접종횟수</td>
											<td class="td-text-left">2회</td>
										</tr>
										<tr>
											<td>접종간격</td>
											<td class="td-text-left">21일</td>
										</tr>
										<tr>
											<td>보관</td>
											<td class="td-text-left">-75℃±15℃ (6개월)</td>
										</tr>
										<tr>
											<td>유통</td>
											<td class="td-text-left">2∼8℃ (5일)</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="tab-pane fade" id="astra" >
								<table class="table table-borderless">
									<tbody>
										<tr>
											<td>개발국</td>
											<td class="td-text-left">영국</td>
										</tr>
										<tr>
											<td>수량</td>
											<td class="td-text-left">2,600만회 분</td>
										</tr>
										<tr>
											<td>접종횟수</td>
											<td class="td-text-left">2회</td>
										</tr>
										<tr>
											<td>접종간격</td>
											<td class="td-text-left">8~12주</td>
										</tr>
										<tr>
											<td>보관</td>
											<td class="td-text-left">2~8℃ (6개월)</td>
										</tr>
										<tr>
											<td>유통</td>
											<td class="td-text-left">2∼8℃ (6개월)</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="tab-pane fade" id="janssen" >
								<table class="table table-borderless">
									<tbody>
										<tr>
											<td>개발국</td>
											<td class="td-text-left">미국</td>
										</tr>
										<tr>
											<td>수량</td>
											<td class="td-text-left">701만회 분</td>
										</tr>
										<tr>
											<td>접종횟수</td>
											<td class="td-text-left">1회 * (임상결과에 따라 변경가능)</td>
										</tr>
										<tr>
											<td>접종간격</td>
											<td class="td-text-left">-</td>
										</tr>
										<tr>
											<td>보관</td>
											<td class="td-text-left">-20℃ (24개월)</td>
										</tr>
										<tr>
											<td>유통</td>
											<td class="td-text-left">2∼8℃ (4.5개월)</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="tab-pane fade" id="moderna" >
								<table class="table table-borderless">
									<tbody>
										<tr>
											<td>개발국</td>
											<td class="td-text-left">미국</td>
										</tr>
										<tr>
											<td>수량</td>
											<td class="td-text-left">4,000만회 분</td>
										</tr>
										<tr>
											<td>접종횟수</td>
											<td class="td-text-left">2회</td>
										</tr>
										<tr>
											<td>접종간격</td>
											<td class="td-text-left">21일</td>
										</tr>
										<tr>
											<td>보관</td>
											<td class="td-text-left">-20℃ (6개월)</td>
										</tr>
										<tr>
											<td>유통</td>
											<td class="td-text-left">2∼8℃ (30일)</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-9">
					<div class="location-percentage-info-wrapper">
						<span class="location-percentage-info-title">
							지역별 백신 접종 현황
							
						</span>
						<div class="locationChart"></div>
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
$(document).ready(function() {
	
	var secondCnt = ${vaccineData.totalSecondCnt};
	var percentage = secondCnt / 51780000 *100;
	console.log(percentage);
	
	percentageChart(percentage);
	
	$.ajax({
		url:'/vaccineStatus',
		type:'get',
		dataType : 'json',
		
		success : function(data) {
			vaccineAllLineChart(data);
 
		}
	});
	
	$.ajax( {
		url :'/todayVaccine',
		type : 'get',
		dataType : 'json',
		
		success : function(data) {
			
			var a = data;
			console.log(a);
			
		}
		
	}); 
	
	$.ajax({
		url : '/todayLocationData',
		type:'get',
		dataType : 'json',
		
		success : function(data) {
			locationBarChart(data);
			console.log(data);
		}
	})
	
});

</script>

<script>
function locationBarChart(data) {
	am4core.ready(function() {

        // Themes begin
        am4core.useTheme(am4themes_animated);
        // Themes end

        var chart = am4core.create("locationChart", am4charts.XYChart);
        chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

        chart.data = data;
		
        var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
        categoryAxis.renderer.grid.template.location = 0;
        categoryAxis.dataFields.category = "sido";
        categoryAxis.renderer.minGridDistance = 40;
        categoryAxis.fontSize = 15;

        var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
        /* valueAxis.min = 0;
        valueAxis.max = 50000; */
        //valueAxis.strictMinMax = true;
        valueAxis.renderer.minGridDistance = 30;
        
        var label = categoryAxis.renderer.labels.template;
      //label.truncate = true;
      label.maxWidth = 200;
      label.tooltipText = "{category}";
      

      categoryAxis.events.on("sizechanged", function(ev) {
        var axis = ev.target;
        var cellWidth = axis.pixelWidth / (axis.endIndex - axis.startIndex);
        if (cellWidth < axis.renderer.labels.template.maxWidth) {
          axis.renderer.labels.template.rotation = -65;
          axis.renderer.labels.template.horizontalCenter = "right";
          axis.renderer.labels.template.verticalCenter = "middle";
        }
        else {
          axis.renderer.labels.template.rotation = 0;
          axis.renderer.labels.template.horizontalCenter = "middle";
          axis.renderer.labels.template.verticalCenter = "top";
        }
      });
        
        //격자 지우기
        valueAxis.renderer.grid.template.disabled = true;
        
        var series = chart.series.push(new am4charts.ColumnSeries());
        series.dataFields.categoryX = "sido";
        series.dataFields.valueY = "secondCnt";
        series.columns.template.tooltipText = "{sido} : [bold]{valueY}[/]";
        series.columns.template.tooltipY = 0;
        series.columns.template.strokeOpacity = 0;
        

        // as by default columns of the same series are of the same color, we add adapter which takes colors from chart.colors color set
        series.columns.template.adapter.add("fill", function(fill, target) {
           return chart.colors.getIndex(target.dataItem.index);
        });
        
        

     }); // end am4core.ready()
	 
  }
	


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
	
      dateAxis.renderer.minGridDistance = 40;
      //dateAxis.renderer.grid.template.location = 0;
      
      dateAxis.dateFormats.setKey("day", "MM/dd");
      dateAxis.periodChangeDateFormats.setKey("day", "MM/dd");
      // Create series
      var series = chart.series.push(new am4charts.LineSeries());
      series.dataFields.valueY = "secondCnt";
      series.dataFields.dateX = "baseDate";
      series.name="baseDate";
     
      series.tooltipText = "{baseDate} :[bold]{valueY}"
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
      valueAxis.cursorTooltipEnabled = false;
      dateAxis.cursorTooltipEnabled = false; 

      // Make bullets grow on hover
      var bullet = series.bullets.push(new am4charts.CircleBullet());
      bullet.circle.strokeWidth = 2;
      bullet.circle.radius = 4;
      bullet.circle.fill = am4core.color("#fff");

      var bullethover = bullet.states.create("hover");
      bullethover.properties.scale = 1.3;
      
      

      // Make a panning cursor
      chart.cursor = new am4charts.XYCursor();
      //chart.cursor.behavior = "panXY";
      //chart.cursor.xAxis = dateAxis;
      //chart.cursor.snapToSeries = series;
      chart.cursor.lineX.disabled = true;
	  chart.cursor.lineY.disabled = true;
      chart.cursor.behavior = "none";
      
      valueAxis.renderer.line.disabled = true; //disables axis line
      //valueAxis.renderer.labels.template.disabled = true; //disables labels
      valueAxis.renderer.grid.template.disabled = true;  //disables grid
      
      dateAxis.keepSelection = true;

      // Enable export
     
      }); // end am4core.ready()
   }
</script>

<script>




function percentageChart(data) {
	
	var can = document.getElementById('canvas');
	var	spanPercent = document.getElementById('percent');
	var c = can.getContext('2d');
	
	//c.arc에서 중심을 잡기위한 변수 posX, posY
	var posX = can.width /2;
	var posY = can.height/2;
	var fps = 1000/200;
	var percent = 0;
	var onePercent = 360/100;
	var result = onePercent * data;
	
	c.lineCap = 'round';
	
	arcMove();
	
	function arcMove() {
		var deegres = 0;
		var acrInterval = setInterval(function () {
			deegres +=1;
			c.clearRect(0,0,can.width, can.height);
			percent = deegres / onePercent;
			
			spanPercent.innerHTML = percent.toFixed();
			c.beginPath();
			c.arc(posX,posY, 70,(Math.PI/100)*270,(Math.PI/180)*(270+360));
			c.strokeStyle = '#b1b1b1';
	        c.lineWidth = '10';
	        c.stroke();

	        c.beginPath();
		    c.strokeStyle = '#3949AB';
		    c.lineWidth = '10';
		    c.arc(posX, posY, 70,(Math.PI/180)*270,(Math.PI/180)*(270 + deegres));
		     c.stroke();
		    if( deegres >= result ) {
		    	clearInterval(acrInterval);
		    }
		},fps);
	}
}	
</script>