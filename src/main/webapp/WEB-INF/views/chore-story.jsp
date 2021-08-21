<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="./sub/header.jsp" />
<title>위로가 되는 이야기&nbsp;|&nbsp;기분 좋은 콘텐츠</title>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-53480561-1');
</script>
<script>
	var gContextPath = "";

	$(function() {
			
		

		$('body').on('click', 'ul.tag-list li', function(){
			var keyword = $(this).text().replace('#','');
			document.topSearchForm.schText.value = keyword;
			document.topSearchForm.submit();
		});
	});
</script>

<script>
$(document).ready(function(){
	var min=1;
	var max=${consolation.count };
	var random = parseInt(( Math.random() * ( max - min )  ) + min);
	
	//alert(random);
	//$("#consolation").css("background-image","url('./images/consolation/"+random+".png'");
})
</script>
<style>
    .outer {
  text-align: center;
	}
	.inner {
	 display: inline-block 
	}
	.contents{
	padding:30px;
	 width:100%;
	 height:200px;
	 display: table-cell;
     vertical-align: middle;
	 text-align:center;
	 line-height:50px;
	 margin:0 auto;
	}

</style>	

</head>
<body>

<a id="uppermost2" href="#contents" class="skip-to">본문 바로가기</a>
<a id="uppermost" href="#gnb" class="skip-to">주메뉴 바로가기</a>
<!-- wrap -->
<div id="wrap">
<jsp:include page="./sub/navigation.jsp" />
<main id="main" class="main">
		<div id="spot" class="sub6">
			<div id="snb">
				<h2 class="snb-title sr-only">위로가 되는 이야기</h2>
				<nav>
					<ul class="depth2" id="subNavi">
						</ul>
				</nav>
			</div>
			<div class="cont-top">

	
			</div>
		</div>
		<section class="cont-wrap horizontal">
					
					
				<div class="knowledge-asset release-info">
					<div class="title-box container-fluid">
					<div class="outer">
					 		<div class="inner">
									<div id="consolation"  class="contents"> 
										 	<h1>${consolation.title }</h1>
										 	<h3><i>${consolation.content }</i></h3>
										 	<h5>${consolation.author }</h5>
									</div>	 
							</div>	 
					</div>
						<h2>우울증 수기</h2>
						<ul class="list-box row">
							<li class="col-xs-6 col-sm-4"><a href="https://m.blog.naver.com/PostList.naver?blogId=leeojsh" target="_blank"> <i class="icon1"></i>서늘한 여름밤의 블로그<i class="xi-angle-right"></i></a></li>
								<li class="col-xs-6 col-sm-4"><a href="https://brunch.co.kr/brunchbook/ellanman" target="_blank"> <i class="icon2"></i>마흔에 잠시 쉬어 갑니다 브런치<i class="xi-angle-right"></i></a></li>
								<li class="col-xs-6 col-sm-4"><a href="https://brunch.co.kr/brunchbook/whatalife"  target="_blank"> <i class="icon3"></i>이렇게 살게 될 줄이야 브런치<i class="xi-angle-right"></i></a></li>
								</ul>
				
						<h2>우울증을 알아가는데 도움이 되는 사이트</h2>
				
						<ul class="list-box row">
							<li class="col-xs-6 col-sm-4"><a href="https://www.nhis.or.kr/nhis/healthin/wbhacd24800m01.do" target="_blank"><i class="icon4"></i>국민건강보험 > 우울증 바로 알기<i class="xi-angle-right"></i></a></li>
								<li class="col-xs-6 col-sm-4"><a href="https://www.onmaum.com:4447/bbs/index.html?code=depressive" target="_blank"><i class="icon5"></i>온마음 > 의학정보 > 우울장애<i class="xi-angle-right"></i></a></li>
								<li class="col-xs-6 col-sm-4"><a href="http://www.nmhc.or.kr/ezboard.php?GID=root&BID=board21" target="_blank"><i class="icon6"></i>중앙정신건강복지사업지원단 > 정신보건기관 찾기<i class="xi-angle-right"></i></a></li>
								<li class="col-xs-6 col-sm-4"><a href="http://www.hira.or.kr/re/diag/getDiagEvlList.do" target="_blank"><i class="icon7"></i>건강보험심사평가원 > 병원평가정보<i class="xi-angle-right"></i></a></li>
								</ul>
				
					</div>
				
				</div>

		<script>
			var gContextPath = "";
		
			
			// 레이어 호출용 메소드
			function layer_open(){
			 	$(".popup-layout").fadeIn();
			 	$("#srcData").select();
		
			
			}
		
			function layer_close(){
				$(".popup-layout").fadeOut();
			}
		</script>

    	</section>
    	<a href="#uppermost" class="go-top"><i class="xi-arrow-up"></i><span class="sr-only">페이지 맨위로 이동</span></a>
	</main>
</div>	
    <!-- footer -->
<jsp:include page="./sub/footer.jsp" />