<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--  header -->
<jsp:include page="./include/header.jsp"/>
<!--  header -->
<link href="./css/depressionInventory.css" rel="stylesheet">
<script src="./js/depressionInventory.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('ab8db4dc71897940e7bd85b0c7abec39');

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
    </script>
</head>
<body>


<!--  navigation -->
<jsp:include page="./include/navigation.jsp"/>
<!--  navigation -->

      
<!--  main  start-->
<main>
		<div class="container">
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
						<h4>당신은 "가벼운 우울 상태(11점)" 입니다.</h4>
						<input type="hidden" id="bdiResult"  value="0">
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
							      '기본 템플릿으로 제공되는 텍스트 템플릿은 텍스트를 최대 200자까지 표시할 수 있습니다. 텍스트 템플릿은 텍스트 영역과 하나의 기본 버튼을 가집니다. 임의의 버튼을 설정할 수도 있습니다. 여러 장의 이미지, 프로필 정보 등 보다 확장된 형태의 카카오링크는 다른 템플릿을 이용해 보낼 수 있습니다.',
							    link: {
							      mobileWebUrl: 'https://developers.kakao.com',
							      webUrl: 'https://developers.kakao.com',
							    },
							  })
							</script>
														
						<h4>이메일 전송 버튼</h4>
						<button id="emailSender" type="button" >이메일 전송</button>
						
				</div>
	</div>
	
	<div id="emailModal" class='emailModal' style="display:none;" >
		<h1 id="emailTitle"> 이메일 보내기 </h1>
		<div id="emailContent">
				이메일 주소 <input id="emailAddr" type="email" name="email">
		</div>
		<button id="emailSend" type="button" >전송</button>
		<button id="emailSenderClose" type="button" onClick="javascript:$('#emailModal').hide()">닫기</button>
	</div>
</main>	
 <!--  main  end-->
 
 
<!--  footer -->
<jsp:include page="./include/footer.jsp"/>
<!--  footer -->


