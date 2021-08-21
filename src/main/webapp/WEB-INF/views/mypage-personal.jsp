<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="./sub/header.jsp" />
<title>나의 정보&nbsp;|&nbsp;마이 페이지</title>
<style>
.userImage{
	width:60px;
 	height:60px;
 	border-radius:50%;

}

.emoticon_sm {
	text-align:center;
	font-size:30px;
}
.week-stamp{

	margin-top:20px;
	height:15rem;
	width:100%;
}
.week-mood{
	margin-top:20px;

	height:15rem;
	width:100%;
}
.week-progress {
	width:100%;
	height:60px;
}

#calendar {
  width: 100%;
}
#calendar a {
  color: #8e352e;
  text-decoration: none;
}
#calendar ul {
  list-style: none;
  padding: 0;
  margin: 0;
  width: 100%;
}
#calendar li {
  display: block;
  float: left;
  width: 14.342%;
  padding: 5px;
  box-sizing: border-box;
  border: 1px solid #ccc;
  margin-right: -1px;
  margin-bottom: -1px;
}
#calendar ul.weekdays {
  height: 40px;
  /* background: #8e352e; */
  background : rgb(111, 175, 186);
}
#calendar ul.weekdays li {
  text-align: center;
  text-transform: uppercase;
  line-height: 20px;
  border: none !important;
  padding: 10px 6px;
  color: #fff;
  font-size: 13px;
  list-style: none;
}
#calendar .days li {
  height: 80px;
}
#calendar .days li:hover {
  background: #d3d3d3;
}

#calendar .days li:after {
  list-style: none;
}
#calendar .date {
  text-align: center;
  margin-bottom: 5px;
  padding: 4px;
  background: #333;
  color: #fff;
  width: 20px;
  border-radius: 50%;
  float: right;
}
#calendar .event {
  clear: both;
  display: block;
  font-size: 13px;
  border-radius: 4px;
  padding: 5px;
  margin-top: 40px;
  margin-bottom: 5px;
  line-height: 14px;
  background: #e4f2f2;
  border: 1px solid #b5dbdc;
  color: #009aaf;
  text-decoration: none;
}
#calendar .event-desc {
  color: #666;
  margin: 3px 0 7px 0;
  text-decoration: none;
}
#calendar .other-month {
  background: #f5f5f5;
  color: #666;
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
			<h1 class="stitle">나의 정보</h1>
			<div id="contents" class="container">
				<div class="cont-mid ">
					<div class="customer-service service-process">
						<section class="txt">
							<h2 ><strong>나의 정보</strong></h2>
							<p class="sub-txt">블라블라 <strong class="point1">블라블라</strong>블라블라<br class="web"> 블라블라 <strong class="point1">할 수 </strong>있습니다. </p>
						</section>
<div class="web">
							<div class="flow-chart">
							
							
							<table class="tg">
	
								  <tr>
									    <td rowspan="3"><img class="userImage" src="/images/user.png"></td>
									    <td rowspan="2">닉네임(이름)</td>
									    <td></td>
								  </tr>
								  <tr>
								    	<td >개인정보 변경</td>
								  </tr>
								  <tr>
									    <td >출석 / 일기 개수 / 월 명상시간 / 총 명상시간</td>
									    <td ></td>
								  </tr>
								</table>
							 	
							</div>
							<div class="flow-chart">
								<span style="display:inline-block;float:left;width:48%">
										뱃지(등급)
								</span>
						
								<span style="display:inline-block;float:left;width:48%">
									등급기준
								</span>
							
							</div>
							
							<div class="">
								<span class="text-center " style="display:inline-block;float:left;width:48%">
										<h1>나의 기분</h1>
										<div class="week-stamp"> <!-- 이번주 기분 -->
										
											 <div id="calendar-wrap">
										            <header class="text-center">
										                <h1>8월 1주</h1>
										            </header>
										            <div id="calendar">
										                <ul class="weekdays" style=" list-style: none;">
										                    <li>일</li>
										                    <li>월</li>
										                    <li>화</li>
										                    <li>수</li>
										                    <li>목</li>
										                    <li>금</li>
										                    <li>토</li>
										                </ul>
										                <!-- Days from previous month -->
										                <ul class="days"  style=" list-style: none;">
										                    <li class="day text-center" >
										                            <span class="emoticon_sm">🤗</span>
										                    </li>
										                    <li class="day text-center">
										                       <span class="emoticon_sm">🤗</span>
										                    </li>
										                    <li class="day text-center">
										                                <span class="emoticon_sm">🤗</span>
										                    </li>
										                    <li class="day text-center">
										                                 <span class="emoticon_sm">🤗</span>
										                    </li>
										                    <li class="day text-center">
										                               <span class="emoticon_sm">🤗</span>
										                    </li>
										                    <!-- Days in current month -->
										                    <li class="day text-center">
										                                 <span class="emoticon_sm">🤗</span>
										                    </li>
										                    <li class="day text-center">
										                    
										                        <span class="emoticon_sm">🤗</span>
										                    </li>
										                </ul>
									                </div>
								                </div>
									              
										</div>
										<div class="week-mood"><!-- 이번주 긍정도 -->
													<header class="text-center">
										                <h1>이번주 긍정도</h1>
										            </header>
											<progress class="week-progress" value="90" max="100"/>
										</div>
								</span>
									
								<span style="display:inline-block;float:left;width:48%">
										  <div id="calendar-wrap">
									            <header>
									                <h1>8월</h1>
									            </header>
									            <div id="calendar">
									                <ul class="weekdays" style=" list-style: none;">
									                    <li>일</li>
									                    <li>월</li>
									                    <li>화</li>
									                    <li>수</li>
									                    <li>목</li>
									                    <li>금</li>
									                    <li>토</li>
									                </ul>
									                <!-- Days from previous month -->
									                <ul class="days"  style=" list-style: none;">
									                    <li class="day other-month" >
									                        <div class="date">27</div>                     
									                    </li>
									                    <li class="day other-month">
									                        <div class="date">28</div>
				                
									                    </li>
									                    <li class="day other-month">
									                        <div class="date">29</div>                     
									                    </li>
									                    <li class="day other-month">
									                        <div class="date">30</div>                     
									                    </li>
									                    <li class="day other-month">
									                        <div class="date">31</div>                     
									                    </li>
									                    <!-- Days in current month -->
									                    <li class="day">
									                        <div class="date">1</div>                      
									                    </li>
									                    <li class="day">
									                        <div class="date">2</div>
									                        
									                    </li>
									                </ul>
									                    <!-- Row #2 -->
									                <ul class="days" style=" list-style: none;">
									                    <li class="day">
									                        <div class="date">3</div>                      
									                    </li>
									                    <li class="day">
									                        <div class="date">4</div>                      
									                    </li>
									                    <li class="day">
									                        <div class="date">5</div>                      
									                    </li>
									                    <li class="day">
									                        <div class="date">6</div>                      
									                    </li>
									                    <li class="day">
									                        <div class="date">7</div>
									                                    
									                    </li>
									                    <li class="day">
									                        <div class="date">8</div>                      
									                    </li>
									                    <li class="day">
									                        <div class="date">9</div>                      
									                    </li>
									                </ul>
									                    <!-- Row #3 -->
									                <ul class="days">
									                    <li class="day">
									                        <div class="date">10</div>                     
									                    </li>
									                    <li class="day">
									                        <div class="date">11</div>                     
									                    </li>
									                    <li class="day">
									                        <div class="date">12</div>                     
									                    </li>
									                    <li class="day">
									                        <div class="date">13</div>                     
									                    </li>
									                    <li class="day">
									                        <div class="date">14</div>
									                                       
									                    </li>
									                    <li class="day">
									                        <div class="date">15</div>                     
									                    </li>
									                    <li class="day">
									                        <div class="date">16</div>                     
									                    </li>
									                </ul>
									                    <!-- Row #4 -->
									                <ul class="days">
									                    <li class="day">
									                        <div class="date">17</div>                     
									                    </li>
									                    <li class="day">
									                        <div class="date">18</div>                     
									                    </li>
									                    <li class="day">
									                        <div class="date">19</div>                     
									                    </li>
									                    <li class="day">
									                        <div class="date">20</div>                     
									                    </li>
									                    <li class="day">
									                        <div class="date">21</div>                     
									                    </li>
									                    <li class="day">
									                        <div class="date">22</div>
									                                     
									                    </li>
									                    <li class="day">
									                        <div class="date">23</div>                     
									                    </li>
									                </ul>
									                        <!-- Row #5 -->
									                <ul class="days">
									                    <li class="day">
									                        <div class="date">24</div>                     
									                    </li>
									                    <li class="day">
									                        <div class="date">25</div>
									                               
									                    </li>
									                    <li class="day">
									                        <div class="date">26</div>                     
									                    </li>
									                    <li class="day">
									                        <div class="date">27</div>                     
									                    </li>
									                    <li class="day">
									                        <div class="date">28</div>                     
									                    </li>
									                    <li class="day">
									                        <div class="date">29</div>                     
									                    </li>
									                    <li class="day">
									                        <div class="date">30</div>                     
									                    </li>
									                </ul>
									                <!-- Row #6 -->
									                <ul class="days">
									                    <li class="day">
									                        <div class="date">31</div>                     
									                    </li>
									                    <li class="day other-month">
									                        <div class="date">1</div> <!-- Next Month -->                      
									                    </li>
									                    <li class="day other-month">
									                        <div class="date">2</div>                      
									                    </li>
									                    <li class="day other-month">
									                        <div class="date">3</div>                      
									                    </li>
									                    <li class="day other-month">
									                        <div class="date">4</div>                      
									                    </li>
									                    <li class="day other-month">
									                        <div class="date">5</div>                      
									                    </li>
									                    <li class="day other-month">
									                        <div class="date">6</div>                      
									                    </li>
									                </ul>
									            </div><!-- /. calendar -->
									        </div><!-- /. wrap -->
									</span>
							</div>
							
						<section class="txt">
							<h2 ><strong>나의 감사 기록</strong></h2>
						</section>
						
						
						
				<ul class="pinterest-board pinterest-board02 clearfix imgcut row ">
					
					<!-- 카드 게시글 	 -->
					
					<li class="col-md-3 col-sm-6 col-xs-6 pinterest-board-img pinterest-item" style="border-radius:20px;">
							<div class="img" style="overflow: hidden;">
								<img src="/images/community-bg.jpg" alt="제목" class="photo"  style="height:200px;" /> 
							</div> <!-- img -->
								<div class="tag-time">
								<small class="text-muted">
                                          2021-08-16 18:00
                               </small>
							</div>
					</li>
					<li class="col-md-3 col-sm-6 col-xs-6 pinterest-board-img pinterest-item" style="border-radius:20px;">
							<div class="img" style="overflow: hidden;">
								<img src="/images/community-bg.jpg" alt="제목" class="photo"  style="height:200px;" /> 
							</div> <!-- img -->
								<div class="tag-time">
								<small class="text-muted">
                                          2021-08-16 18:00
                               </small>
							</div>
					</li>
					<li class="col-md-3 col-sm-6 col-xs-6 pinterest-board-img pinterest-item" style="border-radius:20px;">
							<div class="img" style="overflow: hidden;">
								<img src="/images/community-bg.jpg" alt="제목" class="photo"  style="height:200px;" /> 
							</div> <!-- img -->
								<div class="tag-time">
								<small class="text-muted">
                                          2021-08-16 18:00
                               </small>
							</div>
					</li>
					<li class="col-md-3 col-sm-6 col-xs-6 pinterest-board-img pinterest-item" style="border-radius:20px;">
							<div class="img" style="overflow: hidden;">
								<img src="/images/community-bg.jpg" alt="제목" class="photo"  style="height:200px;" /> 
							</div> <!-- img -->
								<div class="tag-time">
								<small class="text-muted">
                                          2021-08-16 18:00
                               </small>
							</div>
					</li>
					<li class="col-md-3 col-sm-6 col-xs-6 pinterest-board-img pinterest-item" style="border-radius:20px;">
							<div class="img" style="overflow: hidden;">
								<img src="/images/community-bg.jpg" alt="제목" class="photo"  style="height:200px;" /> 
							</div> <!-- img -->
								<div class="tag-time">
								<small class="text-muted">
                                          2021-08-16 18:00
                               </small>
							</div>
					</li>
					<li class="col-md-3 col-sm-6 col-xs-6 pinterest-board-img pinterest-item" style="border-radius:20px;">
							<div class="img" style="overflow: hidden;">
								<img src="/images/community-bg.jpg" alt="제목" class="photo"  style="height:200px;" /> 
							</div> <!-- img -->
								<div class="tag-time">
								<small class="text-muted">
                                          2021-08-16 18:00
                               </small>
							</div>
					</li>
					<li class="col-md-3 col-sm-6 col-xs-6 pinterest-board-img pinterest-item" style="border-radius:20px;">
							<div class="img" style="overflow: hidden;">
								<img src="/images/community-bg.jpg" alt="제목" class="photo"  style="height:200px;" /> 
							</div> <!-- img -->
								<div class="tag-time">
								<small class="text-muted">
                                          2021-08-16 18:00
                               </small>
							</div>
					</li>
					<li class="col-md-3 col-sm-6 col-xs-6 pinterest-board-img pinterest-item" style="border-radius:20px;">
							<div class="img" style="overflow: hidden;">
								<img src="/images/community-bg.jpg" alt="제목" class="photo"  style="height:200px;" /> 
							</div> <!-- img -->
								<div class="tag-time">
								<small class="text-muted">
                                          2021-08-16 18:00
                               </small>
							</div>
					</li>

				</ul>
						
							<div class="btns txt-center">
									<button id="more" type="button" class="pinterest-more-btn" onclick='javascript:fnMoreView();'>
										<i class="xi-angle-down-min"></i>더보기
									</button>
								</div>
						
						
						</div><!--//web-->

						<div class="pad">
							<figure class="figure">
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
