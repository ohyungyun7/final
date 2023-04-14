<%@page import="kr.or.ddit.vo.UserVO"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	UserVO userVO = (UserVO) session.getAttribute("userVO");
	int myNum = userVO.getUsername();
%>

<style>
.thCenter th{
	text-align: center;
}
.innerCard{
	border: 1px solid lightgray;
	border-radius: 5px;
	margin: 5px;
	padding: 10px;
}
.btnVideo{
	text-align: center;
}
</style>

<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bxs-heart-circle page-icon"></i>
	<span class="fw-light">상담 / </span>상담 내역
</h4>

<div class="card" style="min-height: 97%;">
	
	<div class="card-body">
		<table class="table table-bordered thCenter" id="consultTable">
			<thead class="table-active">
				<tr class="text-nowrap">
					<th style="width: 5%;">번호</th>
					<th style="width: 7%;">상담 교수</th>
					<th style="width: 10%;">상담 일자</th>
					<th style="width: 10%;">상담 시간</th>
					<th>상담 사유</th>
					<th style="width: 7%;">상담 유형</th>
					<th style="width: 5%;">신청 상태</th>
					<th style="width: 11%;"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="consultMap" items="${consultMapList}" varStatus="stat">
					<tr>
						<td>${stat.count }</td>
						<td>${consultMap.TEA_NM_KOR }</td>
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
						<c:choose>
							<c:when test="${consultMap.CR_CHECK == 0 }">
								<td>대기</td>
								<td>
									<button type="button" class="btn btn-danger btnDelete" id="${consultMap.CR_NUM }">신청 취소</button>
								</td>
							</c:when>
							<c:when test="${consultMap.CR_CHECK == 1 }">
								<td>승인</td>
								<td>
									<c:if test="${consultMap.CR_TYPE == 1 }">
										<button type="button" class="btn btn-primary btnVideo" id="${consultMap.TEA_NUM }">
											<i class='bx bx-video'></i>
										</button>
									</c:if>
								</td>
							</c:when>
							<c:otherwise>
								<td>반려</td>
								<td>
									<button type="button" class="btn btn-secondary btnCrComre" id="${consultMap.CR_NUM}" 
										data-bs-toggle="modal" data-bs-target="#comreModal">반려사유</button>
								</td>
							</c:otherwise>
						</c:choose>
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
						<h4 class="col-md-2">반려사유</h4>
					</div>
					<c:forEach var="consultMap" items="${consultMapList}" varStatus="status">
						<div class="col-md-12 innerCard crComre" id="crComre_${consultMap.CR_NUM}" style="display: none; height: calc(100px - 1px);">
							${consultMap.CR_COMRE}
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
$(function() {
	let lang_kor = {
	        "emptyTable" : "상담 내역이 없습니다.",
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

$(".btnCrComre").on("click", function() {
	$(".crComre").css("display", "none");
	let crNum = $(this).attr("id");
	$("#crComre_" + crNum).css("display", "block");
});

$(".btnDelete").on("click", function() {
	Swal.fire({
		title: '상담 신청을<br/>취소하시겠습니까?',
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
			let $_this = $(this);
			let url = "/consult/deleteConsult";
			let data = { "crNum" : $_this.attr("id") };
			
			fn_ajax(url, data, function(result) {
				consultTable.row($_this.parents("tr")).remove().draw();
			});
		}
	});
});

$(".btnVideo").on("click", function() {
	let tdTages = $(this).closest("tr").children();
	
	let date = tdTages.eq(2).text();
	let times = tdTages.eq(3).text();
	let stime = times.split("~")[0];
	let etime = times.split("~")[1];
	
	let beginTime = new Date(date + " " + stime);
	let endTime = new Date(date + " " + etime);
	let today = new Date();
	
	if(beginTime > today || endTime < today){
		Swal.fire({
			title: '상담시간이 아닙니다.<br/>상담 일자와 시간을 확인해주세요.',
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
	
	
	let stuNum = $(this).attr("id");
	window.open('/consult/index/tea?myNum=<%=myNum %>&yourNum=' + stuNum, '', 'width=1220, height=690, resizeable=no');
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
			fn(result);
		}
	});
}
</script>