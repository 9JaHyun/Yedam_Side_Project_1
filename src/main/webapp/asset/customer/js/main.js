var dateInfo;
(function ($) {
    var today = new Date();

    "use strict";
    // Calender
    $('#reservationCalendar').datetimepicker({
        inline: true,
        format: 'L',
        longDateFormat: 'L',
        minDate: today
    })

    $('#reservationCalendar').on("change.datetimepicker", function (e) {
        dateInfo = e.date._d.toString();
        let month = dateInfo.split(' ')[1];
        let monthNum = convertToNum(month)
        function convertToNum(month) {
            switch (month) {
                case 'Jan':
                    return '01';
                case 'Feb':
                    return '02';
                case 'Mar':
                    return '03';
                case 'Apr':
                    return '04';
                case 'May':
                    return '05';
                case 'Jun':
                    return '06';
                case 'Jul':
                    return '07';
                case 'Aug':
                    return '08';
                case 'Sep':
                    return '09';
                case 'Oct':
                    return '10';
                case 'Nov':
                    return '11';
                case 'Dec':
                    return '12';
            }
        }
        let days = dateInfo.split(' ')[2];
        let year = dateInfo.split(' ')[3];
        dateInfo = `${year}-${monthNum}-${days}`;
    });

})(jQuery);

var checkAvailableList = function () {
    var data = {
        restaurantId: new URLSearchParams(location.search).get('restaurantId'),
        reservationTime: dateInfo,
        personnel: checkPersonnel()
    };
    $.ajax({
        type: 'GET',
        url: '/checkAvailableList.do',
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(data)
    }).done(function () {
        window.location.href = '/';
    }).fail(function (error) {
        alert(JSON.stringify(error));
    });
}

var makeURL = function () {
    var restaurantId = new URLSearchParams(location.search).get('restaurantId');
    var queryParam = "restaurantId=" + restaurantId + "&date=" + dateInfo
        + "&personnel=" + checkPersonnel();
    return '/reserveForm.do?' + queryParam;
}

var sendReservationInfo = function () {
    var queryParam = "restaurantId=" + restaurantId + "&date=" + dateInfo
        + "&personnel=" + checkPersonnel();
    $.ajax({
        type: 'GET',
        url: '/reserveForm.do?' + queryParam,
    }).done(function () {
    }).fail(function (error) {
        alert(JSON.stringify(error));
    });
}

function checkPersonnel() {
    if (($('input:radio[id=personnel1]').is(':checked'))) {
        return 1;
    }
    if (($('input:radio[id=personnel2]').is(':checked'))) {
        return 2;
    }
    if (($('input:radio[id=personnel3]').is(':checked'))) {
        return 3;
    }
    if (($('input:radio[id=personnel4]').is(':checked'))) {
        return 4;
    }
}
