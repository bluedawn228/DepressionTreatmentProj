/**
 * 
 */
 $(document).ready(function () {
	
	recentChatListFunction(10);
	getInfiniteChat();
});
 
 
var lastId = 0; 
function chatSubmit() {
	var chatName = $('#chatName').val();
	var chatContent = $('#chatContent').val();
	
	$.ajax({
		type:"POST",
		url:"./submitChat",
		data: {
				chatName : chatName,
				chatContent : chatContent
		}, //data
		success : function (result) {
			if(result == "1" ) {
				autoClosingAlert($("#successMessage"), 2000);
			} else if (result == "0"){
				autoClosingAlert($("#dangerMessage"), 2000);
			} else {
				autoClosingAlert($("#warningMessage"), 2000);
			}
		} //success
	}); //ajax
	$('#chatContent').val("");  //메시지창 비워주기
} //chatSumbit

function autoClosingAlert(selector, delay) {
	$(selector).show();

	setTimeout(function() {
                    $(selector).fadeOut('fast');
                }, delay);
} //autoClosingAlert


function chatListFunction(type) {
	$.ajax({
		type:"POST",
		url:"./chatList",
		data: {
				listType : type
		}, //data
		success : function (data) {
			var parsed = JSON.parse(data);
			var result = parsed.result;
			for (var i=0; i < result.length; i++) {
				addChat(result[i][0].value, result[i][1].value, result[i][2].value);
			}
			
		} //success
	}); //ajax
} //chatListFunction


function recentChatListFunction(num) {
	$.ajax({
		type:"POST",
		url:"./recentChatList",
		data: {
				num : num
		}, //data
		success : function (data) {
			var parsed = JSON.parse(data);
			var result = parsed.result;
			for (var i=0; i < result.length; i++) {
				addChat(result[i][0].value, result[i][1].value, result[i][2].value);
			}
			lastId = Number(parsed.last);
		} //success
	}); //ajax
} //chatListFunction



function realtimeChatListFunction() {
	//alert(lastId);
	$.ajax({
		type:"POST",
		url:"./realtimeChatList",
		data: {
				chatId : lastId
		}, //data
		success : function (data) {
			if (data == "") return;
			var parsed = JSON.parse(data);
			var result = parsed.result;
			for (var i=0; i < result.length; i++) {
				addChat(result[i][0].value, result[i][1].value, result[i][2].value);
			}
			lastId = Number(parsed.last);
		} //success
	}); //ajax
} //chatListFunction


function addChat(chatName, chatContent, chatTime) {
	$('#chatList').append('<li class="list-group-item">' +
											'<div class="chatWrapper">' +
												'<div class="divLeft1">' +
													'<img  src="./images/user.png" class="userImage">' +
												'</div>' +
												'<div class="divLeft2">' +
														'<strong class="chatName">'+chatName+'</strong>'+
														'<p class="chatContent">'+chatContent+'</p>'+
												'</div>'+
												'<div class="chatTime divRight">'+chatTime+'</div>'+
											'</div>'+
											'<div style="clear: both;"></div>'+
										'</li>'	+
										'<hr>'
										);

	const top = $('#chatList').prop('scrollHeight');
	$('#chatList').scrollTop(top);

}//addChat

function getInfiniteChat() {
	setInterval(function() {
		realtimeChatListFunction(lastId);
	}, 500);
}