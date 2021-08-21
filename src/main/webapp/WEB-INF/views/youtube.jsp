<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--  header -->
<jsp:include page="./include/header.jsp"/>
<!--  header -->
<script type="text/javascript">
    $(document).ready(function() {
    	
    	
    	
    	//제목 입력창 점검
    	$("#youtubeTitle").blur(function(event){
    		 if ($("#youtubeTitle").val() == null || $("#youtubeTitle").val() == "") {
    			 $('#chkTitle').html('제목을 입력해주세요<br><br>');
      	         $('#chkTitle').attr('color', '#f82a2aa3');
    		 } else {
    			 $('#chkTitle').hide();
    		 }
    	})
    	
    	//URL 입력창 점검
    	$("#youtubeURL").blur(function(event){
    		$('#chkUrl').show();
    		if ($("#youtubeURL").val() == null || $("#youtubeURL").val() == "") {
           	 	$('#chkUrl').html('URL을 입력해주세요<br><br>');
     	         $('#chkUrl').attr('color', '#f82a2aa3');
           } else {
        	   $('#chkUrl').html('');
         		$('#chkUrl').hide();
           }
    	   if(!checkUrlForm($("#youtubeURL").val())) {
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
            if(!checkUrlForm($("#youtubeURL").val())) {
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
        $("#player-content").html("<iframe width='100%' height='515' src='https://www.youtube.com/embed/"+key+"' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope;' allowfullscreen></iframe>");
    	$("#registerModal").hide();       
		$("#playerModal").show();
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
    	    	var lastbno = $(".scrolling:last").attr("data-bno");
    	    	
    			// 마지막 게시글 bno 를 보내서 6개의 데이터를 더 받아온다.
    	    	$.ajax({
    	    		type : 'POST',
    	    		url : './infiniteScrollDown',
    				contentType : "application/json",
    	    		dataType : 'json',
    	    		data : JSON.stringify({
    	    			"bno" : lastbno
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
    							         str +=           		" <td  class='scrolling' data-bno='" + this.bno+ " '> " 
		    							         +           			" <a href='#' onclick=\"javascript:showYoutube(' " + this.title + "', ' " + this.key + " ');\">" 
		    							         +           				 "<img src='https://img.youtube.com/vi/"+ this.key +  "/mqdefault.jpg' width='100%' height='200px'><br>" 
		    									 +							" <h3>" + this.title + "</h3>" 
		    									 +						" </a> " 
		    									 +					" </td> ";
    								if ( i%j==j-1) {
    									 str +=				" </tr> ";
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
                        $(selector).fadeOut('fast')} , delay);
    } //autoClosingAlert
  	
  	
  	
</script>
<style>

html,body {height:100%,margin:0}
.mw {position:fixed;_position:absolute;top:0;left:0;width:100%;height:100%;display:none;}
.mw .bg {position:absolute;top:0;left:0;width:100%;height:100%;background:#000;opacity:.5;filter:alpha(opacity=50)}
.mw .fg {position:absolute;top:50%;left:50%;width:800px;height:700px;margin:-400px 0 0 -400px;padding:20px;border:3px solid #ccc;background:#fff;}
 
 .youtubeTB {
	margin:0 auto; 
 	border-collapse: separate;
    border-spacing: 20px;
    *border-collapse: expression('separate', cellSpacing = '10px');
 }
  .youtubeTB td{
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

.alert{
	position:fixed;
	bottom:50px;
	left:50%;
	width:400px;
	height:80px;
	margin:400px 0 0 -200px;
	padding:20px;
	border:3px solid #ccc;
	background:#f7e426;
	border-radius: 20px;
	text-align:center;
}
</style>
</head>

<!-- 동영상 모달 창 -->
<div id="playerModal" class="mw">
    <div class="bg"><!--이란에는 내용을 넣지 마십시오.--></div>
    <div class="fg">
        <div class="modal-header">
			<h2 class="modal-title" id="playerModalLabel">title</h2>
		</div>
		<div class="modal-body">
				<div id="player-content"></div>
		</div>
		<div class="modal-footer">
				<button type="button"  onclick="javascript:removePlayer();">닫기</button>
		</div>
    </div>
</div><!-- 동영상 모달 창 -->




 <!--  등록하기 모달 창 -->
 <div id="registerModal" class="mw">
	<div class="bg"><!--이란에는 내용을 넣지 마십시오.--></div>
		<div class="fg">
              <div class="modal-body">
					<h1 >동영상 등록하기</h1>
					<img src="./images/youtube_add.png" style="width:500px;margin:0 auto;">
					
					<form id="youtube-form" method="post" action="./addYoutube">
						<label >
							<span>제목</span><input type="text" name="title" id="youtubeTitle" title="제목을 입력해주세요" required>
							<font id="chkTitle" size="2"></font>
						</label>
						
						<label >
							<span>URL</span><input type="text" name="url" id="youtubeURL" title="URL을 입력해주세요" required>
							<font id="chkUrl" size="2"></font>
						</label>
                 	</form>

                 <button id="btn-addYoutube" type="button">등록하기</button> <button type="button"  onclick="javascript:removeRegister();">닫기</button>

             </div>

	</div><!--fg -->
</div><!--  등록 모달 창 -->
<body>


<!--  navigation -->
<jsp:include page="./include/navigation.jsp"/>
<!--  navigation -->

      
<!--  main  start-->
 <main>
		<h1>기분이 좋아지는 영상</h1>
        <!-- 	추가하기 버튼 -->
        <div class="col">
            <button type="button" id="showRegister" onclick="javascript:showRegister()">
                추가하기
            </button>
        </div>
    

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
	                    		<td class="scrolling" data-bno="${list.bno }">
	                    			<a href="#" onclick="javascript:showYoutube('${list.title}', '${list.key}');">
	                    				<img src="https://img.youtube.com/vi/${list.key}/mqdefault.jpg" width="100%" height="200px"><br>
										<h3>${list.title}</h3>
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


</main>
 <!--  main  end-->
 
 <!-- 스크롤 경고 창 -->
<div class="alert alert-warning" id="warningMessage" style="display:none;" >
		<strong>더이상 데이터가 없습니다.</strong>
</div>	 	
<!--  footer -->
<jsp:include page="./include/footer.jsp"/>
<!--  footer -->


