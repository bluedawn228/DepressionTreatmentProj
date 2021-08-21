<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!-- Bootstrap core CSS -->
<link href="./lib/bootstrap-5.0.2-dist/css/bootstrap.css" rel="stylesheet">

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
            location.href = "./addCookingShowArticle";

        });

    });

</script>



<!--  가로 출력 개수 지정  -->
<c:set var="i" value="0" />
<c:set var="j" value="3" />


<main>

    <section class="py-5 text-center container">
        <div class="row py-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">
                <h1 class="fw-light">회원 요리 자랑</h1>
                <p class="lead text-muted">좋아하는 요리에 좋아요 추천을 눌러주세요!!</p>
                <p>
                </p>
            </div>
        </div>
    </section>

    <div class="row">
        <!--  앨범 형태 요리 자랑 식단 -->

        <section class="main__sect care hd__inner1100">
            <p class="main__desc hPara fadeInUp">이 요리, 인기 짱!</p>
            <div style="display:inline-block;float:left;">
                <h3 class="main__h3 hPara fadeInUp">

                    <strong>회원 요리 - 인기순위 </strong>

                </h3>
            </div>
            <div style="display:inline-block;float:right;">
                <button type="button" id="cookingshow-add-btn" class="btn btn-lg btn-warning">게시글 등록</button>
            </div>


        </section>

        <div class="album py-5 bg-light">
            <div class="container">
                <!-- 서버에서 불러오는 게시글  -->
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                    <c:forEach items="${csList}" var="List" varStatus="status">

                        <c:if test="${i%j == 0 }">

                            <br>

                        </c:if>
                        <div class="col">
                            <div class="card shadow-sm">
                                <img src="${List.imageurl}" width="100%" height="225" onclick="javascript:location.href='./CookingShowDetail?idx=${List.idx}'" />
                                <div class="card-body">

                                    <p class="card-text" onclick="javascript:location.href='./CookingShowDetail?idx=${List.idx}'">${List.authorid} 님 "${List.categoryid}" <br> ${List.title}  </p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <button type="button" id="recommendation-btn" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="javascript:pickedIDX(${List.idx});">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
												  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"></path>
												</svg>
                                                좋아요
                                            </button>
                                            <button type="button" class="btn btn-sm btn-outline-secondary" id="recommendation-cnt-${List.idx}" >
                                                <fmt:formatNumber value="${List.recommendation}" pattern="###,###,###,###" />
                                            </button>
                                            
                                        </div>
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
                                </div>
                            </div>
                        </div>


                        <c:if test="${i%j == j-1 }">

                            <br>

                        </c:if>

                        <c:set var="i" value="${i+1 }" />

                    </c:forEach>


                </div> <!-- 서버에서 불러오는 게시글  -->

            </div>
        </div>
    </div> <!-- 앨범 형태 추천 식단	   -->

</main>



<script src="./lib/bootstrap-5.0.2-dist/js/bootstrap.js"></script>


