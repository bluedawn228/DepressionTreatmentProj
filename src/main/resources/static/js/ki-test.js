/**
 * 
 */
 
$(document).ready(function(){
	
	//introduce  슬라이드
	$(".introduce .counter").prepend('<strong class="current-index"></strong> / ');
	var introSlider = $(".intro-list").bxSlider({ 
		autoStart		: true,
		auto			    : true,
		autoHover		: true,
		speed			    : 1000,
		pause		 	    : 3000,
		mode			    : 'fade',
		maxSlides		: 1,
		minSlides        : 1,
		moveSlides     : 1,
		pager			    : false,
		responsive		: false,
		autoControls	: true,
		controls		    : true,
		touchEnabled  : navigator.maxTouchPoints > 0,
		onSliderLoad: function(currentIndex){
			$('.introduce .counter .current-index').text(currentIndex + 1);
		},
		onSlideBefore: function($slideElement, oldIndex, newIndex) {
			$('.introduce .counter .current-index').text(newIndex + 1);
		},
	});	  
	$(".intro-list li > a").on("focusin", function(){
		introSlider.stopAuto();
	});
	$(".intro-list li > a").on("focusout", function(){
		introSlider.startAuto();
	});
	$(".introduce .counter").append(introSlider.getSlideCount());

	
	
	
});