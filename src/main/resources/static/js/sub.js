
var thumbResize;

$(window).load(function(){
	$("#popup-layer").removeClass("active");
	
	if($(".snb .depth3 li.on").offset() != undefined){
		var snbDepthActive = $(".snb .depth3 li.on").offset().left;
		$(".snb .depth3").scrollLeft(snbDepthActive);
	}

	/* 전화번호 */
	$(".org-member-info .tel span").prepend("042-860-");
});


function thumbnailResize() {
	var divs = document.querySelectorAll('.pinterest-board li > a .img');
	for (var i = 0; i < divs.length; ++i) {
		var div = divs[i];
		var divAspect = div.offsetHeight / div.offsetWidth;
		div.style.overflow = 'hidden';

		var img = div.querySelector('.pinterest-board li > a .img img');
		var imgAspect = img.height / img.width;

		if (imgAspect <= divAspect) {
			// 이미지가 div보다 납작한 경우 세로를 div에 맞추고 가로는 잘라낸다
			var imgWidthActual = div.offsetHeight / imgAspect;
			var imgWidthToBe = div.offsetHeight / divAspect;
			var marginLeft = -Math.round((imgWidthActual - imgWidthToBe) / 2)
			img.style.cssText = 'width: auto; height: 100%; margin-left: '
			+ marginLeft + 'px;'
		} else {
			// 이미지가 div보다 길쭉한 경우 가로를 div에 맞추고 세로를 잘라낸다
			img.style.cssText = 'width: 100%; height: auto; margin-left: 0;';
		}
	}
};

function bigview(){
	if($(window).width()<767){
	 $(".figure").click(function(){
		 $('body').addClass("fullscreen");
		 if(!$(this).hasClass("active")){
			 $(this).append("<div class='close'><i class='xi-close'></i><span class='sr-only'></span></div>");
		 }
		 $(this).addClass("active");
	 });
	 $("#contents").on( "click focus", ".close",  function(){
		$("body").removeClass("fullscreen");
		$(this).parent().removeClass("active");
		$(".close").remove();
	});
 }
}

$(window).on("load resize", function(){
	thumbnailResize();
});

$(document).ready(function(){

	bigview();
	thumbnailResize();

	var zoomVar = 18;
	$(".cont-util .zoom-plus").click(function(){
		zoomVar = zoomVar + 1;
		$(".cont-mid ").css("font-size",""+ zoomVar +"px");
		return false;
	});
	$(".cont-util .zoom-minus").click(function(){
		zoomVar = zoomVar - 1;
		$(".cont-mid ").css("font-size",""+ zoomVar +"px");
		return false;
	});

  $(".sns>a").click(function(){
    $(this).parent().toggleClass("active");
  });

	$(".director .tab-nav a").on("click", function() {
		$(this).parent().addClass("active").siblings().removeClass("active");
		$("html, body").animate({scrollTop: $(this.hash).offset().top}, 800, function(){});
		return false;
	});

/* recruit, faq */
	$(".recruit .tab-nav a, .faq .tab-nav>ul>li>a, .map-section .tab-nav>ul>li>a").on("click", function() {
		$(this).parent().addClass("active").siblings().removeClass("active");
		$($(this.hash)).fadeIn().siblings().fadeOut();
		return false;
	});

	var locHash = location.hash;
	console.log(locHash);
	if(locHash != null && locHash != ''){
		if(locHash == "#recruit3"){
			$(".recruit .tab-nav li:nth-child(3)").addClass("active").siblings().removeClass("active");
			$(locHash).fadeIn().siblings().fadeOut();
		}
	}



	/* 아코디언 */
	$(".accordion>li>a").on("click", function(){
		$(this).parent().toggleClass("active").siblings().removeClass("active");
		
		var accAct = $(this).parent().attr("class");
		if(accAct == "active"){
			$(".accordion>li>a").attr("title","축소됨");
			$(this).attr("title","확장됨");
		} else{
			$(this).attr("title","축소됨");
		}
		return false;
	});


	/* 지식자산정보 접근성 수정 2019-05-22 OH HYUN SE*/
	var captionText = $(".table").find("caption").text();
	$(".year-select #btnSearch").click(function(){
		var year = $(".year-select .select-tab").val();

		$('.tablePage').css('display', 'none');
		$("#page" + year).css('display', 'table-row-group');
		$(".table").find("caption").text(year + captionText);
	});


	// 가혜꺼
	$(" .page-number-view-btn li > a").on("click", function() {
    $(this).parent().addClass("active").siblings().removeClass("active");
  });
  $(" .pager > span > a").on("click", function() {
    $(this).addClass("active").siblings().removeClass("active");
  });
	$(".board-style03 tbody tr").hover(function() {
    $(this).addClass("active").siblings().removeClass("active");
  });
	$(".board-style03 tbody tr td a").focus(function() {
	    $(this).parent().parent().addClass("active").siblings().removeClass("active");
	  });

/*----------------------------
	SCROLLMAGIC
	----------------------------*/
	var ctrl = new ScrollMagic.Controller();
	/*----------------------------
	visual
	----------------------------*/
   new ScrollMagic.Scene({ 'triggerElement': '.visual',  'triggerHook': 0,  'offset': 800 })
   .setPin('.visual')
   .addTo(ctrl);
 		/*----------------------------
 		sub0104-history
 		----------------------------*/
		$(".timeline>li:first").addClass("active");
		$(".timeline>li").each(function() {
    	new ScrollMagic.Scene({ triggerElement: this, duration: 4000, offset:-400 })
			//.setTween(this, {opacity:1, y:0})
			.setClassToggle(this, 'active')
      .addTo(ctrl);
  	});
		/*----------------------------
 		sub010402-역대기관장
 		----------------------------*/
		var directorTab = ".director .tab-nav";
		new ScrollMagic.Scene({ triggerElement: directorTab, 'triggerHook': 0, offset:0 })
		//.setTween(this, {opacity:1, y:0})
		//.setClassToggle('.director .tab-nav', 'active')
		.setPin(directorTab)
		.setClassToggle(directorTab, 'fixed')
		.addTo(ctrl);

		new ScrollMagic.Scene({triggerElement: "#director4", duration:700})
						.setClassToggle("#tab-nav1", "active") // add class toggle
						.addTo(ctrl);
		new ScrollMagic.Scene({triggerElement: "#director3", duration:700})
						.setClassToggle("#tab-nav2", "active") // add class toggle
						.addTo(ctrl);
		new ScrollMagic.Scene({triggerElement: "#director2", duration:700})
						.setClassToggle("#tab-nav3", "active") // add class toggle
						.addTo(ctrl);
		new ScrollMagic.Scene({triggerElement: "#director1", duration:700})
						.setClassToggle("#tab-nav4", "active") // add class toggle
						.addTo(ctrl);

		/*----------------------------
		SECTION 2
		----------------------------*/
		var contentsTween = new TimelineMax()
		.add([
			TweenMax.to(".go-top", 0.3, {css:{className:'+=active'}})
		 ])
		var sceneContents = new ScrollMagic.Scene({
			triggerElement: '.cont-mid',
			triggerHook: 1,
			offset: 1000,
			duration: "100%"
		})
		.setTween(contentsTween)
		.addTo(ctrl);
});


$(window).on('resize', function() {
  bigview();
});
