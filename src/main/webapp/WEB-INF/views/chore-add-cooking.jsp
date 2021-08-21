<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="./sub/header.jsp" />
<title>나도 자랑하기&nbsp;|&nbsp;요리 자랑</title>
    
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


<script>

	

    $(document).ready(function() {

        $("#CookingShow-submit").click(function() {

            $("#cookingshow_form").submit();

        }); //end of btn-submit 
        
        
        $("#reason-add-btn").click(function() {
        	

    	    var NowColNodes = eval($(".reasons:last").attr('id').replace(
    	        "reasons_", ""));
      	    
    	    if (NowColNodes < 1) {
    	        NowColNodes = 0;
    	    }
    	    alert("reason-add-btn" + NowColNodes);
    	    
    	    var AddColNodes = Number(NowColNodes) + 1;

    	    $('#reasons_wrapper')
    	        .append('<!-- 추천이유 '+AddColNodes+'  -->'
    	        	   +'<div class="form-floating reasons_wrapper" >'
    	               +'<input type="text" name="reasonsVOList['+(AddColNodes-1)+'].reasons" id="reasons_'+AddColNodes+'" class="form-control reasons" placeholder="추천이유를 적어주세요">'
    	               +'<label for="reasons_'+AddColNodes+'"> 추천 이유 '+AddColNodes+'</label>'
    	               +'</div>' );
    	
        }); //end of reason-add-btn
        

    });
</script>

<!--  마크업 에디터 -->
<script src="./lib/editormd/editormd.js"></script>
<script src="./lib/editormd/languages/en.js"></script>
<link rel="stylesheet" href="./lib/editormd/css/editormd.css" />

<script type="text/javascript">
    $(function() {
        var editor = editormd("markdown-editor", {
            width  : "98%",
            height : "500px",
            path: "./lib/editormd/lib/"
        });
    });
</script>
<style>
    .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
    }

    @media (min-width: 768px) {
        .bd-placeholder-img-lg {
            font-size: 3.5rem;
        }
    }
    
    .empty-10 {
    margin : 10px 0;
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
		<div id="spot" class="sub6">
		</div>
		<section class="cont-wrap horizontal">
			<h1 class="stitle">요리 자랑</h1>
			<div id="contents" class="container">
				<div class="cont-mid ">
											
								<form name="cookingshow_form" id="cookingshow_form" action="./chore-add-cooking" method="post" enctype="multipart/form-data">
						                <h1>나도 자랑 하기</h1>
						                <div class="row">
						                    <div class="col-md-4">
						
						                        <div class="form-floating">
						                            <input type="text" name="name" value="${name}" class="form-control" id="floatingName" placeholder="이름" >
<!-- 						                            <label for="floatingName">이름 </label>
 -->						                        </div>
						                    </div>
						                    <div class="col-md-4">
						                        <div class="form-floating">
						                            <input type="hidden" name="authorid" value="${id}" class="form-control" id="floatingInput" placeholder="id" readonly>
<!-- 						                            <label for="floatingInput">아이디</label>
 -->						                        </div>
						
						                    </div>
						
						            <!--         <div class="col-md-4">
												   <div class="form-floating">
						                            <select name="categoryid" class="form-control" id="floatingCategory">
						                                <option value="a" selected>당을 낮추는 식단</option>
						                                <option value="b">저지방 식단</option>
						                                <option value="c">기분이 좋아지는 식단</option>
						
						                            </select>
						                            <label for="floatingCategory">카테고리 </label>
						                        </div>
						                    </div> -->
						                </div>
						                <div class="empty-10"></div>
						
								<!-- 		<div class="row">
						                    <div class="col-md-12" id="reasons_wrapper">
							                    <div style="display:inline-block;float:left">
							                    	<h3 class="h3 mb-3 fw-normal">추천 이유 </h3>
							                    </div>
							                    <div style="display:inline-block;float:left;margin-left:10px;">	
							                    	<button class="btn btn-primary" type="button" id="reason-add-btn">더 있어요!!</button>
												</div>
												<div style="clear:both"></div>
												
												추천이유 1
												<div class="form-floating reasons_wrapper" >
												 	
													<input type="text" name="reasonsVOList[0].reasons" id="reasons_1" class="form-control reasons" placeholder="추천 이유 1">
						                        </div>
						                        
						                        추천이유 2
						                        <div class="form-floating reasons_wrapper">
												 	
													<input type="text" name="reasonsVOList[1].reasons" id="reasons_2" class="form-control reasons"  placeholder="추천 이유 2">
						                        </div>
						                        
						                        추천이유 3
						                        <div class="form-floating reasons_wrapper">
												 	
													<input type="text" name="reasonsVOList[2].reasons" id="reasons_3" class="form-control reasons" placeholder="추천 이유 3">
						                        </div>
						                        추천이유 4
						                        <div class="form-floating reasons_wrapper">
												 	
													<input type="text" name="reasonsVOList[3].reasons" id="reasons_4" class="form-control reasons" placeholder="추천 이유 4">
						                        </div>
											</div>
						                </div> -->
										<div class="empty-10"></div>
						
						
						
						                <div class="row">
						               	 <div class="col-md-12">
						          
						                    <div class="form-floating">
						                    	<h3>제 목</h3>
						                        <input type="text" name="title" class="form-control" id="floatingTitle" placeholder="제목을 입력하세요">
						                    </div>
						                    </div> 
						                </div>
						                <div class="empty-10"></div>

						
						                <div class="row">
						                    <div id="markdown-editor" class="editormd">
						                        <textarea style="display:none" name="contents">### 마크다운 에디 사용법
						
						- 마크다운 언어로 좌측창에 내용을 작성하시면, 우측창에 변환되어 표시됩니다.
						</textarea>
						                    </div>
						                </div>
						                <div class="empty-10"></div>
										
										
						                <div class="row">
						                    <div class="col-md-12">
						                        <label for="formFileMultiple" class="form-label"><strong>이미지 첨부</strong></label>
						                        <input type="hidden" name="imageurl">
						                        <input class="form-control" multiple="multiple"  name="file" type="file" id="formFileMultiple" multiple>
						                    </div>
						                </div>
						                <div class="empty-10"></div>
						                <div class="row" >
						                <div class="col-md-5">
						                </div>
						                						                <div class="empty-10"></div>
						                
						                    <div class="col-md-2">
<!-- 						                        <button class="w-100 btn btn-lg btn-primary" type="submit" id="CookingShow-submit">등록하기</button>
 -->						                                                			<a href="#" class="btn btn-style01" id="CookingShow-submit" >등록하기</a>
						                        
						                    </div>
						                   
						                </div>
						            </form>

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
					</script>
			</div>
    	</section>
    	<a href="#uppermost" class="go-top"><i class="xi-arrow-up"></i><span class="sr-only">페이지 맨위로 이동</span></a>
	</main>
    <!-- footer -->
<jsp:include page="./sub/footer.jsp" />
