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
	<span class="fw-light">스터디 관리 / </span>스터디 리스트
</h4>
	
<div class="card">
	<div class="card-body">
		<table class="table table-bordered" id="studyTable">
			<thead class="table-active">
				<tr class="text-nowrap">
					<th>No.</th>
					<th>스터디명</th>
					<th>참여인원</th>
					<th>개설자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="study" items="${studyList}" varStatus="stat">
					<tr>
						<td>${stat.count }</td>
						<td>${study.S_NM }</td>
						<td>${study.COUNT }</td>
						<td>${study.STU_NM_KOR }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<script>
$(function() {
	let lang_kor = {
	        "emptyTable" : "스터디 리스트가 없습니다.",
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
	
	$("#studyTable").DataTable({
		info: false,
		language : lang_kor
	});
});
</script>