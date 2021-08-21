<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="./include/header.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script >

$(document).ready(function() {
	
 		$("#signin-submit").click(function(){
			
			//alert("와따");
			
			$("form").submit();
			
			//alert("됐다");
	      
  
      });  //end of btn-submit 
      
  }); 

 </script> 

<style>
    .outer {
  text-align: center;
	}
	
	.inner {
	  display: inline-block;
	}

</style>

<jsp:include page="./include/navigation.jsp"></jsp:include>

<main >

    <div class="outer">

        <div class="inner">

            <form name="signin_form" id="signin_form" action="./Signin" method="post" >
                <h1 >로그인</h1>
                
                 <label>
			        <span>아이디</span><input type="text" name="id" class="form-control id" id="userId" placeholder="id" value="${id}"><br>
			    </label>
			    
                 <label>
			        <span>비밀번호</span><input type="password" name="password" class="form-control password" id="userPassword" placeholder="password" value="${password}"><br>
			    </label>
 
                <label>
                    <input type="checkbox" name="rememberId" <c:choose>
												                                                <c:when test="${rememberId eq true }">checked</c:when>
												            								</c:choose>> Remember me<br>
                </label>
                

			    <label>
			        <button class="" type="submit" id="signin-submit">로그인</button>
			    </label>
            </form>


        </div>
    </div>

</main>


<jsp:include page="./include/footer.jsp"></jsp:include>
