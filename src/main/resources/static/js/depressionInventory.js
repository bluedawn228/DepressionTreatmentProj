/**
 * 
 */
function showNext(divId) {

				var currentDiv = "#bdiQuestion_"+divId;
				var nextDiv = "#bdiQuestion_"+(Number(divId)+1);
				var radioChk = "input[name='options_"+divId+"']";
				
				if ( $(radioChk).is(':checked') == true ) {
					
					$(currentDiv).hide();
					$(nextDiv).show();
					
				} else {
					alert('한 문항을 선택해주세요');
				}
}

function showPrevious(divId) {
				var currentDiv = "#bdiQuestion_"+divId;
				var previousDiv = "#bdiQuestion_"+(Number(divId)-1);

				$(currentDiv).hide();
				$(previousDiv).show();
}

  $(document).ready(function() {

	        var elem_id

	        $("#estimation_form input[type=radio]").change(function() {

	            elem_id = $(this).attr("id");
	            if (elem_id.indexOf("option") != -1) {
		            var sum_value = 0;	
		            var cnt=0;
		            

		            $(".bdi_selector").each(function (i, e) {
		            	if ($(e).is(':checked')) {
							var cycle_num = isNaN(parseInt($(e).val())) ? 0 : parseInt($(e).val());
		                  		sum_value+=cycle_num;
		                  		cnt = cnt+1;
	                  		} 

		             });

		            $("#sum_bdi").val(sum_value);

	            };

	        });

	        $("#emailSender").click(function(){

				$("#emailModal").show();
		
			})//emailSender
			
			//이메일 보내기 ajax
			 $("#emailSend").click(function(){
				
				let email = $("#emailAddr").val();
				let bdiResult = $("#bdiResult").val();
				
				if ( email == null || email ==""  ) {
					alert("이메일을 입력해주세요");
					return false;
				}
				$.ajax({
					type:"POST",
					url:"./bdiEmailSend",
					data : {
						"email" : email,
						"bdiResult" : bdiResult
					},
					success : function(data,textStatus){
						alert(data);
						if(textStatus =='success') {
							$("#emailTitle").text("전송결과");
							$("#emailContent").text("전송에 성공하였습니다.");
						} else {
							$("#emailTitle").text("전송결과");
							$("#emailContent").text("전송 중 오류가 발생하였습니다.");
						}
					}
					
				})

			})//emailSend
   	 });     
   	 
    function showBdiResult() {
	alert("showBdiResult");
	var result;
	var sum = $("#sum_bdi").val();
	if (sum >=0 && sum <= 9) {
		result = "우울하지 않은 상태"
	} else if (sum >=10 && sum <= 15) {
		result = "가벼운 우울 상태"
	} else if (sum >=16 && sum <= 23) {
	 	result = "중한 우울 상태"
	} else if (sum >=24 && sum <= 63) {
		result = "심한 우울 상태"
	}

	$("#result_bdi").val(result)
	
	$("#bdiForm").submit();
	 //var modal_title_success = "Beck Depression Inventory (BDI) "
     //var modal_body_success = "점수의 범위<br>0~9점 : 우울하지 않은 상태<br>10~15점 : 가벼운 우울 상태<br>16~23점 : 중한 우울 상태<br>24~63점 : 심한 우울 상태<br><br>당신은 현재 " +result+"("+sum+")" + " 입니다."
	 //$(".modal-title").html( modal_title_success );	
	 //$(".modal-body").html( modal_body_success );
	// $("#bdiModal").show();
}
