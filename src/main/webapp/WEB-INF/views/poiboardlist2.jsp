<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!--  header -->
<jsp:include page="./include/header.jsp"/>
<!--  header -->

<!--  script/css here  start-->
<style>
.mapMarker{
  	padding: 10px;
    line-height: 1.2;
	color:black;
	font-size:0.8em;
	justify-content: center;
	overflow:hidden; 
	text-overflow:ellipsis; 
	white-space:nowrap; 
	word-wrap:break-word; 
	word-break:break-all;
}
input, select {
padding:10px 20px 10px 20px;
font-size:120%;
}
span {
margin-right:10px;
margin-left:10px;
font-size:140%;
font-weight:400;
}
</style>

<script>
function searchPOI(){
	var str = $("#searchText").val();
 	//alert(str);
	location.href='./POIBoardSearch?searchText='+ str;
}

$(document).ready(function(){
	var sortID;
	var filterID;

	$(".thSort").click(function(event){

		sortID=$(this).attr("id");
		$("#colSortId").val(sortID);
		
		$("#POIBOardList_Form").attr("action", "../.././POIBoardSort/columnSort");
		$("#POIBOardList_Form").submit();
		
	}) //thSort
	
	$(".filter").change(function(event) {
		filterID=$(this).attr("id");
		//alert(filterID);
		//alert($(this).children("option:selected").text());
		
		if (filterID == "selectionProvince") {
			$("#filterProvince").val($(this).children("option:selected").val());
		} else if (filterID == "selectionDivision") {
			$("#filterDivision").val($(this).children("option:selected").val());
		} else if (filterID == "selectionRate") {
			$("#filterRate").val($(this).children("option:selected").val());
		}
	}); //filter
	
	$("#filterSet").click(function(){
		$("#POIBOardList_Form").attr("action", "../.././POIBoardSort/filter");
		$("#POIBOardList_Form").submit();
	})
	
	
});


</script>

</head>
<body>


<!--  navigation -->
<jsp:include page="./include/navigation.jsp"/>
<!--  navigation -->

      
<!--  main  start-->
 <main>
		<h2>????????? ??????</h2>
		<span>??????</span>
		<select class="filter" name="selectionDivision" id="selectionDivision">
			<option>??????</option>
			<option value="1">??????</option>
			<option value="2">?????????</option>
		</select>
		<select class="filter" name="selectionProvince" id="selectionProvince">
			<option>??????</option>
		<c:forEach items="${provinceList}" var="list">
			<option value="${list}">${list}</option>
		</c:forEach>
		</select>
		<select class="filter" name="selectionRate" id="selectionRate">
			<option>??????</option>
		<c:forEach items="${rateList}" var="list">
			<option value="${list}">${list}</option>
		</c:forEach>
		</select>
		<button id="filterSet" type="button">????????????</button>
		<span>??????</span>
		<button class="" onclick="location.href='./POIBoardSort?sortId=address&sortOrder=asc&page=1'">?????????</button>
		<button class="" onclick="location.href='./POIBoardSort?sortId=cno&sortOrder=desc&page=1'">?????????</button>
		<button class="" onclick="location.href='./POIBoardSort?sortId=recommend&sortOrder=desc&page=1'">?????????</button>
		
		<input type="text" id="searchText" name="searchText"><button class="" onclick="searchPOI();">??????</button>

		<button class="" onclick="location.href='./POIBoardInsert'">????????????</button>
		
		<div class="container">
		<form id="POIBOardList_Form" action="./POIBoardColumnSort" method="post">
			<!-- ?????? ????????? ?????? ??? -->
			<input type="hidden" id="sortId" name="sortId" value="${sortId }">
			<input type="hidden" id="sortOrder" name="sortOrder" value="${sortOrder}">
			
			<!-- ?????? ????????? ?????? ??? -->
			<input type="hidden" id="colSortId" name="colSortId" value="${colSortId }">
			<input type="hidden" id="colSortOrder" name="colSortOrder" value="${colSortOrder}">
			<input type="hidden" id="page" name="page" value="${page}">

			<!-- ???????????? ?????? ??? -->
			<input type="hidden" id="filterDivision" name="filterDivision" value="${filterDivision }">
			<input type="hidden" id="filterProvince" name="filterProvince" value="${filterProvince}">
			<input type="hidden" id="filterRate" name="filterRate" value="${filterRate}">
			
			<c:choose>
			<c:when test="${list!=null && pageInfo.listCount>0 }">
			<section id="listForm">
		
			<table class="" style="width:100%">
				<tr>
					
					<th id="HEADdivision" class="thSort" style="width:20%">??????</th>
					<th id="HEADaddress" class="thSort" style="width:20%">??????</th>
					<th id="HEADsubject" class="thSort" style="width:30%">??????</th>
					<th id="HEADcno" class="thSort" style="width:5%">??????</th>
					<th id="HEADrate" class="thSort" style="width:10%">??????</th>
					<th id="HEADrecommend" class="thSort" style="width:5%">??????</th>
					<th id="HEADbno" class="thSort" style="width:10%">????????????</th>
					<!-- <th>????????????</th> -->
				</tr>
				
				<c:forEach items="${list }" var="list" >
				<tr onClick="location.href='./POIBoardDetail?bno=${list.bno }&page=${pageInfo.page}'">	
					<!--  -->
					<td style="width:20%;text-align:center;">
		
						<c:choose>
							<c:when test="${list.division eq 1}">
								??????
							</c:when>
							<c:when test="${list.division eq 2}">
								?????????
							</c:when>
							<c:otherwise>
								??????
							</c:otherwise>
						</c:choose>
						
					</td>
		
					<td style="width:20%;text-align:center;">${list.province }</td>
					<td style="width:30%;text-align:center;">${list.subject }  <c:if test="${list.cno != null && list.cno > 10}">&#128293</c:if></td>
					<td style="width:5%;text-align:center;"><c:if test="${list.cno != null && list.cno > 0}">  ${list.cno} </c:if></td>
					<td style="width:10%;text-align:center;">${list.rate }</td>
					<td style="width:5%;text-align:center;">
		
						<c:choose>
							<c:when test="${list.recommend > 0 }">
								&#128525
							</c:when>
							<c:when test="${list.division < 0}">
								&#128545
							</c:when>
							<c:otherwise>
								
							</c:otherwise>
						</c:choose>
					
					</td>
					<td style="width:10%;text-align:center;">${list.bno }</td>
					<!-- <td><fmt:formatDate value="${list.regDate }" pattern="yyyy.MM.dd HH:mm:ss"/></td> -->
				</tr>	
				</c:forEach>
				
			</table>
			</section>
			<section id="pageList">
					<c:choose>
						<c:when test="${pageInfo.page<=1}">
							[??????]&nbsp;
						</c:when>
						<c:otherwise>  
							<a href="./POIBoardSort?sortId=${sortId}&sortOrder=${sortOrder}&page=${pageInfo.page-1}&filterDivision=${filterDivision}&filterProvince=${filterProvince}&filterRate=${filterRate}">[??????]</a>&nbsp;
						</c:otherwise>
					</c:choose>
					<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
						<c:choose>
							<c:when test="${pageInfo.page==i }">[${i }]</c:when>
							<c:otherwise>
								<a href="./POIBoardSort?sortId=${sortId}&sortOrder=${sortOrder}&page=${i}&filterDivision=${filterDivision}&filterProvince=${filterProvince}&filterRate=${filterRate}">[${i }]</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pageInfo.page>=pageInfo.maxPage }">
							[??????]
						</c:when>
						<c:otherwise>
							<a href="./POIBoardSort?sortId=${sortId}&sortOrder=${sortOrder}&page=${pageInfo.page+1}&filterDivision=${filterDivision}&filterProvince=${filterProvince}&filterRate=${filterRate}">[??????]</a>
						</c:otherwise>
					</c:choose>
				</section>
			</c:when>	
			<c:otherwise>
				<section id="emptyArea">????????? ?????? ????????????.</section>
			</c:otherwise>
			</c:choose>
		</form>	
		</div>
		
		<div id="map" style="width:100%;height:60vh"></div>
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ab8db4dc71897940e7bd85b0c7abec39"></script>
		<script>
		var mapContainer = document.getElementById('map'), // ????????? ????????? div  
		    mapOption = { 
		
		        center: new kakao.maps.LatLng("${list[0].posx}", "${list[0].posy}"), // ????????? ????????????
		
		        level: 12 // ????????? ?????? ??????
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // ????????? ???????????????
		 
		// ????????? ????????? ????????? ????????? ????????? ?????? ?????? ??????????????? 
		var positions = [
		   
		    	<c:forEach var="list" items="${list}" varStatus="status">
		    	 {
		       		content: "<div class='mapMarker' >"+"${list.subject}"+" / "+"${list.rate}"+"</div>", 
		        	latlng: new kakao.maps.LatLng("${list.posx}","${list.posy}")
		
		    	 }  <c:choose><c:when  test="${status.last}"></c:when><c:otherwise>,</c:otherwise></c:choose>	
		        </c:forEach>
		
		
		];
		
		for (var i = 0; i < positions.length; i ++) {
		    // ????????? ???????????????
		    var marker = new kakao.maps.Marker({
		        map: map, // ????????? ????????? ??????
		        position: positions[i].latlng // ????????? ??????
		    });
		
		    // ????????? ????????? ?????????????????? ??????????????? 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // ?????????????????? ????????? ??????
		    });
		
		    // ????????? mouseover ???????????? mouseout ???????????? ???????????????
		    // ????????? ??????????????? ???????????? ????????? ??????????????? 
		    // for????????? ???????????? ????????? ?????? ????????? ????????? ???????????? ???????????? ???????????????
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		}
		
		// ?????????????????? ???????????? ???????????? ????????? ??????????????? 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}
		
		// ?????????????????? ?????? ???????????? ????????? ??????????????? 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
		
		</script>
</main>
 <!--  main  end-->
 
 
<!--  footer -->
<jsp:include page="./include/footer.jsp"/>
<!--  footer -->


