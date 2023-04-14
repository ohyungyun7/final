<%@page import="kr.or.ddit.vo.UserVO"%>
<%@page import="kr.or.ddit.vo.StudyVO"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 
	StudyVO studyVO = (StudyVO) session.getAttribute("studyVO");
	int sNum = studyVO.getsNum();
	int id = studyVO.getStuNum();
	UserVO userVO = (UserVO) session.getAttribute("userVO");
	String name = userVO.getName();
%>

<style type="text/css">
thead{
	text-align: center;
}
.card{
	overflow: auto;
}
.search-sel{
	width: 15%;
	display: inline;
}
.search-inp{
	width: 30%;
	display: inline;
}
.search-btn{
	display: inline;
}

.table-bordered{
	text-align: center;
}
.card-body{
	margin-top: 10px;
	padding-top: 0px;
}
textarea{
	resize: none;
	width: 100%;
	maxlength: 1000;
}

.scrolltbody {
    display: block;
    width: 700px;
    border-collapse: collapse;
}
.scrolltbody tbody {
    display: block;
    height: 400px;
    overflow: auto;
}
.dataTables_empty{
	width: 700px;
}

/* table.forJoin, table.forApp, table.forInvite{ */
/*  	width: 80% !important; */
/* } */
/* h5.tableHeader{ */
/* 	width: 80%; */
/* } */
thCenter table.dataTable thead th{
	text-align: center;
}

</style>

<h4 class="title" id="dropdown-icon-demo">
	<i class="bx bxs-pencil page-icon"></i>
	&nbsp;&nbsp;<%=studyVO.getsNm() %>
	<span class="mt-1" style="font-size: 0.9em; float: right;">메뉴</span>
	<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAkCAYAAADhAJiYAAAAAXNSR0IArs4c6QAAAJlJREFUWEftlcEKwCAMQ+ufb1++4cGRw2zEIrQQT2JnF19TbZZstGR6TIJYRURIhBgBFi/loQdOg8JxnR3Yi//C8AhJUMdZykMRf2zvFSGGziN0mdnotBsS4TrL78Ux5/ed2n5y2S4R6qUZYzaPlAxzLgmK/Gx7r9qeoStFSK89e+3TEWL+OxIvZeojBFhSERIhRoDF5SFG6AUGLBYl/5ufmwAAAABJRU5ErkJggg=="
		style="position: relative; bottom: 2px; padding: 0px; float: right;" id="menuTab" class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"/>
	<ul class="dropdown-menu">
		<li><a href="/study/myStudyList" class="dropdown-item d-flex align-items-center"><i class="bx bx-chevron-right scaleX-n1-rtl"></i>목록으로</a></li>
		<li><a href="/study/studyMain" class="dropdown-item d-flex align-items-center"><i class="bx bx-chevron-right scaleX-n1-rtl"></i>메인</a></li>
		<li><a href="/study/scheduleMain" class="dropdown-item d-flex align-items-center"><i class="bx bx-chevron-right scaleX-n1-rtl"></i>스터디 일정</a></li>
		<li><a href="/study/timeTableMain" class="dropdown-item d-flex align-items-center"><i class="bx bx-chevron-right scaleX-n1-rtl"></i>스케줄 비교</a></li>
		<li>
			<hr class="dropdown-divider">
		</li>
		<li><a href="javascript:void(0);" id="btnExit" class="dropdown-item d-flex align-items-center" style="color: red;"><i class="bx bx-chevron-right scaleX-n1-rtl"></i>스터디 나가기</a></li>
		<li>
			<a href="javascript:void(0);" class="dropdown-item d-flex align-items-center" style="color: red;"
				data-bs-toggle="modal" data-bs-target="#reportModal"><i class="bx bx-chevron-right scaleX-n1-rtl"></i>신고하고 나가기
			</a>
		</li>
	</ul>
</h4>

<div class="card">
	<div class="card-header"><h4>참여자</h4></div>
	
	<div class="card-body">
		<table class="table table-bordered forJoin thCenter">
			<thead class="table-active">
				<tr class="text-nowrap">
					<th>학번</th>
					<th>이름</th>
					<th>참여일자</th>
					<th class="forTheMaster" style="width: 20%;"></th>
				</tr>
			</thead>
			<tbody>
				<c:set var="stuNum" value="<%=studyVO.getStuNum() %>"/>
				<c:forEach var="student" items="${data}">
					<c:if test="${student.S_GRADE le 1}">
						<tr>
							<td>${student.STU_NUM }</td>
							<td>${student.STU_NM_KOR }<c:if test="${student.S_GRADE == 1 }">(방장)</c:if></td>
							<td><fmt:formatDate value="${student.S_DT}" pattern="yyyy.MM.dd"/></td>
							<td class="forTheMaster noSort">
								<c:if test="${student.STU_NUM != stuNum}">
									<button type="button" id="${student.STU_NUM}" class="btn btn-primary btnKick">내보내기</button>
								</c:if>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<br/>
		
<div class="card">
	<div class="card-header">
		<h4 style="display: inline-block;">초대 목록</h4>
		<button type="button" class="btn btn-primary btn-md" style="float: right;" id="btnInviteModal"
			data-bs-toggle="modal" data-bs-target="#inviteModal">초대하기</button>
	</div>

	<div class="card-body">
		<table class="table table-bordered forInvite thCenter">
			<thead class="table-active">
				<tr class="text-nowrap">
					<th>학번</th>
					<th>이름</th>
					<th>초대일자</th>
					<th class="" style="width: 20%;"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="student" items="${data}">
					<c:if test="${student.S_GRADE == 3}">
						<tr>
							<td>${student.STU_NUM }</td>
							<td>${student.STU_NM_KOR }</td>
							<td><fmt:formatDate value="${student.S_DT}" pattern="yyyy.MM.dd"/></td>
							<td class="forTheMaster noSort">
								<button type="button" id="${student.STU_NUM}" class="btn btn-primary btnDelete">초대취소</button>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<br/>

<div class="card">
	<div class="card-header"><h4>신청 목록</h4></div>

	<div class="card-body">
		<table class="table table-bordered forApp thCenter">
			<thead class="table-active">
				<tr class="text-nowrap">
					<th>학번</th>
					<th>이름</th>
					<th>신청일자</th>
					<th class="forTheMaster" style="width: 20%;"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="student" items="${data}">
					<c:if test="${student.S_GRADE == 2}">
						<tr>
							<td>${student.STU_NUM }</td>
							<td>${student.STU_NM_KOR }</td>
							<td><fmt:formatDate value="${student.S_DT}" pattern="yyyy.MM.dd"/></td>
							<td class="forTheMaster noSort">
								<button type="button" id="${student.STU_NUM}" class="btn btn-primary btnUpdate">수락</button>
								<button type="button" id="${student.STU_NUM}" class="btn btn-primary btnDelete">거절</button>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<div class="modal fade" id="inviteModal" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered modal-simple modal-add-new-cc">
		<div class="modal-content p-3 p-md-5">
			<div class="modal-body">
				<button type="button" class="btn-close invite-close" data-bs-dismiss="modal" aria-label="Close"></button>
				<div class="row g-3">
					<div class="col-md-12">
						<h4 class="col-md-2">초대</h4>
					</div>
					<table class="table table-bordered2 scrolltbody" id="modalTable">
						<thead class="table-active">
							<tr class="text-nowrap">
								<th>학번</th>
								<th>이름</th>
								<th class="noSort"></th>
							</tr>
						</thead>
<!-- 						<tbody> -->
<!-- 						</tbody> -->
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="reportModal" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered modal-simple modal-add-new-cc">
		<div class="modal-content p-3 p-md-5">
			<div class="modal-body">
				<button type="button" class="btn-close report-close" data-bs-dismiss="modal" aria-label="Close"></button>
				<div class="row g-3">
					<div class="col-md-12">
						<h4 class="col-md-2">신고</h4>
					</div>
					
					<span class="col-sm-10 col-form-label" id="comEmpty" style="color: red; display: none; padding: 0px; padding-left: 10px;">신고사유를 작성해주세요</span>
					
					<div class="col-sm-12">
						<textarea class="form-control" id="reason" name="reason" rows="3" cols="" placeholder="신고 사유를 작성해주세요." ></textarea>
					</div>
					
					<br/>
					<div class="col-md-12 text-center formButtons">
						<button type="button" id="btnReport" class="btn btn-primary me-sm-3 me-1">제출</button>
						<button type="reset" class="btn btn-label-secondary report-close" data-bs-dismiss="modal" aria-label="Close">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 채팅 -->
<jsp:include page="/WEB-INF/views/study/studyChat.jsp" />
<!-- 채팅 -->

<script>
let today = new Date();
let year = today.getFullYear();
let month = ('0' + (today.getMonth() + 1)).slice(-2);
let day = ('0' + today.getDate()).slice(-2);

let today_str = year + '.' + month  + '.' + day;

function lang_kor_paramEmpty(empty) {
	return {
	        "emptyTable" : empty,
	        "infoFiltered" : "(전체 _MAX_ 명 중 검색결과)",
	        "thousands" : ",",
	        "loadingRecords" : "로딩중...",
	        "processing" : "처리중...",
	        "search" : "검색 : ",
	        "zeroRecords" : "검색된 데이터가 없습니다.",
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

$(function () {
	// 테이블 세팅
	joinTable = $(".forJoin").DataTable({
		displayLength: 5,
		lengthChange: false,
		info: false,
		searching: false
		<%
		if (studyVO.getsGrade() != 1) {
		%>
			,columnDefs: [
				{ targets: 3, visible: false },
			]
		<%
		}
		%>
		,order: [ [ 3, "asc" ] ],
		language : lang_kor_paramEmpty("참여자가 없습니다.")
	});
	inviteTable = $(".forInvite").DataTable({
		displayLength: 5,
		lengthChange: false,
		info: false,
		searching: false,
		language : lang_kor_paramEmpty("초대 목록이 없습니다.")
	});
	appTable = $(".forApp").DataTable({
		displayLength: 5,
		lengthChange: false,
		info: false,
		searching: false,
		language : lang_kor_paramEmpty("신청 목록이 없습니다.")
		<%
		if(studyVO.getsGrade() != 1){
			%>
			,columnDefs: [
				{ targets: 3, visible: false }
			]
			<%
		}
		%>
	});
	modalTable = $("#modalTable");
	modalTable.DataTable({
		info: false,
		paging: false,
		language : lang_kor_paramEmpty("초대 가능한 학생이 없습니다.")
	});
	settingDatatables();
});

// 나가기 버튼
$("#btnExit").on("click", function() {
	Swal.fire({
		title: "정말 \"<%=studyVO.getsNm() %>\"에서 나가시겠습니까?",
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
			location.href = "/study/exitStudy";
		}
	});
});

// 신고하고 나가기 버튼
$("#btnReport").on("click", function() {
	let target = $("#reason");
	
	if(target.val() == "" || target.val() == null){
		target.focus();
		$("#comEmpty").css("display", "inline-block");
		return;
	}
	
	Swal.fire({
		title: "정말" + isEndWithConsonant("<%=studyVO.getsNm() %>") + " 신고하고 나가시겠습니까?",
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
			location.href = "/study/reportStudy?srlReason=" + target.val();
		}
	});
	
});

// 내보내기 버튼
$(document).on("click", ".btnKick", function() {
	let $_this = $(this);
	let stuNum = $_this.attr("id");
	
	let p_tr = $_this.closest("tr");
	let stuNm = p_tr.children().eq(1).text();
	
	Swal.fire({
		title: stuNm + "(" + stuNum + ")님을 스터디에서 내보내시겠습니까?",
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
	
	let data = {"sNum" : parseInt("<%=studyVO.getsNum()%>"), 
				"stuNum" : stuNum,
				"sGrade" : -1};

	ajaxFunction(data, function() {
		joinTable.row($_this.parents("tr")).remove().draw();
		settingDatatables();
	});
});

// 초대 취소, 신청 거절
$(document).on("click", ".btnDelete", function() {
	let $_this = $(this);
	let stuNum = $_this.attr("id");
	
	let data = {"sNum" : parseInt("<%=studyVO.getsNum()%>"), 
				"stuNum" : stuNum,
				"sGrade" : -1};

	let table = $_this.closest("table");
	
	ajaxFunction(data, function() {
		if(table.hasClass("forInvite")){
			inviteTable.row($_this.parents("tr")).remove().draw();
		}
		
		if(table.hasClass("forApp")){
			appTable.row($_this.parents("tr")).remove().draw();
		}
		
		settingDatatables()
	});
});

// 신청 수락
$(".btnUpdate").on("click", function() {
	let $_this = $(this);
	let stuNum = $_this.attr("id");
	
	let data = {"sNum" : parseInt("<%=studyVO.getsNum()%>"), 
				"stuNum" : stuNum,
				"sGrade" : 0};

	ajaxFunction(data, function() {
		let p_tr = $_this.closest("tr");
		let p_tbody = p_tr.closest("tbody");
		let stuNmKor = p_tr.children().eq(1).text();
		
		appTable.row($_this.parents("tr")).remove().draw();
		
		joinTable.row.add([stuNum, stuNmKor, today_str, '<button type="button" id="' + stuNum + '" class="btn btn-primary btnKick">내보내기</button>']).draw();
		settingDatatables();
	});
});

// 초대
$(document).on("click", ".btnInvite", function() {
	let target = $(this).parent();
	target.html("<span style='color: red;'>초대중</span>");
	
	let stuNum = target.prev().prev().text();
	let stuNmKor = target.prev().text();
	let data = {"sNum" : parseInt("<%=studyVO.getsNum()%>"),
				"stuNum" : stuNum, 
				"sNm": "<%=studyVO.getsNm() %>",
				"sGrade" : 3};
	
	ajaxFunction(data, function() {
		let target = $(".forInvite").find("tbody");
		inviteTable.row.add([stuNum, stuNmKor, today_str, '<button type="button" id="' + stuNum + '" class="btn btn-primary btnDelete">초대취소</button>']).draw();
		settingDatatables()
	});
});


function ajaxFunction(data, fn) {
	$.ajax({
		url: "/study/modiStudyGrade",
		data: data,
		type: "post",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(result) {
			if(result == 1){ fn() }
		}
	});
}

// 초대 모달 오픈
$("#btnInviteModal").on("click", function() {
	modalTable.DataTable().destroy();
	modalTable.DataTable({
		ajax: {
			url: "/study/inviteList",
			type: "get",
			async: false
		},
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		columns: [
			{data : "STU_NUM"},
			{data : "STU_NM_KOR"},
			{data: "button"}
		],
		info: false,
		paging: false,
		language : lang_kor_paramEmpty("초대 가능한 학생이 없습니다.")
	});
	
	let thead = modalTable.find("thead");
	thead.find("tr").children().css("width", "315px");
	thead.find("tr").children().eq(2).css("width", "90px");
	thead.find("tr").children().eq(2).removeClass("sorting");
	
	let tbody = thead.next().children();
	for(var i = 0; i < tbody.length; i++){
		tbody.eq(i).children().css("width", "315px");
		tbody.eq(i).children().eq(2).css("width", "90px");
	}
});

$(".invite-close").on("click", function() {
	$("#modalTable_filter").find("input[type='search']").val("");
});

$(".report-close").on("click", function() {
	$("#reason").val("");
});

function settingDatatables(){
	$(".noSort").removeClass("sorting");
// 	$(".dataTables_empty").text("목록이 없습니다");
}

//맨 마지막 글자에 받침이 있는지 찾아서 있다면 true, 없다면 false 를 반환
function isEndWithConsonant(korStr) {
    const finalChrCode = korStr.charCodeAt(korStr.length - 1)
    // 0 = 받침 없음, 그 외 = 받침 있음
    const finalConsonantCode = (finalChrCode - 44032) % 28
    return "\"" + korStr + "\"" + (finalConsonantCode !== 0)? '을':'를';
}
</script>

<!-- <script type="text/javascript" src="/resources/js/studyChat.js"></script> -->