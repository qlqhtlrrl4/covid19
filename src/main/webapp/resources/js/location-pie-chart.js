function drawPieChart(id, data, category, value) {

	// Themes begin
	am4core.useTheme(am4themes_animated);
	// Themes end

	// Create chart instance
	var chart = am4core.create(id, am4charts.PieChart);

	//chart.radius = am4core.percent(50);
	// Add data
	chart.data = data;

	// Add and configure Series
	var pieSeries = chart.series.push(new am4charts.PieSeries());
	pieSeries.dataFields.value = value;
	pieSeries.dataFields.category = category;
	pieSeries.slices.template.stroke = am4core.color("#fff");
	pieSeries.slices.template.strokeOpacity = 1;
	/*pieSeries.labels.template.wrap = true;
	pieSeries.labels.template.fontSize = 13;*/
	
	pieSeries.ticks.template.disabled = true;
	pieSeries.alignLabels = false;
	pieSeries.labels.template.text = "{value.percent.formatNumber('#.0')}%";
	pieSeries.labels.template.radius = am4core.percent(-40);
	pieSeries.labels.template.fill = am4core.color("white");

	// This creates initial animation
	pieSeries.hiddenState.properties.opacity = 1;
	pieSeries.hiddenState.properties.endAngle = -90;
	pieSeries.hiddenState.properties.startAngle = -90;

	chart.hiddenState.properties.radius = am4core.percent(0);

}