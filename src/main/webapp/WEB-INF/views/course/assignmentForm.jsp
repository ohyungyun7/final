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

<script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>

<!-- <nav class="navbar navbar-expand-lg bg-white"> -->
<!-- 	<div class="container-fluid"> -->
<!-- 		<div class="collapse navbar-collapse" id="navbar-ex-6"> -->
<!-- 			<div class="navbar-nav me-auto"> -->
<%-- 				<a class="nav-item nav-link" href="/course/studentList?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">학생목록</a> --%>
<%-- 				<a class="nav-item nav-link" href="/course/notice?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">공지</a> --%>
<%-- 				<a class="nav-item nav-link" href="/course/attendTea?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">출석</a> --%>
<%-- 				<a class="nav-item nav-link active" href="/course/assignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">과제</a> --%>
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
<br />
<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bx-collection page-icon"></i>
	<span class="fw-light" onclick="location.href='/course/list_pro?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}'" class="categoryBar'" style="cursor: pointer;">강의목록 / </span>
	<span onclick="location.href='/course/studentList?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}'" class="categoryBar fw-light" style="cursor: pointer;">${sbjTitle} / </span>
	과제
</h4>

<%
	//UserVO userVO = (UserVO) session.getAttribute("userVO");
	//int teaNum = userVO.getUsername();
	//pageContext.setAttribute("teaNum", teaNum);
%>
<%-- <c:out value="${teaNum}" /> --%>

<form action="/course/createAssignment?${_csrf.parameterName}=${_csrf.token}" method="post">
<input type="hidden" name="sbjTitle" value="${sbjTitle}">
<input type="hidden" name="sbjNum" value="${sbjNum}">
<%-- <input type="hidden" name="spNum" value="${siList.spNum}"> --%>
<%-- <input type="hidden" name="teaNum" value="${teaNum}"> --%>

<div class="card">
	<div class="card-header">
		<div class="mb-3 col-1">
          <label for="siNum" class="form-label">주차</label>
          <select class="form-select col-1" id="siNum" name="siNum" aria-label="Default select example" required>
            <option id="op" value="">주차선택</option>
            <c:forEach var="siListVO" items="${siList}" varStatus="stat">
            <option value="${siListVO.siNum}">${siListVO.siNum}</option>
            </c:forEach>
<%-- 			  <c:forEach var="i" begin="1" end="15"> --%>
<%-- 			  	<option value="${i}">${i}</option> --%>
<%-- 			  </c:forEach> --%>
          </select>
            <input type="hidden" name="spNum" value="${siList[0].spNum}">
        </div>

		<h3 class="card-title">
			<div class="mt-2 mb-3 col-6">
				<label for="title" class="form-label">제목</label>
				<input id="title" name="asTitle" class="form-control form-control-lg" type="text"
					placeholder="제목을 입력하세요." required />
			</div>
		</h3>

		<div class="row">
			<label for="date" class="form-label">제출기한</label>
			<div class="col-3">
				<input class="form-control" type="date" name="asSdt" id="html5-date-input1" value="" min="" required />
<!-- 			<input class="form-control" type="datetime-local" name="asSdt" value="2023-03-08T12:30:00" id="html5-datetime-local-input"> -->
			</div>
			 ~
			<div class="col-3">
				<input class="form-control" type="date" name="asEdt" id="html5-date-input2" value="" min="" required />
<!-- 			<input class="form-control" type="datetime-local" name="asEdt" value="2023-03-08T12:30:00" id="html5-datetime-local-input"> -->
			</div>
		</div>


<!-- 		<p>작성자 : 이수영</p> -->
<!-- 		<p>작성일 : 2022.12.04</p> -->
<!-- 		<p>조회수 : 30</p> -->
<!-- 		<input class="form-control" name="uploadFile" type="file" id="formFile"> -->
	</div>


	<div class="card-body">
		<textarea id="editor" name="asContent" cols="50" rows="20" required></textarea> <br />
			<div class="card-btn">
				<button type="button" id="btnAuto" class="btn btn-label-primary">자동채우기</button>
				<button type="submit" class="btn btn-label-primary">저장</button>
				<a href="/course/assignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}"><button type="button" class="btn btn-label-primary">취소</button></a>
			</div>
	</div>
</div>
</form>

<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
CKEDITOR.replace('asContent');
CKEDITOR.instances.editor.setData('<p></p>');




$(document).ready(function(){
	let today = new Date();

	let year = today.getFullYear();
	let month = ('0' + (today.getMonth() + 1)).slice(-2);
	let day = ('0' + today.getDate()).slice(-2);

	let dateString = year + '-' + month  + '-' + day;

	document.getElementById("html5-date-input1").valueAsDate = new Date();
	$("#html5-date-input1").attr("min", dateString);
	$("#html5-date-input2").attr("min", dateString);

	$(document).on("change", "#html5-date-input1", function(){
		let test1 = $("#html5-date-input1").val();

		$("#html5-date-input2").attr("min", test1);
// 		$("#html5-date-input2").attr("val", test1);
	});

	$(document).on("click", "#btnAuto", function(){

		let title = document.querySelector("#title");
		title.setAttribute("value","과목 과제 글쓰기 테스트입니다.");

		let siNum = $("#siNum option:eq(1)");
		siNum.prop("selected", true);

		$("#html5-date-input1").val(dateString);
		$("#html5-date-input2").val('2023-04-20');

		CKEDITOR.instances.editor.setData('<p>과목 과제 글쓰기 내용입니다.</p>');

	});

});

</script>


