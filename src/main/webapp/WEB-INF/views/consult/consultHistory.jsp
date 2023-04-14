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
					<th style="width: 7%;">상담 학생 학번</th>
					<th style="width: 10%;">상담 학생 명</th>
					<th style="width: 10%;">상담 일자</th>
					<th style="width: 10%;">상담 시간</th>
					<th>상담 사유</th>
					<th style="width: 7%;">상담 유형</th>
					<th style="width: 10%;"></th>
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
								<td>
									<button type="button" class="btn btn-primary btnVideo" id="${consultMap.STU_NUM }" 
										<c:if test="${consultMap.CR_CHECK != 1 }">disabled</c:if>>
										<i class='bx bx-video'></i>
									</button>
								</td>
							</c:otherwise>
						</c:choose>
						<c:if test="${consultMap.CR_CHECK == 1 }">
							<td>
								승인
							</td>
						</c:if>
						<c:if test="${consultMap.CR_CHECK == 2 }">
							<td>반려</td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
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

$(".btnVideo").on("click", function() {
	let tdTages = $(this).closest("tr").children();
	
	let date = tdTages.eq(3).text();
	let times = tdTages.eq(4).text();
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
	
	let teaNum = $(this).attr("id");
	window.open('/consult/index/tea?myNum=<%=myNum %>&yourNum=' + teaNum, '', 'width=1220, height=690, resizeable=no');
});
</script>