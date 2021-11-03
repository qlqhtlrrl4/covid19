var HomeChartManager = function() {
	
	
	this.chart = {};
	this.detailsData = {};
	this.cardTemplate = Handlebars.getTemplate("home-chart");
	this.drawAll();
	this.initEvent();

}

HomeChartManager.prototype.setDetailsData = function(data) {

	var self = this;
	self.detailsData["sex-chart-card"]["data"] = data.sexData;
	self.detailsData["age-chart-card"]["data"] = data.ageData;
	self.detailsData["area-chart-card"]["data"] = data.areaData;
}

HomeChartManager.prototype.initEvent = function() {
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
						drawBarChart2(chartBarId,
								self.detailsData[cardId]["data"], "gubun", "confCase");
					} else if (type == 'area') {
						drawBarChart2(chartBarId,
								self.detailsData[cardId]["data"], "gubun", "defCnt");
					} else {
						drawBarChart2(chartBarId,
								self.detailsData[cardId]["data"], "gubun","confCase");
					}
				} else {
					$("#" + cardId).parent().remove();
					debugger;
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

				drawBarChart2("sex-bar-chart", data.sexData, "gubun", "confCase");
				drawBarChart2("age-bar-chart", data.ageData, "gubun", "confCase");
				drawBarChart2("area-bar-chart", data.areaData, "gubun", "defCnt");
			});
		},

		error : function(err) {
			console.log(err);
		}
	});
}
