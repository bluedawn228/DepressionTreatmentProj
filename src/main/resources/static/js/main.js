
 $(document).ready(function(){
	/**
	 *  탑 메뉴바의 햄버거 버튼
	 */
	 $('#line-wrapper').click(function(){
	
	  $('.line').removeClass('init');
	  $('#line-top').toggleClass('line-top').toggleClass('top-reverse');
	  $('#line-mid').toggleClass('line-mid').toggleClass('mid-reverse');
	  $('#line-bot').toggleClass('line-bot').toggleClass('bot-reverse');
	})
	
})
