<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!-- Bootstrap core CSS -->
<link href="./lib/bootstrap-5.0.2-dist/css/bootstrap.css" rel="stylesheet">

<!-- editor.md  -->
<script src="./lib/editormd/editormd.js"></script>

<script src="./lib/editormd/lib/marked.min.js"></script>
<script src="./lib/editormd/lib/prettify.min.js"></script>
<script src="./lib/editormd/lib/raphael.min.js"></script>
<script src="./lib/editormd/lib/underscore.min.js"></script>
<script src="./lib/editormd/lib/sequence-diagram.min.js"></script>
<script src="./lib/editormd/lib/flowchart.min.js"></script>
<script src="./lib/editormd/lib/jquery.flowchart.min.js"></script>


<link rel="stylesheet" href="./lib/editormd/css/editormd.preview.css"  rel="stylesheet">
<link rel="stylesheet" href="./lib/editormd/css/editormd.css"  rel="stylesheet">

<style>            
    .editormd-html-preview {
        width: 90%;
        margin: 0 auto;
    }
</style>
<script type="text/javascript">
    $(function() { editormd.markdownToHTML("editormd-view", {
                   /* htmlDecode      : true,
                   emoji           : true,
                   taskList        : true,
                   tex             : true,  
                   flowChart       : true,  
                   sequenceDiagram : true,  */
            });
    });
</script>



<!--  editor.md 끝 	 -->

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
</style>

<script>

function pickedIDX(articleId) {
    //alert($(this));
    
	$.ajax({
          type: "GET",
          dataType: "text",
          url: "./CookingShowRecommendation",
          data: { idx : articleId  },
          dataType :"text", // 데이터타입을 text 으로 받아옴

          // 전송 전 작업
          beforeSend: function() {},

          // 요청에 성공하면 함수 실행 data는 응답 데이터가 들어간다
          success: function(data, textStatus) {

              var innerId = "#recommendation-cnt";
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
	
};

$(document).ready(function() {
	

	$("#comments-btn").click(function(){
		
		if( $("#comments").val() == null || $("#comments").val() == "") {
    		  
      		alert("댓글을 입력하세요");	
      		return false;
      	  } 
		
		
		  <c:choose>
	          <c:when test="${id eq null }">
	          		alert("댓글을 다시려면 로그인이 필요합니다.");	 
	          </c:when>
	
	          <c:otherwise>
	          
	          	 
	          	$("#comments-form").submit();	
	          	 	          		
	          </c:otherwise>
      	  </c:choose>

	});

});


</script>


	
<main>
    <!--  식단 소개   -->
    <section class="py-5 text-center container">
        <div class="row py-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">
                <h1 class="fw-light">${cs.authorid} 님 "${cs.title}"</h1>
                <H2> <a href="#">연관 식단 : #${cs.categoryid}</a> </H2>

            </div>
        </div>
    </section>


    <!--  블로그 형태 본문  -->
    <div class="row g-5">
        <div class="col-md-12">
            <article class="blog-post">

                <h3 class="main__h3 hPara fadeInUp">
                  
                        <strong>식단 소개 </strong>
                </h3>
                
                <!--  본문 시작 -->
            		<div id="editormd-view">
	                <textarea style="display:none;">${cs.contents}</textarea>          
        		    </div>
				<!-- 본문 끝 -->
				
                <div style="text-align:center">
                    <img src="${cs.imageurl}" class="img-fluid">
                </div>
            </article>

            <hr />

            <article class="blog-post">
                <h3 class="main__h3 hPara fadeInUp">
                    
                        <strong>추천 이유 </strong>
                   

                </h3>
                <!-- 추천이유 반복문 시작  -->
                <c:forEach items="${csdList}" var="dList" varStatus="status">
                	<p class="main__desc hPara fadeInUp">${dList.ridx}. ${dList.reasons}</p>
                </c:forEach>
                <!-- 추천이유 반복문 끝  -->
            </article>

            <article class="blog-post" style="text-align:center">
                <div class="btn-group">
                    <button type="button" id="recommendation-btn" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="javascript:pickedIDX(${cs.idx});">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
                            <path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"></path>
                        </svg>
                        좋아요
                    </button>
                    <button type="button" class="btn btn-sm btn-outline-secondary" id="recommendation-cnt">
                    		<fmt:formatNumber value="${cs.recommendation}" pattern="###,###,###,###" />
                    </button>
                </div>

            </article>
            <br>
            <!--  댓글 입력 창 시작 -->
            <form name="comments-form" id="comments-form" action="./addCookingShowComments" method="post">
	           	 <div class="card">
		                <div class="card-header">
		                
		                <!-- 댓글 로그인 시작 -->
		                 <c:choose>
	                        <c:when test="${id eq null }">
	                            <a class="btn btn-sm btn-info" href="./SignIn?idx=${cs.idx}" >로그인</a> <span style="width: 10px"></span> 
	                        </c:when>

	                        <c:otherwise>
	                            <p>${name}(${id}) 님</p> <span style="width: 10px"></span> 
	                            <input type="hidden" name="idx" value="${cs.idx}">
	                            <input type="hidden" name="commenterId" value="${id}">
	                        </c:otherwise>
	                    </c:choose>
		                <!--  댓글 로그인 끝  -->   
		                </div>
		                <div class="card-body">
		                    <blockquote class="blockquote mb-0">
		                     <div style="display:inline-block;float:left; width:87%">
		                        <div class="form-floating">
								  <textarea class="form-control" name="comments" id="comments" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>
								  <label for="floatingTextarea2">Comments</label>
								</div>
							 </div>
							 <div style="display:inline-block;float:right; width:10%">
								<div class="d-grid gap-2">
								  <button class="btn btn-primary" type="button" id="comments-btn" style="height: 100px" >댓글 달기</button>
								</div>
							</div>	
		                    </blockquote>
		                </div>
		                
		            </div> 
		    </form>     
		    <br>   
            <!--  댓글 입력 창 끝 -->
            
            <!--  댓글 반복문 시작  -->
            <c:forEach items="${cscList}" var="cList" varStatus="status">
	            <div class="card">
	                <div class="card-header">
	                    ${cList.commenterId} 님
	                </div>
	                <div class="card-body">
	                    <blockquote class="blockquote mb-0">
	                        <p> ${cList.comments}</p>
	                        <footer class="blockquote-footer">
	                        	<cite title="Source Title"><fmt:formatDate value="${cList.postDate}" pattern="yyyy.MM.dd hh:mm:ss" /></cite>
	                        
	                         </footer>
	                    </blockquote>
	                </div>
	            </div> 
	            <br>
	        </c:forEach>    
            <!--  댓글 반복문 끝  -->
            
           


            <nav class="blog-pagination" aria-label="Pagination">
                <a class="btn btn-outline-primary" href="#"> 이전 식단 </a>
                <a class="btn btn-outline-secondary disabled" href="#" tabindex="-1" aria-disabled="true"> 다음 식단 </a>
            </nav>

        </div>


    </div> <!--  블로그 형태 본문  -->


</main>


<script src="./lib/bootstrap-5.0.2-dist/js/bootstrap.js"></script>

