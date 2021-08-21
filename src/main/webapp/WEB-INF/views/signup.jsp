<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="./include/header.jsp"></jsp:include>


<!-- Custom styles for this template
<link href="./lib/css/signin.css" rel="stylesheet">
 -->
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
				url:"../.././signupIdChk",
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
<jsp:include page="./include/navigation.jsp"></jsp:include>

<main >

    <div class="outer">

        <div class="inner">

            <form id="signup-form" action="./Signup" method="post">

                <h1 class="h3 mb-3 fw-normal">회원가입</h1>

                 <label>
			        <span>이름</span><input type="text" name="name" class="form-control" id="name" placeholder="Name" required><br>
			    </label>

                 <label>
			        <span>이메일</span><input type="email" name="email" class="form-control" id="email" placeholder="name@example.com" required><br>
			    </label>
			    
                 <label>
			        <span>아이디</span><input type="text" name="id" class="form-control" id="id" placeholder="Id" required><br>
			    </label>
                <font id="idChkNotice" size="2"></font>
                 <label>
			        <span>비밀번호</span><input type="password" name="password" class="form-control" id="password" placeholder="Password" required><br>
			    </label>
			    
                 <label>
			        <span>비밀번호 확인</span><input type="password" class="form-control" id="passwordconfirm" placeholder="Password" required><br>
			    </label>                

				<font id="chkNotice" size="2"></font>


               <label>
                   <input type="checkbox" value="" id="invalidCheck3"  required>&nbsp;Agree to terms and conditions<br>
               </label>
               <p>가입을 하기 위해서는 이용약관에 동의해주셔야합니다.</p>

                <label>
                	<button class="w-100 btn btn-lg btn-primary" id="signup-submit" type="submit">가입하기</button>
                </label>    
            </form>

        </div>
    </div>

</main>


<jsp:include page="./include/footer.jsp"></jsp:include>
