$(function() {
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth() + 1;

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
            var cell = $('<td>' + date + '</td>');
            cell.click(function() {
                var selectedDate = year + '년 ' + month + '월 ' + $(this).text() + '일';
                $('#selectedDate').text(selectedDate);
                $('#dateModal').modal('show');
            });
            row.append(cell);
        }

        while (row.children().length < 7) {
            row.append('<td></td>');
        }
        $tbody.append(row);
    }

    calendar(year, month);

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