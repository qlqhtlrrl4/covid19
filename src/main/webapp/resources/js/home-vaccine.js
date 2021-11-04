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
				debugger;
				var type = $(this).prop("id").replace(/-check-box/, "");
				var cardId = type + "-chart-card";
				var chartBarId = type + "-bar-chart";
				// var chartPieId = type + "-pie-chart";
				
				if(type == "sex" || type=="age" || type=="area") {
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
						
					}
				}
				
				else {
					var country = $(this).prop("id").replace(/-check-box/, "");
					var list = country+"-country-list";
					
					if ($(this).prop("checked") == true) {
						
						$("#"+list).css("display","block");
					}
					else {
						$("#"+list).css("display","none");
					}
					
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
