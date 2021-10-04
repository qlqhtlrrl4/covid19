<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="main-section">
	<div class="row">
		<div class="col-lg-3 col-md-4 col-sm-12">
			<div class="summary-left-pane">
				<div class="accordion" id="accordionExample">
				  <div class="card active">
				    <div class="card-header" id="headingOne">
				      <h2 class="mb-0">
				        <a class="btn btn-link btn-block text-left panel-title" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				          <span class="card-header-title">국내</span>
				          <div>
				          	<i class="fa fa-chevron-up arrow-icon rotated180"></i>
				          </div>
				        </a>
				      </h2>
				    </div>
				
				    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
				      <div class="card-body">
				        성별 
				        <label class="switch">
							<input id="sex-check-box" type="checkbox" class="chart-toggle-btn primary-confirmed" checked>
							<span id="sex-toggle" class="slider round"></span>
						</label>
				      </div>
				      <div class="card-body">
				        연령
				        <label class="switch">
							<input id="age-check-box" type="checkbox" class="chart-toggle-btn primary-confirmed" checked>
							<span id="age-toggle" class="slider round"></span>
						</label>
				      </div>
				      <div class="card-body">
				        지역
				        <label class="switch">
							<input id="area-check-box" type="checkbox" class="chart-toggle-btn primary-confirmed" checked>
							<span id="area-toggle" class="slider round"></span>
						</label>
				      </div>
				    </div>
				  </div>
				  <div class="card">
				    <div class="card-header" id="headingTwo">
				      <h2 class="mb-0">
				        <a class="btn btn-link btn-block text-left panel-title" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
				          <span class="card-header-title">해외</span>
				          <div>
				          	<i class="fa fa-chevron-up arrow-icon"></i>
				          </div>
				        </a>
				      </h2>
				    </div>
				    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
				      <div class="card-body">
				        성별 
				        <label class="switch">
							<input type="checkbox" class="chart-toggle-btn primary-keep-distance" checked>
							<span class="slider round"></span>
						</label>
				      </div>
				      <div class="card-body">
				        연령
				        <label class="switch">
							<input type="checkbox" class="chart-toggle-btn primary-keep-distance" checked>
							<span class="slider round"></span>
						</label>
				      </div>
				      <div class="card-body">
				        지역
				        <label class="switch">
							<input type="checkbox" class="chart-toggle-btn primary-keep-distance" checked>
							<span class="slider round"></span>
						</label>
				      </div>
				    </div>
				  </div>
				  <div class="card">
				  	<div class="card-header" id="headingThree">
				      <h2 class="mb-0">
				        <a class="btn btn-link btn-block text-left panel-title" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
				          <span class="card-header-title">거리두기</span>
				          <div>
				          	<i class="fa fa-chevron-up arrow-icon"></i>
				          </div>
				        </a>
				      </h2>
				    </div>
				    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
				      <div class="card-body">
				        And lastly, the placeholder content for the third and final accordion panel. This panel is hidden by default.
				      </div>
				    </div>
				  </div>
				</div>
			</div>
		</div>
		<div class="col-lg-9 col-md-8 col-sm-12">
			<div class="row">
				<div class="col-9">
					<div class="corona-info-count-wrapper">
						<div class="row">
							<div class="col-3">
								<span class="corona-info-count-title">확진자</span><br/>
								<span class="corona-color-pink counter">311,289</span><br/>
								<span class="corona-color-pink badge badge-pill badge-primary badge-color-pink">2,564</span>
							</div>
							<div class="col-3">
								<span class="corona-info-count-title">검사자</span><br/>
								<span class="corona-color-grey counter">14,544,258</span><br/>
								<span class="corona-color-grey badge badge-pill badge-primary badge-color-grey">58,998</span>
							</div>
							<div class="col-3">
								<span class="corona-info-count-title">완치자</span><br/>
								<span class="corona-color-grey counter">274,205</span><br/>
								<span class="corona-color-grey badge badge-pill badge-primary badge-color-grey">1,481</span>
							</div>
							<div class="col-3">
								<span class="corona-info-count-title">사망자</span><br/>
								<span class="corona-color-grey counter">2,481</span><br/>
								<span class="corona-color-grey badge badge-pill badge-primary badge-color-grey">7</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-3">
				</div>
			</div>
		</div>
	</div>
</div>


<script>
	$(".card").on("show.bs.collapse", function() {
		var icon = $(this).find(".arrow-icon");
	
		icon.css("transform", "rotate(180deg)");
		$(this).addClass('active');
	});
	
	$(".card").on("hide.bs.collapse", function() {
		var icon = $(this).find(".arrow-icon");
	
		icon.css("transform", "rotate(0deg)");
		$(this).removeClass('active');
	});
	
	/*!
	* jquery.counterup.js 1.0
	*
	* Copyright 2013, Benjamin Intal http://gambit.ph @bfintal
	* Released under the GPL v2 License
	*
	* Date: Nov 26, 2013
	*/
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
