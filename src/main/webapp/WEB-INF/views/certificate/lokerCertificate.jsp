<%@page import="kr.or.ddit.vo.UserVO"%>
<%@page import="kr.or.ddit.vo.StudyVO"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bx-clipboard page-icon"></i>
	<span class="fw-light" >증명서 발급 / </span>증명서 보관함
</h4>

<div class="card" style="min-height: 97%;">
	
	<div class="card-body">
		<table class="table table-bordered forJoin thCenter">
			<thead class="table-active">
				<tr class="text-nowrap">
					<th>증명서명</th>
					<th>발급일</th>
					<th>보관 만료일</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="icMap" items="${icMapList}">
					<tr>
						<td>${icMap.CT_TYPE }</td>
						<td><fmt:formatDate value="${icMap.SDATE }" pattern="yyyy/MM/dd"/></td>
						<td><fmt:formatDate value="${icMap.EDATE }" pattern="yyyy/MM/dd"/></td>
						<td><a href="#" class="down" id="${icMap.CT_SNUM }"><i class='bx bxs-download'></i>다운로드</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
</div>

<script>
$(".down").on("click", function() {
	let ctSnum = $(this).attr("id");
	window.open('/certificate/downLoad/' + ctSnum, '', 'width=813, height=960, resizeable=no');
});

</script>