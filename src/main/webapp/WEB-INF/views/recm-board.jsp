<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="./sub/header.jsp" />
<title>추천 목록&nbsp;|&nbsp;상담소 진료소</title>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-53480561-1');
</script>

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

<a id="uppermost2" href="#contents" class="skip-to">본문 바로가기</a>
<a id="uppermost" href="#gnb" class="skip-to">주메뉴 바로가기</a>
<!-- wrap -->
<div id="wrap">
<jsp:include page="./sub/navigation.jsp" />
<main id="main" class="main">
		<div id="spot" class="sub5">
			<div id="snb">
				<h2 class="snb-title sr-only">상담소·진료소 추천 목록</h2>
				<nav>
					<ul class="depth2" id="subNavi">
						</ul>
				</nav>
			</div>
			<div class="cont-top">
	
			</div>
		</div>
		<section class="cont-wrap horizontal">
			<h1 class="stitle">상담소·진료소 추천 목록</h1>
			<div id="contents" class="container">
				<div class="cont-mid ">
					

		<div class="page-count-wrap01 clearfix">
		<span>필터</span>
		<select class="filter" name="selectionDivision" id="selectionDivision">
			<option>구분</option>
			<option value="1">병원</option>
			<option value="2">상담소</option>
		</select>
		<select class="filter" name="selectionProvince" id="selectionProvince">
			<option>지역</option>
		<c:forEach items="${provinceList}" var="list">
			<option value="${list}">${list}</option>
		</c:forEach>
		</select>
		<select class="filter" name="selectionRate" id="selectionRate">
			<option>등급</option>
		<c:forEach items="${rateList}" var="list">
			<option value="${list}">${list}</option>
		</c:forEach>
		</select>
		<button id="filterSet" type="button">적용하기</button>
		<span>정렬</span>
		<button class="" onclick="location.href='./POIBoardSort?sortId=address&sortOrder=asc&page=1'">지역순</button>
		<button class="" onclick="location.href='./POIBoardSort?sortId=cno&sortOrder=desc&page=1'">댓글순</button>
		<button class="" onclick="location.href='./POIBoardSort?sortId=recommend&sortOrder=desc&page=1'">추천순</button>
		
		<input type="text" id="searchText" name="searchText"><button class="" onclick="searchPOI();">검색</button>

		<button class="" onclick="location.href='./POIBoardInsert'">등록하기</button>
		
		
		
		
		
			<div class="page-count">
				<div class="page-total">
					총 <em><strong>26</strong></em>건<span class="comma">,</span>
				</div>
				<div class="page-now">
					현재페이지 <em>1</em>/
					3</div>
			</div>
			<div class="category-wrap">
				<div class="select-wrap">
					<label for="schType" class="hidden">검색구분</label>
					<select name="schType" id="schType" title="검색구분">
						<option value="1" >제목</option>
						<option value="2" >내용</option>
						<option value="3" >작성자</option>
					</select>
				</div>
				<div class="input-wrap">
					<input name="schText" id="schText" title="검색어입력" placeholder="검색어를 입력해주세요." type="text" value="" />
					<button type="button" name="button" id="btnSearch">
						<i class="xi-search"></i>
						<span class="hidden">검색</span>
					</button>
				</div>
			</div>
		</div>

	<!-- //검색 결과 -->


	<!-- 일반 PC 버전 레이아웃 -->
	<div class="board-style01 board-style03">
	<form id="POIBOardList_Form" action="./POIBoardColumnSort" method="post">
			<!-- 전체 소팅을 위한 값 -->
			<input type="hidden" id="sortId" name="sortId" value="${sortId }">
			<input type="hidden" id="sortOrder" name="sortOrder" value="${sortOrder}">
			
			<!-- 컬럼 소팅을 위한 값 -->
			<input type="hidden" id="colSortId" name="colSortId" value="${colSortId }">
			<input type="hidden" id="colSortOrder" name="colSortOrder" value="${colSortOrder}">
			<input type="hidden" id="page" name="page" value="${page}">

			<!-- 필터링을 위한 값 -->
			<input type="hidden" id="filterDivision" name="filterDivision" value="${filterDivision }">
			<input type="hidden" id="filterProvince" name="filterProvince" value="${filterProvince}">
			<input type="hidden" id="filterRate" name="filterRate" value="${filterRate}">
			
			<c:choose>
			<c:when test="${list!=null && pageInfo.listCount>0 }">
			<section id="listForm">
			
		<table>
			
			<colgroup>
				<col width="20%" />
				<col width="20%" />
				<col width="30%" />
				<col width="5%" />
				<col width="10%" />
				<col width="5%" />
				<col width="10%" />
				</colgroup>
			<thead>
				<tr>
					<th scope="col">구분</th>
					<th scope="col">지역</th>
					<th scope="col">명칭</th>
					<th scope="col">댓글</th>
					<th scope="col">등급</th>
					<th scope="col">추천</th>
					<th scope="col">번호</th>
					</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="list" >
				<tr onClick="location.href='./POIBoardDetail?bno=${list.bno }&page=${pageInfo.page}'">	
					<!--  -->
					<td style="width:20%;text-align:center;">
		
						<c:choose>
							<c:when test="${list.division eq 1}">
								병원
							</c:when>
							<c:when test="${list.division eq 2}">
								상담소
							</c:when>
							<c:otherwise>
								기타
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
						</tbody>
		</table>
	</div>
<p class="btns right">
	</p>
<p class="pager">
		<c:choose>
						<c:when test="${pageInfo.page<=1}">
							[이전]&nbsp;
						</c:when>
						<c:otherwise>  
							<a href="./POIBoardSort?sortId=${sortId}&sortOrder=${sortOrder}&page=${pageInfo.page-1}&filterDivision=${filterDivision}&filterProvince=${filterProvince}&filterRate=${filterRate}">[이전]</a>&nbsp;
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
							[다음]
						</c:when>
						<c:otherwise>
							<a href="./POIBoardSort?sortId=${sortId}&sortOrder=${sortOrder}&page=${pageInfo.page+1}&filterDivision=${filterDivision}&filterProvince=${filterProvince}&filterRate=${filterRate}">[다음]</a>
						</c:otherwise>
					</c:choose>
		</p>
</c:when>	
			<c:otherwise>
				<section id="emptyArea">등록된 글이 없습니다.</section>
			</c:otherwise>
			</c:choose>
		</form>	
</div>
<div id="map" style="width:100%;height:60vh"></div>
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ab8db4dc71897940e7bd85b0c7abec39"></script>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		    mapOption = { 
		
		        center: new kakao.maps.LatLng("${list[0].posx}", "${list[0].posy}"), // 지도의 중심좌표
		
		        level: 12 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		 
		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		var positions = [
		   
		    	<c:forEach var="list" items="${list}" varStatus="status">
		    	 {
		       		content: "<div class='mapMarker' >"+"${list.subject}"+" / "+"${list.rate}"+"</div>", 
		        	latlng: new kakao.maps.LatLng("${list.posx}","${list.posy}")
		
		    	 }  <c:choose><c:when  test="${status.last}"></c:when><c:otherwise>,</c:otherwise></c:choose>	
		        </c:forEach>
		
		
		];
		
		for (var i = 0; i < positions.length; i ++) {
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng // 마커의 위치
		    });
		
		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });
		
		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		}
		
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}
		
		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
		
		</script>
<script>
	var gContextPath = "";

	
	// 레이어 호출용 메소드
	function layer_open(){
	 	$(".popup-layout").fadeIn();
	 	$("#srcData").select();

		/* $('.btn-close').click(function(e)
		{
			//temp.fadeOut();     //'닫기'버튼을 클릭하면 레이어가 사라진다.
			$('#layer1').fadeOut();
			$(".pop-container").fadeOut();
			$(".srcCopy").focus();

			e.preventDefault();
		}); */
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