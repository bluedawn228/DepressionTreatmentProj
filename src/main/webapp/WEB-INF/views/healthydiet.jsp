<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--  header -->
<jsp:include page="./include/header.jsp"/>
<!--  header -->

<script>

function pickedIDX(articleId) {
            //alert("와따");
            location.href = "./healthyDietDetail?idx="+articleId;
    };

  //무한 스크롤 
	// 이전 스크롤 좌표
    var  lastScrollTop = 0;
    var easeEffect = 'easeInQuint';
    
    // 스크롤 이벤트 최초 발생
    $(window).scroll(function(){
    	//alert("왔다");
    	
    	// 현재 스크롤 좌표
    	var currentScrollTop = $(window).scrollTop();
    	
    	/*  
		================= 다운 스크롤인 상태	================
		*/
    	if ( currentScrollTop - lastScrollTop > 0) {

    		// 현재 스크롤의 top 좌표가 > 게시글을 불로온 화면 height - 윈도우의 창 height 되는 순간
    		if($(window).scrollTop() >= ($(document).height() - $(window).height())   ) {
    			
    			//마지막 게시글의 bno 값을 가져온다.
    	    	var lastnum = $(".scrolling:last").attr("data-num");
    	    	
    			// 마지막 게시글 bno 를 보내서 6개의 데이터를 더 받아온다.
    	    	$.ajax({
    	    		type : 'POST',
    	    		url : './dietScrollDown',
    				contentType : "application/json",
    	    		dataType : 'json',
    	    		data : JSON.stringify({
    	    			"num" : lastnum
    	    		}),
    	    		success : function(data) {
    	    			//alert(data);
    	    			var str = "";

    	    			if(data != "") {
   
    						var i = 0;
    						var j = 3; 	    				
    	    				$(data).each(
    	    					function(index, item) {

    	    						console.log(this);
    	    						console.log("i%j " + i%j  );
    	
    	    						  if ( i%j ==0) {
    	    							  str += "<tr class='listToChange'>" ;
    	    						  } 
    							         str += " <td  class='scrolling' data-num='" + this.num+ " '> " 
		    				          			+	    " <img src=' " +this.imageurl + " ' width='100%' height='225px' onclick=\"javascript:location.href='./HealthyDietDetail?idx="+this.idx+" '\" /><br> "
		    									+		"  <p onclick=\"javascript:location.href='./HealthyDietDetail?idx= "+this.idx+" ' \">"+this.title+"'  </p> " 
		    									+		" <div class='btn-group'> "
				    			                +                 "  <button type='button' >" + this.categoryname + " </button> "
				    			                +                 " <button type='button'  onclick=\"javascript:pickedIDX("+this.idx +" );\" >자세히 보기</button> "
		    	                                + 		 " </div> "
		    	                                +	" </td> ";
		    									 
    								if ( i%j==j-1) {
    									 str +=" </tr> ";
    								}
									i=i+1;
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
    	    	}) ;//ajax
    	    	
    	    	// 맨 처음 게시글의 위치
    	    	//var position = $(".listToChange:first").offset();
    	    	
    	    	// 서서히 위로 스크롤
    	    	//$('main').stop().animate({scrollTop :position.top}, 600, easeEffect);
    	    	
    		} // if : 현재 스크롤의 top 좌표가  > (게시글을 불러온 화면 height - 윈도우창의 height) 되는 순간
    		
    		// 현재 스크롤 좌표를 이전 스크롤 좌표에 할당
    		lastScrollTop = currentScrollTop;
    	} // 다운 스크롤 상태
    	
    }); // $(window).scroll(function()
    
    
    function autoClosingAlert(selector, delay) {
    	$(selector).show();

    	setTimeout(function() {
                        $(selector).fadeOut('fast')} , delay);
    } //autoClosingAlert
  	
  	
</script>
<style>

 .dietTB {
	margin:0 auto; 
 	border-collapse: separate;
    border-spacing: 20px;
    *border-collapse: expression('separate', cellSpacing = '10px');
 }
  .dietTB td{
   	width:30%;
    border-radius: 12px;
  	background-color: #fff;
    padding: 20px;
    border:2px solid #fff;
    border-collapse:separate;
  }
 .tb-wrapper {
 	width:100%;
 	text-align:center;
 }
 
a {
  text-decoration-line: none;
}


</style>
</head>
<body>
    
<!--  navigation -->
<jsp:include page="./include/navigation.jsp"/>
<!--  navigation -->

 
     
<!--  main  start-->
 <main>

<!-- 게시글 반복문 시작 	 -->
<c:set var="i" value="0" />
<c:set var="j" value="3" />      
<div class="tb-wrapper">
	<table class="dietTB" >

	    <tbody class="scrollLocation" >
	            <c:forEach items="${hdList}" var="list">
						<c:if test="${i%j == 0 }">
                			<tr class="listTochange">
		           		</c:if>
	                    		<td class="scrolling" data-num=""${list.num}>
	                    				<img src="${list.imageurl}" width="100%" height="225" onclick="javascript:location.href='./HealthyDietDetail?idx=${list.idx}'" /><br>
										<p onclick="javascript:location.href='./HealthyDietDetail?idx=${list.idx}'">${list.title}  </p>
										<div class="btn-group">
			                                  <button type="button" >${list.categoryname}</button>
			                                  <button type="button"  onclick="javascript:pickedIDX(${list.idx});" >자세히 보기</button>
                              			</div><!-- btn-group -->
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
 <!-- 스크롤 경고 창 -->
<div class="alert alert-warning" id="warningMessage" style="display:none;" >
		<strong>더이상 데이터가 없습니다.</strong>
</div>	 	
</main><!-- main  end-->
        
<!--  footer -->
<jsp:include page="./include/footer.jsp"/>
<!--  footer -->