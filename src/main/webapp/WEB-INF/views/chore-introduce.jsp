<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="./sub/header.jsp" />
<title>소개&nbsp;|&nbsp;기분 좋은 콘텐츠</title>
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
				<h2 class="snb-title sr-only">기분 좋은 콘텐츠 소개</h2>
				<nav>
					<ul class="depth2" id="subNavi">
						</ul>
				</nav>
			</div>
			<div class="cont-top">
				

			</div>
		</div>
		<section class="cont-wrap horizontal">
			<h1 class="stitle">기분 좋은 콘텐츠 소개</h1>
			<div id="contents" class="container">
				<div class="cont-mid ">
					<div class="release-info">

						<div class="title-box container-fluid">
							<h2 class="title"><i class="icon"></i>기분 좋은 콘텐츠 소개</h2>
							<div class="cont">
								<p>블라 블라 블라 블라	</p>
							</div>
						</div>

						<div class="standard-wrap">
							<section class="standard container-fluid">
								<div class="col-xs-12 col-sm-3">
									<h3 class="standard-title">
										<small>NO 1</small>
										<span>위로가 되는 이야기</span>
									</h3>
								</div>
								<div class="standard-cont col-xs-12 col-sm-9">
									<h4 class="point2">우울증에 대한 다양한 이야기를 공유할 수 있습니다. </h4>
									<ul>
										<li>
											<strong class="title">위로 문구</strong>
												<ul class="list-dot">
													<li>위로가 되는 문구와 명언을 보실 수 있습니다.</li>
												</ul>
										</li>

										<li>
											<strong class="title">우울증 수기</strong>
											<ul class="list-dot">
												<li>우울증을 겪고 계시거나, 과거에 겪으셨던 이야기를 들려주시고, 함께 응원합시다.</li>
											</ul>
										</li>
									</ul>
								</div>
							</section>
							<section class="standard container-fluid">
								<div class="col-xs-12 col-sm-3">
									<h3 class="standard-title">
										<small>NO 2</small>
										<span>영상 함께 봐요</span>
									</h3>
								</div>
								<div class="standard-cont col-xs-12 col-sm-9">
									<h4 class="point2">유튜브에서 긍정적이고 기분 좋은 영상을 모아 두었습니다.  </h4>
									<strong class="title">기분 좋은 영상 공유</strong>
									<ul class="list-dot">
										<li>기분 좋은 영상을 보시고 다른 분들께도 공유해주세요</li>
										<li>여러분이 알고 계시는 좋은 영상이 있으시면 다른 분들과 공유할 수 있도록 게시하실 수 있습니다.</li>
									</ul>
								</div>
							</section>
							<section class="standard container-fluid">
								<div class="col-xs-12 col-sm-3">
									<h3 class="standard-title">
										<small>NO 3</small>
										<span>요리자랑</span>
									</h3>
								</div>
								<div class="standard-cont col-xs-12 col-sm-9">
									<h4 class="point2">건강한 음식은 우리 몸과 마음을 건강하게 해주는 필수 요소입니다.</h4>
									<strong class="title">요리 자랑</strong>
									<ul class="list-dot">
										<li>작은 성취를 느낄 수 있도록 오늘은 집에서 요리를 해보시는 건 어떨까요?</li>
										<li>정성스럽게 만드신 요리 사진을 게시해 주세요.</li>
										<li>다른 분들의 요리에 대해 추천과 응원을 댓글을 다실 수 있습니다.</li>
									</ul>
						
	
								</div>
							</section>
							<section class="standard container-fluid">
								<div class="col-xs-12 col-sm-3">
									<h3 class="standard-title">
										<small>NO 4</small>
										<span>함께 얘기해요</span>
									</h3>
								</div>
								<div class="standard-cont col-xs-12 col-sm-9">
									<h4 class="point2">익명으로 다른 분들과 이야기를 나눌 수 있습니다.</h4>
									<strong class="title">익명 수다방</strong>
									<ul class="list-dot">
										<li>다른 사람과 편안하게 이야기를 나눠보세요. </li>
										<li>외로움은 다른 사람과의 관계를 통해 덜어낼 수 있습니다.</li>
										<li>익명으로 편안하게 본인의 이야기를 나눠보세요.</li>
									</ul>
			
								</div>
							</section>

						</div>



					</div></div>



<script>
	var gContextPath = "";

	

	// 레이어 호출용 메소드
	function layer_open(){
	 	$(".popup-layout").fadeIn();
	 	$("#srcData").select();

	function layer_close(){
		$(".popup-layout").fadeOut();
	}
</script></div>
    	</section>
    	<a href="#uppermost" class="go-top"><i class="xi-arrow-up"></i><span class="sr-only">페이지 맨위로 이동</span></a>
	</main>
    <!-- footer -->
<jsp:include page="./sub/footer.jsp" />
