<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="./sub/header.jsp" />
<title>영상 함께 봐요&nbsp;|&nbsp;기분 좋은 콘텐츠</title>
<script>
    window.dataLayer = window.dataLayer || [];

    function gtag() {
        dataLayer.push(arguments);
    }
    gtag('js', new Date());

    gtag('config', 'UA-53480561-1');

</script>


<script type="text/javascript">
    $(document).ready(function() {



        //제목 입력창 점검
        $("#youtubeTitle").blur(function(event) {
            if ($("#youtubeTitle").val() == null || $("#youtubeTitle").val() == "") {
                $('#chkTitle').html('제목을 입력해주세요<br><br>');
                $('#chkTitle').attr('color', '#f82a2aa3');
            } else {
                $('#chkTitle').hide();
            }
        })

        //URL 입력창 점검
        $("#youtubeURL").blur(function(event) {
            $('#chkUrl').show();
            if ($("#youtubeURL").val() == null || $("#youtubeURL").val() == "") {
                $('#chkUrl').html('URL을 입력해주세요<br><br>');
                $('#chkUrl').attr('color', '#f82a2aa3');
            } else {
                $('#chkUrl').html('');
                $('#chkUrl').hide();
            }
            if (!checkUrlForm($("#youtubeURL").val())) {
                $('#chkUrl').show();
                $('#chkUrl').html('올바른 URL을 입력해주세요<br><br>');
                $('#chkUrl').attr('color', '#f82a2aa3');
            } else {
                $('#chkUrl').html('');
                $('#chkUrl').hide();
            }
        })
        //등록하기 버튼 클릭
        $("#btn-addYoutube").click(function() {

            if ($("#youtubeTitle").val() == null || $("#youtubeTitle").val() == "") {
                $('#chkTitle').html('제목을 입력해주세요<br><br>');
                $('#chkTitle').attr('color', '#f82a2aa3');
                $("#youtubeTitle").focus();
                return false;
            } else {
                $('#chkTitle').hide();
            }
            if ($("#youtubeURL").val() == null || $("#youtubeURL").val() == "") {
                $('#chkUrl').html('동영상 주소를 입력해주세요<br><br>');
                $('#chkUrl').attr('color', '#f82a2aa3');
                $("#youtubeURL").focus();
                return false;
            } else {
                $('#chkUrl').hide();
            }
            if (!checkUrlForm($("#youtubeURL").val())) {
                $('#chkUrl').show();
                $('#chkUrl').html('올바른 URL을 입력해주세요<br><br>');
                $('#chkUrl').attr('color', '#f82a2aa3');
                $("#youtubeURL").focus();
                return false;
            } else {
                $('#chkUrl').html('');
                $('#chkUrl').hide();
            }

            //submit
            $("#youtube-form").submit();
        }); //$("#btn")
        
        

        
        
    }); //document

    //플레이어 창
    function showYoutube(title, key) {
        $("#playerModalLabel").text(title);
        $("#player-content").html("<iframe width='100%' height='515' src='https://www.youtube.com/embed/" + key + "' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope;' allowfullscreen></iframe>");
        $("#registerModal").hide();
        $("#playerModal").show();
        //삭제하기를 위해 키 저장
        $("#itemKey").val(key);
    };

    function removePlayer() {
        $("#player-content").html("");
        $("#playerModal").hide();
    };

    //등록하기 창 
    function showRegister() {
        $("#player-content").html("");
        $("#playerModal").hide();
        $("#registerModal").show();
    };

    function removeRegister() {
        $("#registerModal").hide();
    };

    function checkUrlForm(strUrl) {
        var expUrl = /^http[s]?\:\/\//i;
        return expUrl.test(strUrl);
    }

    //무한 스크롤 
    // 이전 스크롤 좌표
    var lastScrollTop = 0;
    var easeEffect = 'easeInQuint';

    // 스크롤 이벤트 최초 발생
    $(window).scroll(function() {
        //alert("왔다");

        // 현재 스크롤 좌표
        var currentScrollTop = $(window).scrollTop();

        /*  
		================= 다운 스크롤인 상태	================
		*/
        if (currentScrollTop - lastScrollTop > 0) {

            // 현재 스크롤의 top 좌표가 > 게시글을 불로온 화면 height - 윈도우의 창 height 되는 순간
            if ($(window).scrollTop() >= ($(document).height() - $(window).height())) {

                //마지막 게시글의 bno 값을 가져온다.
                var lastbno = $(".scrolling:last").attr("data-bno");

                // 마지막 게시글 bno 를 보내서 6개의 데이터를 더 받아온다.
                $.ajax({
                    type: 'POST',
                    url: './infiniteScrollDown',
                    contentType: "application/json",
                    dataType: 'json',
                    data: JSON.stringify({
                        "bno": lastbno
                    }),
                    success: function(data) {
                        //alert(data);
                        var str = "";

                        if (data != "") {

                            var i = 0;
                            var j = 3;
                            $(data).each(
                                function(index, item) {

                                    console.log(this);
                                    console.log("i%j " + i % j);

                                    if (i % j == 0) {
                                        str += "<tr class='listToChange'>";
                                    }
                                    str += " <td  class='scrolling' data-bno='" + this.bno + " '> " +
                                        " <a href='#' onclick=\"javascript:showYoutube('" + this.title + "', '" + this.key + "');\">" +
                                        "<img src='https://img.youtube.com/vi/" + this.key + "/mqdefault.jpg' width='100%' height='200px'><br>" +
                                        " <br><h5>" + this.title + "</h5>" +
                                        " </a> " +
                                        " </td> ";
                                    if (i % j == j - 1) {
                                        str += " </tr> ";
                                    }
                                    i = i + 1;
                                    console.log(str);
                                }); //each

                            // 새로 받아온 데이터를 붙여준다.	
                            //$(".listToChange").remove();

                            //$(".scrollLocation").after(str);
                            $(".scrollLocation").append(str);
                        } // if : data != null
                        else {
                            autoClosingAlert($("#warningMessage"), 2000);
                            //alert("더 이상 데이터가 없습니다.");
                        } //else
                    } //success
                }); //ajax

                // 맨 처음 게시글의 위치
                //var position = $(".listToChange:first").offset();

                // 서서히 위로 스크롤
                //$('main').stop().animate({scrollTop :position.top}, 600, easeEffect);

            } // if : 현재 스크롤의 top 좌표가  > (게시글을 불러온 화면 height - 윈도우창의 height) 되는 순간

            // 현재 스크롤 좌표를 이전 스크롤 좌표에 할당
            lastScrollTop = currentScrollTop;
        } // 다운 스크롤 상태

        /*  
		=================	업 스크롤인 상태	================
		*/
        /*
		else {
    		
    		// 현재 스크롤 top 좌표가 0보다 작거나 같아지는 순간
    	  	if( $(window).scrollTop() <=0 ) {
    	  		
    	  		//	첫번째 bno 를 가져온다
    	  		var firstbno = $(".scrolling:first").attr("data-bno");
    	  		
    	  		$.ajax({
    	  			type : 'post',
    	  			url : './infiniteScrollUp',
    	  			contentType : 'application/json',
    	  			dataType : 'json',
    	  			data : JSON.stringify({
    	  				bno : firstbno
    	  			}),
    	  			success : function(data) {
    	  				
    	  				var str = "";

    	  				// 데이터가 null이 아닌면
    	  				if(data != "") {
    	    				// 이전 게시글을 지워준다.	
    	    				//$(".listToChange").empty();
    	    				
    	    				$(data).each(
    	    					function(index, item) {
    	    						var j = 3;
    	    						console.log(this);
    	    						str += ""
    	    						  // alert(i%j);
    	    						    if ( index%j == 0) {
    	    						     + "<tr class='listToChange'>" 
    	    						    }
    							         +           		" <td class='scrolling' data-bno='" + this.bno+ " '> " 
    							         +           			" <a href='#' onclick=\"javascript:showYoutube(' " + this.title + "', ' " + this.key + " ');\">" 
    							         +           				 "<img src='https://img.youtube.com/vi/"+ this.key +  "/mqdefault.jpg' width='100%' height='200px'><br>" 
    									 +							" <h3>" + this.title + "</h3>" 
    									 +						" </a> " 
    									 +					" </td> "
    								  if(index%j == j-1) {	 
    									 +				" </tr> "
    								  }

    	    					}); //each
    	    					
    	    				// 새로 받아온 데이터를 붙여준다.	
    	    				//$(".scrollLocation").after(str);
    	    				$(".listToChange").append(str);
    	    				} // if : data != null
    	    				else {
    	    					//alert("더 이상 데이터가 없습니다.");
    	    				} //else
    	  			} //success
    	  		}) //ajax
    	  		
    	  	} // if	
    		
    	 // 스크롤 다운이벤트 때  ajax통신이 발생하지 않을때 까지의 좌표까지 스크롤을 내려가주기.
    	  //	var position = ( $(document).height() - $(window).height()) -10;
    	  	
    	  //	$('main').stop().animate({scrollTop : position}, 600, easeEffect);
    	  	
    		// 현재 스크롤 좌표를 이전 스크롤 좌표에 할당
    		lastScrollTop = currentScrollTop;
    	} // 업 스크롤인 상태
    	*/
    }); // $(window).scroll(function()


    function autoClosingAlert(selector, delay) {
        $(selector).show();

        setTimeout(function() {
            $(selector).fadeOut('fast')
        }, delay);
    } //autoClosingAlert

    
    //삭제하기 버튼 클릭
    function deleteItem(){
    	confirm("삭제하시겠습니까?");
    	$("#deleteForm").submit()
    	
    };
</script>
<style>
    html,
    body {
        height: 100%, margin:0
    }
	
    .mw {
        position: fixed;
        _position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        display: none;
        z-index:999;
    }

    .mw .bg {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: #000;
        opacity: .5;
        filter: alpha(opacity=50)
    }

    .mw .fg {
        position: absolute;
        top: 50%;
        left: 50%;
        width: 800px;
        height: 700px;
        margin: -400px 0 0 -400px;
        padding: 20px;
        border: 3px solid #ccc;
        background: #fff;
    }

    .youtubeTB {
        margin: 0 auto;
        border-collapse: separate;
        border-spacing: 20px;
        *border-collapse: expression('separate', cellSpacing='10px');
    }

    .youtubeTB td {
        width: 30%;
        border-radius: 12px;
        background-color: #fff;
        padding: 20px;
        border: 2px solid #fff;
        border-collapse: separate;
        vertical-align:top;

    }


    .tb-wrapper {
        width: 100%;
        text-align: center;
    }

    a {
        text-decoration-line: none;
    }

    .alert {
        position: fixed;
        bottom: 50px;
        left: 50%;
        width: 400px;
        height: 80px;
        margin: 400px 0 0 -200px;
        padding: 20px;
        border: 3px solid #ccc;
        background: #f7e426;
        border-radius: 20px;
        text-align: center;
    }
.modal-footer {
	text-align : right;
}

.modal-footer button{
	text-align : center;
	border : 1px #eee solid;
	font-size:30px;
	font-weight:600;
	background-color: #eee;
	padding: 5px 30px;
	border-radius : 20px;
	margin-top:20px;
}

 .modal-footer .deleteBtn{
 	background-color: red;
 	color : white;
 }

.modal-footer button:hover{
	background-color: #000;
	color : #fff;
}

.comment-box {
	padding-botton:30px;
}


.addContent {
	font-size:24px;
	font-weight:400;
}

.addContent span{
	text-align : left;
}

.addContent input{
	padding : 5px 10px;
	width : 60%;

}


.scrolling:hover, #large-movie img:hover {
	box-shadow: 5px 5px 5px 5px gray;
}



</style>
</head>



<body>

<!-- 동영상 모달 창 -->
<div id="playerModal" class="mw">
    <div class="bg">
        <!--이란에는 내용을 넣지 마십시오.-->
    </div>
    <div class="fg">
        <div class="modal-header">
            <h4 class="modal-title" id="playerModalLabel">title</h4>
        </div>
        <div class="modal-body">
            <div id="player-content"></div>
        </div>
        <div class="modal-footer">
           <button type="button" class="deleteBtn" onclick="javascript:deleteItem();">삭제</button>&nbsp;&nbsp;<button type="button" onclick="javascript:removePlayer();">닫기</button>
        </div>
    </div>
</div><!-- 동영상 모달 창 -->




<!--  등록하기 모달 창 -->
<div id="registerModal" class="mw">
    <div class="bg">
        <!--이란에는 내용을 넣지 마십시오.-->
    </div>
    <div class="fg">
        <div class="modal-body">
            <h1>동영상 등록하기</h1>
            <div class="text-center" style="margin : 30px 0;">
            	<img src="./images/youtube_add.png" style="width:80%;margin:0 auto;">
			</div>
            <form id="youtube-form" method="post" action="./addYoutube">
            <div class="text-center addContent" style="margin : 30px 0;">
                    <span>제목</span>
                    <input type="text" name="title" id="youtubeTitle" title="제목을 입력해주세요" required>
                    <br><font id="chkTitle" size="2"></font>
			</div>
                    
			<div class="text-center addContent" style="margin : 30px 0;">
                    <span>URL</span>
                    <input type="text" name="url" id="youtubeURL" title="URL을 입력해주세요" required>
                    <br><font id="chkUrl" size="2"></font>
			</div>

            </form>

			<div class="col text-center" style="margin-top:20px;">
		      	<a href="#" class="btn btn-style01"  id="btn-addYoutube" >등록하기</a>
		      	<a href="#" class="btn btn-style02"  onclick="javascript:removeRegister()">닫기</a>
		     </div>
        </div>

    </div>
    <!--fg -->
</div><!--  등록 모달 창 -->
    <a id="uppermost2" href="#contents" class="skip-to">본문 바로가기</a>
    <a id="uppermost" href="#gnb" class="skip-to">주메뉴 바로가기</a>
    <!-- wrap -->
    <div id="wrap">
    
        <jsp:include page="./sub/navigation.jsp" />
        
        <main id="main" class="main">
            <div id="spot" class="sub6">


            </div>
            
            
            <!--  동영상 삭제하기 form -->
			<form name="deleteForm" id="deleteForm" method="post" action="/deleteYoutube">
				<input type="hidden" name="itemKey"  id="itemKey" value="">
			</form>


            <section class="cont-wrap horizontal">
                <h1 class="stitle">동영상</h1>
                <div id="contents" class="container">
                    <div class="cont-mid ">



                        <div class="ad-movie clearfix">
                            <div class="col-xs-12 col-sm-8" id="large-movie" >
      
								<a href='#' onclick='javascript:showYoutube("${randomOne.title}", "${randomOne.key}");'>
									<img src='https://img.youtube.com/vi/${randomOne.key}/mqdefault.jpg'   width='100%'  height='500rem' style="z-index:999;border : 1px #eee solid;"><br>
								<br>
								<h4>${randomOne.title}</h4>	
								</a>

      
                            </div>
                            <div class="col-xs-12 col-sm-4">

                               
                                
                                <div class="txt-area" style="height:500px;">
                                		 <!-- 	추가하기 버튼 -->
										<div class="col text-center" style="margin-bottom:20px;">
		                                    <a href="#" class="btn btn-style01" id="showRegister" onclick="javascript:showRegister()">기분 좋은 영상 나도 공유 하기</a>
		                                </div>
										<div class="txt" tabindex="0" style="height:360px;">
										<p><strong>이미지를 클릭</strong>하시면 동영상 재생 창을 보실 수 있습니다. ^_^</p>
											<p><strong>유튜브 영상 중 마음을 안정시키거나<br>
													   기분이 좋아지는 영상을 공유해주세요.</strong></p>
													<p>공유하고 싶은 유튜브 영상을 찾으시면<br>
													상단의 <span class=" btn-style01">기분 좋은 영상 나도 공유하기</span><br> 
													버튼을 클릭하세요</p>
													
													<p> 화면에 제목과 유튜브 영상의 주소를<br> 
													입력할 수 있는 창이 보이실 겁니다.
													</p>
													<p>아래 이미지와 가이 주소를 복사하여서<br>
													제목과 함께 저장해주시면<br>
													다른 분들과 영상을 공유하실 수 있습니다.</p>
													<p><img src="./images/youtube_add.png" style="width:300px;margin:0 auto;"></p>
													</div>
										</div>

                            </div>
                        </div>

                        <div class="ad-movie-list">
                        
					        <!-- 동영상 카드  -->
								<!-- <input type="text" name="page" value="${page }"> -->
								<c:set var="i" value="0" />
								<c:set var="j" value="3" />      
								<div class="tb-wrapper">
									<table class="youtubeTB" >
								
									    <tbody class="scrollLocation" >
									            <c:forEach items="${ytList}" var="list">
														<c:if test="${i%j == 0 }">
								                			<tr class="listTochange">
										           		</c:if>
									                    		<td class="scrolling" data-bno="${list.bno }" style="border : 1px #eee solid;">
									                    			<a href="#" onclick="javascript:showYoutube('${list.title}', '${list.key}');">
									                    				<img src="https://img.youtube.com/vi/${list.key}/mqdefault.jpg" width="100%" height="200px"><br>
																		<br>
																		<h5>${list.title}</h5>
																	</a>
																</td>
									  					<c:if test="${i%j == j-1 }">
															</tr>
														</c:if>
														<c:set var="i" value="${i+1 }" />
												</c:forEach>
									            <!-- 동영상 카드 끝 -->
									    </tbody>
									</table>
								</div>	
                            
                            
                        </div>

                        <div class="btns right">
                        </div>

                        <script>
                            $(window).load(function() {
                                $('.pinterest-board').masonry({
                                    columnWidth: '.pinterest-item',
                                    itemSelector: '.pinterest-item',
                                    isAnimated: true
                                });
                            });

                            $(document).on({
                                mouseenter: function() {
                                    $(this).toggleClass('active');
                                },
                                mouseleave: function() {
                                    $(this).toggleClass('active');
                                }
                            }, '.pinterest-item');



                            var gContextPath = "";


                            // 레이어 호출용 메소드
                            function layer_open() {
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

                            function layer_close() {
                                $(".popup-layout").fadeOut();
                            }

                        </script>
                    </div>
            </section>
            <a href="#uppermost" class="go-top"><i class="xi-arrow-up"></i><span class="sr-only">페이지 맨위로 이동</span></a>
        </main>
        
		        
		 <!-- 스크롤 경고 창 -->
		<div class="alert alert-warning" id="warningMessage" style="display:none;" >
				<strong>더이상 데이터가 없습니다.</strong>
		</div>	 	

        <!-- footer -->
        <jsp:include page="./sub/footer.jsp" />
