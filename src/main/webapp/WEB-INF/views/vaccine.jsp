<!-- Resources -->
<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>


<script>
$(document).ready(function(){
	$.ajax({
		
		url:'/vaccineStatus',
		type:'get',
		dataType:'json',
		
		success : function(data) {
			
			console.log(data);
			pieChart(data);
		}
		
	});
});



</script>

<style>
.piediv {
  width: 50%;
  height: 500px
}
</style>

<div class="piediv"></div>
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
		pieSeries.dataFields.value = "totalFirstCnt";
		pieSeries.dataFields.category = "sido";
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
