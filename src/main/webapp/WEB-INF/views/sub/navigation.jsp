<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- HEADER -->
        <header id="header">
            <h1 class="logo">
                <a href="/"><span class="hidden">토닥토닥</span></a>
            </h1>
            <!--  상단 네비바  -->
            <nav class="nav">
                <ul id="gnb" class="gnb">

                    <li id="topNaviCom_MENU00465" class="depth1"><a href="/intro" class="topMenu">토닥토닥
                            소개</a>
                        <ul class="depth2">
                            <li id="topNavi2_MENU00466"><a href="/intro">토닥토닥은</a></li>
                            <li id="topNavi2_MENU00470"><a href="/purpose">운영 취지</a></li>
                            <li id="topNavi2_MENU00469"><a href="/contributors">제작 참여</a>
                            </li>
                        </ul>
                    </li>


                    <li id="topNaviCom_MENU00476" class="depth1"><a href="/inventory-bdi" id="MENU00476" class="topMenu">심리검사</a>
                        <ul class="depth2">
                            <li id="topNavi2_MENU00478"><a href="/inventory-bdi">K-BDI 검사</a></li>
                            <li id="topNavi2_MENU00479"><a href="/inventory-ces">K-CES 검사</a></li>
                            <li id="topNavi2_MENU00480"><a href="/inventory-pic">그림 검사</a></li>
                        </ul>
                    </li>



                    <li id="topNaviCom_MENU00485" class="depth1"><a href="/chore" id="MENU00485" class="topMenu">기분 좋은 콘텐츠</a>
                        <ul class="depth2">
                            <li id="topNavi2_MENU00490" class="active"><a href="/chore">기분 좋은 컨텐츠 소개</a></li>
                            <li id="topNavi2_MENU00486"><a href="/chore-story">위로가 되는 이야기</a></li>
                            <li id="topNavi2_MENU00651"><a href="/chore-youtube">영상 함께 봐요</a></li>
                            <li id="topNavi2_MENU00651"><a href="/chore-cooking">요리 자랑</a></li>
                            <li id="topNavi2_MENU00651"><a href="/chore-chat">함께 이야기해요</a></li>
                        </ul>
                    </li>



                    <li id="topNaviCom_MENU00489" class="depth1"><a href="/medi" id="MENU00489" class="topMenu">감사명상</a>
                        <ul class="depth2">
                            <li id="topNavi2_MENU00490" class="active"><a href="/medi">감사명상 소개</a></li>
                            <li id="topNavi2_MENU00497"><a href="/medi-step01">감사명상 일기</a></li>
                            <li id="topNavi2_MENU00499"><a href="/medi-community">감사명상 커뮤니티</a></li>
                        </ul>
                    </li>


                    <li id="topNaviCom_MENU00505" class="depth1"><a href="/poi" id="MENU00505" class="topMenu">상담소 진료소</a>
                        <ul class="depth2">
                            <li id="topNavi2_MENU00491" class="active"><a href="/poi">추천 방법</a></li>
                            <li id="topNavi2_MENU00647" class="active"><a href="/POIBoardSort/listAll" >상담소 진료소 추천 목록</a></li>
                            
                        </ul>
                    </li>

                    <li id="topNaviCom_MENU00505" class="depth1">
                        <a href="/mypage" id="MENU00505" class="topMenu">마이 페이지</a>
                        <ul class="depth2">
                            <li id="topNavi2_MENU00491" class="active">
                                <a href="/mypage">나의 정보</a>
                            </li>

                            <li id="topNavi2_MENU00512">
                                <a href="/mypage-history">나의 콘텐츠</a>
                                
                            </li>

                          <li id="topNavi2_MENU00582">
                            	<a href="/mypage-notes">쪽지 목록</a>
                           	</li>
                       	</ul>    	
                    </li>
                    

	<c:choose>
		<c:when test="${userInfo.id eq null }">
					<li id="topNaviCom_MENU00529" class="depth1">
                    		<a href="/auth-signup" id="MENU00529" class="topMenu">회원가입</a>
                    </li>
                    <li id="topNaviCom_MENU00529" class="depth1">
                    		<a href="/auth-signin" id="MENU00529" class="topMenu">로그인</a>
                    </li>
		</c:when>
		<c:otherwise>
					<li id="topNaviCom_MENU00529" class="depth1">
                    		${userInfo.name}(${userInfo.id}) 님
                    </li>
                    <li id="topNaviCom_MENU00529" class="depth1">
                    		<a href="/auth-signout" id="MENU00529" class="topMenu">로그아웃</a>
                    </li>
						
		</c:otherwise>
	</c:choose>


                    
                </ul> <!-- gnb -->

                <a href="javascript:;" class="all-menu-close"><i class="xi-close"></i><span class="sr-only">전체메뉴닫기</span></a>
            </nav> <!--  상단 네비바  -->

            <!-- 	부가 기능 (알림, 검색) -->
            <div class="util">

                <!-- 사이드 알림판 -->
                <div class="side-popup">
                    <button type="button" class="popup-notice" data-cnt="3">
                        <i class="xi-bell-o"></i> <span class="badge">3</span><span class="sr-only">알림판 열기</span>
                    </button>
                    <div id="popup-layer" class="">
                        <strong class="subject">알림판</strong>
                        <div class="popup-slide">
                            <div class="bx-wrapper" style="max-width: 100%;">
                                <div class="bx-viewport" aria-live="polite" style="width: 100%; overflow: hidden; position: relative; height: 255px;">
                                    <ul class="popup-list" style="width: auto; position: relative; transition-duration: 0.5s; transform: translate3d(0px, -740px, 0px);">
                                        <li style="float: none; list-style: none; position: relative; width: 350px;">
                                            <a href="https://www.kinac.re.kr/board/view?pageNum=1&amp;rowCnt=8&amp;linkId=18235&amp;menuId=MENU00490&amp;schType=0&amp;boardStyle=&amp;categoryId=&amp;continent=&amp;siteId=SITE00002&amp;contents1=&amp;contents2=&amp;country=&amp;schText=&amp;schKeyword=" tabindex="-1"> <img src="https://www.kinac.re.kr/fileDownload?fileGubun=common&amp;menuId=popupWindowMgr&amp;userFileName=기술수요조사.gif&amp;systemFileName=1622681233783.gif" alt="2021년도 원자력통제 기술수요조사 공고 - 핵비확산·핵안보 분야의 당면문제를 해결하고 국가의 주요 원자력통제 정책 이행을 뒷받침하기 위한 연구개발과제 기술수요조사를 실시하고자 합니다. - 조사대상 : 국민, 산학연 및 유관 학회 소속 전문가 / - 조사기간 : 2021.5.3.(월)~2021.9.3.(금)>자세히 보기">
                                            </a>
                                        </li>
                                        <li style="float: none; list-style: none; position: relative; width: 350px;">
                                            <a href="#" tabindex="-1"> <img src="https://www.kinac.re.kr/fileDownload?fileGubun=common&amp;menuId=popupWindowMgr&amp;userFileName=개인안심번호.png&amp;systemFileName=1623055759281.png" alt="휴대전화번호 대신 개인안심번호 - 코로나19 방역을 위해 수기명부에 개인안심번호를 쓰면 소종한 개인정보를 지킬 수 있습니다!">
                                            </a>
                                        </li>
                                        <li style="float: none; list-style: none; position: relative; width: 350px;">
                                            <a href="https://www.acrc.go.kr/acrc/cardNews/cardNews.do?command=searchDetailCardNews&amp;menuId=05050605&amp;cardNum=138&amp;currPageNo=1" target="_blank" rel="noopener noreferrer" tabindex="-1">
                                                <img src="https://www.kinac.re.kr/fileDownload?fileGubun=common&amp;menuId=popupWindowMgr&amp;userFileName=배너2.png&amp;systemFileName=1623653025432.png" alt="21세기 금도끼 은도끼 청렴 주인공을 찾습니다. 2021 국민참여 청렴콘텐츠 공모전 총 상금 4,700만원 / - 수필, 시, 웹툰/포스터/일러스트 : 2021.06.14 ~ 09.10 / - 영상, 노래 : 2021.07.01 ~10.04">
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="bx-controls bx-has-controls-direction bx-has-controls-auto bx-has-pager">
                                    <div class="bx-controls-direction">
                                        <a class="bx-prev" href=""><span>Prev</span></a><a class="bx-next" href=""><span>Next</span></a>
                                    </div>
                                    <div class="bx-controls-auto">
                                        <div class="bx-controls-auto-item">
                                            <a class="bx-start" href=""><span>Start</span></a>
                                        </div>
                                        <div class="bx-controls-auto-item">
                                            <a class="bx-stop active" href=""><span>Stop</span></a>
                                        </div>
                                    </div>
                                    <div class="bx-pager bx-default-pager">
                                        <div class="bx-pager-item">
                                            <a href="" data-slide-index="0" class="bx-pager-link" title="">1</a>
                                        </div>
                                        <div class="bx-pager-item">
                                            <a href="" data-slide-index="1" class="bx-pager-link" title="">2</a>
                                        </div>
                                        <div class="bx-pager-item">
                                            <a href="" data-slide-index="2" class="bx-pager-link active" title="선택됨">3</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="popup-counter">
                                <strong class="current-index">3</strong> / 3
                            </div>
                        </div>
                        <div class="layerpop-close">
                            <input type="checkbox" class="btnPopupWinodwChk" name="inputChk" id="inputChk"> <label for="inputChk">하루동안 열지않기</label>
                            <button type="button" class="btn-close">
                                <span class="sr-only">알림판 닫기</span> <i class="xi-close-min"></i>
                            </button>
                        </div>
                    </div>
                </div> <!-- 사이드 알림판 -->

               
                <!-- 햄버거 버튼 -->
                <a href="javascript:;" class="all-menu"><i class="xi-bars"></i><span class="sr-only">전체메뉴열기</span>
                </a> <!-- 햄버거 버튼 -->
            </div> <!-- 	부가 기능 (알림, 검색) -->
        </header> <!-- HEADER -->

        <div class="header-dimmed"></div>
        <form id="headerLoginForm" name="headerLoginForm" action="/main/member/loginForm?menuId=" method="POST" style="display: none;"><input type="hidden" name="csSignature" value="/UQ6sJHXfB8lppJelkYw/Q==">
            <input type="hidden" id="rtnUrlLogin" name="rtnUrl" value="">
        </form>
         <script>
            $(document).ready(function() {
                $(".btn-close").click(function() {
                    if ($("input:checkbox[name=inputChk]").is(":checked") == true) {
                        setCookiePopup("todayCookie", "done", 1);
                        $("#popup-layer").hide()
                    }
                });
                getCookiePopup()
            });

            function setCookiePopup(c, d, a) {
                var b = new Date();
                b.setDate(b.getDate() + a);
                document.cookie = c + "=" + escape(d) + "; path=/; expires=" + b.toGMTString() + ";"
            }

            function getCookiePopup() {
                var a = document.cookie;
                if (a.indexOf("todayCookie=done") < 0) {
                    $("#popup-layer").addClass("active")
                } else {
                    $("#popup-layer").removeClass("active")
                }
            }

            
          </script>
    