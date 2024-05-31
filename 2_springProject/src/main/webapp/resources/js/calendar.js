$(function() {
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth() + 1;

    calendar(year, month);

    // 전후 버튼 동작
    $('#preMon').click(function() {
        if (month === 1) {
            year--;
            month = 12;
        } else {
            month--;
        }
        calendar(year, month);
    });

    $('#nextMon').click(function() {
        if (month === 12) {
            year++;
            month = 1;
        } else {
            month++;
        }
        calendar(year, month);
    });

    // 년도와 월에 맞는 달력 만들기
    function calendar(year, month) {
        var firstDay = new Date(year, month - 1, 1).getDay();
        var lastDate = new Date(year, month, 0).getDate();
        var $tbody = $('table.calendar tbody');
        $tbody.empty();

        $('.year_mon').text(year + '년 ' + month + '월');

        var row = $('<tr></tr>');
        for (var i = 0; i < firstDay; i++) {
            row.append('<td></td>');
        }

        for (var date = 1; date <= lastDate; date++) {
            if (row.children().length === 7) {
                $tbody.append(row);
                row = $('<tr></tr>');
            }
            var cell = $('<td></td>');
            cell.data('date', date);
            cell.append(date);

            // 요일에 따라 클래스 추가
            var day = new Date(year, month - 1, date).getDay();
            if (day === 0) { // 일요일
                cell.addClass('sunday');
            } else if (day === 6) { // 토요일
                cell.addClass('saturday');
            }

            row.append(cell);
        }

        while (row.children().length < 7) {
            row.append('<td></td>');
        }
        $tbody.append(row);

        // AJAX 요청 후 데이터 처리
        $.ajax({
            url: "calendar.ajax",
            type: "get",
            data: { year: year, month: month },
            dataType: "json",
            success: function(resData) {
                console.log(resData);
                // 날짜별 지출 총액을 저장할 객체
                var totalSpending = {};
                var receipt = {};

                // 데이터를 처리하여 날짜별 지출 총액 계산
                $.each(resData, function(i, v) {
                    let d = new Date(v.date);
                    let cellDate = d.getDate();
             
                    if (!totalSpending[cellDate]) {
                        totalSpending[cellDate] = 0;
                        receipt[cellDate] = [];
                    }
                    totalSpending[cellDate] += parseInt(v.price);
                    receipt[cellDate].push({no: v.no, writer: v.writer, price:v.price, content:v.content});
                });

                // 계산된 지출 총액을 각 셀에 표시
                $('table.calendar tbody td').each(function() {
                    var cellDate = $(this).data('date');
                    var spending = totalSpending[cellDate] || 0; // 지출이 없는 경우 0원으로 설정
                    if (totalSpending[cellDate]) {
                        var formattedSpending = totalSpending[cellDate].toLocaleString();
                        $(this).append('<div style="color: black; font-weight: bold;">지출 총액: <br>' + formattedSpending + '원</div>');
                        $(this).data('receipt', receipt[cellDate]);
                    }
                    
                    // 클릭시 모달창
                    $(this).click(function() {
                        var receipts = $(this).data('receipt'); // 셀에 저장된 receipt 데이터를 가져옴
                        var modalContent = '';
                        var selectedDateText= year+'년 '+month+'월 '+$(this).data('date')+'일';
                        $('#selectedDate').text(selectedDateText);
                        $('#totalSpending').text(spending.toLocaleString() + '원'); // 총 지출액 표시
                        $.each(receipts, function(i, receipt) {
                            var formattedPrice = parseInt(receipt.price).toLocaleString();
                            modalContent += `
                                <tr>
                            		<td class="ps-3"><a href="boardDetail?no=${receipt.no}">${receipt.content}</a></td>
                            		<td><a href="boardDetail?no=${receipt.no}">${receipt.writer}</a></td>
                            		<td><a href="boardDetail?no=${receipt.no}">${formattedPrice}원</a></td>
                            	</tr>
                            `;
                        });
                        $("#modalBody").html(modalContent); // 모달 내용 채우기
                        
                        //js 바코드 생성
                        JsBarcode("#barcode", year+"0"+month+""+$(this).data('date'), {
                            format: "CODE128",
                            width: 3,
                            height: 40,
                            displayValue: true,
                            scale: 3,
                            textMargin: 5
                        });
                        $('#dateModal').modal('show'); // 모달 열기
                    });
                    
                    // 요일에 따라 클래스 추가
                    var day = new Date(year, month - 1, cellDate).getDay();
                    if (day === 0) { // 일요일
                        $(this).addClass('sunday');
                    } else if (day === 6) { // 토요일
                        $(this).addClass('saturday');
                    }
                });
            },
            error: function(xhr, status) {
                console.log("error: " + status);
            }
        });
    }
});
