<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="./sub/header.jsp" />
<title>나의 콘텐츠&nbsp;|&nbsp;마이 페이지</title>

<style>
ul{list-style:none;}

.web {
  height : 640px;
}
.tabmenu{ 
  width:100%; 
  display:  block;
  position : relative;
  z-index : 999;
}
.tabmenu ul li{
  display:  inline-block;
  width:33.33%; 
  float:left;  
  text-align:center; 
  background :#f9f9f9;
  line-height:40px;
}
.tabmenu label{
  display:block;
  width:100%; 
  height:40px;
  line-height:40px;
}
.tabmenu input{display:none;}

.tabCon{
  display:none; 
  width:100%;
  text-align:left; 
  padding: 20px;
  position:absolute; 
  left:0; top:40px; 
  box-sizing: border-box; 
  border : 5px solid #f9f9f9;
}
.tabmenu input:checked ~ label{
  background:#ccc;
}
.tabmenu input:checked ~ .tabCon{
  display:block;
}

</style>
</head>
<body>

<a id="uppermost2" href="#contents" class="skip-to">본문 바로가기</a>
<a id="uppermost" href="#gnb" class="skip-to">주메뉴 바로가기</a>
<!-- wrap -->
<div id="wrap">
<jsp:include page="./sub/navigation.jsp" />
<main id="main" class="main">
		<div id="spot" class="sub3">
			
		</div>
		<section class="cont-wrap horizontal">
			<h1 class="stitle">나의 콘텐츠</h1>
			<div id="contents" class="container">
				<div class="cont-mid ">
					<div class="customer-service service-process">
						<section class="txt">
							<h2 ><strong>나의 콘텐츠</strong></h2>
							<p class="sub-txt">블라블라 <strong class="point1">블라블라</strong>블라블라<br class="web"> 블라블라 <strong class="point1">할 수 </strong>있습니다. </p>
						</section>
<div class="web">

	
										<div class="tabmenu">
										  <ul>
										    <li id="tab1" class="btnCon"> <input type="radio" checked name="tabmenu" id="tabmenu1">
										      <label for="tabmenu1">내가 쓴 게시글</label>
										      <div class="tabCon" >

												<div class="board-style01 board-style03">
														<table>
															<caption>
															</caption>
															<colgroup>
																<col width="20%" />
																<col width="12%" />
																<col width="*" />
																<col width="12%" />
																</colgroup>
															<thead>
																<tr>
																	<th scope="col">메뉴</th>
																	<th scope="col">글번호</th>
																	<th scope="col">제목</th>
																	<th scope="col">작성일자</th>
																	</tr>
															</thead>
															<tbody>
																<tr>
																
																	<td class="text-left">
																					<a href="#">요리자랑</a>
																					</td>
																				<td class="number">
																					<span>11</span></td>
																				<td class="text-left">
																					<a href="#">제목 제목</a>
																					</td>
																				<td class="time">
																					<i class="xi-clock-o"></i>
																					2021.08.16</td>
																				</tr>
																		<tr>
																				<td class="text-left">
																					<a href="#">요리자랑</a>
																					</td>
																				<td class="number">
																					<span>11</span></td>
																				<td class="text-left">
																					<a href="#">제목 제목</a>
																					</td>
																				<td class="time">
																					<i class="xi-clock-o"></i>
																					2021.08.16</td>
																				</tr>
																		<tr>
																				<td class="text-left">
																					<a href="#">요리자랑</a>
																					</td>
																				<td class="number">
																					<span>11</span></td>
																				<td class="text-left">
																					<a href="#">제목 제목</a>
																					</td>
																				<td class="time">
																					<i class="xi-clock-o"></i>
																					2021.08.16</td>
																				</tr>
																		
																		</tbody>
														</table>
													</div>



										      </div>
										      
										    </li>
										    <li id="tab2" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu2">
										      <label for="tabmenu2">내가 단 댓글</label>
										      <div class="tabCon" >


												<div class="board-style01 board-style03">
														<table>
															<caption>
															</caption>
															<colgroup>
																<col width="20%" />
																<col width="8%" />
																<col width="*" />
																<col width="12%" />
																</colgroup>
															<thead>
																<tr>
																	<th scope="col">카테고리</th>
																	<th scope="col">번호</th>
																	<th scope="col">내용</th>
																	<th scope="col">작성일자</th>
																	</tr>
															</thead>
															<tbody>
																<tr>
																				<td class="text-left">
																					<a href="#">감사일기</a>
																					</td>
																				<td class="number">
																					<span>39</span></td>
																				<td class="text-left">
																					<a href="#">제목 제목</a>
																					</td>
																				<td class="time">
																					<i class="xi-clock-o"></i>
																					2021.08.16</td>
																				</tr>
																		<tr>
																				<td class="text-left">
																					<a href="#">요리자랑</a>
																					</td>
																				<td class="number">
																					<span>39</span></td>
																				<td class="text-left">
																					<a href="#">제목 제목</a>
																					</td>
																				<td class="time">
																					<i class="xi-clock-o"></i>
																					2021.08.16</td>
																				</tr>
																		<tr>
																				<td class="text-left">
																					<a href="#">영상 공유</a>
																					</td>
																				<td class="number">
																					<span>39</span></td>
																				<td class="text-left">
																					<a href="#">제목 제목</a>
																					</td>
																				<td class="time">
																					<i class="xi-clock-o"></i>
																					2021.08.16</td>
																				</tr>
																		
																		</tbody>
														</table>
													</div>





										      </div>
										      
										    </li>    
										    <li id="tab3" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu3">
										      <label for="tabmenu3">나의 심리검사 목록</label>
										      <div class="tabCon" >

												<div class="board-style01 board-style03">
														<table>
															<caption>
															</caption>
															<colgroup>
																<col width="8%" />
																<col width="12%" />
																<col width="*" />
																<col width="12%" />
																</colgroup>
															<thead>
																<tr>
																	<th scope="col">번호</th>
																	<th scope="col">검사종류</th>
																	<th scope="col">검사결과</th>
																	<th scope="col">검사일자</th>
																	</tr>
															</thead>
															<tbody>
																<tr>
																				<td class="number">
																					<span>39</span></td>
																				<td class="text-left">
																					<a href="#">BDI	</a>
																					</td>
																				<td class="text-left">
																					<a href="#">약간우울한 상태(11점)</a>
																					</td>
																				<td class="time">
																					<i class="xi-clock-o"></i>
																					2021.08.16</td>
																				</tr>
																		<tr>
																				<td class="number">
																					<span>39</span></td>
																				<td class="text-left">
																					<a href="#">BDI	</a>
																					</td>
																				<td class="text-left">
																					<a href="#">약간우울한 상태(11점)</a>
																					</td>
																				<td class="time">
																					<i class="xi-clock-o"></i>
																					2021.08.16</td>
																				</tr>
																		<tr>
																				<td class="number">
																					<span>39</span></td>
																				<td class="text-left">
																					<a href="#">BDI	</a>
																					</td>
																				<td class="text-left">
																					<a href="#">약간우울한 상태(11점)</a>
																					</td>
																				<td class="time">
																					<i class="xi-clock-o"></i>
																					2021.08.16</td>
																				</tr>
																		
																		</tbody>
														</table>
													</div>




										      </div>
										      
										    </li>
										  </ul>
										</div>
		
						</div><!--//web-->

						<div class="pad">
							<figure class="figure">
								<img src="../../resources/images/kps/sub060303_chart.gif" alt="">
							</figure>
						</div><!--//mobile-->
					</div></div>
		   
<script>
	var gContextPath = "";


	// 레이어 호출용 메소드
	function layer_open(){
	 	$(".popup-layout").fadeIn();
	 	$("#srcData").select();

		
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
