<%@page import="kr.or.ddit.vo.UserVO"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
table{
	text-align: center;
}

.btnWrite{
	float: right;
	width: auto;
}

.div-header{
	margin-right: 25px;
	padding-top: 10px;
}

#assignTable {
	text-align: left;
}

.card-body{
	margin-top: 0px;
	padding-top: 0px;
}

#noticeTr:hover {
	background-color: lightyellow;
}
</style>

<%
	UserVO userVO = (UserVO) session.getAttribute("userVO");

	if(userVO.getAuth().equals("ROLE_STU")){
%>
<div class="card-header">
	<ul class="nav nav-pills flex-column flex-md-row mb-3">
	      <li class="nav-item">
	      	<a class="nav-item nav-link"
	      		href="/course/detail?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">주차</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link"
	      		href="/course/notice?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">공지</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link"
	      		href="/course/attendStu?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">출석</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link active"
	      		href="/course/assignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">과제</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link"
	      		href="/course/reference?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">자료</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link" href="/course/exam?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">시험</a>
	      </li>
	</ul>
</div>
<%
	}else{
%>
<div class="card-header">
	<ul class="nav nav-pills flex-column flex-md-row mb-3">
	      <li class="nav-item">
	      	<a class="nav-item nav-link"
	      		href="/course/studentList?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">학생목록</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link" href="/course/detailTea?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">주차</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link"
	      		href="/course/notice?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">공지</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link"
	      		href="/course/attendTea?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">출석</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link active"
	      		href="/course/assignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">과제</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link"
	      		href="/course/reference?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">자료</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link"
	      		href="/course/reportCard?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">성적</a>
	      </li>
	</ul>
</div>

<%
	}
%>
<br />
<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<%
	if(userVO.getAuth().equals("ROLE_STU")){
	%>
	<i class="bx bx-collection page-icon"></i>
	<span class="fw-light" onclick="location.href='/course/list'" style="cursor: pointer;">강의목록 / </span>
	<span onclick="location.href='/course/detail?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}'" class="categoryBar fw-light" style="cursor: pointer;">${sbjTitle} / </span>
	과제
	<%
	}else{
	%>
	<i class="bx bx-collection page-icon"></i>
	<span class="fw-light" onclick="location.href='/course/list_pro?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}'" class="categoryBar'" style="cursor: pointer;">강의목록 / </span>
	<span onclick="location.href='/course/studentList?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}'" class="categoryBar fw-light" style="cursor: pointer;">${sbjTitle} / </span>
	과제
	<%
	}
	%>
</h4>


<div class="card">
	<%
	if(userVO.getAuth().equals("ROLE_TEA")){
	%>
	<div class="div-header">
		<a href="/course/createAssignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}"><button type="button" class="btn btn-label-primary btnWrite">글쓰기</button></a>
	</div>
	<%
	}
	%>
	<div class="card-body">
	<table id="assignTable" class="table">
		<thead class="table-active">
			<tr class="text-nowrap">
				<th>주차</th>
				<th class="si_target">제목</th>
				<th>제출기간</th>
			<%
			if(userVO.getAuth().equals("ROLE_STU")){
			%>
				<th>제출여부</th>
			<%
			}else{
			%>
<!-- 				<th>제출여부 조회</th> -->
			<%
			}
			%>
			</tr>
		</thead>
		<tbody>

<%-- 		<c:if test="${empty data}"> --%>
<!-- 		  <tr> -->
<!-- 			  <td></td> -->
<!-- 			  <th scope="row" style="text-align: center;">등록된 과제가 존재하지 않습니다.</th> -->
<!-- 			  <td></td> -->
<!-- 			  <td></td> -->
<!-- 		  </tr> -->
<%-- 		</c:if> --%>

		<c:forEach var="courseAssignmentVO" items="${data}" varStatus="stat">
			<tr id="noticeTr">
				<th scope="row">${courseAssignmentVO.siNum}</th>
				<td><a href="/course/assignmentDetail?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}&&asNum=${courseAssignmentVO.asNum}">${courseAssignmentVO.asTitle}</a></td>
				<td><fmt:formatDate pattern="yyyy.MM.dd" value="${courseAssignmentVO.asSdt}"/> - <fmt:formatDate pattern="yyyy.MM.dd" value="${courseAssignmentVO.asEdt}"/></td>
				<%
				if(userVO.getAuth().equals("ROLE_STU")){
				%>
				<c:if test="${courseAssignmentVO.sbmNum == 0 }">
				<td>X</td>
				</c:if>
				<c:if test="${courseAssignmentVO.sbmNum != 0 }">
				<td>O</td>
				</c:if>
				<%
				}else{
				%>
<!-- 				<td><button class="btn">조회하기</button></td> -->
				<%
				}
				%>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>

<!-- 	<div class="card-footer"> -->
<!-- 		<div class="demo-inline-spacing"> -->
<!-- 			<nav class="paging" aria-label="Page navigation"> -->
<!-- 				<ul class="pagination justify-content-center"> -->
<!-- 					<li class="page-item active"> -->
<!-- 						<a class="page-link" href="javascript:void(0);">1</a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="javascript:void(0);">2</a> -->
<!-- 					</li> -->
<!-- 				</ul> -->
<!-- 			</nav> -->
<!-- 		</div> -->
<!-- 	</div> -->

</div>

<script>
$(function(){
	// Korean
    var lang_kor = {
        "decimal" : "",
        "emptyTable" : "등록된 과제 게시글이 존재하지 않습니다.",
        "info" : "_START_ - _END_ (총 _TOTAL_ 건)",
        "infoEmpty" : "",
        "infoFiltered" : "(전체 _MAX_ 건 중 검색결과)",
        "infoPostFix" : "",
        "thousands" : ",",
        "lengthMenu" : "_MENU_ 개씩 보기",
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

	$(".table").DataTable({
		aaSorting : [],
		language : lang_kor
	});


});
</script>