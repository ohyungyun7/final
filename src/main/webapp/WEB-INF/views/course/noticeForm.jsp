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
.btnWrite{
	width: auto;
}
.div-header{
	margin: 5px;
}
.card-btn{
	display: inline;
	float: right;
}
</style>

<!-- <nav class="navbar navbar-expand-lg bg-white"> -->
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
<br />


<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bx-collection page-icon"></i>
	<span class="fw-light" onclick="location.href='/course/list_pro?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}'" class="categoryBar'" style="cursor: pointer;">강의목록 / </span>
	<span onclick="location.href='/course/studentList?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}'" class="categoryBar fw-light" style="cursor: pointer;">${sbjTitle} / </span>
	공지
</h4>

<%
	UserVO userVO = (UserVO) session.getAttribute("userVO");
	int teaNum = userVO.getUsername();
	pageContext.setAttribute("teaNum", teaNum);
%>
<%-- <c:out value="${teaNum}" /> --%>

<form action="/course/createNotice?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
<input type="hidden" name="sbjTitle" value="${sbjTitle}">
<input type="hidden" name="sbjNum" value="${sbjNum}">
<input type="hidden" name="teaNum" value="${teaNum}">

<div class="card">
	<div class="card-header">
		<h3 class="card-title">
			<div class="mt-2 mb-3">
				<label for="title" class="form-label">제목</label>
				<input id="title" name="snTitle" class="form-control form-control-lg" type="text"
					placeholder="제목을 입력하세요." />
			</div>
		</h3>
<!-- 		<p>작성자 : 이수영</p> -->
<!-- 		<p>작성일 : 2022.12.04</p> -->
<!-- 		<p>조회수 : 30</p> -->
		<input class="form-control" name="uploadFile" type="file" id="formFile">
	</div>


	<div class="card-body">
		<textarea id="editor" name="snContent" cols="50" rows="20"></textarea>
			<div class="card-btn">
				<br />
				<button id="btnAuto" type="button" class="btn btn-label-primary">자동입력</button>
				<button type="submit" class="btn btn-label-primary">저장</button>
				<a href="/course/notice?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}"><button type="button" class="btn btn-label-primary">취소</button></a>
			</div>
	</div>
</div>
</form>

<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
CKEDITOR.replace('snContent');
CKEDITOR.instances.editor.setData('<p></p>');


$(document).on("click", "#btnAuto", function(){
	let title = document.querySelector("#title");
	title.setAttribute("value","과목 공지 글쓰기 테스트입니다.");
	CKEDITOR.instances.editor.setData('<p>과목 공지 글쓰기 내용입니다.</p>');


});
</script>
