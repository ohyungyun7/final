<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
.thCenter th{
	text-align: center;
}
textarea{
	resize: none;
	width: 100%;
	maxlength: 1000;
}
</style>

<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bxs-heart-circle page-icon"></i>
	<span class="fw-light">상담 / </span>상담 신청 확인
</h4>

<div class="card" style="min-height: 97%;">
	
	<div class="card-body">
		<table class="table table-bordered thCenter" id="consultTable">
			<thead class="table-active">
				<tr class="text-nowrap">
					<th style="width: 5%;">번호</th>
					<th style="width: 7%;">상담 학생 학번</th>
					<th style="width: 10%;">상담 학생 명</th>
					<th style="width: 10%;">상담 일자</th>
					<th style="width: 10%;">상담 시간</th>
					<th>상담 사유</th>
					<th style="width: 7%;">상담 유형</th>
					<th style="width: 15%;"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="consultMap" items="${consultMapList}" varStatus="stat">
					<tr>
						<td>${stat.count }</td>
						<td>${consultMap.STU_NUM }</td>
						<td>${consultMap.STU_NM_KOR }</td>
						<td><fmt:formatDate value="${consultMap.CR_DT }" pattern="yyyy/MM/dd"/></td>
						<td>${consultMap.TIME }</td>
						<td>${consultMap.CR_REASON }</td>
						<c:choose>
							<c:when test="${consultMap.CR_TYPE == 0 }">
								<td>대면</td>
							</c:when>
							<c:otherwise>
								<td>비대면</td>
							</c:otherwise>
						</c:choose>
						<td>
							<button type="button" class="btn btn-primary btnOk" id="${consultMap.CR_NUM }">승인</button>&nbsp;/
							<button type="button" class="btn btn-danger btnComreModal" id="${consultMap.CR_NUM }"
								data-bs-toggle="modal" data-bs-target="#comreModal" >반려</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
</div>

<div class="modal fade" id="comreModal" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered modal-simple modal-add-new-cc">
		<div class="modal-content p-3 p-md-5">
			<div class="modal-body">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				<div class="row g-3">
					<div class="col-md-12">
						<div class="row">
							<h4 class="col-md-3">반려사유</h4>
							<span class="col-form-label ms-2" id="comEmpty" style="color: red; display: none; padding: 0px;">반려사유를 작성해주세요</span>
						</div>
					</div>
					
					<textarea class="form-control" id="crComre" rows="3" cols="" placeholder="반려사유를 입력해주세요"></textarea>
					
					<div class="col-md-12 text-center formButtons">
						<button type="button" class="btn btn-primary btnSubmit">확인</button>
						<button type="button" class="btn btn-primary me-sm-3 me-1 btnCancel" data-bs-dismiss="modal" aria-label="Close">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
$(function() {
	let lang_kor = {
	        "emptyTable" : "상담 신청 내역이 없습니다.",
	        "thousands" : ",",
	        "lengthMenu" : "_MENU_ 개씩 보기",
	        "loadingRecords" : "로딩중...",
	        "processing" : "처리중...",
	        "search" : "검색 : ",
	        "zeroRecords" : "검색된 상담이 없습니다.",
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
	
	consultTable = $("#consultTable").DataTable({
		info: false,
		language : lang_kor
	});
});

let crNum;

$(".btnComreModal").on("click", function() {
	$("#comEmpty").css("display", "none");
	crNum = $(this).attr("id");
});

$(".btnCancel").on("click", function() {
	$("#crComre").val("");
});

$(".btnSubmit").on("click", function() {
	if($("#crComre").val() == '' || $("#crComre").val() == null ){
		$("#crComre").focus();
		$("#comEmpty").css("display", "inline");
		return;
	}
	
	let target = $("#" + crNum);
	let url = "/consult/modifyConsult";
	let data = {"crNum" : crNum, 
				"crCheck" : 2,
				"crComre" : $("#crComre").val()
				};
	
	fn_ajax(url, data, function() {
		$("#comreModal").modal("hide");
		consultTable.row(target.parents("tr")).remove().draw();
	});
});

$(".btnOk").on("click", function() {
	let $_this = $(this);
	let url = "/consult/modifyConsult";
	let data = {"crNum" : $_this.attr("id"), 
				"crCheck" : 1
				};
	
	fn_ajax(url, data, function() {
		consultTable.row($_this.parents("tr")).remove().draw();
	});
});

function fn_ajax(url, data, fn) {
	$.ajax({
		url: url,
		data: data,
		type: "post",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(result) {
			fn();
		}
	});
}
</script>