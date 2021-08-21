<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="./sub/header.jsp" />
<title>로그인&nbsp;|&nbsp;토닥토닥</title>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-53480561-1');
</script>
<script >

$(document).ready(function() {
	
 		$("#signin-submit").click(function(){
			
			//alert("와따");
			
			$("form").submit();
			
			//alert("됐다");
	      
  
      });  //end of btn-submit 
      
  }); 

 </script> 
 
 
<style>
    .outer {
  text-align: center;
	}
	
	.inner {
	  display: inline-block;
	}

	.email-signin {
		background : blue;
		color:#fff;
	}
	.kakao-signin {
		background : yellow;
	}
	.google-signin {
		background : white;
	}
.signin-btn {
		margin-top : 20px;
		width : 300px;
		height: 60px;
		border : 1px solid #eee;
		border-radius : 30px;

		text-align : center;
		font-weight:600;

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
		<div id="spot" class="sub5">
			

		</div>
		<section class="cont-wrap horizontal">
			<h1 class="stitle">로그인</h1>
			<div id="contents" class="container">
				<div class="cont-mid ">
					<div class="customer-service">
						<section class="txt">
							<h2 ><strong>로그인</strong></h2>
						</section>
						<section class="standard container-fluid">
							<div class="col-xs-12 col-sm-12">
								
								<div class="outer">

								        <div class="inner">
								
								            <form name="signin_form" id="signin_form" action="./auth-signin" method="post" >								                
								                 <label>
											        <span>이메일</span><input type="text" name="id" class="form-control id" id="userId" placeholder="id" value="${id}"><br>
											    </label>
											    
								                 <label>
											        <span>비밀번호</span><input type="password" name="password" class="form-control password" id="userPassword" placeholder="password" value="${password}"><br>
											    </label>
								 
								                <label>
								                    <input type="checkbox" name="rememberId" <c:choose>
																				                                                <c:when test="${rememberId eq true }">checked</c:when>
																				            								</c:choose>> Remember me<br>
								                </label>
								                
								
											    <label>
											        <input type="submit" id="signin-submit"  class="email-signin signin-btn" value="이메일로 로그인" />
											    </label>
								            </form>
											  <br>
													---     또는    --- <br>
													
													<input id="kakao-signin"  class="kakao-signin signin-btn" value="카카오 계정으로 로그인" /><br>
													<input id="google-signin"  class="google-signin signin-btn" value="구글 계정으로 로그인" />
								
								        </div>
								    </div>
								
								
							</div>
							
						</section>
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