<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="./sub/header.jsp" />
<title>함께 이야기해요&nbsp;|&nbsp;기분 좋은 콘텐츠</title>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-53480561-1');
</script>
<script src="/js/chatroom.js"></script>
<style>

ul {
	list-style: none;
   padding-left: 0px;
   text-align:left;
}
	
.userImage{
	width:60px;
 	height:60px;
 	border-radius:50%;

}

.chatWrapper{
	display:block;
	width:100%;
}

.divLeft1{
	float:left;
	width:10%;
}

.divLeft2{
	float:left;
	width:70%;
}

.divRight{
	float:right;
	width:20%;
}

.wrapLeft{
	float:left;
	width:70%;

}

.wrapRight{
	float:right;
	width:30%;

}

.chatName{
	font-size:0.6em;
	font-weight:600;
    text-overflow: ellipsis;
	
}

.chatContent{
	font-size:0.9em;
	text-overflow: ellipsis;
	
}

.chatTime{
	font-size:0.5em;
	font-weight:100;
	width:20%;
	float:right;
	text-align:right;
    text-overflow: ellipsis;
	
}

.list-group{
	list-style: none;
    padding-left: 0px;
    overflow-y:auto;
    width: 100%; 
    height: 500px;
}
.list-group-item{
	list-style: none;
    padding-left: 0px;
	
}

.username{
	padding:10px;
	width:400px;
}
.usertext{
	padding:10px;
	width:300px;
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

		</div>
		<section class="cont-wrap horizontal">
			<h1 class="stitle">익명 수다방</h1>
			<div id="contents" class="container">
				<div class="cont-mid ">
					<div class="customer-service">
						<div class="txt">
							<h2 ><strong>익명 수다방</strong></h2>
							<p class="sub-txt">익명으로 다른 사람과 편하게 이야기 해보세요.</p>
						</div>
						<div class="flow-chart2" >
		     				<div class="wrapLeft">
			                        <!-- 메시지 리스트 	 -->
			                       <ul id="chatList"   class="list-group" ></ul>
							</div>
							<div class="wrapRight">
			                        <!-- 메시지 입력창 	 -->
									<label >
										<span>이름</span><br><input  id="chatName"  class="username" type="text" placeholder="anonymous name" >
										<font id="chkName" size="2"></font>
									</label>
									<br>
									<label >
										<span>내용</span> <br><textarea id="chatContent" class="usertext" placeholder="message" rows="3"></textarea><button type="button" id="button-addon2"  onclick="chatSubmit();">전송</button><br>
										<font id="chkUrl" size="2"></font>
									</label>
							</div>
									<!--  토스트 메시지 -->
									<div class="alert alert-success" id="successMessage" style="display:none;" >
											<strong>메시지 전송에 성공했습니다.</strong>
									</div>
									<div class="alert alert-danger" id="dangerMessage" style="display:none;" >
											<strong>이름과 내용을 모두 입력해주세요.</strong>
									</div>
									<div class="alert alert-warning" id="warningMessage" style="display:none;" >
											<strong>데이터베이스 입력 중 오류가 발생하였습니다.</strong>
									</div>	 	
									<!--  토스트 메시지 끝-->
							
						</div>
                         <hr>                    
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
