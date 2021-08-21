<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="wrapper">
<header>
	<h1>1조 프로젝트</h1>

		<span><a  href="#" onclick="javascript:location.href='<c:url value='/' />bdi'">BDI 자가진단</a></span>
		<span><a  href="#" onclick="javascript:location.href='<c:url value='/' />bdiResult'">(임시)BDI 진단 결과</a></span>
		<span><a  href="#" onclick="javascript:location.href='<c:url value='/' />POIBoardSort/listAll'">상담소/진료소 리스트</a></span>
		<span><a  href="#" onclick="javascript:location.href='<c:url value='/' />POIBoardInsert'">(임시)상담소/진료소 입력</a></span>
		<span><a  href="#" onclick="javascript:location.href='<c:url value='/' />Consolation'">위로가 되는 문구</a></span>
		<span><a  href="#" onclick="javascript:location.href='<c:url value='/' />Youtube'">동영상 공유</a></span>
		<span><a  href="#" onclick="javascript:location.href='<c:url value='/' />HealthyDiet'">건강식단 </a></span>
		<span><a  href="#" onclick="javascript:location.href='<c:url value='/' />AnonymousChat'">해우소 </a></span>
		<span><a  href="#" onclick="javascript:location.href='<c:url value='/' />Drawing'">그림그리기 </a></span>
		
		<span></span>
	<c:choose>
		<c:when test="${userInfo.id eq null }">
		<span><a  href="#" onclick="javascript:location.href='<c:url value='/' />Signin'">로그인</a></span>
		<span><a  href="#" onclick="javascript:location.href='<c:url value='/' />Signup'">회원가입</a></span>
		</c:when>
		<c:otherwise>
		<span>${userInfo.name}(${userInfo.id}) 님</span> 
		<span><a  href="#" onclick="javascript:location.href='<c:url value='/' />Signout'">로그아웃</a></span>
		</c:otherwise>
	</c:choose>
	<!-- <div id="hamburger"> -->
	  <div id="line-wrapper">
		    <div id="line-top" class="line init top-reverse"></div>
		    <div id="line-mid" class="line init mid-reverse"></div>
		    <div id="line-bot" class="line init bot-reverse"></div>
	  </div>
	<!-- </div> -->
</header>

  <section>
    <nav>Nav</nav>
    