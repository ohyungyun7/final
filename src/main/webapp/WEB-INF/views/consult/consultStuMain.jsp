<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="kr.or.ddit.vo.UserVO"%>
<%@page import="org.apache.catalina.Session"%>

<style>
textarea{
	resize: none;
	width: 100%;
	maxlength: 1000;
}
</style>

<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bxs-heart-circle page-icon"></i>
	<span class="fw-light">상담 / </span>상담 신청
</h4>

<div class="row">

	<div class="col-3">
		<div class="card" style="height: 835px;">
			<h5 class="card-header">교수목록</h5>
			<div class="card-body">
			<c:forEach var="teaVO" items="${teaList }">
				<button type="button" class="btn btn-outline-secondary col-12 btnSelTea" id="${teaVO.teaNum }">${teaVO.teaNmKor } 교수</button><br/><br/>
			</c:forEach>
			<button type="button" class="btn btn-outline-secondary col-12 btnSelTea" id="200102">음두헌 교수</button><br/><br/>
			<button type="button" class="btn btn-outline-secondary col-12 btnSelTea" id="200103">이재호 교수</button><br/><br/>
			<button type="button" class="btn btn-outline-secondary col-12 btnSelTea" id="200104">강지헌 교수</button><br/><br/>
			</div>
		</div>
	</div>
	<div class="col-9">
	   <div class="card" style="height: 835px;">
			<h5 class="card-header">&nbsp;&nbsp;&nbsp;교수 시간표</h5>
			<div class="col-md-12">
	     	<div class="row" style="margin-bottom: 0px;">
		     	<div id="" class="col-md-10 text-end" style="text-align: center; margin-top: 25px;">
		     		<h6 id="tableTitle"></h6>
		     	</div>
				<div class="col-md-2 demo-inline-spacing">
					<div class="text-end" style="margin-left: 20px; padding-left: 40px;">
						<nav aria-label="Page navigation">
							<ul class="pagination pagination-secondary">
							  <li class="page-item prev active">
							    <button id="prev" class="page-link"><i class="tf-icon bx bx-chevron-left"></i></button>
							  </li>
							  <li class="page-item next active">
							    <button id="next" class="page-link"><i class="tf-icon bx bx-chevron-right"></i></button>
							  </li>
							</ul>
						</nav>
					</div>
				</div>
        	</div>
        	</div>
	     <div class="card-body">
			<table class="table table-bordered" style="text-align: center; height: 100%;">
				<thead>
				  <tr>
				    <th style="width: 20%;">/</th>
				    <th class="date MON" id="1">월</th>
				    <th class="date TUE" id="2">화</th>
				    <th class="date WEN" id="3">수</th>
				    <th class="date THU" id="4">목</th>
				    <th class="date FRI" id="5">금</th>
				  </tr>
				</thead>
				<tbody>
				  <tr>
				    <th id="class1">09:00~09:50</th>
				    <td class="weekTable" id="MON1"></td>
				    <td class="weekTable" id="TUE1"></td>
				    <td class="weekTable" id="WEN1"></td>
				    <td class="weekTable" id="THU1"></td>
				    <td class="weekTable" id="FRI1"></td>
				  </tr>
				  <tr>
				    <th id="class2">10:00~10:50</th>
				    <td class="weekTable" id="MON2"></td>
				    <td class="weekTable" id="TUE2"></td>
				    <td class="weekTable" id="WEN2"></td>
				    <td class="weekTable" id="THU2"></td>
				    <td class="weekTable" id="FRI2"></td>
				  </tr>
				  <tr>
				    <th id="class3">11:00~11:50</th>
				    <td class="weekTable" id="MON3"></td>
				    <td class="weekTable" id="TUE3"></td>
				    <td class="weekTable" id="WEN3"></td>
				    <td class="weekTable" id="THU3"></td>
				    <td class="weekTable" id="FRI3"></td>
				  </tr>
				  <tr>
				    <th id="class4">12:00~12:50</th>
				    <td class="weekTable" id="MON4"></td>
				    <td class="weekTable" id="TUE4"></td>
				    <td class="weekTable" id="WEN4"></td>
				    <td class="weekTable" id="THU4"></td>
				    <td class="weekTable" id="FRI4"></td>
				  </tr>
				  <tr>
				    <th id="class5">13:00~13:50</th>
				    <td class="weekTable" id="MON5"></td>
				    <td class="weekTable" id="TUE5"></td>
				    <td class="weekTable" id="WEN5"></td>
				    <td class="weekTable" id="THU5"></td>
				    <td class="weekTable" id="FRI5"></td>
				  </tr>
				  <tr>
				    <th id="class6">14:00~14:50</th>
				    <td class="weekTable" id="MON6"></td>
				    <td class="weekTable" id="TUE6"></td>
				    <td class="weekTable" id="WEN6"></td>
				    <td class="weekTable" id="THU6"></td>
				    <td class="weekTable" id="FRI6"></td>
				  </tr>
				  <tr>
				    <th id="class7">15:00~15:50</th>
				    <td class="weekTable" id="MON7"></td>
				    <td class="weekTable" id="TUE7"></td>
				    <td class="weekTable" id="WEN7"></td>
				    <td class="weekTable" id="THU7"></td>
				    <td class="weekTable" id="FRI7"></td>
				  </tr>
				  <tr>
				    <th id="class8">16:00~16:50</th>
				    <td class="weekTable" id="MON8"></td>
				    <td class="weekTable" id="TUE8"></td>
				    <td class="weekTable" id="WEN8"></td>
				    <td class="weekTable" id="THU8"></td>
				    <td class="weekTable" id="FRI8"></td>
				  </tr>
				  <tr>
				    <th id="class9">17:00~17:50</th>
				    <td class="weekTable" id="MON9"></td>
				    <td class="weekTable" id="TUE9"></td>
				    <td class="weekTable" id="WEN9"></td>
				    <td class="weekTable" id="THU9"></td>
				    <td class="weekTable" id="FRI9"></td>
				  </tr>
				</tbody>
			</table>

	     </div>
	   </div>
	</div>

</div>

<div class="modal fade" id="insertConsult" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered modal-simple modal-add-new-cc">
		<div class="modal-content p-3 p-md-5">
			<div class="modal-body">
				<button type="button" class="btn-close btnCancel" data-bs-dismiss="modal" aria-label="Close"></button>
				<div class="row g-4">
					<h4 class="col-md-6">상담 신청</h4><hr/>
					
					<div class="row">
						<div class="col-md-6">
							<label for="teaNmKor" class="form-label">교수명</label>
							<input type="text" class="form-control" id="teaNmKor" aria-describedby="defaultFormControlHelp" disabled>
						</div>
						
						<div class="btn-group col-md-6 mt-4" role="group" aria-label="Basic radio toggle button group" style="height: 55%;">
							<input type="radio" class="btn-check" name="crType" id="btnradio1" checked="checked" autocomplete="off" value="0">
							<label class="btn btn-outline-primary" for="btnradio1">대면</label>
							<input type="radio" class="btn-check" name="crType" id="btnradio2" autocomplete="off" value="1">
							<label class="btn btn-outline-primary" for="btnradio2">비대면</label>
						</div>
					</div>
					
					<div class="col-md-6">
						<label for="teaNmKor" class="form-label">상담 일자</label>
						<input type="text" class="form-control" id="crDt" aria-describedby="defaultFormControlHelp" disabled>
					</div>
					
					<div class="col-md-6">
						<label for="teaNmKor" class="form-label">상담 시간</label>
						<div class="row">
							<div class="col-md-5">
								<input type="text" class="form-control" id="sTime" aria-describedby="defaultFormControlHelp" disabled>
							</div>
							<div class="col-md-1 mt-2">~</div>
							<div class="col-md-5">
								<input type="text" class="form-control" id="eTime" aria-describedby="defaultFormControlHelp" disabled>
							</div>
						</div>
					</div>
					
					<div class="col-md-12">
						<label class="form-label">상담 사유</label>
						<span class="col-form-label" id="comEmpty" style="color: red; display: none; padding: 0px;">상담 사유를 작성해주세요</span>
						<textarea class="form-control" id="crReason" rows="3" cols="" placeholder="상담 사유를 입력해주세요."></textarea>
					</div>
					
					<div class="col-md-12 text-center formButtons">
						<button type="button" class="btn btn-primary btnSubmit">신청</button>
						<button type="button" class="btn btn-primary me-sm-3 me-1 btnCancel" data-bs-dismiss="modal" aria-label="Close">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
let teaNum;
let teaNmKor;
let dateArr;
let timeCode;
let crDt;

$(".weekTable").on("click", function() {
	if(teaNum == null || teaNum == ''){
		Swal.fire({
			title: '교수를 선택해주세요.',
			showClass: {
				popup: 'animate__animated animate__bounceIn'
			},
			icon: 'warning',
			customClass: {
				confirmButton: 'btn btn-primary'
			},
			buttonsStyling: false
		});
		return;
	}
	if($(this).hasClass("timeDisAble")){
		Swal.fire({
			title: '이미 일정이 있습니다.<br/>다른 시간을 선택해 주세요',
			showClass: {
				popup: 'animate__animated animate__bounceIn'
			},
			icon: 'warning',
			customClass: {
				confirmButton: 'btn btn-primary'
			},
			buttonsStyling: false
		});
		return;
	}
	$("#comEmpty").css("display", "none");
	
	$("#teaNmKor").val(teaNmKor);
	
	timeCode = $(this).attr("id");
	crDt = timeCode.substr(0, 3);
	crDt = year + "/" + $("." + crDt).text();
	$("#crDt").val(crDt);
	crDt = crDt.substr(0, crDt.length - 3);
	
	let seTime = $("#class" + timeCode[3]).text();
	let sTime = seTime.split("~")[0];
	let eTime = seTime.split("~")[1];
	$("#sTime").val(sTime);
	$("#eTime").val(eTime);
	
	$("#insertConsult").modal("show");
});

$(".btnSelTea").on("click", function() {
	$(".btnSelTea").removeClass("active");
	$(this).addClass("active");
	teaNum = $(this).attr("id");
	teaNmKor = $(this).text().split(" ")[0];
	
	clearTable();
});

$(".btnSubmit").on("click", function() {
	if($("#crReason").val() == "" || $("#crReason").val() == null){
		$("#crReason").focus();
		$("#comEmpty").css("display", "inline");
		return;
	}
	
	let url = "/consult/appConsult";
	let data = {"teaNum" : teaNum,
				"timeCode" : timeCode,
				"crDt" : crDt,
				"crType" : $("input[name='crType']:checked").val(),
				"crReason" : $("#crReason").val()
				};
	
	fn_ajax(url, data, function(result) {
		Swal.fire({
			title: '상담 내역으로<br/>이동하시겠습니까?',
			showDenyButton: true,
			confirmButtonText: 'Yes',
			denyButtonText: 'No',
			customClass: {
				actions: 'my-actions',
				cancelButton: '',
				confirmButton: 'btn btn-primary',
				denyButton: 'btn btn-secondary',
			}
		}).then((result) => {
			if(result.isConfirmed){
				location.href="/consult/historyConsult";
			}else{
				clearTable();
			}
		});
	});
	
	clearModal();
	$("#insertConsult").modal("hide");
});

$(".btnCancel").on("click", function() {
	clearModal();
});

function clearModal() {
	$("#teaNmKor").val("");
	$("#crDt").val("");
	$("#sTime").val("");
	$("#eTime").val("");
	$("#btnradio1").click();
	$("#crReason").val("");
}

function clearTable() {
	$(".weekTable").text("");
	$(".weekTable").css("background", "none");
	$(".weekTable").removeClass("timeDisAble");

	let url = "/consult/getTimeTable";
	let data = {"teaNum" : teaNum};
	
	fn_ajax(url, data, function(result) {
		$.each(result, function(i, v) {
			$("#" + v.TIME_TCODE).text(v.SBJ_TITLE);
			$("#" + v.TIME_TCODE).css("background", "lightgray");
			$("#" + v.TIME_TCODE).addClass("timeDisAble");
		})
	});
	
	getConsultTime();
}

function getConsultTime() {
	let url = "/consult/getConsultTime";
	let data = {"teaNum" : teaNum};
	
	fn_ajax(url, data, function(result) {
		$.each(result, function(i, v) {
			if(dateArr.indexOf(v.CR_DT) > -1){
				$("#" + v.TIME_CODE).html("상담 예약<br/>(" + v.STU_NM + ")");
				$("#" + v.TIME_CODE).css("background", "#D2E1FF");
				$("#" + v.TIME_CODE).addClass("timeDisAble");
			}
		});
	});
}

function fn_ajax(url, data, fn) {
	$.ajax({
		url: url,
		data: data,
		type: "post",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(result) {
			fn(result);
		}
	});
}

<!-- 달력을 뽑는 script -->

let today = new Date();

let year = today.getFullYear(); // 년도
let month = today.getMonth() + 1;  // 월
let week = getWeek(new Date(today)); // 주
let date = today.getDate();  // 날짜
let day = today.getDay();  // 요일
let wfd = date;
let x = 1 - day;
	x = x * -1;
wfd = today.getDate() - x;

$("#tableTitle").text(month + "월 " + week + "번째주");


let tt = year + "/" + month + "/" + wfd;
	tt = new Date(tt);

dateArr = [];
for(let i = 1; i < 7; i++){

	let hm = new Date();
	hm.setDate(tt.getDate() + (i - 1));
	hm = new Date(hm);
	tttMonth = hm.getMonth() + 1;
	tttDate = hm.getDate();

	let ttd;
	if(i == 1){
		ttd = "(월)";
	}else if(i == 2){
		ttd = "(화)";
	}else if(i == 3){
		ttd = "(수)";
	}else if(i == 4){
		ttd = "(목)";
	}else if(i == 5){
		ttd = "(금)";
	}
	$("th[id='" + i + "']").text(tttMonth + "/" + tttDate + ttd);
	dateArr.push(tttMonth + "/" + tttDate);
}

$("#prev").on("click", function(){
	moveWeek('prev');
	clearTable();
});

$("#next").on("click", function(){
	moveWeek('next');
	clearTable();
});

function moveWeek(status){

	let th1 = $("th[id='1']").text();
	let aaa = year + "/" +  th1;
	aaa = new Date(aaa);


	let ptt = new Date(aaa);
	if(status == 'prev'){
		ptt.setDate(aaa.getDate() - 7);
	}else{
		ptt.setDate(aaa.getDate() + 7);
	}

	let nmonth = ptt.getMonth() + 1;  // 월
	let nweek = getWeek(new Date(ptt)); // 주
	$("#tableTitle").text(nmonth + "월 " + nweek + "번째주");

	dateArr = [];
	for(let i = 1; i < 7; i++){

		let ttt = new Date(ptt);
		ttt.setDate(ptt.getDate() + (i - 1));
		ttt = new Date(ttt);

		tttMonth = ttt.getMonth() + 1;
		tttDate = ttt.getDate();

		let ttd;
		if(i == 1){
			ttd = "(월)";
		}else if(i == 2){
			ttd = "(화)";
		}else if(i == 3){
			ttd = "(수)";
		}else if(i == 4){
			ttd = "(목)";
		}else if(i == 5){
			ttd = "(금)";
		}
		$("th[id='" + i + "']").text(tttMonth + "/" + tttDate + ttd);
		dateArr.push(tttMonth + "/" + tttDate);
	}
}

function getWeek(date){
	  const currentDate = date.getDate();
	  const firstDay = new Date(date.setDate(1)).getDay();
	  return Math.ceil((currentDate + firstDay) / 7);
};
</script>