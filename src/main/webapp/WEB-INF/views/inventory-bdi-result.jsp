<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="./sub/header.jsp" />
<title>K-BDI 검사&nbsp;|&nbsp;심리검사</title>

<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-53480561-1');
</script>


<script src="/js/depressionInventory.js"></script>

</head>
<body>

<a id="uppermost2" href="#contents" class="skip-to">본문 바로가기</a>
<a id="uppermost" href="#gnb" class="skip-to">주메뉴 바로가기</a>
<!-- wrap -->
<div id="wrap">

<jsp:include page="./sub/navigation.jsp" />

<main id="main" class="main">
		<div id="spot" class="sub7">
		</div>
		<section class="cont-wrap horizontal">
			<h1 class="stitle">심리검사</h1>
			<div id="contents" class="container">
				<div class="cont-mid ">
					
							<div>
									<h4>BDI 검사 결과 점수 범위 설명</h4>
										<ul>
											<li>우울하지 않은 상태 ( 0~ 9점 )</li>	
											<li>가벼운 우울 상태 ( 10 ~ 15점 )</li>
										 	<li>중한 우울 상태 ( 16 ~ 23점 )</li>
											<li>심한 우울 상태 ( 24 ~ 63점 )</li>
										</ul>
							</div>
							
							

							<div>
									<h4>당신은 "${result_bdi} (${sum_bdi} }점)" 입니다.</h4>
									<input type="hidden" id="bdiResult"  value="${sum_bdi}">
									<h4>검사 결과를 나중에 다시 확인하시려	면 아래 저장 버튼을 눌러주세요</h4>
									<p> 결과 저장을 위해서는 회원가입 및 로그인이 필요합니다.</p>
									<button type="button" onClick="saveResult()">저장</button>
							</div>
							
							<div>
									<h4>검사 결과에 따른 추천 콘텐츠</h4>
									<div>
											읽을거리 
									</div>
									<div>
											기타 추천자료 
									</div>
							</div>
							
							<div>
									<h4>소셜 공유 버튼 </h4>
										<a id="create-kakao-link-btn" href="javascript:;">
										  <img
										    src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"
										  />
										</a>
										<script type="text/javascript">
										  Kakao.Link.createDefaultButton({
										    container: '#create-kakao-link-btn',
										    objectType: 'text',
										    text:
										      '당신은 "'+${result_bdi}+' (' +${sum_bdi}+' }점)" 입니다.',
										    link: {
										      mobileWebUrl: 'https://developers.kakao.com',
										      webUrl: 'https://developers.kakao.com',
										    },
										  })
										</script>
																	
									<h4>이메일 전송 버튼</h4>
									<button id="emailSender" type="button" >이메일 전송</button>
									
							</div>
				
						<div id="emailModal" class='emailModal' style="display:none;" >
							<h1 id="emailTitle"> 이메일 보내기 </h1>
							<div id="emailContent">
									이메일 주소 <input id="emailAddr" type="email" name="email">
							</div>
							<button id="emailSend" type="button" >전송</button>
							<button id="emailSenderClose" type="button" onClick="javascript:$('#emailModal').hide()">닫기</button>
						</div>
					
					
				</div>
			</div>
    	</section>
    	<a href="#uppermost" class="go-top"><i class="xi-arrow-up"></i><span class="sr-only">페이지 맨위로 이동</span></a>
	</main>

<jsp:include page="./sub/footer.jsp" />