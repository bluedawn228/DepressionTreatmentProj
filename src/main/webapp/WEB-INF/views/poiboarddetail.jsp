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
		<h2> 게시글 상세</h2>
		<button class="" onclick="location.href='.././POIBoardUpdate/${detail.bno}'">수정</button>
		<button class="" onclick="location.href='.././POIBoardDelete/${detail.bno}'">삭제</button>
		<div class="container">
			<form action=".././POIBoardInsert" method="get">
				<div class="form-group">
					이름 <p>${detail.subject }</p>
				</div>
				
				<c:if test="${detail.division != null && detail.division != ''}">
				<div class="form-group">
					구분 <p>
								<c:choose>
									<c:when test="${detail.division eq 1}">
										병원
									</c:when>
									<c:when test="${detail.division eq 2}">
										상담소
									</c:when>
									<c:otherwise>
										기타
									</c:otherwise>
								</c:choose>
							</p>
				</div>
				</c:if>
				
				<c:if test="${detail.rate != null && detail.rate != ''}">
				<div class="form-group">
					등급 <p>${detail.rate }</p>
				</div>
				</c:if>
				<c:if test="${detail.recommend != null && detail.recommend != ''}">
				<div class="form-group">
					추천 <p>
							<c:choose>
								<c:when test="${detail.recommend > 0 }">
									&#128525
								</c:when>
								<c:when test="${detail.division < 0}">
									&#128545
								</c:when>
								<c:otherwise>
									
								</c:otherwise>
							</c:choose>
							</p>
				</div>
				</c:if>
				<c:if test="${detail.address != null && detail.address != ''}">
				<div class="form-group">
					주소 <p>${detail.address }</p>
				</div>
				</c:if>
				<c:if test="${detail.url != null && detail.url != ''}">
				<div class="form-group">
					홈페이지 <p>${detail.url }</p>
				</div>
				</c:if>
				<c:if test="${detail.content != null && detail.content != ''}">
				<div class="form-group">
					내용 <p>${detail.content }</p>
				</div>
				</c:if>
				<c:if test="${files.bno!=null }">
				<div class="form-group">
					첨부파일 <p><a href=".././fileDown/${files.bno}">${files.fileoriname}</a></p>
				</div>
				</c:if>
				<a href="./POIBoardList?page=${page}"> [목록]</a>&nbsp;&nbsp;
				<button type="submit" class="" > 작성 </button>
			</form>
		</div>
		<!--  댓글 -->
		<div class="container">
			<form name="commentInsertForm">
				<div class="">
						<input type="hidden" name="bno" value="${detail.bno }">
						<input type="text" class="" id="content" name="content" placeholder="댓글을 입력하세요">
						<span class="">
								<button class="" type="button" name="commentInsertBtn">등록</button>
						</span>
				</div>
			</form>
		</div>
		
		<div class="container">
			<div class="commentList"></div>
		</div>
		<jsp:include page="./commentS.jsp"/>
 </main>
 <!--  main  end-->
 
 
<!--  footer -->
<jsp:include page="./include/footer.jsp"/>
<!--  footer -->


