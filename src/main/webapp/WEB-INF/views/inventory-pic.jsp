<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="./sub/header.jsp" />
<title>그림 검사&nbsp;|&nbsp;심리검사</title>
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
		<div id="spot" class="sub7">
			<div id="snb">
				<h2 class="snb-title sr-only">알림·소식</h2>
				<nav>
					<ul class="depth2" id="subNavi">
						</ul>
				</nav>
			</div>
			<div class="cont-top">
				<div class="path">
					<i class="xi-home" aria-hidden="true"></i>HOME
					<i class="xi-angle-right-thin" aria-hidden="true"></i><span class="sr-only">&gt;</span>
						알림·소식<i class="xi-angle-right-thin" aria-hidden="true"></i><span class="sr-only">&gt;</span>
						홍보자료<i class="xi-angle-right-thin" aria-hidden="true"></i><span class="sr-only">&gt;</span>
						<strong>KINAC CI</strong></div>
				<div class="cont-util">
					<div class="zoom">
						<a href="javascript:;" class="zoom-plus" id="fontPlus"><i class="xi-plus"></i><span class="sr-only">확대보기</span></a>
						<a href="javascript:;" class="zoom-minus" id="fontMinus"><i class="xi-minus"></i><span class="sr-only">축소보기</span></a>
					</div>
					<a href="javascript:window.print();" class="print" title="새창열림"><i class="xi-print"></i><span class="sr-only">프린트</span></a>
					<div class="sns">
						<a href="javascript:;"><i class="xi-share-alt"></i><span class="sr-only">sns</span></a>
						<ul class="sns-shortcut">
							<li class="facebook"><a href="javascript:void(0);" onclick="facebook(); return false;" target="_blank"><i class="xi-facebook"></i><span class="sr-only">페이스북</span></a></li>
							<li class="twitter"><a href="javascript:void(0);" onclick="gfnToTwitter(document.location.href); return false;" target="_blank"><i class="xi-twitter"></i><span class="sr-only">트위터</span></a></li>
							<li class="kakaostory"><a href="javascript:void(0);" onclick="sendKakaoStory('KINAC CI'); return false;" target="_blank"><i class="xi-kakaostory"></i><span class="sr-only">카카오스토리</span></a></li>
							<li class="blog"><a href="javascript:void(0);" onclick="sendNaverBlog('KINAC CI'); return false;" target="_blank"><i class="xi-blogger"></i><span class="sr-only">블로그</span></a></li>
						</ul>
						<a href="javascript:;" class="sns-close"><i class="xi-share-alt"></i><span class="sr-only">sns</span></a>
					</div>
				</div>
			</div>
		</div>
		<section class="cont-wrap horizontal">
			<h1 class="stitle">KINAC CI</h1>
			<div id="contents" class="container">
				<div class="cont-mid ">
					<div class="ci">
<h2 class="sr-only">CI</h2>
						<section class="signature-section">
							<ul class="signature row">
								<li class="col-xs-12 col-sm-6">
									<div>
										<img src="../../resources/images/kps/sub0106_signature_eng.png" alt="KINAC">
									</div>
								</li>
								<li class="col-xs-12 col-sm-6">
									<div>
										<img src="../../resources/images/kps/sub0106_signature_kor.png" alt="한국원자력통제기술원">
									</div>
								</li>
							</ul>
<h3 class="">CI 의미</h3>
							<div class="box dotted text-center">약속의 상징인 새끼손가락을 거는 모습을 대한민국 국기의 태극문양을 통해 표현<br class="web">업무의 공정성과 국제적 신뢰성 확보를 위한 기관의 위상과 역동적인 발전상을 상징</div>
						</section>
						<section class="symbol-mean-section bg">
							<div class="circle">
								<img src="../../resources/images/kps/sub0104_symbol.png" alt="kinac심볼">
								<div class="color navy">
									<strong class="title">곤색</strong>
									<p>신뢰성 및 전문성 상징</p>
								</div>
								<div class="color gray">
									<strong class="title">회색</strong>
									<p>평화로운 내일을 위해<br>초석이 되는 원자력 에너지 상징</p>
								</div>
							</div>
						</section>
						<section class="download-section">
							<div class="btns text-center">
								<a href="/fileDownload?fileGubun=common&amp;menuId=attachFileMgr&amp;userFileName=KINAC_CI2.zip&amp;systemFileName=1530496794030.zip" class="btn btn-style01"><span>JPG 다운로드</span> <i class="xi-download"></i></a>
								<a href="/fileDownload?fileGubun=common&amp;menuId=attachFileMgr&amp;userFileName=KINAC_ci.zip&amp;systemFileName=1530496942984.zip" class="btn btn-style02"><span>AI 다운로드</span> <i class="xi-download"></i></a>
							</div>
						</section>
					</div></div>
		    	<!-- <dl class="autonomy-person" id="autonomyPerson" style="display: none;">
	<dt>항목세부 담당자</dt>
</dl> -->

<!-- 개발 붙여놓은 소스 원본 -->
<div class="cont-bot">
		<div class="title"><strong>현재 페이지의 정보 및 사용 편의성에 만족하십니까?</strong></div>
		<div class="cont">
			<div class="row">
				<ul class="satisfy-choice col-xs-12 col-sm-6">
					<li><input type="radio" id="satisfy05" name="grade" class="grade" value="5" title="매우만족 선택"><label for="satisfy05" class="satisfy05">매우만족</label></li>
					<li><input type="radio" id="satisfy04" name="grade" class="grade" value="4" title="만족 선택"><label for="satisfy04" class="satisfy04">만족</label></li>
					<li><input type="radio" id="satisfy03" name="grade" class="grade" value="3" title="보통 선택"><label for="satisfy03" class="satisfy03">보통</label></li>
					<li><input type="radio" id="satisfy02" name="grade" class="grade" value="2" title="불만 선택"><label for="satisfy02" class="satisfy02">불만</label></li>
					<li><input type="radio" id="satisfy01" name="grade" class="grade" value="1" title="매우불만 선택"><label for="satisfy01" class="satisfy01">매우불만</label></li>
				</ul>
				<p class="txt col-xs-12 col-sm-6">
					<label for="KText">여러분들의 의견을 남겨주세요.</label>
					<input type="text" id="KText" name="KText" class="input-mid" title="만족도 입력"> 
					<button type="submit" id="btnSatisfaction" class="btn-assess">평가하기</button>
				</p>
			</div>
		</div>
	</div>
<!-- 서민규연구원님 담당자 제거 요청 (18.03.08) -->
<!--
<div class="contact-us">
	<ul class="contact-list">
		<li><strong><i class="xi-sitemap-o"></i> 담당부서</strong> : 홍보기획실</li>
		<li><strong><i class="xi-user-o"></i> 담당자</strong> : 홍길동</li>
		<li><strong><i class="xi-call"></i> 전화</strong> : 042-123-1234</li>
	</ul>
</div>
 -->
<script>
	var gContextPath = "";

	$(function() {
		$('#printContent').click(function(){
			printContent("", "kps");
		});

		$("#btnSatisfaction").click(function(){
			if($("input[name='grade']:radio:checked").length == 0){
				alert("만족도를 선택하시기 바랍니다.");
				return false;
			}

			$.ajax({
					url: gContextPath+"/satisfaction/form",
					data: {'menuId' : 'MENU00642', linkId : "11650", 'grade' : $("input:radio[class=grade]:checked").val(), 'KText' : $("#KText").val()},
					type: "POST",
					async: false,
					cache: false,
					success:function(data, textStatus, jqXHR) {
						if(data != null) {
							$("input:radio[name='grade']").removeAttr("checked");
							$("#KText").val('');
							alert("만족도가 정상 등록 되었습니다.");
						}
					}
				});
		 });

		/* $.ajax({
			url: gContextPath+"/main/autonomyPersonCnt",
			data: {'menuId' : 'MENU00642'},
			async: false,
			cache: false,
			success:function(data, textStatus, jqXHR) {
				if(data > 0) {
					$.ajax({
						url: gContextPath+"/main/autonomyPersonList",
						data: {'menuId' : 'MENU00642'},
						async: false,
						success:function(data, textStatus, jqXHR) {
							if(data != null) {
								var cArray = new Array();
								var sArray = new Array();
								var wArray = new Array();
								$.each(data, function(i, item) {
									if(item.MANAGETYPE == '01') cArray.push(item.DUTYNAME+" "+item.NAME+"("+item.PHONE+" / "+item.USERID+")");
									if(item.MANAGETYPE == '02') sArray.push(item.DUTYNAME+" "+item.NAME+"("+item.PHONE+" / "+item.USERID+")");
									if(item.MANAGETYPE == '03') wArray.push(item.DUTYNAME+" "+item.NAME+"("+item.PHONE+" / "+item.USERID+")");
								});

								$("#autonomyPerson").append('<dd>작성자 : '+wArray+'</dd>');
								$("#autonomyPerson").append('<dd>감독자 : '+sArray+'</dd>');
								$("#autonomyPerson").append('<dd>확인자 : '+cArray+'</dd>');
							}
						}
					});
					$("#autonomyPerson").show();
				}
			}
		}); */

		var url = "http://www.facebook.com/sharer.php?u=" + encodeURIComponent(document.URL);
		$(".facebook a").attr("href", url);

		// 주소복사 클릭 처리
		$(".fnCopy").click(function fnCopy(){
			var strUrl = location.href;
			var IE=(document.all)?true:false;
		   	if (IE) {
				if (!confirm("주소를 복사하시겠습니까?")) {
					return;
			  	}
			window.clipboardData.setData("Text", strUrl);
			alert ( "주소가 복사되었습니다. \'Ctrl+V\'를 눌러 붙여넣기 해주세요." );
		   	} else {
			   if(navigator.userAgent.search('Trident') != -1){
				   if (!confirm("주소를 복사하시겠습니까?")) {
						 return;
					  }
					  window.clipboardData.setData("Text", strUrl);
					  alert ( "주소가 복사되었습니다. \'Ctrl+V\'를 눌러 붙여넣기 해주세요." );
			   }else{
				  temp = prompt("현재페이지 주소입니다. Ctrl+C를 눌러 클립보드로 복사하세요", strUrl);
			   }
		   }
		});

	});

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