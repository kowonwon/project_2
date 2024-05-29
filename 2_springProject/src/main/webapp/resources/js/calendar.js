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

            // 클릭시 모달창
            cell.click(function() {
                var selectedDate = year + '년 ' + month + '월 ' + $(this).data('date') + '일';
                $('#selectedDate').text(selectedDate);
                $('#dateModal').modal('show');
            });
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
                // 날짜별 지출 총액을 저장할 객체
                var totalSpending = {};

                // 데이터를 처리하여 날짜별 지출 총액 계산
                $.each(resData, function(i, v) {
                    let d = new Date(v.date);
                    let cellDate = d.getDate();
                    if (!totalSpending[cellDate]) {
                        totalSpending[cellDate] = 0;
                    }
                    totalSpending[cellDate] += parseInt(v.price);
                });

                // 계산된 지출 총액을 각 셀에 표시
                $('table.calendar tbody td').each(function() {
                    var cellDate = $(this).data('date');
                    if (totalSpending[cellDate]) {
                        $(this).append('<div style="color: black; font-weight: bold;">지출 총액: ' + totalSpending[cellDate] + '원</div>');
                    }

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
