<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--  header -->
<jsp:include page="./include/header.jsp"/>
<!--  header -->

<script>
    $(document).ready(function() {
        // 초기 메뉴 세팅
        $(".nav-tabs li a").eq(0).addClass("active");
        $(".nav-tabs li a").eq(0).attr("aria-current", "page");
        $(".tab-cont").hide();
        $("#composition_1").show();

        // 클릭시 메뉴 변경
        $(".nav-tabs li").click(function() {
            //alert("click");
            var idx = $(this).index();
            //alert(idx);
            $(".nav-tabs li a").removeClass("active");
            $(".nav-tabs li a").removeAttr("aria-current");
            $(".nav-tabs li a").eq(idx).addClass("active");
            $(".nav-tabs li a").eq(idx).attr("aria-current", "page");

            $(".tab-cont").hide();
            $("#composition_" + (idx + 1)).show();
        })
    });


	
</script>

</head>

<body>
    
<!--  navigation -->
<jsp:include page="./include/navigation.jsp"/>
<!--  navigation -->

      
<!--  main  start-->

                
 <!--  식단 소개   -->
    <section class="py-5 text-center container">
        <div class="row py-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">
                <h1 class="fw-light">${hd.categoryname }</h1>
                <h3>식단구성</h3> <br>
                <!-- 식단 구성요소 반복문 -->
                <c:forEach var="dList" items="${foodVOList}" varStatus="status">
                    ${dList.fdNm }&nbsp;|&nbsp;
                </c:forEach>
                <!-- 식단 구성요소 반복문 끝 -->
                <br><br>
                <h3>식단소개</h3> <br>
                ${foodVOList[0].dietCn }
                <br>
                <div style="text-align:center">
                    <img src="${hd.imageurl}" class="img-fluid" alt="식단이미지" width="600px" height="500px"><br>
                </div>
            </div>
        </div>
    </section>






    <!--  식단 구성별 네비 바  -->

    <ul class="nav nav-tabs">

        <!-- 식단 구성요소 반복문 -->
        <c:forEach var="dList" items="${foodVOList}" varStatus="status">
            <li class="nav-item">
                <a class="nav-link">${status.count}. ${dList.fdNm }</a>
                <!--<a class="nav-link" aria-current="page" href="#composition_${composition.compositionno}">${composition.compositionno}. ${composition.title }</a>  -->
            </li>
        </c:forEach>
        <!-- 식단 구성요소 반복문 끝 -->

    </ul>

    <div class="row" style="height:10px;"></div><!-- 공백  -->

    <div class="row">

        <section class="main__sect care hd__inner1100">



        </section>
    </div>

    <!--  블로그 형태 본문  -->
    
    <!--  총영양소 구하기 변수선언  -->
    	<c:set var="tot_calory" value="0" />
		<c:set var="tot_glucose" value="0" />
		<c:set var="tot_protein" value="0" />
		<c:set var="tot_lipids" value="0" />
    <!--  총영양소 구하기 변수선언 끝 -->  
    
    <!--   식단구성요소 상세 정보  -->
    <c:forEach var="fdList" items="${foodVOList}" varStatus="status">
        <div class="row g-5 tab-cont" id="composition_${status.count}">
            <div class="col-md-8">
                <article class="blog-post">
                    <h3 class="main__h3 hPara fadeInUp">
                        <strong>재료 </strong>
                    </h3>
                    <p class="main__desc hPara fadeInUp">${fdList.matrlInfo}</p>

                </article>

                <hr />

                <article class="blog-post">
                    <h3 class="main__h3 hPara fadeInUp">
                        <strong>조리 방법 </strong>
                    </h3>
                    <p class="main__desc hPara fadeInUp">${fdList.ckngMthInfo }</p>
                </article>



            </div>

            <!--  본문 사이드 바  -->
            <div class="col-md-4">
                <div class="position-sticky" style="top: 2rem;">
                    <div class="p-4 mb-3 bg-light rounded">

                     

                            <h4 class="fst-bold">${fdList.fdNm }</h4>

                            <img src="${fdList.rtnImageDc }" class="img-fluid" alt="${fdList.fdNm }">

                 

                    </div>

                </div>
            </div> <!--  본문 사이드 바  -->
            
            
            <!--  영양요소 테이블 -->
            
            <div class="bd-example">
				<table class="table table-striped table-bordered">
				  <thead>
				    <tr  class="table-secondary" >
				      <th scope="col" colspan="2" style="text-align:center;width:50%">1회 섭취량</th>
	
				      <th scope="col" colspan="2" style="text-align:center;width:50%">열량</th>
				
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row" colspan="2" style="text-align:right">${fdList.ntkQyInfo   }  ml</th>
				      <td colspan="2" style="text-align:right" >${fdList.clriInfo   }  kcal</td>
				
				    </tr>
				    <tr>
				      <td colspan="4">
				        <table class="table mb-0">
				          <thead>
				            <tr  class="table-success">
				              <th scope="col" style="text-align:center;">당질	</th>
				              <th scope="col" style="text-align:center;">단백질</th>
				              <th scope="col" style="text-align:center;">지질</th>
				               <th scope="col" style="text-align:center;">콜레스트롤</th>
				            </tr>
				          </thead>
				          <tbody>
				            <tr>
				              <th scope="row" style="text-align:right">${fdList.crbhInfo   }   g</th>
				              <td style="text-align:right">${fdList.protInfo   }   g</td>
				              <td style="text-align:right">${fdList.ntrfsInfo   }   g</td>
				                <td style="text-align:right">${fdList.chlsInfo   }   mg</td>
				            </tr>
				           </tbody> 
				           <thead>
				            <tr  class="table-warning">
				              <th scope="row" style="text-align:center;">조섬유</th>
				              <th style="text-align:center;">칼슘</th>
				              <th style="text-align:center;">철분</th>
				              <th style="text-align:center;">나트륨</th>
				            </tr>
				            </thead>
				            <tbody> 
				            <tr>
				              <th style="text-align:right" scope="row">${fdList.crfbInfo   }   g</th>
				              <td style="text-align:right">${fdList.clciInfo   }   mg</td>
				              <td style="text-align:right">${fdList.ircnInfo   }   mg</td>
				              <td style="text-align:right">${fdList.naInfo   }   mg</td>
				            </tr>
				            </tbody> 
				             <thead>
				            <tr class="table-info">
				              <th scope="row" style="text-align:center;">식염상당량</th>
				              <th style="text-align:center;">비타민A</th>
				              <th style="text-align:center;">비타민B</th>
				              <th style="text-align:center;">비타민C</th>
				            </tr>
				             </thead>
				             <tbody> 
				            <tr>
				              <th style="text-align:right" scope="row">${fdList.frmlasaltEqvlntqyInfo   }   g</th>
				              <td style="text-align:right">${fdList.vtmaInfo   }   ㎍RE</td>
				              <td style="text-align:right">${fdList.vtmbInfo   }   mg</td>
				              <td style="text-align:right">${fdList.vtmcInfo   }   mg</td>
				            </tr>
				            
				          </tbody>
				        </table>
				      </td>
				    </tr>
			

				     <!--  총영양소 구하기 -->
				      
				      <c:set var= "tot_calory" value="${tot_calory + fdList.clriInfo }"/><!-- 열량 -->
				      <c:set var= "tot_glucose" value="${tot_glucose + fdList.crbhInfo }"/><!--당질 -->
				      <c:set var= "tot_protein" value="${tot_protein + fdList.protInfo }"/><!-- 단백질 -->
				      <c:set var= "tot_lipids" value="${tot_lipids + fdList.ntrfsInfo }"/><!-- 지질 -->
				    

				    <!--  총영양소 구하기 끝 -->     

				  </tbody>
				</table>
				</div>
            
            
            <!-- 영양요소 테이블 끝	 -->
        </div> <!--  블로그 형태 본문  -->
    </c:forEach> <!--   식단구성요소 상세 정보 끝 -->
    
    
<table class="table table-striped table-bordered">
				  <thead>
				    
    		   <tr  class="table-secondary" >
				      <th scope="row"  style="text-align:center;width:20%">총 영양소</th>

				     
				     <td colspan="3" style="text-align:center;width:80%">
				      열량 		<c:out value="${tot_calory }"/> kcal , <!-- 열량 -->
				      당질 		<c:out value="${tot_glucose}"/> g , <!--당질 -->
				      단백질 	<c:out value="${tot_protein }"/> g , <!-- 단백질 -->
				      지질 		<c:out value="${tot_lipids}"/> g   <!-- 지질 -->
				      </td> 
				    <!--  총영양소 구하기 끝 -->     

				    </tr>
				  </thead>
				</table>
    
    
    <nav class="blog-pagination" aria-label="Pagination">
        <a class="btn btn-outline-primary" href="#"> 이전 식단 </a>
        <a class="btn btn-outline-secondary disabled" href="#" tabindex="-1" aria-disabled="true"> 다음 식단 </a>
    </nav>
    

<!--  main  end-->
        
<!--  footer -->
<jsp:include page="./include/footer.jsp"/>
<!--  footer -->