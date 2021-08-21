<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="./sub/header.jsp" />
<title>소개&nbsp;|&nbsp;상담소 진료소</title>
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
		<div id="spot" class="sub2">
			
	
		</div>
		<section class="cont-wrap horizontal">
			<h1 class="stitle">상담소 진료소 추천</h1>
			<div id="contents" class="container">
				<div class="cont-mid ">
					<div class="customer-service">
						<section class="txt">
							<h2 ><strong>상담소 진료소 추천</strong></h2>
							<p class="sub-txt">건강보험심사평가원의 <strong class="point1">병원평가정보</strong>와 <br class="web"> 서늘한 여름밤님의 <strong class="point1">추천지도</strong>에 근거하여 제공되는 정보입니다.</p>
						</section>
						<section class="standard container-fluid">
							<div class="col-xs-12 col-sm-3">
								<h3 class="standard-title">의료급여<br>정신과<br>평가정보</h3>
							</div>
							<div class="standard-cont col-xs-12 col-sm-9">
								<h4 class="point2">평가 이유</h4>
								<ul class="list-dot">
									<li>의료급여환자의 정신건강의학과 입원료는 1일당 정해진 금액만을 받도록 하고 있어, </li>
									<li>병원에서 치료에 필요한 의료서비스를 적게 제공할 우려가 있습니다.</li>
									<li>건강보험심사평가원은 이를 방지하고, 더불어 병원에서 환자에게 근거중심의 효과적인 의료서비스를 제공하여</li>
									<li>퇴원 후 지역사회에 원만하게 복귀할 수 있도록 하고자 평가를 시행하였습니다.</li>
									<li>또한 국민이 정신건강의학과 병원 선택 시에 참고할 수 있도록 평가결과를 공개하고 있습니다.</li>
								</ul>
	
								<h4 class="point2">평가 대상</h4>
								<ul class="list-dot">
									<li>2019년 1월~6월 동안 의료급여 정신건강의학과 입원 진료비를 청구한 기관을 대상으로 평가하였습니다. </li>
									
								</ul>
				
								<h4 class="point2">평가 내용</h4>
								<ul class="list-dot">
									<li><strong>과정부문 </strong> 정신요법 실시횟수(주당), 개인정신치료 실시횟수(주당)에 대해 평가하였습니다.</li>
									<li><strong>결과부문 </strong> 조현병 및 알코올장애 환자의 재원·퇴원환자 입원일수 중앙값, 조현병 환자의 퇴원 후
                30일 이내 재입원율, 조현병 및 알코올장애 환자의 퇴원 후 30일 이내 낮병동 또는
                외래방문율, 조현병 환자의 지역사회서비스 연계 의뢰율에 대해 평가하였습니다.</li>
								</ul>
						
								<h4 class="point2">평가 등급</h4>
								<ul class="list-dot">
									<li><strong>1등급 </strong> 종합결과가 80점 이상인 기관</li>
									<li><strong>2등급 </strong> 종합결과가 70점 이상 ~ 80점 미만인 기관</li>
									<li><strong>3등급 </strong> 종합결과가 60점 이상 ~ 70점 미만인 기관</li>
									<li><strong>4등급 </strong> 종합결과가 50점 이상 ~ 60점 미만인 기관</li>
									<li><strong>5등급 </strong> 	종합결과가 50점 미만인 기관</li>
									<li><strong>등급제외 </strong> 평가지표 9개 중 5개 미만 산출기관</li>
									
								</ul>
							
			
							<p class="sub-txt">자료 출처 : 건강보험심사평가원 병원평가정보</p>
							</div>
						</section>
						<section class="standard container-fluid">
							<div class="col-xs-12 col-sm-3">
								<h3 class="standard-title">상담소<br>진료소<br>이용후기</h3>
							</div>
							<div class="standard-cont col-xs-12 col-sm-9">
								<h4 class="point2">서늘한 여름밤의 추천 지도</h4>
								<strong class="title">추천지도란?</strong>
								<ul class="list-dot">
									<li>2016.11~2021.1월까지 상담소 또는 진료소를 방문한 많은 분들의 후기를 토대로</li>
									<li>서늘한밤님이 작성한 구글 지도 입니다.</li>
									<li>자료 원본 : <strong><a href="https://m.blog.naver.com/leeojsh/220852877049" target="_blank">심리상담센터/정신과 추천 지도</a></strong></li>
								</ul>
								<strong class="title">유의 사항</strong>
								<ul class="list-dot">
									<li>상담사나 내담자의 개개인의 추천을 받아 만든 것이기 때문에 개인의 주관이 강하게 반영되어 있습니다 </li>
									<li>같은 상담소 진료소라도 개인에 따라 느끼는 바가 다를 수 있습니다. </li>
								</ul>
								<strong class="title">긍정도 평가도</strong>
								<ul class="list-dot">
									<li>블로그에 1680여개의 댓글을 네이버 Sentiment 감정 분석 API를 통해 분석한 결과입니다.</li>
									<li>긍정도, 중립도, 부정도의 합이 100%를 나타내며, 중립도의 비중에 따라 긍정도와 부정도가 실제 느낀점과 다를 수 있습니다. </li>
								</ul>
								
							</div>
						</section>
					</div></div>


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