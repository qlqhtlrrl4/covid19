function drawBarChart(id, data, category, value) {
	
    am4core.useTheme(am4themes_animated);
 
    var chart = am4core.create(id, am4charts.XYChart);
 
    chart.data = data;
    
    var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
    var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
	
    dateAxis.renderer.minGridDistance = 40;
    
    if(id == "dayLocation-bar-chart") {
    	dateAxis.dateFormats.setKey("day", "MM/dd");
    	dateAxis.periodChangeDateFormats.setKey("day", "MM/dd");	
    }
    
    else if(id =="weekLocation-bar-chart") {
    	
    }
    
    else {
    	
    	
    }
    chart.radius = am4core.percent(40);
    
    // Create series
    var series = chart.series.push(new am4charts.LineSeries());
    series.dataFields.valueY = value;
    series.dataFields.dateX = category;
    series.name=category;
    
    var category2 = category.replace(/"/,"").trim();
    console.log(id);
    
    series.tooltipText = "{category2} :[bold]{valueY}"
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

   
    valueAxis.renderer.line.disabled = true; //disables axis line
    //valueAxis.renderer.labels.template.disabled = true; //disables labels
    valueAxis.renderer.grid.template.disabled = true;  //disables grid
    
    dateAxis.keepSelection = true;
	
	
}