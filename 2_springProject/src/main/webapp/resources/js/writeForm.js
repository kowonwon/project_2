$(function() {
    // 폼 추가
    $("#addForm").on("click", function() {
        addForm();
    });

    // 모두선택
    $("#selectAll").on("click", function() {
        let isChecked = $(this).is(":checked");
        $(".formCheckbox").prop("checked", isChecked);
    });

    // 선택폼 삭제 
    $("#deleteSelected").on("click", function() {
        $(".submitForm").each(function() {
            if ($(this).find(".formCheckbox").is(":checked")) {
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
        console.log('Submit all clicked');
        // 체크된 폼만 서브밋
        $('.submitForm').each(function() {
            if ($(this).find('.formCheckbox').is(':checked')) {
                var formData = $(this).serializeArray();
                var jsonData = {};
                $.each(formData, function() {
                    jsonData[this.name] = this.value;
                });
                console.log('Submitting form:', jsonData);
                myBoardList(jsonData);
            }
        });
    });

    // 개별 폼 제출 처리
    $(document).on("submit", ".submitForm", function(e) {
        e.preventDefault(); // 폼의 기본 제출 동작을 막습니다.
        console.log('Individual form submitted');
        var formData = $(this).serializeArray();
        var jsonData = {};
        $.each(formData, function() {
            jsonData[this.name] = this.value;
        });
        console.log('Submitting form:', jsonData);
        myBoardList(jsonData);
    });
    
    // 폼 수정
    $(document).on("click", ".updateList", function(){
    	
    	var formData = $(this).serializeArray();
        var jsonData = {};
        $.each(formData, function() {
            jsonData[this.name] = this.value;
        });
        console.log('Submitting form:', jsonData);
        updateList(jsonData);
    	
    });
    
    // 함수
    // 새 폼 추가
    function addForm() {
        var newFormHtml = `
            <form class="submitForm" method="post">
                <input type="hidden" name="writer" value="${nickname}"/> 
                <input type="checkbox" class="formCheckbox"> 
                
                <select name="category" class="consumeTag">
                    <option value="" disabled selected>소비태그</option>
                    <option value="식비">식비</option>
                    <option value="쇼핑">쇼핑</option>
                    <option value="편의점&마트">편의점&마트</option>
                    <option value="교통비">교통비</option>
                    <option value="보험&세금">보험&세금</option>
                    <option value="주거&통신">주거&통신</option>
                    <option value="기타">기타</option>
                </select> 
                            
                <input type="text" name="content" placeholder="소비내역"> 
                <input type="text" name="price" placeholder="가격"> 
                
                <select name="payment" class="paymentMethod">
                    <option value="" disabled selected>결제수단</option>
                    <option value="현금">현금</option>
                    <option value="신용카드">신용카드</option>
                    <option value="체크카드">체크카드</option>
                    <option value="모바일결제">모바일 결제</option>
                    <option value="계좌이체">계좌이체</option>
                </select> 
                <input type="date" name="date">
                <input type="submit" class="submitOne btn btn-primary">
                <input type="reset" class="resetBtn btn btn-danger">
            </form>
        `;
        
        $(".formContainer").append(newFormHtml);
    }
    
    function myBoardList(formData) {
        $.ajax({
            url: "insertList.ajax",
            type: "post",
            data: JSON.stringify(formData),
            contentType: "application/json",
            dataType: "json",
            success: function(resData) {
                $("#myList").empty();
                
                $.each(resData, function(i, b) {
                    let result = `
                        <tr>
                            <td><a href="boardDetail?no=${b.no}"
                                class="text-decoration-none link-dark">${b.date}</a></td>
                            <td><a href="boardDetail?no=${b.no}"
                                class="text-decoration-none link-dark">${b.category}</a></td>
                            <td><a href="boardDetail?no=${b.no}"
                                class="text-decoration-none link-dark">${b.content}</a></td>
                            <td><a href="boardDetail?no=${b.no}"
                                class="text-decoration-none link-dark">${new Intl.NumberFormat('ko-KR').format(b.price)}</a></td>
                            <td><a href="boardDetail?no=${b.no}"
                                class="text-decoration-none link-dark">${b.payment}</a></td>
                        </tr>
                    `;
                    $("#myList").append(result);
                });             
            },
            error: function(xhr, status) {
                console.log("Error: " + status);
            }
        });
    }
});
