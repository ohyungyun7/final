<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix ="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@page import="org.apache.catalina.Session"%>
<style>
/* #selectBldg #selectRoom {min-height: 150px; max-height: 150px; overflow-y: auto;} */
</style>

<h4 class="title fw-bold py-3 mb-2 categoryBar">
   <i class="bx bx-buildings page-icon"></i>
   <span class="fw-light">시설 / </span>시설 예약
</h4>

<div class="card mb-5">
	<div class="card-body">
		<div class="row">
			<!-- 건물 검색 -->
			<div class="col-md-9">
				<div class="row">
					<label class="col-sm-9 col-form-label text-sm-end" for="slTarget_10">건물</label>
					<div class="col-sm-3">
						<div class="select2-primary border-0 shadow-none flex-grow-1 mx-2">
							<select class="select2 select-email-contacts form-select" id="selectBldg" name="selectBldg" multiple="multiple" onchange="bldgChange(this)">
									<c:forEach var="bldgVO" items="${bldgList}" varStatus="i">
										<option value="${bldgVO.buildingCode}" name="${bldgVO.buildingName}" >${bldgVO.buildingName}</option>
									</c:forEach>
							</select>
						</div>
					</div>
				</div>
			</div>
			<!-- 건물 검색 끝 -->
			<!-- 시설 검색 -->
			<div class="col-md-3">
				<div class="row">
					<label class="col-sm-3 col-form-label text-sm-end" for="slTarget_10">시설명</label>
					<div class="col-sm-9">
						<div class="select2-primary border-0 shadow-none flex-grow-1 mx-2">
							<select class="select2 select-email-contacts form-select" id="selectRoom" name="selectRoom" multiple="multiple">
									<c:forEach var="roomVO" items="${roomList}" varStatus="i">
										<option value="${roomVO.roomLect}" name="${roomVO.roomLect}" >${roomVO.roomLect}</option>
									</c:forEach>
							</select>
						</div>
					</div>
				</div>
			</div>
			<!-- 시설검색 끝 -->
		</div>
	</div>
</div>


<c:set var="i" value="0" />
<c:set var="j" value="4" />
<div class="">
	<c:forEach var="roomVO" items="${roomList}" varStatus="index">
		<c:if test="${i%j == 0 }">
	    	<div class="row mb-5">
	    </c:if>
			  <div class="col-md-2 col-lg-3 mb-3">
			    <div class="card">
			  	  <input type="hidden" id="roomCode" class="roomCode" value="${roomVO.roomCode }" />
			      <img class="card-img-top" src="/resources/images/대강의실.jpg" alt="Card image cap">
			      <div class="card-body">
			        <h5 class="card-title" id="roomName">${roomVO.roomLect }</h5>
			        <p class="card-text" id="">
			         	<span>위치한 건물 : </span><b id="bldg">${roomVO.buildingName }</b>
			        </p>
			        <p class="card-text" id="">
			          	<span>수용 정원 : </span><b id="capactity">${roomVO.roomCapacity }</b>
			        </p>
			        <a class="dropdown-item btnTimeTable" href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#timeModal"><i class='bx bx-calendar-check'></i> 강의실/시간 선택</a>
			      </div>
			    </div>
			  </div>
		<c:if test="${i%j == j-1 }">
	    	</div>
	    </c:if>
	    <c:set var="i" value="${i+1 }" />
	</c:forEach>
</div>	
<div class="h-px-300"></div>

<div class="modal fade" id="timeModal" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-xl modal-dialog-centered1 modal-simple modal-add-new-cc">
		<div class="modal-content p-3 p-md-5" style="min-height: 110%; position: relative; top: -20px;">
			<div class="modal-body">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				<form id="timeForm" method="post" action="/enroll/insertTime" onsubmit="return checkTime()">
					<sec:csrfInput/>
					<input type="hidden" name="roomNum" id="roomNum_time" /> 
					<input type="hidden" name="sel_times" id="sel_times" />
					<div class="row g-3">
						<div class="col-md-12 text-end formButtons">
							<button type="button" class="btn btn-label-secondary" id="btnAuto">자동채우기</button>
							<button type="button" class="btn btn-primary timeTable_btnModi">수정</button>
							<button type="submit" class="btn btn-primary timeTable_btnSubmit">등록</button>
							<button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">취소</button>
						</div>
						
						<h5 class="col-md-12">강의실/시간 선택</h5>
						<hr />
						
						<div class="innerCard">
							<div class="row g-3">
								<div class="col-md-6">
									<div class="row">
										<label class="col-sm-2 col-form-label text-sm-end" for="sbjTitle_timeT">강의명</label>
										<div class="col-sm-10">
											<input type="text" id="sbjTitle_timeT" class="form-control" disabled />
										</div>
									</div>
								</div>
								<div class="col-md-6"></div>
								
								<div class="col-md-3">
									<div class="row">
										<label class="col-sm-4 col-form-label text-sm-end" for="sbjGrade_timeT">건물</label>
										<div class="col-sm-8">
											<input type="text" id="sbjGrade_timeT" class="form-control" disabled />
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="row">
										<label class="col-sm-4 col-form-label text-sm-end" for="deptNum_timeT">층</label>
										<div class="col-sm-8">
											<input type="text" id="deptNum_timeT" class="form-control" disabled />
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="row">
										<label class="col-sm-4 col-form-label text-sm-end" for="sbjPersonnel_timeT">정원</label>
										<div class="col-sm-8">
											<input type="text" id="sbjPersonnel_timeT" class="form-control" disabled />
										</div>
									</div>
								</div>
							</div>
						</div>
						
						
						<div class="col-md-7">
							<table class="table table-bordered timeTable">
								<thead class="table-active">
									<tr class="text-nowrap">
										<th class="timeTh-header"></th>
										<th>월</th>
										<th>화</th>
										<th>수</th>
										<th>목</th>
										<th>금</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1교시<br/>09:00~09:50</td>
										<td id="MON1" class="timeTable_td 월"></td>
										<td id="TUE1" class="timeTable_td 화"></td>
										<td id="WEN1" class="timeTable_td 수"></td>
										<td id="THU1" class="timeTable_td 목"></td>
										<td id="FRI1" class="timeTable_td 금"></td>
									</tr>
									<tr>
										<td>2교시<br/>10:00~10:50</td>
										<td id="MON2" class="timeTable_td 월"></td>
										<td id="TUE2" class="timeTable_td 화"></td>
										<td id="WEN2" class="timeTable_td 수"></td>
										<td id="THU2" class="timeTable_td 목"></td>
										<td id="FRI2" class="timeTable_td 금"></td>
									</tr>
									<tr>
										<td>3교시<br/>11:00~11:50</td>
										<td id="MON3" class="timeTable_td 월"></td>
										<td id="TUE3" class="timeTable_td 화"></td>
										<td id="WEN3" class="timeTable_td 수"></td>
										<td id="THU3" class="timeTable_td 목"></td>
										<td id="FRI3" class="timeTable_td 금"></td>
									</tr>
									<tr>
										<td>4교시<br/>12:00~12:50</td>
										<td id="MON4" class="timeTable_td 월"></td>
										<td id="TUE4" class="timeTable_td 화"></td>
										<td id="WEN4" class="timeTable_td 수"></td>
										<td id="THU4" class="timeTable_td 목"></td>
										<td id="FRI4" class="timeTable_td 금"></td>
									</tr>
									<tr>
										<td>5교시<br/>13:00~13:50</td>
										<td id="MON5" class="timeTable_td 월"></td>
										<td id="TUE5" class="timeTable_td 화"></td>
										<td id="WEN5" class="timeTable_td 수"></td>
										<td id="THU5" class="timeTable_td 목"></td>
										<td id="FRI5" class="timeTable_td 금"></td>
									</tr>
									<tr>
										<td>6교시<br/>14:00~14:50</td>
										<td id="MON6" class="timeTable_td 월"></td>
										<td id="TUE6" class="timeTable_td 화"></td>
										<td id="WEN6" class="timeTable_td 수"></td>
										<td id="THU6" class="timeTable_td 목"></td>
										<td id="FRI6" class="timeTable_td 금"></td>
									</tr>
									<tr>
										<td>7교시<br/>15:00~15:50</td>
										<td id="MON7" class="timeTable_td 월"></td>
										<td id="TUE7" class="timeTable_td 화"></td>
										<td id="WEN7" class="timeTable_td 수"></td>
										<td id="THU7" class="timeTable_td 목"></td>
										<td id="FRI7" class="timeTable_td 금"></td>
									</tr>
									<tr>
										<td>8교시<br/>16:00~16:50</td>
										<td id="MON8" class="timeTable_td 월"></td>
										<td id="TUE8" class="timeTable_td 화"></td>
										<td id="WEN8" class="timeTable_td 수"></td>
										<td id="THU8" class="timeTable_td 목"></td>
										<td id="FRI8" class="timeTable_td 금"></td>
									</tr>
									<tr>
										<td>9교시<br/>17:00~17:50</td>
										<td id="MON9" class="timeTable_td 월"></td>
										<td id="TUE9" class="timeTable_td 화"></td>
										<td id="WEN9" class="timeTable_td 수"></td>
										<td id="THU9" class="timeTable_td 목"></td>
										<td id="FRI9" class="timeTable_td 금"></td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<div class="col-md-5">
							<div class="border-box">
								<div class="container" id="selected_time" style="height: 85%; word-break:break-all;"></div>
							</div>
							<br/>
							<div class="col-md-12 text-center formButtons">
								<button type="button" class="btn btn-primary timeTable_btnClear" style="display: none;">초기화</button>
								<button type="button" class="btn btn-primary me-sm-3 me-1 timeTable_btnModi">수정</button>
								<button type="submit" class="btn btn-primary me-sm-3 me-1 timeTable_btnSubmit">등록</button>
								<button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">취소</button>
							</div>
						</div>
						
					</div>
					
				</form>
			</div>
		</div>
	</div>
</div>

<script>
$(function(){
	 $('#selectBldg').select2();
	 $('#selectRoom').select2();
// 	 $("#buildingCode").on("change", buildingChange);
});
//----------------------------------------------------------------
//강의실/시간 선택 모달창 오픈시
//이미 선택한 시간이 있다면 가져온다.
$(".btnTimeTable").on("click", function() {
	// 모달 창 초기화
	$("#timeForm")[0].reset();
	$("#selected_time").empty();
	$(".timeTable_btnClear").css("display", "none");
	
	let table_tdArr = [];
	table_tdArr = $(".timeTable_td");
	for(var i = 0; i < table_tdArr.length; i++){
		table_tdArr[i].innerText = "";
		table_tdArr[i].style.background = "none";
		table_tdArr[i].classList.remove('timeDisAble', 'selTime');
	}
	
	// 선택한 과목번호 세팅
	let trTags = $(this).parents().siblings("#roomCode");
	let roomCode = trTags.val();
	$("#roomNum_time").val(roomCode);
	let title = $("#roomName");
	let bldg = $("#bldg");
	let capactity = $("#capactity");

	// 강의 정보들 담아주기
	trTags = trTags.next();
	$("#sbjTitle_timeT").val(title.text());
	trTags = trTags.next();
	$("#sbjGrade_timeT").val(bldg.text().trim());
	trTags = trTags.next();
	$("#sbjRecode_timeT").val();
	trTags = trTags.next();
	$("#sbjPersonnel_timeT").val(capactity.text());
	trTags = trTags.next();
	$("#deptNum_timeT").val(trTags.text().replace(/\s+/g, ""));
	
// 	$.ajax({
// 		url: "/enroll/getTimeData",
// 		type: "post",
// 		data: {"roomNum" : roomNum},
// 		dataType: "json",
// 		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
//          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
//      },
// 		success: function(result) {
// 			timeData = result;
			
// 			if(timeData.length > 1){ // 이미 시간을 정했다면
// 				time_flag = true;
				
// 				// div에 시간 띄우기
// 				let str = "";
// 				$.each(result, function(i, v) {
// 					let $_day = $("#" + v.TIME_TCODE).attr("class").split(" ")[1];
// 					let $_time = $("#" + v.TIME_TCODE).closest("tr").children().eq(0).html().replace("<br>", " ");
					
// 					str += "<p id='" + v.BUILDING_CODE + "-" + v.ROOM_CODE  + "-" + v.TIME_TCODE + "'>";
// 					str += v.BUILDING_NAME + " " + v.ROOM_LECT + " " + $_day + " " + $_time + "</p>";
// 				});
// 				$("#selected_time").append(str);
				
// 				// 건물, 강의실 change 이벤트
// 				$("#buildingCode").on("change", buildingChange);
// 				$("#roomCode").on("change", roomChange);
// 				// 테이블 관련 이벤트 제거
// 				$(".timeTable_td").off();
// 				// select태그 사용 불가
// //				$("#buildingCode").attr("disabled", "true");
// //				$("#roomCode").attr("disabled", "true");
// 				// 등록버튼 > 수정버튼
// 				$(".timeTable_btnModi").css("display", "inline-block");
// 				$(".timeTable_btnSubmit").css("display", "none");
// 			}else{ // 아직 시간을 정하지 않았다면
// 				time_flag = false;

// 				// 이벤트 추가
// 				$("#buildingCode").on("change", buildingChange);
// 				$("#roomCode").on("change", roomChange);
// 				$(".timeTable_td").on("mouseover", tdMouseOver);
// 				$(".timeTable_td").on("mouseout", tdMouseOut);
// 				$(".timeTable_td").on("click", tdClick);
// 				// select태그 사용 가능
// //				$("#buildingCode").removeAttr("disabled");
// //				$("#roomCode").removeAttr("disabled");
// 				// 수정버튼 > 등록버튼
// 				$(".timeTable_btnModi").css("display", "none");
// 				$(".timeTable_btnSubmit").css("display", "inline-block");
// 			}
			
// 			timeTable_btnClick();
// 		}
// 	}); // ajax 끝
});

function bldgChange(e){
	const values = [];
	const texts = [];
	
	// options에서 selected 된 element 찾기
	for(let i=0; i < e.options.length; i++) {
	  const option = e.options[i];
	  if(option.selected) {
	    values.push(option.value);
	    texts.push(option.text);
		}
	};
	// 선택된 데이터 출력
	
	$.ajax({
		url: "/room/selectRoomList",
		type: "post",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
     },
		data: {"bldgCode" : values},
		success: function(result) {
// 			let str = "";
// 			str = '<optgroup label="'+ texts[i] +'">';
// 			$.each(result, function(i, v) {
// 				str += "<option>강의실을 선택하세요</option>";
// 				str += "<option value='" + v.roomLect + "'>" + v.roomLect + "</option>";
// 			});
// 			str += "</optgroup>";
// 			$("#selectRoom").html(str);
			
// 			if(time_flag){
// 				$("#roomCode").val(timeData[timeData.length -1].ROOM_CODE);
// 				roomChange();
// 			} // if문 끝
		}
	}); // ajax 끝

}

//강의실 선택 시 시간표 출력
//$("#roomCode").on("change", function() {
function roomChange() {
	let roomCode = $("#roomCode").val();
	
	$.ajax({
		url: "/enroll/getTimeTable",
		type: "post",
		data: {"roomCode" : roomCode},
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
     },
		success: function(result) {
			// clear table
			let tdArr = document.querySelectorAll(".timeTable_td");
			for(var i = 0; i < tdArr.length; i++){
				tdArr[i].innerText = "";
				$(tdArr[i]).css("background", "none");
				$(tdArr[i]).removeClass("timeDisAble");
				$(tdArr[i]).removeClass("selTime");
			}
			
			$.each(result, function(i, v) {
				let title = v.sbjTitle;
				$.each(v.timeTcodeList, function(j, w) {
					$("#" + w.timeTcode).text(title);
					$("#" + w.timeTcode).css("background", "lightgray");
					$("#" + w.timeTcode).addClass("timeDisAble");
				});
			}); // $.each 끝

			let sel_child = $("#selected_time").children();
			
			for(var i = 0; i < sel_child.length; i++){
				let child_id = sel_child.eq(i).attr("id");
				
				if($("#roomCode").val() == child_id.split("-")[1]){
					$("#" + child_id.split("-")[2]).css("background", "lightblue");
					$("#" + child_id.split("-")[2]).addClass("selTime");
				}
			}
			
		}
	}); // ajax 끝
}

//timeTable 마우스 이벤트 ----------------------------------
function tdMouseOver() {
	if(!($(this).hasClass("timeDisAble") || $(this).hasClass("selTime"))){
		$(this).css("background", "rgb(236, 238, 241)");
		$(this).addClass("mouseover");
	}
}
function tdMouseOut() {
	if($(this).hasClass("mouseover")){
		$(this).removeClass("mouseover");
		if(!$(this).hasClass("selTime")){
			$(this).css("background", "none");
		}
	}
}

//timeTable에서 시간 선택시
function tdClick() {
	if($("#buildingCode").val() == '건물을 선택하세요'){
		Swal.fire({
			title: '건물을 먼저 선택해주세요.',
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
	if($("#roomCode").val() == "강의실을 선택하세요"){
		Swal.fire({
			title: '강의실을 먼저 선택해주세요.',
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
	
	if(!$(this).hasClass("timeDisAble")){
		// code값 - DB용
		let $_buildingCode = $("#buildingCode").val();
		let $_roomCode = $("#roomCode").val();
		let $_timeCode = $(this).attr("id");
		// name값 - 출력용
		let $_buildingName = $("#buildingCode option:checked").text();
		let $_roomName = $("#roomCode option:checked").text();
		let $_day = $(this).attr("class").split(" ")[1];
		let $_time = $(this).closest("tr").children().eq(0).html().replace("<br>", " ");
		
		let $_id = $_buildingCode + "-" + $_roomCode + "-" + $_timeCode;
		
		if($(this).hasClass("selTime")){
			$(this).css("background", "none");
			$(this).removeClass("selTime");
			
			$("#selected_time").find("#" + $_id).remove();
		}else{
			$(this).css("background", "skyblue");
			$(this).addClass("selTime");
			
			let str = "<p id='" + $_id + "'>" + $_buildingName + " " + $_roomName + " " + $_day + " " + $_time + "</p>";
			$("#selected_time").append(str);
		}
	}
}

//timeTable submit
function checkTime() {
	let selTimeArr = $("#selected_time").children();
	
	if(selTimeArr.length < 2){
		Swal.fire({
			title: '최소 2시간을 선택해야 합니다.',
			showClass: {
				popup: 'animate__animated animate__bounceIn'
			},
			icon: 'warning',
			customClass: {
				confirmButton: 'btn btn-primary'
			},
			buttonsStyling: false
		});
		return false;
	}
	
	let timeVal = "";
	for(var i = 0; i < selTimeArr.length; i++){
		timeVal += selTimeArr.eq(i).attr("id") + ", ";
	}
	
	$("#sel_times").val(timeVal);
}

//강의실, 시간 선택 수정
$(".timeTable_btnModi").on("click", function() {
	// 버튼 변경
	$(".timeTable_btnClear").css("display", "inline-block");
	$(".timeTable_btnSubmit").css("display", "inline-block");
	$(".timeTable_btnModi").css("display", "none");
	// 이벤트 추가
	$(".timeTable_td").on("mouseover", tdMouseOver);
	$(".timeTable_td").on("mouseout", tdMouseOut);
	$(".timeTable_td").on("click", tdClick);
	$(".selTime").removeClass("timeDisAble");
	$(".selTime").text("");
});

//초기화 버튼
$(".timeTable_btnClear").on("click", function() {
	let table_tdArr = [];
	table_tdArr = $(".timeTable_td");
	for(var i = 0; i < table_tdArr.length; i++){
		if($(table_tdArr[i]).hasClass("selTime")){
			table_tdArr[i].innerText = "";
			table_tdArr[i].style.background = "none";
			table_tdArr[i].classList.remove('selTime');
		}
	}
	
	$("#selected_time").empty();
});
</script>