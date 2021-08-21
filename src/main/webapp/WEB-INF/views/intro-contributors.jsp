<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="./sub/header.jsp" />
<title>제작 참여&nbsp;|&nbsp;토닥토닥 소개</title>
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
		<div id="spot" class="sub4">
			<div id="snb">
				<h2 class="snb-title sr-only">제작 참여</h2>
				<nav>
					<ul class="depth2" id="subNavi">
						</ul>
				</nav>
			</div>
			<div class="cont-top">


			</div>
		</div>
		<section class="cont-wrap horizontal">
			<h1 class="stitle">사업실명제 개요</h1>
			<div id="contents" class="container">
				<div class="cont-mid ">
					<div class="release-info business-name">
	
						<div class="standard-wrap">
							<section class="standard container-fluid">
								<div class="col-xs-12 col-sm-3">
									<h3 class="standard-title">
										<small>NO 1</small>
										<span>김지영</span>
									</h3>
								</div>
								<div class="standard-cont col-xs-12 col-sm-9">
									<h4 class="point2">주요 소개</h4>
									<ul class="list-nostyle">
										<li>블라블라</li>
										<li>블라블라</li>
										<li>블라블라</li>
										<li>블라블라</li>
										<li>블라블라</li>
									</ul>
								</div>
							</section>
							<section class="standard container-fluid">
								<div class="col-xs-12 col-sm-3">
									<h3 class="standard-title">
										<small>NO 2</small>
										<span>김찬구</span>
									</h3>
								</div>
								<div class="standard-cont col-xs-12 col-sm-9">
									<h4 class="point2">주요 소개</h4>
									<ul class="list-nostyle">
										<li>블라블라</li>
										<li>블라블라</li>
										<li>블라블라</li>
										<li>블라블라</li>
										<li>블라블라</li>
									</ul>
								</div>
							</section>
							<section class="standard container-fluid">
								<div class="col-xs-12 col-sm-3">
									<h3 class="standard-title">
										<small>NO 3</small>
										<span>박세윤</span>
									</h3>
								</div>
								<div class="standard-cont col-xs-12 col-sm-9">
									<h4 class="point2">주요 소개</h4>
									<ul class="list-nostyle">
										<li>블라블라</li>
										<li>블라블라</li>
										<li>블라블라</li>
										<li>블라블라</li>
										<li>블라블라</li>
									</ul>
								</div>
							</section>
							<section class="standard container-fluid">
								<div class="col-xs-12 col-sm-3">
									<h3 class="standard-title">
										<small>NO 4</small>
										<span>조현영</span>
									</h3>
								</div>
								<div class="standard-cont col-xs-12 col-sm-9">
									<h4 class="point2">주요 소개</h4>
									<ul class="list-nostyle">
										<li>블라블라</li>
										<li>블라블라</li>
										<li>블라블라</li>
										<li>블라블라</li>
										<li>블라블라</li>
									</ul>
								</div>
							</section>
							<section class="standard container-fluid">
								<div class="col-xs-12 col-sm-3" >
									<h3 class="standard-title">
										<small>NO 5</small>
										<span>황명환</span>
									</h3>
								</div>
								<div class="standard-cont col-xs-12 col-sm-9">
									<h4 class="point2">주요 소개</h4>
									<ul class="list-nostyle">
										<li>블라블라</li>
										<li>블라블라</li>
										<li>블라블라</li>
										<li>블라블라</li>
										<li>블라블라</li>
									</ul>
								</div>
							</section>
						</div>

					</div><p><br></p></div>

<script>
	var gContextPath = "";


	// 레이어 호출용 메소드
	function layer_open(){
	 	$(".popup-layout").fadeIn();
	 	$("#srcData").select();

		/* $('.btn-close').click(function(e)
		{
			//temp.fadeOut();     //'닫기'버튼을 클릭하면 레이어가 사라진다.
			$('#layer1').fadeOut();
			$(".pop-container").fadeOut();
			$(".srcCopy").focus();

			e.preventDefault();
		}); */
	}

	function layer_close(){
		$(".popup-layout").fadeOut();
	}
</script></div>
    	</section>
    	<a href="#uppermost" class="go-top"><i class="xi-arrow-up"></i><span class="sr-only">페이지 맨위로 이동</span></a>
	</main>
    <!-- footer -->
<jsp:include page="./sub/footer.jsp" />