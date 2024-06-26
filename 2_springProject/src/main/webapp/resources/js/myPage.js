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
    
    // 폼 수정 버튼 누를때
    $(".updateList").click(function() {
        var row = $(this).closest("tr");

        // 행에서 값 추출
        var no = row.find('input[name="no"]').val();
        var writer = row.find('input[name="writer"]').val();
        var content = row.find("td:eq(3)").text();
        var price = row.find("td:eq(2)").text();
        var date = row.find("td:eq(0)").text();
        var evaluation = row.find("input[name='evaluation']").val();

        // 기존에 추가된 모든 폼 제거
        $("tr.form-row").remove(); 

        // 새로운 폼 생성
        var newFormHtml = `
            <tr class="form-row" >
        		<input type="hidden" name="no" value="${no}">
                <input type="hidden" name="writer" value="${writer}">
                <input type="hidden" name="evaluation" value="${evaluation}">
                <td colspan="6">
                    <form class="submitForm p-3" method="post">
                        <!-- 수정 삭제를 위한 히든 인풋 -->
                        
                        <div class="row mb-2">
                       		<div class="col">
                                <div class="row mb-2">
                                    <div class="col-3 d-flex align-items-center">
                                        <select name="category" class="form-select consume-tag">
                                            <option value="" disabled selected>소비태그</option>
                                            <option value="식비">식비</option>
                                            <option value="쇼핑">쇼핑</option>
                                            <option value="편의점&마트">편의점&마트</option>
                                            <option value="교통비">교통비</option>
                                            <option value="보험&세금">보험&세금</option>
                                            <option value="주거&통신">주거&통신</option>
                                            <option value="기타">기타</option>
                                        </select>
                                    </div>
                                    <div class="col">
                                        <input type="text" name="content" class="form-control" placeholder="소비내역" value="${content}">
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
                                        <input type="text" name="price" class="form-control" placeholder="가격(원)" value="${price}">
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col">
                                        <input type="date" name="date" class="form-control" >
                                    </div>
                                </div>

                                <!-- 메모 기능 추가 -->
                                <div class="row mb-2">
                                    <div class="col position-relative">
                                        <textarea class="form-control" id="textarea" name="evaluation" rows="1">${evaluation}</textarea>
                                        <i class="bi bi-caret-down-fill fs-5 caret-icon" id="caretDown"></i>
                                        <i class="bi bi-caret-up-fill fs-5 d-none caret-icon" id="caretUp"></i>
                                    </div>
                                </div>

                                <div class="row mb-2 justify-content-center">
                                    <div class="col-6">
                                        <input type="button" class="updateOne btn btn-outline-primary w-100" value="수정하기">
                                    </div>
                                    <div class="col-6">
                                        <input type="reset" class="resetBtn btn btn-outline-warning w-100" value="취소하기">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </td>
            </tr>
        `;

        // 클릭한 버튼 바로 아래에 폼 추가
        row.after(newFormHtml);
    });

    // 취소버튼 눌러서 수정폼 제거 
    $(document).on('click', '.resetBtn', function() {
        $(this).closest("tr.form-row").remove();
    });
    
    // 폼 업데이트 버튼
    $(document).on("click", ".updateOne", function(){
        var formRow = $(this).closest("tr.form-row");
        var formData = formRow.find('input, select, textarea').serializeArray();
        
        var jsonData = {};
        $.each(formData, function() {
            jsonData[this.name] = this.value;
        });
    	        
        console.log('Submitting form:', jsonData);
        
        updateList(jsonData);
        
        formRow.remove();
    });


    // 폼 삭제
    $(document).on("click", ".deleteList", function(){
    	var no = $(this).attr("data-no");
        var writer = $(this).closest("tr").find("input[name='writer']").val(); // writer 값을 올바르게 가져오기
        var formData = { no: no, writer: writer };
        console.log('Deleting form:', formData);
        deleteList(formData);

    });
    
    // 메모 기능
    $(document).on("click", "#caretDown", function() {
        var $colDiv = $(this).closest('.col');
        $colDiv.find('#textarea').animate({ height: '200px' }, 500);
        $(this).addClass('d-none');
        $colDiv.find('#caretUp').removeClass('d-none');
    });

    $(document).on("click", "#caretUp", function() {
        var $colDiv = $(this).closest('.col');
        $colDiv.find('#textarea').animate({ height: '38px' }, 500); // 기본 높이로 돌아감
        $(this).addClass('d-none');
        $colDiv.find('#caretUp').removeClass('d-none');
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

					<div class="col">
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
								<input type="text" name="content" class="form-control" placeholder="소비내역">
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
								<input type="text" name="price" class="form-control" placeholder="가격(원)">
							</div>
						</div>

						<div class="row mb-2">
							<div class="col">
								<input type="date" name="date" class="form-control">
							</div>
						</div>

						<!-- 메모 기능 추가 -->
						<div class="row mb-2">
							<div class="col position-relative">
								<textarea class="form-control" id="textarea" name="evaluation" rows="1"></textarea>
								<i class="bi bi-caret-down-fill fs-5 caret-icon" id="caretDown"></i>
								<i class="bi bi-caret-up-fill fs-5 d-none caret-icon" id="caretUp"></i>
							</div>
						</div>

						<div class="row mb-2 justify-content-center">
							<div class="col-6">
								<input type="submit" class="submitOne btn btn-outline-primary w-100" value="제출하기">
							</div>
							<div class="col-6">
								<input type="reset" class="resetBtn btn btn-outline-warning w-100" value="취소하기" onclick="removeForm(this)">
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
                        <tr class="form-row">
                      		<input type="hidden" name="no" value="${b.no}">
                            <input type="hidden" name="writer" value="${b.writer}">
                            <input type="hidden" name="evaluation" value="${b.evaluation}">
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
                        <tr class="form-row">
                    		<input type="hidden" name="no" value="${b.no}">
                            <input type="hidden" name="writer" value="${b.writer}">
                            <input type="hidden" name="evaluation" value="${b.evaluation}">
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
                    	<tr class="form-row">
                    		<input type="hidden" name="no" value="${b.no}">
                            <input type="hidden" name="writer" value="${b.writer}">
                            <input type="hidden" name="evaluation" value="${b.evaluation}">
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
