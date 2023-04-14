<%@page import="kr.or.ddit.vo.UserVO"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.si_target{
	width: 60%;
	text-align: center;
}
thead{
	text-align: center;
}
.btnWrite{
	float: right;
	width: auto;
}
/* .div-header{ */
/* 	margin: 5px; */
/* } */
/* .table-bordered{ */
.table{
/* 	text-align: center; */
}
.div-header{
	margin-right: 25px;
	padding-top: 10px;
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
<!-- <nav class="navbar navbar-expand-lg bg-white" id="nav_stu"> -->
<!-- 	<div class="container-fluid"> -->
<!-- 		<div class="collapse navbar-collapse" id="navbar-ex-6"> -->
<!-- 			<div class="navbar-nav me-auto"> -->
<%-- 				<a class="nav-item nav-link" href="/course/detail?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">주차</a> --%>
<%-- 				<a class="nav-item nav-link active" href="/course/notice?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">공지</a> --%>
<%-- 				<a class="nav-item nav-link" href="/course/attendStu?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">출석</a> --%>
<%-- 				<a class="nav-item nav-link" href="/course/assignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">과제</a> --%>
<%-- 				<a class="nav-item nav-link" href="/course/reference?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">자료</a> --%>
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </nav> -->
<div class="card-header">
	<ul class="nav nav-pills flex-column flex-md-row mb-3">
	      <li class="nav-item">
	      	<a class="nav-item nav-link"
	      		href="/course/detail?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">주차</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link active"
	      		href="/course/notice?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">공지</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link"
	      		href="/course/attendStu?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">출석</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link"
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
<!-- <nav class="navbar navbar-expand-lg bg-white" id="nav_pro"> -->
<!-- 	<div class="container-fluid"> -->
<!-- 		<div class="collapse navbar-collapse" id="navbar-ex-6"> -->
<!-- 			<div class="navbar-nav me-auto"> -->
<%-- 				<a class="nav-item nav-link" href="/course/studentList?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">학생목록</a> --%>
<%-- 				<a class="nav-item nav-link active" href="/course/notice?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">공지</a> --%>
<%-- 				<a class="nav-item nav-link" href="/course/attendTea?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">출석</a> --%>
<%-- 				<a class="nav-item nav-link" href="/course/assignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">과제</a> --%>
<%-- 				<a class="nav-item nav-link" href="/course/reference?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">자료</a> --%>
<!-- 				<a class="nav-item nav-link" href="javascript:void(0)">성적</a> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </nav> -->

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
	      	<a class="nav-item nav-link active"
	      		href="/course/notice?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">공지</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link"
	      		href="/course/attendTea?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">출석</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link"
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
	공지
	<%
	}else{
	%>
	<i class="bx bx-collection page-icon"></i>
	<span class="fw-light" onclick="location.href='/course/list_pro?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}'" class="categoryBar'" style="cursor: pointer;">강의목록 / </span>
	<span onclick="location.href='/course/studentList?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}'" class="categoryBar fw-light" style="cursor: pointer;">${sbjTitle} / </span>
	공지
	<%
	}
	%>
</h4>

<!-- <h5 class="title"> -->
<!-- 	<i class="menu-icon tf-icons bx bx-collection"></i> -->
<!-- 	<a href="/course/list" class="categoryBar">강의목록</a> -->
<%-- 	&nbsp;/&nbsp;<a href="/course/detail?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}" class="categoryBar">${sbjTitle}</a> --%>
<!-- 	&nbsp;/&nbsp;공지 -->
<%-- 	<% --%>
<!-- // 	}else{ -->
<%-- 	%> --%>
<!-- 	<i class="menu-icon tf-icons bx bx-collection"></i> -->
<%-- 	<a href="/course/list_pro?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}" class="categoryBar">강의목록</a> --%>
<%-- 	&nbsp;/&nbsp;<a href="/course/studentList?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}" class="categoryBar">${sbjTitle}</a> --%>
<!-- 	&nbsp;/&nbsp;공지 -->
<%-- 	<% --%>
<!-- // 	} -->
<%-- 	%> --%>
<!-- </h5> -->

<div class="card">
	<%
	if(userVO.getAuth().equals("ROLE_TEA")){
	%>
	<div class="div-header">
		<button type="button" id="btnWrite" class="btn btn-label-primary btnWrite">글쓰기</button>
	</div>
	<%
	}
	 %>
	<div class="card-body">
<!-- 	<table class="table table-bordered"> -->
	<table id="noticeTable" class="table">
		<thead class="table-active">
			<tr class="text-nowrap">
				<th>번호</th>
				<th class="si_target" style="margin-left: 100px;">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>

<%-- 		<c:if test="${empty data}"> --%>
<!-- 		  <tr> -->
<!-- 			  <td></td> -->
<!-- 			  <th scope="row" style="text-align: center;">등록된 공지가 존재하지 않습니다.</th> -->
<!-- 			  <td></td> -->
<!-- 			  <td></td> -->
<!-- 			  <td></td> -->
<!-- 		  </tr> -->
<%-- 		</c:if> --%>

		<c:forEach var="courseNoticeVO" items="${data}" varStatus="stat">

			<tr id="noticeTr">
				<th scope="row">${courseNoticeVO.rowNum}</th>
				<td style="margin-left: 100px;"><a href="/course/noticeDetail?sbjNum=${sbjNum}&&snNum=${courseNoticeVO.snNum}&&sbjTitle=${sbjTitle}&&snHit=${courseNoticeVO.snHit}">${courseNoticeVO.snTitle}</a></td>
				<td>${courseNoticeVO.teaNmKor}</td>
				<td><fmt:formatDate pattern="yyyy.MM.dd"
 			 value="${courseNoticeVO.snDt}"/></td>
				<td>${courseNoticeVO.snHit}</td>
			</tr>

		</c:forEach>
		</tbody>
	</table>
	</div>

<!-- 	<div class="card-footer"> -->
<!-- 		<div class="demo-inline-spacing"> -->
<!-- 			<nav class="paging" aria-label="Page navigation"> -->
<!-- 				<ul class="pagination justify-content-center"> -->
<!-- 					<li class="page-item first"> -->
<!-- 						<a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-left"></i></a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item prev"> -->
<!-- 						<a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevron-left"></i></a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="javascript:void(0);">1</a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="javascript:void(0);">2</a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item active"> -->
<!-- 						<a class="page-link" href="javascript:void(0);">3</a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="javascript:void(0);">4</a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="javascript:void(0);">5</a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item next"> -->
<!-- 						<a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevron-right"></i></a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item last"> -->
<!-- 						<a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-right"></i></a> -->
<!-- 					</li> -->
<!-- 				</ul> -->
<!-- 			</nav> -->
<!-- 		</div> -->
<!-- 	</div> -->

</div>

<script>
$(function(){
	$("#btnWrite").on("click", function(){
		location.href = "/course/createNotice?sbjNum=${courseVO.sbjNum}&&sbjTitle=${sbjTitle}";
	});


	// Korean
    var lang_kor = {
        "decimal" : "",
        "emptyTable" : "등록된 공지사항이 존재하지 않습니다.",
        "info" : "_START_ - _END_ (총 _TOTAL_ 명)",
        "infoEmpty" : "",
        "infoFiltered" : "(전체 _MAX_ 명 중 검색결과)",
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


// 	$(".table-bordered").DataTable({
	$("#noticeTable").DataTable({
		aaSorting : [],
	    language : lang_kor


	});



});
</script>


