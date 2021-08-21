<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="./sub/header.jsp" />
<title>요리 자랑&nbsp;|&nbsp;기분 좋은 콘텐츠</title>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-53480561-1');
</script>
<script>

function pickedIDX(articleId) {
    //alert($(this));
    
	$.ajax({
          type: "GET",
          dataType: "text",
          url: "./CookingShowRecommendation",
          data: { idx : articleId  },

          // 전송 전 작업
          beforeSend: function() {},

          // 요청에 성공하면 함수 실행 data는 응답 데이터가 들어간다
          success: function(data, textStatus) {

              var innerId = "#recommendation-cnt-"+articleId ;
              //alert(data);
              if (textStatus == 'success') {
            	  $(innerId).text(data);

              };
          },

          // 응답이 종료되면 실행, 성공여부와 상관없이 ajax 완료후 작업 
          complete: function(data) {},

          // 에러가 났을 경우의 작업
          error: function(response, textStatus) {
              //$("#exampleModal").show();
              $(".modal-title").html("알림");
              $(".modal-body").html("오류가 발생했습니다.");

          }
      });
      return false; // 페이지 리로딩을 막는다. 
	
}

    $(document).ready(function() {
        $("#cookingshow-add-btn").click(function() {

            //alert("와따");
            location.href = "./chore-add-cooking";

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
		<div id="spot" class="sub6">
			<div id="snb">
				<h2 class="snb-title sr-only">요리 자랑</h2>
				<nav>
					<ul class="depth2" id="subNavi">
						</ul>
				</nav>
			</div>
			<div class="cont-top">


			</div>
		</div>
		<section class="cont-wrap horizontal">
			<h1 class="stitle">요리 자랑</h1>
			<div id="contents" class="container">
				<div class="cont-mid ">



	<div class="btns text-right">
			<a href="#" class="btn btn-style01" id="cookingshow-add-btn" >나도 자랑 하기</a>
		</div>
			<!-- 카이날리지 추가 -->
				<div class="page-count-wrap clearfix">
						<div class="page-count">
							<div class="page-total">총 <em>75</strong></em>건</div>
						</div>
						<div class="category-wrap">
							<div class="input-wrap">
								<input type="text" name="schText" id="schText" class="form-control" placeholder="검색어를 입력해 주세요" value="" title="검색어입력" />
								<button type="button" name="button" id="btnSearch" >
									<i class="xi-search"></i>
									<span class="hidden">검색하기</span>
								</button>
							</div>
						</div>
					</div>


	<ul class="pinterest-board pinterest-board02 clearfix imgcut row ">
					
					<!-- 카드 게시글 	 -->
					<c:forEach items="${csList}" var="List" varStatus="status">
					
					<li class="col-md-3 col-sm-6 col-xs-6 pinterest-board-img pinterest-item" style="border-radius:20px;">
					 	<a href="#" onclick="javascript:location.href='./CookingShowDetail?idx=${List.idx}'">
							<div class="img" style="overflow: hidden;">
								<img src="/uploads/cooking/${List.filename}" alt="${List.title}" class="photo" onerror="this.src='/images/noimage.jpg" onclick="javascript:location.href='./CookingShowDetail?idx=${List.idx}'" /> 
							</div> <!-- img -->
							<div class="txt">
								<strong>${List.name} 님(${List.authorid}) <br> ${List.title}</strong>
								
								
                                        
								<div class="tag-time">
									
										<small class="text-muted">
                                            <fmt:formatDate value="${List.postdate}" pattern="yyyy.MM.dd" />
                                            <c:choose>
                                                <c:when test="${List.modifydate ne null }">
                                                    (
                                                    <fmt:formatDate value="${List.modifydate}" pattern="yyyy.MM.dd" />)
                                                </c:when>
                                            </c:choose>


                                        </small>
									
									</div>
									<div style="display:inline-box;float:right;">        
                                             <fmt:formatNumber value="${List.recommendation}" pattern="###,###,###,###" />
                          			</div>       
									<div style="display:inline-box;float:right;margin-right:10px;">
                                            <div  id="recommendation-btn"  data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="javascript:pickedIDX(${List.idx});">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
												  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"></path>
												</svg>
                                                좋아요
                                            </div>
                                     </div>       
                                    
                        
							</div> <!-- txt -->
						</a>
					</li>
					  </c:forEach>
					
					
				</ul>

	<div class="btns txt-center">
			<button id="more" type="button" class="pinterest-more-btn" onclick='javascript:fnMoreView();'>
				<i class="xi-angle-down-min"></i>더보기
			</button>
		</div>
<script>
/* 
$(window).load(function(){
	$('.pinterest-board').masonry({
		columnWidth: '.pinterest-item',
		itemSelector: '.pinterest-item',
		isAnimated: true
	});
});

$(document).on({
	mouseenter: function(){
		$(this).toggleClass('active');
	},
	mouseleave: function(){
		$(this).toggleClass('active');
	}
}, '.pinterest-item');


$(function(){
	// input 한글우선입력
	$("#schText").css("ime-mode", "active");

	$('#btnSearch').on('click', function(){
		$('#searchForm').submit();
	});



	var tagArray;

	$('input[name=schText]').keyup(function(e) {
		if (e.keyCode === 13) {
			fn_submit();
		}
	});

	$("#btnApply").click(function(){
		$('#applyForm').submit();
	})
});
*/
var isMoreLoad = false;

function fn_search(){
	$("#applyForm").attr('action', '/board');
	$('#applyForm').submit();
}

// 엔터 키 사용하여 submit할 때 키워드 값을 비운다
$("#schText").keydown(function(event){
	if(event.keyCode == 13){
		$('#pageNum').val(1)
		$('#schKeyword').val('');
		$('#searchForm').submit();
	}
});

/* 더보기 */
function fnMoreView(){
	var target = parseInt($('#pageNum').val()) + 1
	var rowCnt = $('#rowCnt').val();
	var schText = $('#schText').val();
	var schKeyword = $('#schKeyword').val();
	var menuId = 'MENU00494';
	var contents1 = '';
	var contents2 = '';
	var categoryId = '';
	var siteId = 'SITE00002';

	if(schKeyword != null && schKeyword != ''){
		schText = '';
	}

	var paramData = { contents1 : contents1, contents2 : contents2, categoryId : categoryId, pageNum : target, rowCnt : rowCnt, schText : schText, menuId : menuId, schKeyword : schKeyword, siteId : siteId};

	$.ajax({
		type : "POST",
		url : "/board/listJson",
		data : paramData,
		async : true,
		success : function(data, textStatus, jqXHR)
		{
			//console.log(JSON.stringify(data));
			fnAjaxSuccess(data);
			$('#pageNum').val(parseInt($('#pageNum').val()) + 1);
		},
		error : fnAjaxError
	});
}

function fnAjaxSuccess(data){
	if(data != null && data != ''){
		//console.log(JSON.stringify(data));
		var content = "";
		$.each(data, function(i, item){
			var title = item.KNAME;
			if(title && title.length > 40) {
				title = title.substring(0, 40) + '...';
			}

			content += '<li class="col-md-3 col-sm-6 col-xs-6 pinterest-board-img pinterest-item">';
			//핵비확산뉴스레터의 경우에만 뉴스레터 페이지로 이동
			if('MENU00494' == 'MENU00494'){
				content += '<a href="'+item.CONTENTS1+'" target="_blank">';
			}else{
				content += '<a href="javascript:void(0);" onclick="goView(\''+item.LINKID+'\');return false;">';
			}
			content += '<div class="img">';
			content += '<img src="#titleId='+item.TITLEID+'" alt="'+item.KNAME+'" class="photo" onerror="this.src=\'/resources/images/common/content/noimg.gif\'"/>';
			content += '</div>';
			content += '<div class="txt">';
			if(item.CONTENTS1 != null && 'MENU00494' == 'MENU00492'){
				content += '<em class="title-point contents1">'+item.CONTENTS1+'</em>';
			}

			content += '<strong>'+title+'</strong>';
			if('MENU00494' != 'MENU00492' && 'MENU00494' != 'MENU00493' && 'MENU00494' != 'MENU00494'){
				content += '<div class="tag-time">';
				if('MENU00494' == 'MENU00490'){
					content += '<span>'+fnSetDateFormat(item.CONTENTS4)+'</span>';
				}else if('MENU00494' == 'MENU00501'){

				}else{
					content += '<span>'+formatDate(item.INSTIME)+'</span>';
				}
				content += '</div>'
			}
			content += '</div></a>';
			content += "</li>";
		});

		var $moreBlocks = $( content );

		setTimeout(function(){
			$('.pinterest-board').append( $moreBlocks).masonry( 'appended', $moreBlocks, true );
			thumbResize();

			$('.pinterest-board').masonry();
			isMoreLoad = false;
		}, 500);
	}else{
		//alert("마지막 페이지입니다.");
		$('#more').parent().remove();

	}
}

function fnAjaxError(e){

}

function formatDate(startDate) {
	var year = startDate.substring(0, 4);
	var month = startDate.substring(4, 6);
	var day = startDate.substring(6, 8);

	return year + '-' + month + '-' + day;
}

function fnSetDateFormat(content4){
	if (typeof(content4) == 'undefined') { //Virtual Function
        return '';
    }else{
		var date = new Date(content4);

		var year = date.getFullYear();
		var month = date.getMonth()+1;
		if(month <= 9){
			month = '0' + month;
		}
		var day = date.getDate();
		if(day <= 9){
			day = '0' + day;
		}

		return year + '-' + month + '-' + day;
    }
}

function goView(linkId){
	
	 $('#linkId').val(linkId);
	
	 $("#searchForm").attr('action', '/board/view');
     $('#searchForm').submit();
	
     //document.location.href = "/board/view?pageNum=1&rowCnt=8&linkId="+linkId+"&menuId=MENU00494&schType=0&boardStyle=&categoryId=&continent=&siteId=SITE00002&contents1=&contents2=&country=&schText=&schKeyword=";
}

</script></div>
		    	
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
