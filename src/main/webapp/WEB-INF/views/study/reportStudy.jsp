<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
<style type="text/css">
.buttonDiv{
	text-align: right;
}
</style>
	
<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bxs-pencil page-icon"></i>
	<span class="fw-light">스터디 관리 / </span>신고 관리
</h4>
	
<div class="card">
	<div class="card-header"><h4>신고 리스트</h4></div>
	<div class="card-body">
		<table class="table table-bordered" id="studyTable">
			<thead class="table-active">
				<tr class="text-nowrap">
					<th>CODE.</th>
					<th>스터디명</th>
					<th>개설자</th>
					<th>누적신고(회)</th>
					<th class="noSort"></th>
					<th class="noSort"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="study" items="${studyList}">
					<tr>
						<td>${study.S_NUM }</td>
						<td>${study.S_NM }</td>
						<td>${study.STU_NM_KOR }</td>
						<td>${study.COUNT }</td>
						<td>
							<button type='button' id="${study.S_NUM }" class='btn btn-primary btnHistoryModal'
								data-bs-toggle="modal" data-bs-target="#historyModal">신고내역</button>
						</td>
						<td>
							<button type='button' id="${study.S_NUM }" class='btn btn-primary btnBan'>정지</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<br/>
<div class="card">
	<div class="card-header"><h4>정지된 스터디</h4></div>
	
	<div class="card-body">
		<table class="table table-bordered" id="banTable">
			<thead class="table-active">
				<tr class="text-nowrap">
					<th>CODE.</th>
					<th>스터디명</th>
					<th>개설자</th>
					<th>참여인원</th>
					<th class="noSort"></th>
					<th class="noSort"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="study" items="${banList}">
					<tr>
						<td>${study.S_NUM }</td>
						<td>${study.S_NM }</td>
						<td>${study.STU_NM_KOR }</td>
						<td>${study.COUNT }</td>
						<td>
							<button type='button' id="${study.S_NUM }" class='btn btn-primary btnHistoryModal'
								data-bs-toggle="modal" data-bs-target="#historyModal">신고내역</button>
						</td>
						<td>
							<button type='button' id="${study.S_NUM }" class='btn btn-primary btn_reportCancel'>취소</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<div class="modal fade" id="historyModal" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered modal-simple modal-add-new-cc">
		<div class="modal-content p-3 p-md-5">
			<div class="modal-body">
				<button type="button" class="btn-close invite-close" data-bs-dismiss="modal" aria-label="Close"></button>
				<div class="row g-3">
					<div class="col-md-12">
						<h4 class="col-md-12" id="modal_sNm"></h4>
					</div>
					<table class="table table-bordered2 scrolltbody" id="reasonTable">
						<thead class="table-active">
							<tr class="text-nowrap">
								<th>학번</th>
								<th>이름</th>
								<th>신고 사유</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
function lang_kor_paramEmpty(empty) {
	return {
	        "emptyTable" : empty,
	        "infoFiltered" : "(전체 _MAX_ 명 중 검색결과)",
	        "thousands" : ",",
	        "lengthMenu" : "_MENU_ 개씩 보기",
	        "loadingRecords" : "로딩중...",
	        "processing" : "처리중...",
	        "search" : "검색 : ",
	        "zeroRecords" : "검색된 스터디가 없습니다.",
	        "paginate" : {
	            "first" : "첫 페이지",
	            "last" : "마지막 페이지",
	            "next" : "다음",
	            "previous" : "이전"
	        },
	        "aria" : {
	            "sortAscending" : " :  오름차순 정렬",
	            "sortDescending" : " :  내림차순 정렬"
	        }
	};
}

$(function() {
	studyTable = $("#studyTable").DataTable({
		info: false,
		lengthMenu: [ 5, 10, 15, 20 ],
		columnDefs: [
			{ targets: 0, width: 30 },
			{ targets: 2, width: 70 },
			{ targets: 3, width: 30 },
			{ targets: 4, width: 100 },
			{ targets: 5, width: 70 }
		],
		order: [ [ 3, "desc" ] ],
		language : lang_kor_paramEmpty("신고된 스터디가 없습니다.")
	});
	
	banTable = $("#banTable").DataTable({
		info: false,
		lengthMenu: [ 5, 10, 15, 20 ],
		columnDefs: [
			{ targets: 0, width: 30 },
			{ targets: 2, width: 70 },
			{ targets: 3, width: 75 },
			{ targets: 4, width: 100 },
			{ targets: 5, width: 70 }
		],
		language : lang_kor_paramEmpty("정지된 스터디가 없습니다.")
	});

	noSort = $(".noSort");
	noSort.removeClass("sorting");
	
	reasonTable = $("#reasonTable");
	reasonTable.DataTable({
		info: false,
		paging: false
	});
	
});

$(document).on("click", ".btnBan", function() {
	let $_this = $(this);
	let sNum = $_this.attr("id");
	let data = {"sNum" : sNum, "sGrade" : -4};
	
	reportAjax(data, function(study) {
		studyTable.row($_this.parents("tr")).remove().draw();
		
		banTable.row.add([
			study.S_NUM, 
			study.S_NM, 
			study.STU_NM_KOR, 
			study.COUNT, 
			"<td><button type='button' id='" + study.S_NUM + "' class='btn btn-primary btnHistoryModal'data-bs-toggle='modal' data-bs-target='#historyModal'>신고내역</button></td>", 
			'<button type="button" id="' + study.S_NUM + '" class="btn btn-primary btn_reportCancel">취소</button>'
		]).draw();

		noSort.removeClass("sorting");
	});
});

$(document).on("click", ".btn_reportCancel", function() {
	let $_this = $(this);
	
	Swal.fire({
		title: "\"" + $_this.closest("tr").children().eq(1).text() + "\" 의 정지를 취소하시겠습니까?",
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
		if(result.isDenied){
			return;
		}
	});
	
	let history = false;
	Swal.fire({
		title: "해당 스터디의 신고 내역을 삭제하시겠습니까?",
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
			history = true;
		}
	});
	
	let sNum = $_this.attr("id");
	let data = {"sNum" : sNum, "sGrade" : 4, "history" : history};

	reportAjax(data, function(study) {
		banTable.row($_this.parents("tr")).remove().draw();
		
		let btnHistory = "";
		if(study.COUNT > 0){
			btnHistory = "<td><button type='button' id='" + study.S_NUM + "' class='btn btn-primary btnHistoryModal'data-bs-toggle='modal' data-bs-target='#historyModal'>신고내역</button></td>";
		}
		studyTable.row.add([
			study.S_NUM, 
			study.S_NM, 
			study.STU_NM_KOR, 
			study.COUNT, 
			btnHistory, 
			'<button type="button" id="' + study.S_NUM + '" class="btn btn-primary btnBan">정지</button>'
		]).draw();

		noSort.removeClass("sorting");
	});
});

$(document).on("click", ".btnHistoryModal", function() {
	let $_this = $(this);
	let sNum = $_this.attr("id");
	let sNm = $_this.closest("tr").children().eq(1).text();
	
	$("#modal_sNm").text(sNm + " 신고내역");
	
	reasonTable.DataTable().destroy();
	reasonTable.DataTable({
		ajax: {
			url: "/study/getReasonList",
			type: "post",
			data: {"sNum" : sNum},
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			async: false
		},
		columns: [
			{data : "STU_NUM"},
			{data : "STU_NM_KOR"},
			{data: "SRL_REASON"}
		],
		searching: false,
		ordering: false,
		info: false,
		paging: false
	});
});

function reportAjax(data, fn) {
	$.ajax({
		url: "/study/manageReportStudy",
		data: data,
		type: "post",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(result) {
			fn(result);	// result == studyMap
		}
	});
}
</script>