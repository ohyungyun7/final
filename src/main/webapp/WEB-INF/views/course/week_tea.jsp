<%@page import="kr.or.ddit.vo.UserVO"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
.si_target{
	width: 60%;
	text-align: center;
}

thead{
	text-align: center;
}

.table-bordered{
	text-align: center;
}

#weekTr:hover {
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
	      	<a class="nav-item nav-link active"
	      		href="/course/detail?sbjNum=${sbjNum}&sbjTitle=${sbjTitle}">주차</a>
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

<!-- <nav class="navbar navbar-expand-lg bg-white" id="nav_stu"> -->
<!-- 	<div class="container-fluid"> -->
<!-- 		<div class="collapse navbar-collapse" id="navbar-ex-6"> -->
<!-- 			<div class="navbar-nav me-auto"> -->
<%-- 				<a class="nav-item nav-link active" href="/course/detail?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">주차</a> --%>
<%-- 				<a class="nav-item nav-link" href="/course/notice?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">공지</a> --%>
<%-- 				<a class="nav-item nav-link" href="/course/attendStu?sbjNum=${courseVO.sbjNum}&&sbjTitle=${sbjTitle}">출석</a> --%>
<%-- 				<a class="nav-item nav-link" href="/course/assignment?sbjNum=${courseVO.sbjNum}&&sbjTitle=${sbjTitle}">과제</a> --%>
<%-- 				<a class="nav-item nav-link" href="/course/reference?sbjNum=${courseVO.sbjNum}&&sbjTitle=${sbjTitle}">자료</a> --%>
<%-- 				<a class="nav-item nav-link" href="/course/exam?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">시험</a> --%>
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </nav> -->
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
	      	<a class="nav-item nav-link active" href="/course/detailTea?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">주차</a>
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
	<span onclick="location.href='/course/detail?sbjNum=${sbjNum}&sbjTitle=${sbjTitle}'" class="categoryBar fw-light" style="cursor: pointer;">${sbjTitle} / </span>
	주차
	<%
	}else{
	%>
	<i class="bx bx-collection page-icon"></i>
	<span class="fw-light" onclick="location.href='/course/list_pro?sbjNum=${sbjNum}&sbjTitle=${sbjTitle}'" class="categoryBar'" style="cursor: pointer;">강의목록 / </span>
	<span onclick="location.href='/course/studentList?sbjNum=${sbjNum}&sbjTitle=${sbjTitle}'" class="categoryBar fw-light" style="cursor: pointer;">${sbjTitle} / </span>
	주차
	<%
	}
	%>
</h4>


<div class="card">
	<table class="table table-bordered">
		<thead class="table-active">
			<tr class="text-nowrap">
				<th>주차</th>
				<th class="si_target">학습목표</th>
				<th>수업 구분</th>
				<th>과제 여부</th>
<!-- 				<th>링크</th> -->
			</tr>
		</thead>
		<tbody>
		<c:if test="${empty data}">
		  <tr>
			  <td colspan="4">등록된 주차별 내용이 존재하지 않습니다.</td>
		  </tr>
		</c:if>

		<c:forEach var="courseDetailVO" items="${data}" varStatus="stat">
			<tr id="weekTr">
				<th scope="row">${courseDetailVO.siNum}</th>
				<td>${courseDetailVO.siTarget}</td>


				<c:if test="${courseDetailVO.siOnline == null }"><!-- 비대면 수업 -->
					<td>대면 </td>
				</c:if>
				<c:if test="${courseDetailVO.siOnline != null }"><!-- 비대면 수업 -->
					<td><a href="#">온라인 </a></td>
				</c:if>



				<c:if test="${courseDetailVO.siHwyn == 1 }"><!-- 과제가 있는 주차일 경우 -->
					<td>O</td>
<%-- 					<td><a href="/course/assignment?sbjNum=${courseVO.sbjNum}&sbjTitle=${sbjTitle}"><button class="btn">제출하러 가기</button></a></td> --%>
				</c:if>
				<c:if test="${courseDetailVO.siHwyn == 0 }"><!-- 과제가 없는 주차일 경우 -->
					<td>X</td>
<!-- 					<td></td> -->
				</c:if>


			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>

<script type="text/javascript">
$(function(){
	$("#btnClick").on("click", function(){
		$("#nav_pro").css("display","block");
		$("#nav_stu").css("display", "none");
	});
});
</script>