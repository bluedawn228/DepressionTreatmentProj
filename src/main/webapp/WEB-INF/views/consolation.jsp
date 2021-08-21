<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--  header -->
<jsp:include page="./include/header.jsp"/>
<!--  header -->
<script>
$(document).ready(function(){
	var min=1;
	var max=${consolation.count };
	var random = parseInt(( Math.random() * ( max - min )  ) + min);
	
	//alert(random);
	$("#consolation").css("background-image","url('./images/consolation/"+random+".png'");
})
</script>
<style>
    .outer {
  text-align: center;
	}
	.inner {
	 display: inline-block 
	}
	.contents{
	padding:30px;
	 width:500px;
	 height:500px;
	 display: table-cell;
     vertical-align: middle;
	 text-align:center;
	 line-height:50px;
	 margin:0 auto;
	}

</style>	
</head>
<body>


<!--  navigation -->
<jsp:include page="./include/navigation.jsp"/>
<!--  navigation -->

      
<!--  main  start-->
 <main>
 	<div class="outer">
 		<div class="inner">
				<div id="consolation"  class="contents"> 
					 	<h1>${consolation.title }</h1>
					 	<h3><i>${consolation.content }</i></h3>
					 	<h5>${consolation.author }</h5>
				</div>	 
		</div>	 	
 </div> 
</main>
 <!--  main  end-->
 
 
<!--  footer -->
<jsp:include page="./include/footer.jsp"/>
<!--  footer -->


