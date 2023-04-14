<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ page import="kr.or.ddit.vo.UserVO"%>
<html lang="en"	class="light-style layout-navbar-fixed layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="/resources/sneat/assets/" data-template="vertical-menu-template">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">

<title>study</title>

<meta name="description"	content="Most Powerful &amp; Comprehensive Bootstrap 5 HTML Admin Dashboard Template built for developers!">
<meta name="keywords"	content="dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5">
<!-- Canonical SEO -->
<link rel="canonical"	href="https://themeselection.com/item/sneat-bootstrap-html-admin-template/">
<!-- Google Tag Manager (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
  new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
  j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
  'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
  })(window,document,'script','dataLayer','GTM-5DDHKGP');</script>
<!-- End Google Tag Manager -->

<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="/resources/sneat/assets/img/favicon/favicon.ico">
<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
<link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&amp;display=swap" rel="stylesheet">
<!-- Icons -->
<link rel="stylesheet" href="/resources/sneat/assets/vendor/fonts/boxicons.css">
<link rel="stylesheet" href="/resources/sneat/assets/vendor/fonts/fontawesome.css">
<link rel="stylesheet" href="/resources/sneat/assets/vendor/fonts/flag-icons.css">
<!-- Core CSS -->
<link rel="stylesheet" href="/resources/sneat/assets/vendor/css/rtl/core.css" class="template-customizer-core-css" />
<link rel="stylesheet" href="/resources/sneat/assets/vendor/css/rtl/theme-default.css" class="template-customizer-theme-css" />
<link rel="stylesheet" href="/resources/sneat/assets/css/demo.css">
<!-- Row Group CSS -->
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/datatables-rowgroup-bs5/rowgroup.bootstrap5.css">
<!-- Form Validation -->
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/formvalidation/dist/css/formValidation.min.css">
<!-- Vendors CSS -->
<link rel="stylesheet"	href="/resources/sneat/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet"	href="/resources/sneat/assets/vendor/libs/typeahead-js/typeahead.css">
<link rel="stylesheet"	href="/resources/sneat/assets/vendor/libs/select2/select2.css">
<!-- Editor -->
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/quill/typography.css" />
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/quill/editor.css">

<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/datatables-bs5/datatables.bootstrap5.css">
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css">
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/datatables-checkboxes-jquery/datatables.checkboxes.css">
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/datatables-buttons-bs5/buttons.bootstrap5.css">
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/flatpickr/flatpickr.css">

<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/resources/sneat/assets/vendor/libs/select2/select2.js"></script>
<script src="/resources/js/jquery-3.6.0.js"></script>

<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/tagify/tagify.css" />
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/bootstrap-select/bootstrap-select.css" />

<!-- sweetalert2 -->
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/animate-css/animate.css" />
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/sweetalert2/sweetalert2.css" />

<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">

<script src="/resources/sneat/assets/vendor/js/helpers.js"></script>

<script src="/resources/sneat/assets/js/config.js"></script>

<link rel="stylesheet" type="text/css"	
			href="/resources/sneat/assets/vendor/css/rtl/core.css"	class="template-customizer-core-css">
<link rel="stylesheet" type="text/css"	
			href="/resources/sneat/assets/vendor/css/rtl/theme-default.css"	class="template-customizer-theme-css">
</head>

<style type="text/css">
/* .layout-navbar-fixed .layout-navbar{ */
/* 	position: static; */
/* } */
/* .layout-navbar.navbar-detached{ */
/* 	margin: 0px; */
/* 	margin-left: 20px; */
/* } */
.layout-navbar-fixed .layout-navbar.navbar-detached{
	width: calc(80% - calc(1.625rem * 2) - 16.25rem);
}
.card .row{
	margin-top: 20px;
}
#search{
	margin-left: 10px;
}
.scrolltbody {
    display: block;
    width: 700px;
    border-collapse: collapse;
}
.scrolltbody tbody {
    display: block;
    height: 200px;
    overflow: auto;
}
.dataTables_empty{
	width: 700px;
}
body{
	font-family:'Noto Sans KR', sans-serif;
}
body *{
	font-size: 19px;
}
</style>

<body>

<div class="card" style="margin: 10px; min-height: 98%;">
	<div class="card-body">

		<div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
			
			<div class="app-brand demo">
			    <a href="#" class="app-brand-link">
					<span class="app-brand-logo demo">
						<img class="logo-picture" src="/resources/images/logo2.png" alt="siksik cu logo" style="width: 50;">
					</span>
			      <span class="app-brand-text demo menu-text fw-bolder ms-2" style="font-size: 2.75rem;">스터디</span>
			    </a>
			</div>
			
			<input id="search" class="form-control form-control-lg" type="text" placeholder="스터디 검색">
			
			<div class="app-brand demo" style="margin-left: 20px;">
				<button type="button" class="btn btn-primary btn-lg" id="btnOpenModal"
					data-bs-toggle="modal" data-bs-target="#openModal">스터디 개설</button>
			</div>
			
		</div>
		
		<table class="table table-bordered" id="mainTable">
			<thead class="table-active">
				<tr class="text-nowrap">
					<th>No.</th>
					<th>스터디명</th>
					<th>참여인원</th>
					<th>개설자</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="study" items="${wholeStudyList}" varStatus="stat">
					<tr>
						<td>${stat.count }</td>
						<td>${study.S_NM }</td>
						<td>${study.COUNT }</td>
						<td>${study.STU_NM_KOR }</td>
						<td>
							<button type="button" id="${study.S_NUM}" class="btn btn-primary btnApplication">신청</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<div class="modal fade" id="openModal" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered modal-simple modal-add-new-cc">
		<div class="modal-content p-3 p-md-5">
			<div class="modal-body">
				<button type="button" class="btn-close invite-close" data-bs-dismiss="modal" aria-label="Close"></button>
				
				<h3>스터디 개설</h3><br/>
				
				<form action="/study/openStudy" method="post" onsubmit="return checkOpenForm()">
					<div class="row g-3">
						<div class="mb-3">
							<label for="sNm" class="form-label">스터디 명&nbsp;&nbsp;<span id="sNmSpan" style="color: red; display: none;">스터디명을 입력해주세요</span></label>
							<input id="sNm" class="form-control" name="sNm" type="text" placeholder="스터디명을 입력해주세요">
				        </div>
						
						<table class="table table-bordered2 scrolltbody" id="openList">
							<thead class="table-active">
								<tr class="text-nowrap">
									<th>학번</th>
									<th>이름</th>
									<th class="noSort"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="student" items="${studentList}">
									<tr>
										<td>${student.STU_NUM }</td>
										<td>${student.STU_NM_KOR }</td>
										<td>
											<button type="button" id="${student.STU_NUM}" class="btn btn-primary btnAdd">추가</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<hr style="border: 1px solid gray; opacity: 0.3;"/>
						<table class="table table-bordered2 scrolltbody" id="openInvite">
							<thead class="table-active">
								<tr class="text-nowrap">
									<th>학번</th>
									<th>이름</th>
									<th class="noSort"></th>
								</tr>
							</thead>
						</table>
						
						<input type="hidden" name="openStu" value="${stuNum}" />
						<input type="hidden" name="stuNumStr" id="stuNumStr" />
						
						<sec:csrfInput/>
						
						<div class="col-md-12 text-center">
							<button type="submit" class="btn btn-primary me-sm-3 me-1 appStudy">개설</button>
							<button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->
<script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>
<script src="/resources/sneat/assets/vendor/libs/popper/popper.js"></script>
<script src="/resources/sneat/assets/vendor/js/bootstrap.js"></script>
<script	src="/resources/sneat/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="/resources/sneat/assets/vendor/libs/hammer/hammer.js"></script>
<script src="/resources/sneat/assets/vendor/libs/i18n/i18n.js"></script>
<!-- <script src="/resources/sneat/assets/vendor/libs/typeahead-js/typeahead.js"></script> -->

<script src="/resources/sneat/assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Datatable -->
<!-- Vendors JS -->
<!-- Form Validation -->
<script src="/resources/sneat/assets/vendor/libs/formvalidation/dist/js/FormValidation.min.js"></script>
<script src="/resources/sneat/assets/vendor/libs/formvalidation/dist/js/plugins/Bootstrap5.min.js"></script>
<script src="/resources/sneat/assets/vendor/libs/formvalidation/dist/js/plugins/AutoFocus.min.js"></script>
<script src="/resources/sneat/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
<!-- Flat Picker -->
<script src="/resources/sneat/assets/vendor/libs/moment/moment.js"></script>
<script src="/resources/sneat/assets/vendor/libs/flatpickr/flatpickr.js"></script>
<!-- Main JS -->
<script src="/resources/sneat/assets/js/main.js"></script>

<!-- Page JS -->
<script src="/resources/sneat/assets/js/tables-datatables-extensions.js"></script>
<script src="/resources/sneat/assets/js/forms-editors.js"></script>
<script src="/resources/sneat/assets/js/extended-ui-sweetalert2.js"></script>

<script src="https://cdn.datatables.net/1.13.3/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.3/js/dataTables.bootstrap5.min.js"></script>
<!-- Vendors JS -->
<!-- Editor -->
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<script src="/resources/sneat/assets/vendor/libs/quill/katex.js"></script> 
<script src="/resources/sneat/assets/vendor/libs/quill/quill.js"></script>
<!-- sweetalert -->
<script src="/resources/sneat/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
<script src="/resources/sneat/assets/vendor/libs/tagify/tagify.js"></script>
<script src="/resources/sneat/assets/vendor/libs/bootstrap-select/bootstrap-select.js"></script>
<script src="/resources/sneat/assets/vendor/libs/bloodhound/bloodhound.js"></script>
<script src="/resources/sneat/assets/js/forms-tagify.js"></script>

  <!-- Page JS -->
<!-- <script src="/resources/sneat/assets/js/forms-typeahead.js"></script> -->


<!-- 삭제 절대 xxxxxx -->
<script src="/resources/sneat/assets/vendor/libs/select2/select2.js"></script>
<script src="/resources/sneat/assets/vendor/libs/block-ui/block-ui.js"></script>


<script type="text/javascript">
function lang_kor_paramEmpty(empty, record) {
	return {
	        "emptyTable" : empty,
	        "infoFiltered" : "(전체 _MAX_ 명 중 검색결과)",
	        "thousands" : ",",
	        "loadingRecords" : "로딩중...",
	        "processing" : "처리중...",
	        "search" : "검색 : ",
	        "zeroRecords" : record,
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
	let mainTable = $("#mainTable").DataTable({
		displayLength: 20,
		columnDefs: [
			{ targets: 0, width: 50 },
			{ targets: 2, width: 50 },
			{ targets: 3, width: 70 },
			{ targets: 4, width: 70 }
		],
		info: false,
		language : lang_kor_paramEmpty("참여자가 없습니다.", "검색된 스터디가 없습니다")
	});
	
	$("#mainTable_length").css("display", "none");
	$("#mainTable_filter").css("display", "none");

	// 검색
	$("#search").on("keyup", function() {
		mainTable.search($(this).val()).draw();
	});
	
	// --------------------- 모달 테이블 세팅 ---------------------
	openList = $("#openList");
	openList.DataTable({
		info: false,
		paging: false,
		language : lang_kor_paramEmpty("초대할 학생이 없습니다.", "검색된 학생이 없습니다")
	});
	
	openInvite = $("#openInvite");
	openInvite.DataTable({
		info: false,
		paging: false,
		language : lang_kor_paramEmpty("초대목록이 없습니다.", "검색된 학생이 없습니다")
	});
	
	$("#openList_filter").parent().prev().html("<div id='modalTable_length' class='modalTable_length' style='font-size: 1.3em;'><label>초대</label></div>")
	$("#openInvite_filter").parent().prev().html("<div id='modalTable_length' class='modalTable_length' style='font-size: 1.3em;'><label>초대 목록</label></div>")

	modalTableSetting();
	// --------------------- 모달 테이블 세팅 ---------------------
});

// 신청
$(document).on("click", ".btnApplication", function() {
	let sNum = $(this).attr("id");
	let sNm = $(this).closest("tr").children().eq(1).text();
	$(this).parent().html("<span style='color: red;'>신청중</span>");
	
	let data = {"sNum" : sNum,
				"stuNum" : parseInt("${stuNum}"), 
				"sNm": sNm,
				"sGrade" : 2};
	
	ajaxFunction(data, function() {
// 		window.opener.location.reload();
	});
});


// 초대 추가
$(document).on("click", ".btnAdd", function() {
	let $_this = $(this);
	let stuNum = $_this.attr("id");

	let p_tr = $_this.closest("tr");
	let stuNmKor = p_tr.children().eq(1).text();
	
	openList.DataTable().row($_this.parents("tr")).remove().draw();
	
	openInvite.DataTable().row.add([stuNum, stuNmKor, '<button type="button" id="' + stuNum + '" class="btn btn-primary btnCancel">취소</button>']).draw();
	modalTableSetting();
});

// 초대 삭제
$(document).on("click", ".btnCancel", function() {
	let $_this = $(this);
	let stuNum = $_this.attr("id");

	let p_tr = $_this.closest("tr");
	let stuNmKor = p_tr.children().eq(1).text();
	
	openInvite.DataTable().row($_this.parents("tr")).remove().draw();
	
	openList.DataTable().row.add([stuNum, stuNmKor, '<button type="button" id="' + stuNum + '" class="btn btn-primary btnAdd">추가</button>']).draw();
	modalTableSetting();
});

// 개설
function checkOpenForm() {
	if($("#sNm").val() == ''){
		$("#sNm").focus();
		$("#sNmSpan").css("display", "inline");
		return false;
	}
	
	let str = "";
	
	let trTags = $("#openInvite").find("tbody").children();
	for(var i = 0; i < trTags.length; i++){
		str += trTags.eq(i).children().eq(0).text() + ",";
	}
	
	if(str == '초대목록이 없습니다.,') str = "";
	
	$("#stuNumStr").val(str);
}

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

function modalTableSetting() {
	let openList_thead = openList.find("thead");
	openList_thead.find("tr").children().css("width", "315px");
	openList_thead.find("tr").children().eq(2).css("width", "90px");
	openList_thead.find("tr").children().eq(2).removeClass("sorting");
	
	let openList_tbody = openList_thead.next().children();
	for(var i = 0; i < openList_tbody.length; i++){
		openList_tbody.eq(i).children().css("width", "315px");
		openList_tbody.eq(i).children().eq(2).css("width", "90px");
	}
	
	let openInvite_thead = openInvite.find("thead");
	openInvite_thead.find("tr").children().css("width", "315px");
	openInvite_thead.find("tr").children().eq(2).css("width", "90px");
	openInvite_thead.find("tr").children().eq(2).removeClass("sorting");
	
	let openInvite_tbody = openInvite_thead.next().children();
	for(var i = 0; i < openInvite_tbody.length; i++){
		openInvite_tbody.eq(i).children().css("width", "315px");
		openInvite_tbody.eq(i).children().eq(2).css("width", "90px");
	}
	
	$("#openList .dataTables_empty").css("width", "700px");
	$("#openInvite .dataTables_empty").css("width", "700px");
// 	$(".dataTables_empty").text("목록이 없습니다.");
}
</script>
</body>
</html>