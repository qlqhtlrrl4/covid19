var VaccineChartManager = function() {

	this.chart = {};
	this.locationData= {};
	this.regionData={};
	this.cardTemplate = Handlebars.getTemplate("vaccine-chart");
	//this.init();
	this.drawAll();
	this.initEvent();
}

VaccineChartManager.prototype.setLocationData = function(data) {
	var self = this;
	self.locationData["dayLocation-chart-card"]["data"] = data.dayLocation;
	self.locationData["weekLocation-chart-card"]["data"] = data.weekLocation;
	self.locationData["monthLocation-chart-card"]["data"] = data.monthLocation;
	//self.regionData["seoul-chart-card"]["data"] = data.
}

VaccineChartManager.prototype.initEvent = function() {
	var self = this;
	
	$(".chart-toggle-btn").on('change', function() {
		
		var type = $(this).prop("id").replace(/-check-box/, "");
		var cardId = type + "-chart-card";
		var chartBarId = type + "-bar-chart";
		var chartPieId = type + "-pie-chart";
		 var name = self.locationData[cardId]["name"]; // getText

		var cardHtml = self.cardTemplate({
			type : type,
			name : name
		});
		
		
		

		if ($(this).prop("checked") == true) {
			$("#location-collection").append(cardHtml);
			if (type == 'dayLocation') {
				drawBarChart(chartBarId, self.locationData[cardId]["data"],"baseDate","totalSecondCnt");
				drawPieChart(chartPieId,self.locationData[cardId]["data"],"baseDate","totalSecondCnt");
			} else if (type == 'weekLocation') {
				drawBarChart(chartBarId, self.locationData[cardId]["data"],"end","sum(secondCnt)");
				drawPieChart(chartPieId,self.locationData[cardId]["data"],"end","sum(secondCnt)");
			} else {
				drawBarChart(chartBarId, self.locationData[cardId]["data"],"month","sum(secondCnt)");
				drawPieChart(chartPieId,self.locationData[cardId]["data"],"month","sum(secondCnt)");
			}
			
			
			$(".check-chart-type").on('click',function() {
				$(this).tab('show');
				$(this).removeClass('active');
			});
		}

		else {
			$("#" + cardId).remove();
		}

	});
	
	$(".check-chart-type").on('click',function() {
		
		console.log($(this));
		
		$(this).tab('show');
		$(this).removeClass('active');
	});
	
	
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
		url : "/LocationData",
		dataType : "json",
		async : false,

		success : function(data) {
			$.getJSON("/resources/json/location/location-card.json",function(jsonData){
				self.locationData = jsonData;
				console.log(data);
				self.setLocationData(data);
				
				drawBarChart("dayLocation-bar-chart",data.dayLocation,"baseDate","totalSecondCnt");
				drawBarChart("weekLocation-bar-chart",data.weekLocation,"end","sum(secondCnt)");
				drawBarChart("monthLocation-bar-chart",data.monthLocation,"month","sum(secondCnt)");
				drawPieChart("dayLocation-pie-chart",data.dayLocation,"baseDate","totalSecondCnt");
				drawPieChart("weekLocation-pie-chart",data.weekLocation,"end","sum(secondCnt)");
				drawPieChart("monthLocation-pie-chart",data.monthLocation,"month","sum(secondCnt)");
				
			});
		},		
		error : function(err) {
			console.log(err);
		}
	});
	
	
}

/*VaccineChartManager.prototype.init = function() {
var self = this;
this.chart.locationDay = am4core.create("location-day", am4charts.XYChart);
this.chart.locationWeek = am4core
		.create("location-week", am4charts.XYChart);
this.chart.locationMonth = am4core.create("location-month",
		am4charts.XYChart);
}*/