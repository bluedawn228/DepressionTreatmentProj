<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="./sub/header.jsp" />
<title>회원가입&nbsp;|&nbsp;토닥토닥</title>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-53480561-1');
</script>
<style>
    .outer {
  text-align: center;
	}
	
	.inner {
	  display: inline-block;
	}
	
	label span {
		text-align : center;
	    width : 150px;
	}
	
	.email-signup {
		background : blue;
		color:#fff;
	}
	.kakao-signup {
		background : yellow;
	}
	.google-signup {
		background : white;
	}
.signup-btn {
		margin-top : 20px;
		width : 300px;
		height: 60px;
		border : 1px solid #eee;
		border-radius : 30px;

		text-align : center;
		font-weight:600;

}	
</style>
<script>

// 패스워드 일치 체크 
$(document).ready(function() {
	
	$("#id").blur(function(event) {
		//alert("1");
		var chkId = $("#id").val();
		if ( chkId != null && chkId  != '') {
			
			$.ajax({
				type:"post",
				url:"/signupIdChk",
				data:{
					"id" : chkId
				},
				success:function(data){
					//alert(data);
					$('#idChkNotice').html('');
				 	if (data != "0" ) {
				 		//alert("중복");
				 	   $('#idChkNotice').html('중복된 ID 입니다. <br>');
		     	       $('#idChkNotice').attr('color', '#f82a2aa3');
		     	       $('#id').val(null);
		     	       $('#id').focus();
	     	        } else{
	     	          $('#idChkNotice').html('사용가능한 ID입니다.<br>');
	     	          $('#idChkNotice').attr('color', '#199894b3');
				 	} 
				}
			});
			
			
		}
		
		
	}); 
	
	$("#signup-submit").click(function() {
		//alert("홨");
		if ( $('#chkNotice').text().indexOf("일치함") == -1) {
			$('#password').val(null);
			$('#passwordconfirm').val(null);
			alert("비밀번호가 일치하지 않습니다!");
		   
		} else {
			
			$("#signup-form").submit();	
			
		}   
	});
	
	

   	$(function(){
   	    $('#password').keyup(function(){
   	      $('#chkNotice').html('');
   	    });

   	    $('#passwordconfirm').keyup(function(){

   	        if($('#password').val() != $('#passwordconfirm').val()){
   	          $('#chkNotice').html('비밀번호 일치하지 않음<br><br>');
   	          $('#chkNotice').attr('color', '#f82a2aa3');
   	        } else{
   	          $('#chkNotice').html('비밀번호 일치함<br><br>');
   	          $('#chkNotice').attr('color', '#199894b3');
   	        }

   	    });
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
		<div id="spot" class="sub5">
		
		</div>
		<section class="cont-wrap horizontal">
			<h1 class="stitle">회원 가입</h1>
			<div id="contents" class="container">
				<div class="cont-mid ">
					<div class="customer-service">
						<section class="txt">
							<h2><strong>회원가입</strong></h2>
						</section>
						<section class="standard container-fluid">
							<div class="col-xs-12 col-sm-12">
							
							 <div class="outer">
						
						        <div class="inner">
						
						            <form id="signup-form" action="/auth-signup" method="post">
												
						                 <label>
									        <input type="text" name="name" class="form-control" id="name" placeholder="이름" required><br>
									    </label>
						
						                 <label>
									        <input type="email" name="email" class="form-control" id="email" placeholder="이메일 name@example.com" required><br>
									    </label>
									    
						                 <label>
									        <input type="text" name="id" class="form-control" id="id" placeholder="아이디" required><br>
									    </label>
						                <font id="idChkNotice" size="2"></font>
						                 <label>
									       <input type="password" name="password" class="form-control" id="password" placeholder="비밀번호" required><br>
									    </label>
									    
						                 <label>
									        <input type="password" class="form-control" id="passwordconfirm" placeholder="비밀번호 확인" required><br>
									    </label>                
						
										<font id="chkNotice" size="2"></font>
						
						
						               <label>
						                   <input type="checkbox" value="" id="invalidCheck3"  required>&nbsp;Agree to terms and conditions<br>
						               </label>
						               <p>가입을 하기 위해서는 이용약관에 동의해주셔야합니다.</p>
						
						                <label>
						                	<input  id="signup-submit" type="submit" class="email-signup signup-btn" value="이메일로 가입하기" />
						                	
						                </label>    

						            </form>
						            <br>
										---     또는    --- <br>
										
										<input id="kakao-signup"  class="kakao-signup signup-btn" value="카카오 계정으로 가입하기" /><br>
										<input id="google-signup"  class="google-signup signup-btn" value="구글 계정으로 가입하기" />
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