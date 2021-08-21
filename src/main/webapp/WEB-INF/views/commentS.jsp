<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
	var bno='${detail.bno}'; //게시글 번호
	
	$('[name=commentInsertBtn]').click(function(){  //댓글 등록 버튼 글릭 시
		var insertData = $('[name=commentInsertForm]').serialize();  //commentInsertForm의 내용을 가져온다.
		commentInsert(insertData); //Insert 함수 호출(아래)
		
	});
	
//댓글 목록
function commentList(){
	$.ajax ({
		url : '.././CommentList',
		type : 'get',
		data : { 'bno' : bno},
		success : function(data) {
			var str='';
			$.each(data, function(key, value) {
				str += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;"';
				str += '<div class="commentInfo'+ value.cno+'"> '+ '댓글번호 : ' +value.cno+' / 작성자 : ' + value.writer;
				str += '<a onclick="commentUpdate('+ value.cno+',\''+value.content+'\');"> 수정 </a>';
				str += '<a onclick="commentDelete('+value.cno+');"> 삭제 </a></div>';
				str += '<div class="commentContent'+ value.cno+'"><p> 내용 : '+ value.content +'</p>';
				str += '</div></div>';
			}); //each
			
			$(".commentList").html(str);	
		} //success
	}) //ajax
}


//댓글 등록
function commentInsert(insertData) {
	$.ajax({
		url : '.././CommentInsert',
		type : 'post',
		data : insertData,
		success : function(data){
			if(data == 1) {
				commentList(); //	댓글 작성 후 댓글 목록 	reload();
				$('[name=content]').val('');
			}
		}
	});
}


//댓글 수정 - 댓글 내용 출력을 input form으로 변경
function commentUpdate(cno, content) {
	var str = '';
	alert('수정');
	str += '<div class="input-group">';
	str += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"  /> ';
	str += '<span class="input-group-btn"><button type="button" class="" onclick="commentUpdateProc('+ cno+')"> 수정 </button> </span>';
	str += '</div>';
	
	$('.commentContent'+cno).html(str);
}

//댓글 수정
function commentUpdateProc(cno){
	var updateContent = $('[name=content_'+cno+']').val();
	
	$.ajax({
		url : '.././CommentUpdate',
		type : 'post',
		data : {
			'content' : updateContent,
			'cno' : cno
		},
		success : function(data){
			if(data==1) commentList(bno);  //댓글 수정 후 목록 출력
		}
	})//ajax
}


//댓글 삭제
function commentDelete(cno){
	$.ajax({
		url : '.././CommentDelete/'+cno,
		type : 'post',
		success : function(data) {
			if(data==1) commentList(bno); //댓글 삭제 후 목록 출력
		}
	})//ajax
	
}

$(document).ready(function(){
	commentList(); // 페이지 로딩 시 댓글 목록 출력
});
</script>



