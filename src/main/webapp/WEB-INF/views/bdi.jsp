<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!--  header -->
<jsp:include page="./include/header.jsp" />
<!--  header -->

<link href="./css/depressionInventory.css" rel="stylesheet">
<script src="./js/depressionInventory.js"></script>

</head>

<body>

    <!--  navigation -->
    <jsp:include page="./include/navigation.jsp" />
    <!--  navigation -->

    <!--  main  start-->
  <main>
    <div class="container">
        <input type="hidden" id="sum_bdi">
        <form id="estimation_form">

            <c:forEach items="${diList}" var="list" varStatus="status" begin="0" end="3">
                <c:choose>
                    <c:when test="${list.answerNo == 1}">
                        <div id="bdiQuestion_${list.bdiId}" style="display:block;border:1px red dotted;">
                    </c:when>
               </c:choose>
               
		                <div style="display:block;border:1px red dotted;">
				                    <input type="radio" class="btn-check bdi_selector" name="options_${list.bdiId}" id="option_${list.bdiId}_${list.answerNo}" autocomplete="off" value="${list.point}">
				                    <label class="btn btn-outline-secondary" for="option_${list.bdiId}_${list.answerNo}">${list.answer}</label>
		                </div>
		                
				<c:choose>
                    <c:when test="${(list.answerNo  == 4)}">
                            		<button  type="button" onClick="showNext('${list.bdiId}')">다음 문항</button>
						    </div>
				    </c:when>
		          </c:choose>
            </c:forEach>

            <c:forEach items="${diList}" var="list" varStatus="status" begin="4" end="79">


                <c:choose>
                    <c:when test="${list.bdiId > 1 && list.answerNo%4 == 1}">
                        <div id="bdiQuestion_${list.bdiId}" style="display:none;border:1px red dotted;">
                    </c:when>
                </c:choose>

						<div style="display:block;border:1px red dotted;">
					            <input type="radio" class="btn-check bdi_selector" name="options_${list.bdiId}" id="option_${list.bdiId}_${list.answerNo}" autocomplete="off" value="${list.point}">
					            <label class="btn btn-outline-secondary" for="option_${list.bdiId}_${list.answerNo}">${list.answer}</label>
						</div>

               <c:choose>
                    <c:when test="${(list.bdiId) > 1 && (list.answerNo%4  == 0)}">
                        		<button  type="button" onClick="showPrevious('${list.bdiId}')">이전 문항</button><button  type="button" onClick="showNext('${list.bdiId}')">다음 문항</button>
                        </div>
				    </c:when>
              </c:choose>
            
            </c:forEach>

            <c:forEach items="${diList}" var="list" varStatus="status" begin="80" end="83">

                <c:choose>
                    <c:when test="${list.bdiId == 21 && list.answerNo%4 == 1}">
                        <div id="bdiQuestion_${list.bdiId}" style="display:none;border:1px red dotted;">
                    </c:when>
               </c:choose>

						<div style="display:block;border:1px red dotted;">
		                    <input type="radio" class="btn-check bdi_selector" name="options_${list.bdiId}" id="option_${list.bdiId}_${list.answerNo}" autocomplete="off" value="${list.point}">
		                    <label class="btn btn-outline-secondary" for="option_${list.bdiId}_${list.answerNo}">${list.answer}</label>
						</div>
						
                <c:choose>
                    <c:when test="${list.bdiId== 21 && (list.answerNo%4  == 0)}">
                        <button  type="button" onClick="showPrevious('${list.bdiId}')">이전</button> <button  type="button" onClick="showBdiResult();">결과보기</button>
                        </div>
                    </c:when>
                </c:choose>

    	   </c:forEach>
	    </form>	  
	 </main>     
    <!--  main  end-->


    <!-- Modal -->
    <div id="bdiModal"  style="display:none;">

                    <h5 class="modal-title" >Modal title</h5>

                <div class="modal-body">
                    ...
                </div>

    </div>

    <!-- modal end -->
    <!--  footer -->
    <jsp:include page="./include/footer.jsp" />
    <!--  footer -->
