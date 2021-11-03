var HomeChartManager = function() {

	this.chart = {};
	this.detailsData = {};
	this.cardTemplate = Handlebars.getTemplate("home-chart");
	this.drawAll();
	this.initEvent();

}

HomeChartManager.property.setDetailsData = function(data) {

	var self = this;
	self.detailsData["sex-chart-card"]["data"] = data.sexData;
	self.detailsData["age-chart-card"]["data"] = data.ageData;
	self.detailsData["area-chart-card"]["data"] = data.areaData;
}

HomeChartManager.property.initEvent = function() {
	var self = this;
	$(".chart-toggle-btn").on(
			'change',
			function() {
				var type = $(this).prop("id").replace(/-check-box/, "");
				var cardId = type + "-chart-card";
				var chartBarId = type + "-bar-chart";
				// var chartPieId = type + "-pie-chart";
				var name = self.detailsData[cardId]["name"];
				var cardHtml = self.cardTemplate({
					type : type,
					name : name
				});

				if ($(this).prop("checked") == true) {
					$("#details-collection").append(cardHtml);
					if (type == 'sex') {
						drawBarChart(chartBarId,
								self.detailsData[cardId]["data"], "category",
								"value");
					} else if (type == 'area') {
						drawBarChart(chartBarId,
								self.detailsData[cardId]["data"], "category",
								"value");
					} else {
						drawBarChart(chartBarId,
								self.detailsData[cardId]["data"], "category",
								"value");
					}
				} else {
					$("#" + cardId).remove();
				}
			});
}
HomeChartManager.prototype.drawAll = function() {
	var self = this;

	this.drawDetails();
}

HomeChartManager.prototype.drawDetails = function() {
	var self = this;

	$.ajax({
		type : "post",
		url : "/detailsData",
		dataType : "json",
		async : false,

		success : function(data) {
			$.getJSON("/resources/json/details/details-card.json", function(
					jsonData) {
				self.detailsData = jsonData;
				console.log(data);
				self.setDetailsData(data);

				drawBarChart("sex-bar-chart", data.sexData, "category", "value");
				drawBarChart("age-bar-chart", data.ageData, "category", "value");
				drawBarChart("area-bar-chart", data.areaData, "category", "value");
			});
		},

		error : function(err) {
			console.log(err);
		}
	});
}
