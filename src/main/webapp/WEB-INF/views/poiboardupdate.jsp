<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--  header -->
<jsp:include page="./include/header.jsp"/>
<!--  header -->

</head>
<body>


<!--  navigation -->
<jsp:include page="./include/navigation.jsp"/>
<!--  navigation -->

      
<!--  main  start-->
 <main>
		<h2>게시글 수정</h2>
		<div class="container">
			<form action=".././POIBoardUpdate" method="post">
				<div class="form-group">
							제목 <input type="text" class="" id="subject" name="subject" value="${detail.subject}">
				</div>
				
				<div class="form-group">
					 		내용 <textarea class="" id="content" name="content" >${detail.content }</textarea>
				</div>
				
				<div class="form-group">
						 <input type="text" class="" id="bno" name="bno" value="${detail.bno }">
				</div>
				
				<button type="submit" class="">수정</button>
			
			</form>
		
		
		</div>



 </main>
 <!--  main  end-->
 
 
<!--  footer -->
<jsp:include page="./include/footer.jsp"/>
<!--  footer -->


