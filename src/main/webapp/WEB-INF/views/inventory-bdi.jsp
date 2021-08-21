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

<script src="/js/depressionInventory.js"></script>
</head>
<body>

<a id="uppermost2" href="#contents" class="skip-to">본문 바로가기</a>
<a id="uppermost" href="#gnb" class="skip-to">주메뉴 바로가기</a>
<!-- wrap -->
<div id="wrap">
	<jsp:include page="./sub/navigation.jsp" />

<main id="main" class="main">
		<form id="bdiForm" name="bdiForm" action="inventory-bdi-result" method="post">
			<input type="hidden" id="sum_bdi" name="sum_bdi">
			<input type="hidden" id="result_bdi" name="result_bdi">
		</form>
		<div id="spot" class="sub7">
		</div>
		
		<section class="cont-wrap horizontal">
			<h1 class="stitle">심리검사</h1>
			<div id="contents" class="container">
				<div class="cont-mid ">
					<div class="ci">
						<h2 class="sr-only">K-BDI 검사</h2>
						<section class="signature-section">
							<ul class="signature row">
								<li class="col-xs-12 col-sm-6">
									<iframe width="100%" height="380rem" src="https://serviceapi.nmv.naver.com/flash/convertIframeTag.nhn?vid=A6923579168D8DD0214AF5C89EAD1EA0F4CB&outKey=V12513380b7f3b8d28d75b915120ecaa4c9cf00aeb178ec4cc901b915120ecaa4c9cf" frameborder="no" scrolling="no" title="NaverVideo" allow="autoplay; gyroscope; accelerometer; encrypted-media" allowfullscreen></iframe>
								</li>
								<li class="col-xs-12 col-sm-6">

										<iframe width="100%" height="380rem" src="https://serviceapi.nmv.naver.com/flash/convertIframeTag.nhn?vid=744CDC9F3BA3C4BD0C9109F9CBA0581601AF&outKey=V12511530ec4ff97adf430ba0f135b0eaad518cabf50f4a09d4470ba0f135b0eaad51" frameborder="no" scrolling="no" title="NaverVideo" allow="autoplay; gyroscope; accelerometer; encrypted-media" allowfullscreen></iframe>

								</li>
							</ul>
						<h3 class="">K-BDI 검사</h3>
							<div class="box dotted text-center">
								<form id="estimation_form">
								
								<c:forEach items="${diList}" var="list" varStatus="status" begin="0" end="3">
				                <c:choose>
				                    <c:when test="${list.answerNo == 1}">
				                        <div id="bdiQuestion_${list.bdiId}" style="display:block;text-align:left;">
				                    </c:when>
				               </c:choose>
				               
						                <div style="display:block;text-align:left;">
								                    <input type="radio" class="btn-check bdi_selector" name="options_${list.bdiId}" id="option_${list.bdiId}_${list.answerNo}" autocomplete="off" value="${list.point}">
								                    <label class="btn btn-outline-secondary" for="option_${list.bdiId}_${list.answerNo}">${list.answer}</label>
						                </div>
						                
								<c:choose>
				                    <c:when test="${(list.answerNo  == 4)}">
				                            	<div class="btns text-center">
													
													<a href="#" class="btn btn-style01" onClick="showNext('${list.bdiId}')"><span>다음 문항</span> </a>
												</div>
				                       
										    </div>
								    </c:when>
						          </c:choose>
				            </c:forEach>
				
				            <c:forEach items="${diList}" var="list" varStatus="status" begin="4" end="79">
				
				
				                <c:choose>
				                    <c:when test="${list.bdiId > 1 && list.answerNo%4 == 1}">
				                        <div id="bdiQuestion_${list.bdiId}" style="display:none;text-align:left;">
				                    </c:when>
				                </c:choose>
				
										<div style="display:block;text-align:left;">
									            <input type="radio" class="btn-check bdi_selector" name="options_${list.bdiId}" id="option_${list.bdiId}_${list.answerNo}" autocomplete="off" value="${list.point}">
									            <label class="btn btn-outline-secondary" for="option_${list.bdiId}_${list.answerNo}">${list.answer}</label>
										</div>
				
				               <c:choose>
				                    <c:when test="${(list.bdiId) > 1 && (list.answerNo%4  == 0)}">
				                        		
						                       <div class="btns text-center">
													<a href="#" class="btn btn-style02" onClick="showPrevious('${list.bdiId}')"><span>이전 문항</span> </a>
													<a href="#" class="btn btn-style01" onClick="showNext('${list.bdiId}')"><span>다음 문항</span> </a>
												</div>
				                       
				                       
				                        </div>
								    </c:when>
				              </c:choose>
				            
				            </c:forEach>
				
				            <c:forEach items="${diList}" var="list" varStatus="status" begin="80" end="83">
				
				                <c:choose>
				                    <c:when test="${list.bdiId == 21 && list.answerNo%4 == 1}">
				                        <div id="bdiQuestion_${list.bdiId}" style="display:none;text-align:left;">
				                    </c:when>
				               </c:choose>
				
										<div style="display:block;text-align:left;">
						                    <input type="radio" class="btn-check bdi_selector" name="options_${list.bdiId}" id="option_${list.bdiId}_${list.answerNo}" autocomplete="off" value="${list.point}">
						                    <label class="btn btn-outline-secondary" for="option_${list.bdiId}_${list.answerNo}">${list.answer}</label>
										</div>
										
				                <c:choose>
				                    <c:when test="${list.bdiId== 21 && (list.answerNo%4  == 0)}">
				                       <div class="btns text-center">
											<a href="#" class="btn btn-style02" onClick="showPrevious('${list.bdiId}')"><span>이전 문항</span> </a>
											<a href="#" class="btn btn-style01" onClick="showBdiResult();"><span>결과보기</span> </a>
										</div>
				                        </div>
				                    </c:when>
				                </c:choose>
				
				    	   </c:forEach>
					    </form>	  

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
