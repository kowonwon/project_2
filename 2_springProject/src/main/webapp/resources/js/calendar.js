$(function() {
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth() + 1;
   
    
    //년도에 월에 맞는 달력 만들기
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
            
            //클릭시 모달창
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
        
        $.ajax({
            url: "calendar.ajax",
            type: "get",
            data: { year: year, month: month },
            dataType: "json",
            success: function(resData) {
                $.each(resData, function(i, v) {
                    let d = new Date(v.date);
                    let cellDate = d.getDate();
                    $('table.calendar tbody td').each(function() {
                        if ($(this).data('date') == cellDate) {
                        	 if ($(this).find('div').length < 3) { // 최대 3개만 추가
                                 $(this).append('<div>' + v.writer + '-' + v.price + '</div>');}
                             }                        
                    });
                });
                // Process and display the data as needed
            },
            error: function(xhr, status) {
                console.log("error: " + status);
            }
        });
    }

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
});
