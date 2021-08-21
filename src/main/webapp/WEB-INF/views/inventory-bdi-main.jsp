<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="./sub/header.jsp" />
<title>K-BDI 검사&nbsp;|&nbsp;심리검사</title>

<script src="./js/depressionInventory.js"></script>
<style>

</style>
</head>
<body>

<!-- wrap -->

		<input type="hidden" id="sum_bdi">

								<form id="estimation_form">
								
								<c:forEach items="${diList}" var="list" varStatus="status" begin="0" end="3">
				                <c:choose>
				                    <c:when test="${list.answerNo == 1}">
				                        <div id="bdiQuestion_${list.bdiId}" style="display:block;text-align:left;">
				                    </c:when>
				               </c:choose>
				               
						                <div style="display:block;text-align:left;font-size:20px;">
								                    <input type="radio" class="btn-check bdi_selector" name="options_${list.bdiId}" id="option_${list.bdiId}_${list.answerNo}" autocomplete="off" value="${list.point}">
								                    <label class="btn btn-outline-secondary" for="option_${list.bdiId}_${list.answerNo}">${list.answer}</label>
						                </div>
						                
								<c:choose>
				                    <c:when test="${(list.answerNo  == 4)}">
				                            	<div class="btns text-center">
													
													<a href="#" class="btn btn-style01" onClick="showNext('${list.bdiId}')"><span>다음 문항</span> </a>
												</div>
				                       
										    </div>
								    </c:when>
						          </c:choose>
				            </c:forEach>
				
				            <c:forEach items="${diList}" var="list" varStatus="status" begin="4" end="79">
				
				
				                <c:choose>
				                    <c:when test="${list.bdiId > 1 && list.answerNo%4 == 1}">
				                        <div id="bdiQuestion_${list.bdiId}" style="display:none;text-align:left;">
				                    </c:when>
				                </c:choose>
				
										<div style="display:block;text-align:left;">
									            <input type="radio" class="btn-check bdi_selector" name="options_${list.bdiId}" id="option_${list.bdiId}_${list.answerNo}" autocomplete="off" value="${list.point}">
									            <label class="btn btn-outline-secondary" for="option_${list.bdiId}_${list.answerNo}">${list.answer}</label>
										</div>
				
				               <c:choose>
				                    <c:when test="${(list.bdiId) > 1 && (list.answerNo%4  == 0)}">
				                        		
						                       <div class="btns text-center">
													<a href="#" class="btn btn-style02" onClick="showPrevious('${list.bdiId}')"><span>이전 문항</span> </a>
													<a href="#" class="btn btn-style01" onClick="showNext('${list.bdiId}')"><span>다음 문항</span> </a>
												</div>
				                        </div>
								    </c:when>
				              </c:choose>
				            
				            </c:forEach>
				
				            <c:forEach items="${diList}" var="list" varStatus="status" begin="80" end="83">
				
				                <c:choose>
				                    <c:when test="${list.bdiId == 21 && list.answerNo%4 == 1}">
				                        <div id="bdiQuestion_${list.bdiId}" style="display:none;text-align:left;">
				                    </c:when>
				               </c:choose>
				
										<div style="display:block;text-align:left;">
						                    <input type="radio" class="btn-check bdi_selector" name="options_${list.bdiId}" id="option_${list.bdiId}_${list.answerNo}" autocomplete="off" value="${list.point}">
						                    <label class="btn btn-outline-secondary" for="option_${list.bdiId}_${list.answerNo}">${list.answer}</label>
										</div>
										
				                <c:choose>
				                    <c:when test="${list.bdiId== 21 && (list.answerNo%4  == 0)}">
				                       <div class="btns text-center">
											<a href="#" class="btn btn-style02" onClick="showPrevious('${list.bdiId}')"><span>이전 문항</span> </a>
											<a href="#" class="btn btn-style01" onClick="showBdiResult();"><span>결과보기</span> </a>
										</div>
				                    </c:when>
				                </c:choose>
				    	   </c:forEach>
					    </form>	  

</body>
</html>
