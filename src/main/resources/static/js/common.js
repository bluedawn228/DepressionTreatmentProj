/*function navigation(){
  var $gnb = $("#header .nav");
  if($(window).width()>1150){
    $gnb.find('a').on('focusin mouseenter', function(){
      $gnb.addClass('active');
      $('#gnb').find('.depth1').removeClass('active');
      $(this).parent().addClass('active');
    });
    $('#gnb').on('mouseleave', function(){
      $('#gnb').parent('.nav').removeClass('active');
      $('#gnb').find('.depth1').removeClass('active');
    });
    $('#header .util a').on('focusin', function(){
    	$('#gnb').parent('.nav').removeClass('active');
    });
    $('#header .logo a').on('focusin', function(){
    	$('#gnb').parent('.nav').removeClass('active');
    });
  }else{
    $gnb.find('.depth1 > a').on("click", function(){
      $(this).parent().addClass('active').siblings().removeClass('active');
      return false;
    });
  }
}
*/
$(document).ready(function(){
	var $gnb = $("#header .nav");
	  if($(window).width()>1150){
	    $gnb.find('a').on('focusin mouseenter', function(){
		  $gnb.addClass('active');
		  $('#gnb').find('.depth1').removeClass('active');
		  $(this).parent().addClass('active');
		});
		$('#gnb').on('mouseleave', function(){
		  $('#gnb').parent('.nav').removeClass('active');
		  $('#gnb').find('.depth1').removeClass('active');
		});
		$('#header .util a').on('focusin', function(){
			$('#gnb').parent('.nav').removeClass('active');
		});
		$('#header .logo a').on('focusin', function(){
		$('#gnb').parent('.nav').removeClass('active');
	    });
	  }else{
	    $gnb.find('.depth1 > a').on("click", function(){
	  $(this).parent().addClass('active').siblings().removeClass('active');
	      return false;
	    });
	  }
	  
	$(".tabs ul li.active a").attr("title","선택됨");
	
	var totalSearchLayer = $(".total-search-layer");
	$(".util .total-search").on('click', function() {
	    totalSearchLayer.addClass("active");
	    $("html").addClass("active");
	});
	$(".util .total-search-layer .btn-close").on('click', function() {
	    totalSearchLayer.removeClass("active");
	    $("html").removeClass("active");
	});
	$(".util .total-search-layer .btn-close").on('focusout', function() {
	    totalSearchLayer.find('.logo a').focus();
	});
	
	
	var popupLayer = $("#popup-layer");
	$(".popup-notice").on('click', function() {
		setCookiePopup( "todayCookie", "" , 1);		
	    $("html").addClass("popup-scrollFixed");
	    $(".popup-slide .popup-list li a").focus();
	    
		if($(this).data('cnt')) {
			popupLayer.addClass("active");
		 } else {
			  alert("팝업이 존재하지 않습니다.");
			  $("html").removeClass("popup-scrollFixed");
		}

		/*$('#header .util .side-popup').prepend($('#popup-layer'));
		$('#header .util .side-popup').prepend($('#popup-notice'));*/
	});
	var nPopupWindowCnt = 0;
	$("#popup-layer .btn-close").on('click', function() {
		popupLayer.removeClass("active");		
		setCookie( "popupLayer", "done" , 1);
	    $("html").removeClass("popup-scrollFixed");
	    $(".popup-notice").focus();
	});

	
	$(".popup-counter").prepend('<strong class="current-index"></strong> / ');
	var popupSlider = $(".popup-slide .popup-list").bxSlider({
		auto: true,
		speed : 500,
		pause : 4000,
	    maxSlides : 1,
	    minSlides : 1,
		moveSlides : 1,
		mode : 'vertical',
		pager		: true,
		controls	: true,
		infiniteLoop : false,
		/*hideControlOnEnd :true,*/
		ariaHidden : false,
		autoHover	: true,
		autoControls : true,
		stopAutoOnClick : true,
		touchEnabled : false,
		preventDefaultSwipeY : false,
		onSliderLoad : function(currentIndex){
	      $('.popup-counter .current-index').text(currentIndex + 1);
	      $(".popup-slide .bx-pager .bx-pager-item .bx-pager-link").attr("title","");
	      $(".popup-slide .bx-pager .bx-pager-item .bx-pager-link.active").attr("title","선택됨");
	      
	    },
	    onSlideBefore: function($slideElement, oldIndex, newIndex) {
	      $(".popup-counter .current-index").text(newIndex + 1);
	    },
	    onSlideAfter: function($slideElement, oldIndex, newIndex){
	      $(".popup-list").children("li").each(function(){
		      if($(this).attr("aria-hidden") == "false"){
		    	  $(this).find("a").attr("tabIndex","0");
		      }else{
		    	  $(this).find("a").attr("tabIndex","-1");
		      }
	      });
	      $(".popup-slide .bx-pager .bx-pager-item .bx-pager-link").attr("title","");
	      $(".popup-slide .bx-pager .bx-pager-item .bx-pager-link.active").attr("title","선택됨");
	    }
	});
	$(".popup-slide .popup-list li a").on("focusin", function(){
		popupSlider.stopAuto();
	});
	$(".popup-slide .popup-list li a").on("focusout", function(){
		popupSlider.startAuto();
	});
	 $(".popup-slide .popup-counter").append(popupSlider.getSlideCount());

	$(".util .all-menu").on('click', function() {
		$("body, #header").addClass("all-menu-open");
		$("#header .logo a").focus();
	});
  
  $(".nav .all-menu-close").on('click', function() {
	$('#gnb').parent('.nav').removeClass('active');
    $("body, #header").removeClass("all-menu-open");
    $(".section-nav .nav-visual a").focus();
  });
  
  $(".nav .all-menu-close").on('focusout', function() {
	  $("#header.all-menu-open .logo a").focus();
  });

    //contents
    $(".go-top, .scroll-down").on('click', function() {
      $('html, body').animate({scrollTop: $(this.hash).offset().top}, 800, function(){});
      return false;
    });
    
    $(".relate-site .title").on("click", function(){
  		$(this).parent().toggleClass("active");
      return false;
  	});
    $(".relate-site .list li:last").find("a").on("focusout", function(){
    	$(".relate-site").removeClass("active");
  	});
    $(".tabs").on("click", function(){
      $(this).parent().addClass("active").siblings().removeClass("active");
    });
    $(".tab-nav > ul > li > a").on("click", function(){
      $(this).parent().addClass("active").siblings().removeClass("active");
      //event.preventDefault();
      //return false;
    });

    $(".org-detail .tab-nav > ul > li > a").on("click", function(){
        $(this).parent().toggleClass("active");
        event.preventDefault();
        return false;
      });


    var $searchNav = $(".total-search-result .search-tab ul");
    $searchNav.find("a").click(function(){
    	$(this).parent().addClass("active").siblings().removeClass("active");
    });

  
});


/*$(window).on("resize", function(){
  navigation();
});
*/
/*
$(window).on("load scroll", function(){
  var el = $("#footer");
  console.log(el.offset().top, $(window).scrollTop());
  if(el.offset().top <= $(window).scrollTop()){
    $(".go-top").addClass("stick");
  }else{
    $(".go-top").removeClass("stick");
  }
});
*/


//SNS 공유기능
//facebook 공유
function facebook(){
	var url = "http://www.facebook.com/sharer.php?u=" + encodeURIComponent(document.URL);
	$(".facebook").attr("href", url);
	$(".facebook").click();
}

//트위터보내기
function gfnToTwitter(strUrl){
	var shareUrl = "http://twitter.com/share?url=" + encodeURIComponent(strUrl);
	window.open(shareUrl, 'share_twitter', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');
}

/*$(function(){
	if(typeof Kakao !== "undefined") {
		Kakao.init('416390a719cbfba0726bb85544063852');
	}
})*/

function sendKakaoStory(menuName){
	if(typeof Kakao !== "undefined") {
		Kakao.Story.share({
			text: menuName,
			url: document.location.href
		});
	}
}