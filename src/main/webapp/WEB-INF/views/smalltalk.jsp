<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--  header -->
<jsp:include page="./include/header.jsp"/>
<!--  header -->

<script>
$(document).ready(function(){
			$("#btn-MsgSend").click(function(){ 
				//alert("왔다");
						var utext = $("#userMsg").val();
						var sendData ={
														"utext": utext, 
												        "lang": "ko" 
													}
						//alert(utext);
						$.ajaxSetup({
					        headers: { "AJAX": "true" }
					    });
						$.ajax({
							type:"POST",
							dataType: "JSON",
							processData : true,
							contentType : 'application/json; charset=UTF-8',
							url:"./SmallTalkPost",
							data: JSON.stringify(sendData),

							success:function(data){
								alert(data);
								$("#receiveMsg").val(data);
							}
							
						})//ajax
			}) //btn.click
}) //document

</script>
</head>
<body>


<!--  navigation -->
<jsp:include page="./include/navigation.jsp"/>
<!--  navigation -->

      
<!--  main  start-->
 <main>
		
		
<form name="chat_form" >
받는 메시지
<textarea name="receiveMsg" id="receiveMsg"></textarea><br>

보내는 메시지
<textarea name="userMsg" id="userMsg">안녕!</textarea>
</form>			
<button type="button" id="btn-MsgSend">보내기</button>	
		
		
</main>
 <!--  main  end-->
 
 
<!--  footer -->
<jsp:include page="./include/footer.jsp"/>
<!--  footer -->


