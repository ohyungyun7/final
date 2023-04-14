<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Vendors CSS -->
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/typeahead-js/typeahead.css" />
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/dropzone/dropzone.css" />

<script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>

<nav class="navbar navbar-expand-lg bg-white">
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="navbar-ex-6">
			<div class="navbar-nav me-auto">
				<a class="nav-item nav-link" href="/course/detail?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">주차</a>
				<a class="nav-item nav-link" href="/course/notice?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">공지</a>
				<a class="nav-item nav-link active" href="/course/attendStu?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">출석</a>
				<a class="nav-item nav-link" href="/course/assignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">과제</a>
				<a class="nav-item nav-link" href="/course/reference?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">자료</a>
			</div>
		</div>
	</div>
</nav>
<br />

<div class="card">
	<div class="card-header">
		<h5 class="title">
			<a href="/home" class="categoryBar">메인</a>&nbsp;/&nbsp;<a href="/course/list" class="categoryBar">강의목록</a>
			&nbsp;/&nbsp;<a href="/course/detail?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}" class="categoryBar">${sbjTitle}</a>
			&nbsp;/&nbsp;출석
			<span style="float:right;">
				<button type="button" class="btn btn-label-primary btnWrite">조회</button>
				<button type="button" class="btn btn-label-primary btnWrite">저장</button>
			</span>
		</h5>
		<br/>
			<div class="row" style="text-align:right;">
				<div class="row mb-3">
		            <label class="col-sm-2 col-form-label" for="basic-default-name">학번</label>
		            <div class="col-sm-2">
		              <input type="text" class="form-control" id="basic-default-name" value="${stuAtList[0].deptNm}" disabled>
		            </div>
		            <label class="col-sm-1 col-form-label" for="basic-default-name">학과</label>
		            <div class="col-sm-2">
		              <input type="text" class="form-control" id="basic-default-name" value="${stuAtList[0].stuNum}" disabled>
		            </div>
		            <label class="col-sm-1 col-form-label" for="basic-default-name">이름</label>
		            <div class="col-sm-2">
		              <input type="text" class="form-control" id="basic-default-name" value="${stuAtList[0].stuNmKor}" disabled>
		            </div>
	          	</div>
        	</div>
		</div>

	<div class="card-body ">
		<br/>
		<table class="table table-bordered " style="margin:auto; margin-bottom:100px; text-align:center;">
			<thead class="table-active">
				<tr class="text-nowrap h-px-10" >
					<th rowspan="2"></th>
					<th colspan="2">1</th>
					<th colspan="2">2</th>
					<th colspan="2">3</th>
					<th colspan="2">4</th>
					<th colspan="2">5</th>
				</tr>
				<tr class="text-nowrap h-px-10">
					<th>월</th>
					<th>화</th>
					<th>월</th>
					<th>화</th>
					<th>월</th>
					<th>화</th>
					<th>월</th>
					<th>화</th>
					<th>월</th>
					<th>화</th>
				</tr>
			</thead>
			<tbody>
				<tr class="fs-tiny">
					<td>1교시</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
				</tr>
				<tr class="fs-tiny">
					<td>2교시</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
				</tr>
			</tbody>
			<thead class="table-active">
				<tr class="text-nowrap" >
					<th rowspan="2"></th>
					<th colspan="2">1</th>
					<th colspan="2">2</th>
					<th colspan="2">3</th>
					<th colspan="2">4</th>
					<th colspan="2">5</th>
				</tr>
				<tr class="text-nowrap">
					<th>월</th>
					<th>화</th>
					<th>월</th>
					<th>화</th>
					<th>월</th>
					<th>화</th>
					<th>월</th>
					<th>화</th>
					<th>월</th>
					<th>화</th>
				</tr>
			</thead>
			<tbody>
				<tr class="fs-tiny">
					<td>1교시</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
				</tr>
				<tr class="fs-tiny">
					<td>2교시</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
				</tr>
			</tbody>
			<thead class="table-active">
				<tr class="text-nowrap" >
					<th rowspan="2"></th>
					<th colspan="2">1</th>
					<th colspan="2">2</th>
					<th colspan="2">3</th>
					<th colspan="2">4</th>
					<th colspan="2">5</th>
				</tr>
				<tr class="text-nowrap">
					<th>월</th>
					<th>화</th>
					<th>월</th>
					<th>화</th>
					<th>월</th>
					<th>화</th>
					<th>월</th>
					<th>화</th>
					<th>월</th>
					<th>화</th>
				</tr>
			</thead>
			<tbody>
				<tr class="fs-tiny">
					<td>1교시</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
				</tr>
				<tr class="fs-tiny">
					<td>2교시</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
					<td>O</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<script src="/resources/sneat/assets/vendor/libs/dropzone/dropzone.js"></script>
<!-- Page JS -->
<script src="/resources/sneat/assets/js/forms-file-upload.js"></script>