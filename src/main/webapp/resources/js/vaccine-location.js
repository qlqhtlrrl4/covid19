var VaccineChartManager = function() {

	this.chart = {};
	this.chart = {};
	this.cardTemplate = Handlebars.getTemplate("vaccine-chart");

	this.init();
	this.drawAll();
	this.initEvent();

}

VaccineChartManager.prototype.init = function() {
	var self = this;
	this.chart.locationDay = am4core.create("location-day", am4charts.XYChart);
	this.chart.locationWeek = am4core
			.create("location-week", am4charts.XYChart);
	this.chart.locationMonth = am4core.create("location-month",
			am4charts.XYChart);
}

VaccineChartManager.prototype.initEvent = function() {
	var self = this;
	
	$(".chart-toggle-btn").on('change', function() {
		debugger;
		var type = $(this).prop("id").replace(/-check-box/, "");
		var cardId = type + "-chart-card";
		var chartBarId = type + "-bar-chart";
		var chartPieId = type + "-pie-chart";
		var name = $(this); // getText

		var cardHtml = self.cardTemplate({
			type : type,
			name : name
		});

		if ($(this).prop("checked") == true) {
			$("#location-collection").append(cardHtml);
			if (type == 'dayLocation') {
				drawBarChart(chartBarId, type);
			} else if (type == 'weekLocation') {
				drawBarChart(chartBarId, type);
			} else {
				drawBarChart(chartBarId, type);
			}
		}

		else {
			$("#" + cardId).remove();
		}

	})
}

VaccineChartManager.prototype.drawAll = function() {
	var self = this;

	this.drawLocation();
	// this.drawWeekLocation();
	// this.drawMonthLocation();
}

VaccineChartManager.prototype.drawLocation = function() {

	var self = this;

	$.ajax({
		type : "post",
		url : "/todayVaccine",
		dataType : "json",
		async : false,

		success : function(data) {
			
		}
	});
}