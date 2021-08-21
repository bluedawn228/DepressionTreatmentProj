<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="./sub/header.jsp" />
<title>감사명상 일기&nbsp;|&nbsp;감사명상</title>

<style>
.tb-emotion{
	text-align : center;
	
}
.tb-emotion td {
	padding:20px;
}
.tb-emotion td span {
	font-size:60px;
}
.emoticon_wrapper {
width:100%;
margin: 0 auto;
text-align : center;
}
.emoticon {
	font-size:80px;
}


.tag{
	width:auto;
	height : 30px;
	border : 1px solid #eee;
	border-radius : 10px;
	background : white;
	color : #000;
	text-align : center;
	font-weight:400;
}

#bg-upload {
	width:80%;
	font-size: 20px;
	vertical-align : middle;
	border:none;
}


.postit {
  font-family: 'Open Sans Condensed';
  font-size: .9em;
  position: absolute;
  padding: 20px 15px;
  top: 10px;
  left: -120px;
  background: #FCF0AD;
  
  width: 150px;
  height: 150px;
  z-index: 5;
  transform: rotate(6deg);
  box-shadow: -1px 1px 7px rgba(0, 0, 0, .6);
}

.postit-title{
  margin: .1em 0;
  font-family: 'Open Sans Condensed', sans-serif;
  font-weight: 700;
  font-size: 1.5em;
  letter-spacing: -2px;
  text-transform: uppercase;
  text-align: center;
  color: #746e5e;
  text-shadow: 1px 1px 1px #fff, -1px 0px 0px rgba(0,0,0,.5);
}
.video-area{
	margin: 0 auto;
	text-align: center;
}
.paper-area {
  margin: 0 auto;

	
       -webkit-font-smoothing: antialiased;
     font-smoothing: antialiased;
     box-sizing: border-box; 
}

.step03 {
	background-image:url(https://raw.github.com/subtlepatterns/SubtlePatterns/gh-pages/retina_wood.png);
  	background-attachment:fixed;
}

#type {
  text-transform: uppercase;
  font-size: 1.2em;
  margin-top: 20px;
  margin-left: 12px;
  padding: 5px 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  cursor: pointer;
  background: #f2c730;
  background: -webkit-linear-gradient(top, #f2c70a 0%,#eaac0b 100%);
  font-family: 'Open Sans Condensed';
}
#type:hover {
  background: #eaac0b;
}

.notebody {
	position: relative;
	background-color: #f5f5f5;
	width: 50%;
	margin: 50px auto;
	padding: 0;
	filter: drop-shadow(5px 5px 5px grey);
}

.notelist {
	color: #555;
	font-size: 18px;
	padding: 0 !important;
	width: 100%;
	font-family: courier, monospace;
	border: 1px solid #dedede;
}

.notelist li {
	list-style: none;
	border-bottom: 1px dotted #ccc;
	text-indent: 25px;
	line-height: 18px;
	height: auto;
	padding: 10px;
	text-transform: capitalize;
}

.notelist li:hover {
	background-color: #f0f0f0;
	-webkit-transition: all 0.2s;
	-moz-transition: all 0.2s;
	-ms-transition: all 0.2s;
	-o-transition: all 0.2s;
}

.notelines {
	border-left: 1px solid #ffaa9f;
	border-right: 1px solid #ffaa9f;
	width: 2px;
	float: left;
	height: 390px;
	margin-left: 40px;
}

.noteformwrapper {
	position: absolute;
	width: 100%;
	height: 100%;
	margin: 0 auto;
	padding: 0;
}

.content {
	width: 100%;
	border: 0px;
	height: 390px;
	font-size: 18px;
	line-height: 215%;
	padding-top: 0px;
	padding-left: 48px;
	overflow-x: hidden;
	margin-top:px;
	background-color: transparent;
}

</style>
<script>




function selectEmotion(num,econ) {
	//alert(num);
	$("#selectedEmotion").val(num);
	$("#diaryEmoticon").text(econ);
	
	
}

function selectMedi(num) {
	//alert(num);
	$("#selectedEmotion").val(num);

}

function showNext(step) {

	
	if (step == "step01") {
			var em = $("#selectedEmotion").val();
			if (em == null || em == "") {
				alert("오늘의 감정을 선택해주세요");
			} else {
				$(".step01").hide();
				$(".step02").show();
			}
	} else if (step == "step02"){
		var md = $("#selectedMedi").val();
		$(".step02").hide();
		$(".step03").show();
		
	} else if (step == "step03"){
		$(".step03").hide();
		$(".step04").show();
		
	} else if (step == "step04"){
		alert("결과 페이지로 이동")
		
	}

}


function showPrevious(step) {
	
	if (step == "step02") {
		$(".step02").hide();
		$(".step01").show();
	} else if (step == "step03") {
		$(".step03").hide();
		$(".step02").show();
	}
	//alert(em);
	
}

</script>
</head>
<body>

<a id="uppermost2" href="#contents" class="skip-to">본문 바로가기</a>
<a id="uppermost" href="#gnb" class="skip-to">주메뉴 바로가기</a>
<!-- wrap -->
<div id="wrap">
<jsp:include page="./sub/navigation.jsp" />
<main id="main" class="main">
		<div id="spot" class="sub1">
			
		</div>
		<section class="cont-wrap horizontal">
			<h1 class="stitle">감사명상 일기 작성</h1>
			<div id="contents" class="container">
				<div class="cont-mid ">
					<div class="customer-service service-process">
						
						<div class="web step01">
							<section class="txt">
							<h2 ><strong>오늘 기분은 어떠셨나요?</strong></h2>
							</section>
							<table class="tb-emotion">
								<tr class="tr-emotion">
									<td><span onclick='javascript:selectEmotion(1,"🥰");'>🥰</span><br>행복함</td>
									<td><span onclick='javascript:selectEmotion(2,"😄");'>😄</span><br>신이남</td>
									<td><span onclick='javascript:selectEmotion(3,"😍");'>😍</span><br>감사함</td>
								</tr>
								
								<tr class="tr-emotion">
									<td><span onclick='javascript:selectEmotion(4,"😌");'>😌</span><br>차분함</td>
									<td><span onclick='javascript:selectEmotion(5,"🤗");'>🤗</span><br>만족함</td>
									<td><span onclick='javascript:selectEmotion(6,"😴");'>😴</span><br>피로</td>
								</tr>
								
								<tr class="tr-emotion">
									<td><span onclick='javascript:selectEmotion(7,"🙁");'>🙁</span><br>불확실함</td>
									<td><span onclick='javascript:selectEmotion(8,"😑");'>😑</span><br>지루함</td>
									<td><span onclick='javascript:selectEmotion(9,"😨");'>😨</span><br>불안함</td>
								</tr>
								<tr class="tr-emotion">
									<td><span onclick='javascript:selectEmotion(10,"😡");'>😡</span><br>분노</td>
									<td><span onclick='javascript:selectEmotion(11,"🤯");'>🤯</span><br>스트레스 받음</td>
									<td><span onclick='javascript:selectEmotion(12,"😭");'>😭</span><br>슬픔</td>
								</tr>								
							</table>
							
							<div class="btns text-center">
								<a href="#" class="btn btn-style01" onClick='showNext("step01")'><span>다음</span> </a>
							</div>
							
						</div><!--//web-->
						
						<div class="web step02" style="display:none;">
							<ul class="signature row">
								<li class="col-xs-12 col-sm-6">
									<h2 ><strong>컨셉별 명상음악</strong></h2>
									<table>
									<tr>
										<td>
											<img src='https://img.youtube.com/vi/OrVmxZATDCs/mqdefault.jpg' width='200px' height='150rem' >
										</td>
										<td>
											잔잔한 명상음악
										</td>
									</tr>
									<tr>
										<td>
											<img src='https://img.youtube.com/vi/OrVmxZATDCs/mqdefault.jpg' width='200px' height='150rem' >
										</td>
										<td>
											경쾌한 명상음악
										</td>
									</tr>
									<tr>
										<td>
											<img src='https://img.youtube.com/vi/OrVmxZATDCs/mqdefault.jpg' width='200px' height='150rem' >
										</td>
										<td>
											산뜻한 명상음악
										</td>
									</tr>
									<tr>
										<td>
											<img src='https://img.youtube.com/vi/OrVmxZATDCs/mqdefault.jpg' width='200px' height='150rem' >
										</td>
										<td>
											웅장한 명상음악
										</td>
									</tr>
									<tr>
										<td>
											<img src='https://img.youtube.com/vi/OrVmxZATDCs/mqdefault.jpg' width='200px' height='150rem' >
										</td>
										<td>
											평온한 명상음악
										</td>
									</tr>
	
									</table>
								</li>
								<li class="col-xs-12 col-sm-6">
									<h2 ><strong>기분별 명상음악</strong></h2>
									<table>
									<tr>
										<td>
											<img src='https://img.youtube.com/vi/OrVmxZATDCs/mqdefault.jpg' width='200px' height='150rem' >
										</td>
										<td>
											스트레스 받을 때
										</td>
									</tr>
									<tr>
										<td>
											<img src='https://img.youtube.com/vi/OrVmxZATDCs/mqdefault.jpg' width='200px' height='150rem' >
										</td>
										<td>
											우울할 때
										</td>
									</tr>
									<tr>
										<td>
											<img src='https://img.youtube.com/vi/OrVmxZATDCs/mqdefault.jpg' width='200px' height='150rem' >
										</td>
										<td>
											불안할 때
										</td>
									</tr>
									<tr>
										<td>
											<img src='https://img.youtube.com/vi/OrVmxZATDCs/mqdefault.jpg' width='200px' height='150rem' >
										</td>
										<td>
											화가날 때
										</td>
									</tr>
									<tr>
										<td>
											<img src='https://img.youtube.com/vi/OrVmxZATDCs/mqdefault.jpg' width='200px' height='150rem' >
										</td>
										<td>
											무기력할 때
										</td>
									</tr>
	
									</table>
								</li>
							</ul>
							
							<div class="btns text-center">
								<a href="#" class="btn btn-style02" onClick='showPrevious("step02")'><span>이전</span> </a>
								<a href="#" class="btn btn-style01" onClick='showNext("step02")'><span>다음</span> </a>
							</div>
						</div>	
 							

						<section class="web step03" style="display:none;">
							<ul class="signature row">
								<li class="col-xs-12 col-sm-12">
									<!-- 	비디오 플레이어 -->
									<section class="video-area">
										<iframe width="560" height="315" src="https://www.youtube.com/embed/OrVmxZATDCs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
									</section>
									<section class="paper-area">
										<section class="emoticon_wrapper">
											<span id="diaryEmoticon" class="emoticon"></span>
										</section>
										<section>
											<!-- <img class="pen" src="http://www.mofanning.com/imgs/ink_pen.png"/> -->
												<p class="postit-title">&mdash;오늘의 감사 내용을 적어 보세요&mdash;</p>
												<section class="stack">
												  <section class="postit">
												    <p>음성으로 작성하기</p>
												    <button id="type">녹음</button>
												  </section>
												  
												   <section class="notebody">

									                <section class="noteformwrapper">

									                        <textarea class="content"  name="mailContent" id="" title="" placeholder="마음을 전하세요" value=""></textarea>
									     
									                </section>
		
									                <section class="notelines"></section>
									
									                <ul class="notelist" id="List">
									                    <li>&nbsp;</li>
									                    <li>&nbsp;</li>
									                    <li>&nbsp;</li>
									                    <li>&nbsp;</li>
									                    <li>&nbsp;</li>
									                    <li>&nbsp;</li>
									                    <li>&nbsp;</li>
									                    <li>&nbsp;</li>
									                    <li>&nbsp;</li>
									                    <li>&nbsp;</li>
									                </ul>
									
									            </section>
											</section>	
									
									<section class="tag-wrapper text-center" style="margin: 30px 0;">
										<input type="text" class="tag" value="일">
										<input type="text" class="tag" value="학교">
										<input type="text" class="tag" value="가족">
										<input type="text" class="tag" value="친구">
										<input type="text" class="tag" value="여행">
										<input type="text" class="tag" value="자기 돌봄">
										<input type="text" class="tag" value="관계">
										<input type="text" class="tag" value="돈">
										<input type="text" class="tag" value="음식">
										<input type="text" class="tag" value="건강">
									</section>
									<section class="file-wrapper text-center"  style="margin: 30px 0;">
										<input type="file" id="bg-upload">
									</section>	
									</section>
									</section>
								</li>
								
							</ul>
							
							<div class="btns text-center">
								<a href="#" class="btn btn-style02" onClick='showPrevious("step03")'><span>이전</span> </a>
								<a href="#" class="btn btn-style01" onClick='showNext("step03")'><span>다음</span> </a>
							</div>
						</section>	
 							
 							<div class="web step04" style="display:none;">
							<ul class="signature row">
								<li class="col-xs-12 col-sm-12">
									<section class="txt">
											<h2 ><strong>이렇게 긍정적인 기분을 인지한 나 자신에게 감사해보세요</strong></h2>
									</section>
									<section class="txt">
											<h2 ><strong>감사 노트 기록</strong></h2>
											<p>감사하는 습관은 긍정적인 마음을 갖게 해주고 힘든 시기를 이겨낼 수 있는 회복 탄력성을 길러줍니다.</p>
											
									</section>
									
								</li>
								
							</ul>
							
							<div class="btns text-center">
								<a href="#" class="btn btn-style01" onClick='showNext("step04")'><span>결과 확인하기</span> </a>
							</div>
						</div>		
 							
 							
							<input type="text"  id="selectedEmotion" value="">
							<input type="text"  id="selectedMedi" value="">
							<input type="text"  id="startedTime" value="">
							<input type="text"  id="endedTime" value="">

							
						<div class="pad">
	
						</div><!--//mobile-->
					</div></div>

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
</script></div>
    	</section>
    	<a href="#uppermost" class="go-top"><i class="xi-arrow-up"></i><span class="sr-only">페이지 맨위로 이동</span></a>
	</main>
    <!-- footer -->
<jsp:include page="./sub/footer.jsp" />
