<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="./sub/header.jsp" />
<title>운영 취지&nbsp;|&nbsp;토닥토닥 소개</title>

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
				<h2 class="snb-title sr-only">토닥토닥 소개</h2>
				<nav>
					<ul class="depth2" id="subNavi">
						</ul>
				</nav>
			</div>
			<div class="cont-top">
				
				
			</div>
		</div>
		<section class="cont-wrap horizontal">
			<h1 class="stitle"></h1>
			<div id="contents" class="container">
				<div class="cont-mid ">
					<div class="inter-cooperation deco-top">
	
	
	<section class="nuclear-section">
		<h2>토닥토닥의 운영 취지</h2>
		<p class="text-center">블라블라<br class="web">
			블라블라<br class="web">
			블라블라</p>
		<ul class="list">
			<li>
				<div class="title col-xs-12 col-sm-3"> <i class="icon"></i> </div>
				<div class="cont col-xs-12 col-sm-9"> <strong>블라블라</strong>
					<p>블라블라
						블라블라
						블라블라</p>
				</div>
			</li>
			<li>
				<div class="title col-xs-12 col-sm-3"> <i class="icon"></i> </div>
				<div class="cont col-xs-12 col-sm-9"> <strong>블라블라</strong>
					<p>블라블라
						블라블라</p>
				</div>
			</li>
			<li>
				<div class="title col-xs-12 col-sm-3"> <i class="icon"></i> </div>
				<div class="cont col-xs-12 col-sm-9"> <strong>블라블라</strong>
					<p>블라블라</p>
				</div>
			</li>
			<li>
				<div class="title col-xs-12 col-sm-3"> <i class="icon"></i> </div>
				<div class="cont col-xs-12 col-sm-9"> <strong>블라블라</strong>
					<p>블라블라 </p>
				</div>
			</li>
		</ul>
	</section>
	
</div><p><br></p></div>
		    	

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
					data: {'menuId' : 'MENU00576', linkId : "2019", 'grade' : $("input:radio[class=grade]:checked").val(), 'KText' : $("#KText").val()},
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
			data: {'menuId' : 'MENU00576'},
			async: false,
			cache: false,
			success:function(data, textStatus, jqXHR) {
				if(data > 0) {
					$.ajax({
						url: gContextPath+"/main/autonomyPersonList",
						data: {'menuId' : 'MENU00576'},
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
