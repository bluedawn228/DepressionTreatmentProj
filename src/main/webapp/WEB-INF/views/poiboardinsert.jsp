<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--  header -->
<jsp:include page="./include/header.jsp"/>
<!--  header -->
	<style>
	    .outer {
	  text-align: center;
		}
		
		.inner {
		  display: inline-block;
		}
		
		label {
			text-align:left;
		}
		
		label span {
			text-align:left;
		}
		input, select, textarea {
			width:80%;
		}
	
	</style>


	<!-- 도로명주소 API -->
	<script src="./js/juso.js"></script>
</head>
<body>


<!--  navigation -->
<jsp:include page="./include/navigation.jsp"/>
<!--  navigation -->

      
<!--  main  start-->
 <main>
		<h2> 게시글 작성</h2>
		


    <div class="outer">

        <div class="inner">
			<form action="./POIBoardInsert" id="signup_form" method="post" enctype="multipart/form-data">
				<label>
			        <span>작성자</span><input type="text" class="" value="${userInfo.name}" readonly><input type="hidden" class="" id="writer" name="writer" value="${userInfo.id}"><br>
			    </label>
			    
			    <div class="clear"></div>	
			    
		 		<label>
			        <span>명칭</span><input type="text" class="" id="subject" name="subject" placeholder="명칭을 입력하세요"><br>
			    </label>

				<div class="clear"></div>
				
				<label>
			        <span>내용</span><textarea class="" id="content" name="content" rows="3">상세 설명</textarea><br>
			    </label>
			    
			    <div class="clear"></div>
			    
			    <label>
			        <span>주소</span>
                            <input type="text" class="" id="address" name="address" placeholder="주소를 입력하세요"><br>
			        		<button class="" type="button" onClick="javascript:goPopup();">검색</button>
			    </label>
			    
			    <div class="clear"></div>
			    
			    <label>
			        <span>Url</span><input type="text" class="" id="url" name="url" placeholder="홈페지지 URL 을 입력하세요"><br>
			    </label>
			    
			    <div class="clear"></div>
			    
			    <label>
			        <span>구분</span><select id="division" name="division"><option value="1">병원</option><option value="2">상담소</option></select>
			    </label>
			    
			    <div class="clear"></div>
			    
			    <label>
			        <span>추천</span><select id="recommend" name="recommend"><option value="1">추천</option><option value="-1">비추천</option><option value="0" selected>중립</option></select>
			    </label>
			    
			    <div class="clear"></div>
			    
			     <label>
			        <span>등급</span><select id="rate" name="rate">
			        										<option value="" selected>해당없음</option>
			        										<option value="1등급">1등급</option>
			        										<option value="2등급">2등급</option>
			        										<option value="3등급">3등급</option>
			        										<option value="4등급">4등급</option>
			        										<option value="5등급">5등급</option>
			        										<option value="등급제외">등급제외</option>
        											</select>
			    </label>
			    
				<div class="clear"></div>
				
				<input type="file" name="files">
				<button type="submit" >	작성</button>
			</form>
			</div>
		</div>
 </main>
 <!--  main  end-->
 
 
<!--  footer -->
<jsp:include page="./include/footer.jsp"/>
<!--  footer -->


