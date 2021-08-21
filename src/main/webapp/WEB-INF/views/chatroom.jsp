<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--  header -->
<jsp:include page="./include/header.jsp"/>
<!--  header -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

<link href="./css/chatroom.css" rel="stylesheet">
<script src="./js/chatroom.js"></script>
<style>

</style>
</head>
<body>

<!--  navigation -->
<jsp:include page="./include/navigation.jsp"/>
<!--  navigation -->

      
<!--  main  start-->
<main>
  
    <div class="outer">

        <div class="inner">     
                     	<h2 >Conversations</h2>
     
                        <!-- 메시지 리스트 	 -->
                       <ul id="chatList"   class="list-group" ></ul>

                        <!-- 메시지 입력창 	 -->
						<label >
							<span>이름</span><input  id="chatName"  class="username" type="text" placeholder="anonymous name" >
							<font id="chkName" size="2"></font>
						</label>

						<label >
							<span>내용</span> <textarea id="chatContent" class="usertext" placeholder="message" rows="3"></textarea><button type="button" id="button-addon2"  onclick="chatSubmit();">전송</button><br>
							<font id="chkUrl" size="2"></font>
						</label>



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
		</div>
</main>



<!-- <button type="button" class="btn btn-primary pull-right" onclick="realtimeChatListFunction();">추가	</button> -->
 <!--  main  end-->
 
 
<!--  footer -->
<jsp:include page="./include/footer.jsp"/>
<!--  footer -->