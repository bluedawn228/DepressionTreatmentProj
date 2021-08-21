<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="./sub/header.jsp" />
<title>쪽지 목록&nbsp;|&nbsp;마이 페이지</title>
    
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-53480561-1');
</script>
<script>
	var gContextPath = "";

	$(function() {
			
		

		$('body').on('click', 'ul.tag-list li', function(){
			var keyword = $(this).text().replace('#','');
			document.topSearchForm.schText.value = keyword;
			document.topSearchForm.submit();
		});
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
		<div id="spot" class="sub3">
			
			
		</div>
		<section class="cont-wrap horizontal">
			<h1 class="stitle">쪽지 목록</h1>
			<div id="contents" class="container">
				<div class="cont-mid ">
					
		<div class="page-count-wrap01 clearfix">
			<div class="page-count">
				<div class="page-total">
					총 <em><strong>39</strong></em>건<span class="comma">,</span>
				</div>
				<div class="page-now">
					현재페이지 <em>1</em>/
					4</div>
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
		<table>
			<caption>
			</caption>
			<colgroup>
				<col width="8%" />
				<col width="*" />
				<col width="8%" />
					<col width="12%" />
				<col width="12%" />
				</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">상태</th>
						<th scope="col">보낸이</th>
					<th scope="col">수신일</th>
					</tr>
			</thead>
			<tbody>
				<tr>
								<td class="number">
									<span>39</span></td>
								<td class="text-left">
									<a href="#">제목 제목</a>
									</td>
								<td class="state-cell">
										<span class="state complete">
											읽지않음</span>
									</td>
									<td class="end-date">
										알파카</td>
								<td class="time">
									<i class="xi-clock-o"></i>
									2021.08.16</td>
								</tr>
						<tr>
								<td class="number">
									<span>38</span></td>
								<td class="text-left">
									<a href="#">제목 제목</a>
									</td>
								<td class="state-cell">
										<span class="state complete">
											읽지않음</span>
									</td>
									<td class="end-date">
										알파카</td>
								<td class="time">
									<i class="xi-clock-o"></i>
									2021.08.16</td>
								</tr>
						<tr>
								<td class="number">
									<span>37</span></td>
								<td class="text-left">
									<a href="#">제목 제목</a>
									</td>
								<td class="state-cell">
										<span class="state complete">
											읽지않음</span>
									</td>
									<td class="end-date">
										알파카</td>
								<td class="time">
									<i class="xi-clock-o"></i>
									2021.08.16</td>
								</tr>
						<tr>
								<td class="number">
									<span>36</span></td>
								<td class="text-left">
									<a href="#">제목 제목</a>
									</td>
								<td class="state-cell">
										<span class="state complete">
											읽지않음</span>
									</td>
									<td class="end-date">
										알파카</td>
								<td class="time">
									<i class="xi-clock-o"></i>
									2021.08.16</td>
								</tr>
						<tr>
								<td class="number">
									<span>35</span></td>
								<td class="text-left">
									<a href="#">제목 제목</a>
									</td>
								<td class="state-cell">
										<span class="state complete">
											읽지않음</span>
									</td>
									<td class="end-date">
										알파카</td>
								<td class="time">
									<i class="xi-clock-o"></i>
									2021.08.16</td>
								</tr>
						<tr>
								<td class="number">
									<span>34</span></td>
								<td class="text-left">
									<a href="#">제목 제목</a>
									</td>
								<td class="state-cell">
										<span class="state complete">
											읽지않음</span>
									</td>
									<td class="end-date">
										알파카</td>
								<td class="time">
									<i class="xi-clock-o"></i>
									2021.08.16</td>
								</tr>
						<tr>
								<td class="number">
									<span>33</span></td>
								<td class="text-left">
									<a href="#">제목 제목</a>
									</td>
								<td class="state-cell">
										<span class="state complete">
											읽지않음</span>
									</td>
									<td class="end-date">
										알파카</td>
								<td class="time">
									<i class="xi-clock-o"></i>
									2021.08.16</td>
								</tr>
						<tr>
								<td class="number">
									<span>32</span></td>
								<td class="text-left">
									<a href="#">제목 제목</a>
									</td>
								<td class="state-cell">
										<span class="state complete">
											읽지않음</span>
									</td>
									<td class="end-date">
										알파카</td>
								<td class="time">
									<i class="xi-clock-o"></i>
									2021.08.16</td>
								</tr>
						<tr>
								<td class="number">
									<span>31</span></td>
								<td class="text-left">
									<a href="#">제목 제목</a>
									</td>
								<td class="state-cell">
										<span class="state complete">
											읽지않음</span>
									</td>
									<td class="end-date">
										알파카</td>
								<td class="time">
									<i class="xi-clock-o"></i>
									2021.08.16</td>
								</tr>
						<tr>
								<td class="number">
									<span>30</span></td>
								<td class="text-left">
									<a href="#">제목 제목</a>
									</td>
								<td class="state-cell">
										<span class="state complete">
											읽지않음</span>
									</td>
									<td class="end-date">
										알파카</td>
								<td class="time">
									<i class="xi-clock-o"></i>
									2021.08.16</td>
								</tr>
						</tbody>
		</table>
	</div>
<p class="btns right">
		<a href="javascript:;" class="btn btn-primary" id="btnAdd">쪽지 보내기</a>
	</p>
<p class="pager">
		<a class="active" href="javascript:void(0);">1</a><a href="?pageNum=2&rowCnt=10&menuId=MENU00499&schType=0&boardStyle=&categoryId=&continent=&siteId=SITE00002&contents1=&contents2=&country=&schText=&schKeyword=&upDown=0">2</a><a href="?pageNum=3&rowCnt=10&menuId=MENU00499&schType=0&boardStyle=&categoryId=&continent=&siteId=SITE00002&contents1=&contents2=&country=&schText=&schKeyword=&upDown=0">3</a><a href="?pageNum=4&rowCnt=10&menuId=MENU00499&schType=0&boardStyle=&categoryId=&continent=&siteId=SITE00002&contents1=&contents2=&country=&schText=&schKeyword=&upDown=0">4</a>
		</p>

</div>


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
