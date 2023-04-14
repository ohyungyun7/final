<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.categoryBar{
	color: gray;
}
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
<%-- data : ${data } --%>
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


<form action="/course/noticeModify?${_csrf.parameterName}=${_csrf.token}" method="post">

<input type="hidden" id="snNum" name="snNum" value="${data.snNum}">
<input type="hidden" id="sbjNum" name="sbjNum" value="${sbjNum}">
<input type="hidden" id="sbjTitle" name="sbjTitle" value="${sbjTitle}">

<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bx-collection page-icon"></i>
	<span class="fw-light" onclick="location.href='/course/list_pro?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}'" class="categoryBar'" style="cursor: pointer;">강의목록 / </span>
	<span onclick="location.href='/course/studentList?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}'" class="categoryBar fw-light" style="cursor: pointer;">${sbjTitle} / </span>
	공지
</h4>

<div class="card">
	<div class="card-header">
		<h3 class="card-title">
			<div class="mt-2 mb-3">
				<label for="title" class="form-label">제목</label>
				<input id="title" class="form-control form-control-lg" type="text"
					placeholder=".form-control-lg" name="snTitle" value="${data.snTitle}" />
			</div>
			<div class="card-btn">
				<button type="submit" class="btn btn-label-primary">저장</button>
				<a href="/course/goDetail?snNum=${data.snNum}&&sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}"><button type="button" class="btn btn-label-primary">취소</button></a>
			</div>
		</h3>
		<p>작성자 : ${data.teaNmKor}</p>
		<p>작성일 : <fmt:formatDate pattern="yyyy.MM.dd"
 			 value="${data.snDt}"/></p>
		<p>조회수 : ${data.snHit}</p>
		<input class="form-control" type="file" id="formFile" name="snFilename" value="${data.snFilename }" />
	</div>


	<div class="card-body">
		<textarea id="editor" name="snContent" cols="50" rows="20">${data.snContent}</textarea>

	</div>

</div>
</form>

<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
CKEDITOR.replace('snContent');
// CKEDITOR.instances.editor.setData('<p></p>');
</script>