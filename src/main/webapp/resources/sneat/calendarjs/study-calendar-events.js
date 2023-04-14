/**
 * App Calendar Events
 */

'use strict';

let date = new Date();
let nextDay = new Date(new Date().getTime() + 24 * 60 * 60 * 1000);
// prettier-ignore
let nextMonth = date.getMonth() === 11 ? new Date(date.getFullYear() + 1, 0, 1) : new Date(date.getFullYear(), date.getMonth() + 1, 1);
// prettier-ignore
let prevMonth = date.getMonth() === 11 ? new Date(date.getFullYear() - 1, 0, 1) : new Date(date.getFullYear(), date.getMonth() - 1, 1);

console.log("roomNumber : ", roomNumber);

let datas =
	$.ajax({
		url: "/study/ssDataList",
		data: {"roomNumber" : roomNumber},
		type: "post",
		dataType: "json",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader(csrfHeaderName, csrfToken);
		},
		async: false,
		success: function(data){
			console.log(data);
		}
	}).responseText;

let events = JSON.parse(datas);
