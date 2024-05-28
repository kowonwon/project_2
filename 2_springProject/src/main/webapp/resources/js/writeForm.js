$(function(){
	
	// 폼 추가
	$("#addForm").on("click", function(){
		addForm();
	});
	
	// 모두선택
	$("#selectAll").on("click", function(){
		let isChecked = $(this).is(":checked");
		$(".formCheckbox").prop("checked", isChecked);
	});
	
	// 선택폼 삭제 
	$("#deleteSelected").on("click", function(){
		$(".submitForm").each(function(){
			if($(this).find(".formCheckbox").is(":checked")) {
				$(this).closest(".submitForm").remove();
			}
		});
		
        // 폼이 하나도 없으면 새로운 폼 추가
        if ($('.submitForm').length === 0) {
            addForm();
        }

		
	});
	
	// 한번에 제출 처리
	$('#submitAll').click(function() {
        // 체크된 폼만 서브밋
        $('.submitForm').each(function() {
            if ($(this).find('.formCheckbox').is(':checked')) {
            	var formData = $(this).serialize();
                myBoardList(formData);
            }
        });
	});
   
	
	// 새 폼 추가
	function addForm() {
		var newFormHtml = `
				<form class="submitForm " method="post">
			<input type="hidden" name="id" value="이현학"/> 
			<input type="checkbox" class="formCheckbox"> <select
				name="consume-tag" class="consume-tag">
				<option value="" disabled selected>소비태그</option>
				<option value="food">식비</option>
				<option value="shopping">쇼핑</option>
				<option value="store">편의점&마트</option>
				<option value="transportation">교통비</option>
				<option value="tax">보험&세금</option>
				<option value="housing">주거&통신</option>
				<option value="etc">기타</option>
			</select> 
			
			<input type="text" name="price" placeholder="가격"> 
			
			<select
				name="paymentMethod" class="paymentMethod">
				<option value="" disabled selected>결제수단</option>
				<option value="cash">현금</option>
				<option value="credit-card">신용카드</option>
				<option value="debit-card">체크카드</option>
				<option value="mobile-pay">모바일 결제</option>
				<option value="bank-transfer">계좌이체</option>
			</select> 
			
			<input type="date" name="date">
			
			<input type="submit" class="submitOne btn btn-primary"></button>
			<input type="reset"  class="resetBtn btn btn-danger">
			
		</form>
		`;		
		
		$(".formContainer").append(newFormHtml);
	}
//	
//	function myBoardList(formData) {
//		$.ajax({
//			url: "myBoardList.ajax",
//			type: "get",
//			data: formData,
//			dataType: "json",
//			success: function(resData){
//				console.log(resData)
//			},
//			 error: function(xhr, status) {
//                console.log("error: " + status);
//            }
//		});
//	}
});