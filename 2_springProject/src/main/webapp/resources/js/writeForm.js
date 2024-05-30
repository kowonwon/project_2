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
          $("#selectAll").prop("checked", false);  
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
                $(this).trigger('reset');
            }
            
        });
        $("#deleteSelected").click();
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
        $(this).trigger('reset');
    });

    // 폼 수정
    $(document).on("click", ".updateList", function(){
        var no = $(this).data("no");
        var row = $(this).closest("tr");
        var formData = {
            no: no,
            writer: row.find('td:eq(1) a').text(),
            category: row.find('td:eq(2) a').text(),
            content: row.find('td:eq(3) a').text(),
            price: parseInt(row.find('td:eq(4) a').text().replace(/,/g, '')),
            payment: row.find('td:eq(5) a').text(),
            date: row.find('td:eq(0) a').text()
        };
        console.log('Updating form:', formData);
        updateList(formData);
    });

    // 폼 삭제
    $(document).on("click", ".deleteList", function(){
    	var no = $(this).attr("data-no");
        var writer = $(this).closest("tr").find("input[name='writer']").val(); // writer 값을 올바르게 가져오기
        var formData = { no: no, writer: writer };
        console.log('Deleting form:', formData);
        deleteList(formData);

    });

    // 함수
    // 새 폼 추가
    function addForm() {
        var newFormHtml = `
          <form class="submitForm p-3" method="post">
				<!-- 수정 삭제를 위한 히든 인풋 -->
				<input type="hidden" name="writer" value="${nickname}" />
				<div class="row mb-2">
					<div class="col-auto m-0 p-0 ms-1">
						<input type="checkbox" class="formCheckbox me-1">
					</div>

					<div class="col ">
						<div class="row mb-2">
							<div class="col-3 d-flex align-items-center">
								<select name="category" class="form-select consume-tag">
									<option value="" disabled selected>소비태그</option>
									<option value="식비">식비</option>
									<option value="쇼핑">쇼핑</option>
									<option value="펀의점&마트">편의점&마트</option>
									<option value="교통비">교통비</option>
									<option value="보험&세금">보험&세금</option>
									<option value="주거&통신">주거&통신</option>
									<option value="기타">기타</option>
								</select>
							</div>
							<div class="col">
								<input type="text" name="content" class="form-control"
									placeholder="소비내역">
							</div>
						</div>

						<div class="row mb-2">
							<div class="col-3">
								<select name="payment" class="form-select payment">
									<option value="" disabled selected>결제수단</option>
									<option value="현금">현금</option>
									<option value="신용카드">신용카드</option>
									<option value="체크카드">체크카드</option>
									<option value="모바일결제">모바일 결제</option>
									<option value="계좌이체">계좌이체</option>
								</select>
							</div>
							<div class="col">
								<input type="text" name="price" class="form-control"
									placeholder="가격(원)">
							</div>
						</div>

						<div class="row mb-2 ">
							<div class="col">
								<input type="date" name="date" class="form-control">
							</div>
						</div>

						<div class="row mb-2 justify-content-center ">
							<div class="col-6">
								<input type="submit" class="submitOne btn btn-primary w-100"
									value="제출하기">
							</div>
							<div class="col-6">
								<input type="reset" class="resetBtn btn btn-warning w-100"
									value="취소하기">
							</div>
						</div>

					</div>
				</div>
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
                console.log(resData)
                $.each(resData, function(i, b) {
                    let result = `
                        <tr>
                      		<input type="hidden" name="writer" value="${b.writer}" />
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
                            <td>
                                <i class="bi bi-pencil-square updateList" data-no="${b.no}"></i>
                                <i class="bi bi-x-octagon deleteList" data-no="${b.no}"></i>
                            </td>
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

    function deleteList(formData) {
        $.ajax({
            url: "deleteList.ajax",
            type: "post",
            data: JSON.stringify(formData),  // JSON 문자열로 변환하여 전달
            contentType: "application/json", // content type 설정
            dataType: "json",
            success: function(resData) {
                console.log(resData);
                $("#myList").empty();
                
                $.each(resData, function(i, b) {
                    let result = `
                        <tr>
                    		<input type="hidden" name="writer" value="${b.writer}" />
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
                            <td>
                                <i class="bi bi-pencil-square updateList" data-no="${b.no}"></i>
                                <i class="bi bi-x-octagon deleteList" data-no="${b.no}"></i>
                            </td>
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


    function updateList(formData) {
        $.ajax({
            url: "updateList.ajax",
            type: "post",
            data: JSON.stringify(formData),
            contentType: "application/json",
            dataType: "json",
            success: function(resData) {
                console.log(resData)
                $("#myList").empty();
                
                $.each(resData, function(i, b) {
                    let result = `
                        <tr>
                    		<input type="hidden" name="writer" value="${b.writer}" />
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
                            <td>
                                <i class="bi bi-pencil-square updateList" data-no="${b.no}"></i>
                                <i class="bi bi-x-octagon deleteList" data-no="${b.no}"></i>
                            </td>
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
