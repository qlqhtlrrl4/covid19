function drawBarChart2(id, data, category, value) {
	
    /*am4core.useTheme(am4themes_animated);
 
    var chart = am4core.create(id, am4charts.XYChart);
 
    chart.data = data;
    
    var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
    var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
	
    dateAxis.renderer.minGridDistance = 40;
    
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
    
    dateAxis.keepSelection = true;*/
	
    am4core.useTheme(am4themes_animated);
    // Themes end

    var chart = am4core.create(id, am4charts.XYChart);
    chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

    chart.data = data;
    console.log(data);

    var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
    categoryAxis.renderer.grid.template.location = 0;
    categoryAxis.dataFields.category = category;
    categoryAxis.renderer.minGridDistance = 40;
    categoryAxis.fontSize = 11;

    var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
    
    valueAxis.min = 0;
    valueAxis.strictMinMax = true;
    valueAxis.renderer.minGridDistance = 30;
    
    var series = chart.series.push(new am4charts.ColumnSeries());
    series.dataFields.categoryX = category;
    
    debugger;
    
    series.dataFields.valueY = value;
    series.columns.template.tooltipText = "{valueY.value}";
    series.columns.template.tooltipY = 0;
    series.columns.template.strokeOpacity = 0;

    // as by default columns of the same series are of the same color, we add adapter which takes colors from chart.colors color set
    series.columns.template.adapter.add("fill", function(fill, target) {
       return chart.colors.getIndex(target.dataItem.index);
    });
	
	
}