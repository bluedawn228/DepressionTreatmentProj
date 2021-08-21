<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--  header -->
<jsp:include page="./include/header.jsp"/>
<!--  header -->
<script>
var canvas, context;
function init() {
    canvas = document.getElementById("myCanvas");
    context = canvas.getContext("2d");
 
    context.lineWidth = 2; // 선 굵기를 2로 설정
    context.strokeStyle = "blue";
 
    // 마우스 리스너 등록. e는 MouseEvent 객체
    canvas.addEventListener("mousemove", function (e) { move(e) }, false);
    canvas.addEventListener("mousedown", function (e) { down(e) }, false);
    canvas.addEventListener("mouseup", function (e) { up(e) }, false);
    canvas.addEventListener("mouseout", function (e) { out(e) }, false);
}
 
var startX=0, startY=0; // 드래깅동안, 처음 마우스가 눌러진 좌표
var drawing=false;
function draw(curX, curY) {
    context.beginPath();
    context.moveTo(startX, startY);
    context.lineTo(curX, curY);
    context.stroke();
}
function down(e) {
    startX = e.offsetX; startY = e.offsetY;
    drawing = true;
}
function up(e) { drawing = false; }
function move(e) {
    if(!drawing) return; // 마우스가 눌러지지 않았으면 리턴
    var curX = e.offsetX, curY = e.offsetY;
    draw(curX, curY);
    startX = curX; startY = curY;
}
function out(e) { drawing = false; }

//	캔버스 초기화
function clearCanvas()
{
    // canvas
    var cnvs = document.getElementById('myCanvas');
    // context
    var ctx = canvas.getContext('2d');

    // 픽셀 정리
    ctx.clearRect(0, 0, cnvs.width, cnvs.height);
    // 컨텍스트 리셋
    ctx.beginPath();
}

// Canvas 요소의 이미지 ajax로 서버 전송하기 
uploadCanvasToServer = function() {
	  const canvas = document.getElementById('myCanvas');
	  const imgBase64 = canvas.toDataURL('image/jpeg', 'image/octet-stream');
	  const decodImg = atob(imgBase64.split(',')[1]);

	  let array = [];
	  for (let i = 0; i < decodImg .length; i++) {
	    array.push(decodImg .charCodeAt(i));
	  }

	  const file = new Blob([new Uint8Array(array)], {type: 'image/jpeg'});
	  const fileName = 'canvas_img_' + new Date().getMilliseconds() + '.jpg';
	  let formData = new FormData();
	  formData.append('file', file, fileName);

	  $.ajax({
	    type: 'post',
	    url: '/upload/',
	    cache: false,
	    data: formData,
	    processData: false,
	    contentType: false,
	    success: function (data) {
	      alert('Uploaded !!')
	    }
	  })
	};
</script>
</head>
<body onload="init()">


<!--  navigation -->
<jsp:include page="./include/navigation.jsp"/>
<!--  navigation -->

      
<!--  main  start-->
 <main>
<canvas id="myCanvas" style="background-color:aliceblue" width="400" height="300">
</canvas>
<br>
<button type="button" id="canvasSend">분석하기</button>
<button type="button" onclick="javascript:clearCanvas()">초기화</button>

</main>
 <!--  main  end-->
 
 
<!--  footer -->
<jsp:include page="./include/footer.jsp"/>
<!--  footer -->


