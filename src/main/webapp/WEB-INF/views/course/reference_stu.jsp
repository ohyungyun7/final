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
	float: right;
	width: auto;
}
.div-header{
	margin-right: 25px;
	padding-top: 10px;
}

.table-stripe td, th{
	text-align: center;
}
.card-body{
	margin-top: 5px;
	padding-top: 0px;
}

#contTr:hover{
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
<%-- 				<a class="nav-item nav-link" href="/course/notice?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">공지</a> --%>
<%-- 				<a class="nav-item nav-link" href="/course/attendStu?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">출석</a> --%>
<%-- 				<a class="nav-item nav-link" href="/course/assignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">과제</a> --%>
<%-- 				<a class="nav-item nav-link active" href="/course/reference?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">자료</a> --%>
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
	      	<a class="nav-item nav-link"
	      		href="/course/notice?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">공지</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link"
	      		href="/course/attendStu?sbjNum=${courseVO.sbjNum}&&sbjTitle=${sbjTitle}">출석</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link"
	      		href="/course/assignment?sbjNum=${courseVO.sbjNum}&&sbjTitle=${sbjTitle}">과제</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link active"
	      		href="/course/reference?sbjNum=${courseVO.sbjNum}&&sbjTitle=${sbjTitle}">자료</a>
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
<%-- 				<a class="nav-item nav-link" href="/course/notice?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">공지</a> --%>
<%-- 				<a class="nav-item nav-link" href="/course/attendTea?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">출석</a> --%>
<%-- 				<a class="nav-item nav-link" href="/course/assignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">과제</a> --%>
<%-- 				<a class="nav-item nav-link active" href="/course/reference?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">자료</a> --%>
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
	      	<a class="nav-item nav-link"
	      		href="/course/assignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">과제</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link active"
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
	자료
	<%
	}else{
	%>
	<i class="bx bx-collection page-icon"></i>
	<span class="fw-light" onclick="location.href='/course/list_pro?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}'" class="categoryBar'" style="cursor: pointer;">강의목록 / </span>
	<span onclick="location.href='/course/studentList?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}'" class="categoryBar fw-light" style="cursor: pointer;">${sbjTitle} / </span>
	자료
	<%
	}
	%>
</h4>

<div class="card">
	<%
	if(userVO.getAuth().equals("ROLE_TEA")){
	%>
	<div class="div-header">
		<button type="button" class="btn btn-label-primary btnWrite"
			data-bs-toggle="modal" data-bs-target="#addNewModal">글쓰기</button>
	</div>
	<%
	}
	%>
	<div class="card-body">
	<table class="table table-stripe">
		<thead class="table-active">
			<tr class="text-nowrap">
				<th>번호</th>
				<th class="si_target">제목</th>
				<th>파일</th>
	<%
	if(userVO.getAuth().equals("ROLE_TEA")){
	%>
				<th></th>
	<%
	}
	%>
			</tr>
		</thead>
		<tbody>

		<c:if test="${empty data}">
		  <tr>
			  <td colspan="4">등록된 자료 게시글이 존재하지 않습니다.</td>
		  </tr>
		</c:if>

		<c:forEach var="courseRefernceVO" items="${data}" varStatus="stat">
			<tr id="contTr">
				<th>${courseRefernceVO.rowNum}</th>
				<td>${courseRefernceVO.rrTitle}</td>
			<c:if test="${courseRefernceVO.rrNm != null}">
				<td>
				<p class="str2" style="display: none;">${courseRefernceVO.rrNm}</p>
<%-- 				<input type="hidden" class="str" id="str" value="${courseRefernceVO.rrNm}">	 --%>
				<button type="button" id="btnDownload" class="btn btnDownload">다운로드</button>
				</td>
			</c:if>
			<c:if test="${empty courseRefernceVO.rrNm}">
				<td>-</td>
			</c:if>



	<%
	if(userVO.getAuth().equals("ROLE_TEA")){
	%>
<%-- 				<td style="text-align: center;width: 10%;"><a href="/course/deleteReference?rrNum=${courseRefernceVO.rrNum}&&sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}"><button class="btn" >삭제</button></a></td> --%>
				<td style="text-align: center;width: 10%;">
					<p style="display: none;">${courseRefernceVO.rrNum}</p>
					<button id="btnDelete" class="btn" >삭제</button>
				</td>

				<c:if test="${empty courseRefernceVO.rrNum}">
					<td>-</td>
				</c:if>
	<%
	}
	%>
			</tr>

<%-- 			<c:if test="${courseRefernceVO.rrNm == null || courseRefernceVO.rrNm==''}"> --%>


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

<div class="modal fade" id="addNewModal" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered1 modal-simple modal-add-new-cc">
		<div class="modal-content p-3 p-md-5">
			<div class="modal-body">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				<div class="text-center mb-4">
					<h3>파일 업로드</h3>
				</div>
				<form id="addNewCCForm" class="row g-3 fv-plugins-bootstrap5 fv-plugins-framework" action="/course/createReference?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
				<input type="hidden" name="sbjNum" value="${sbjNum}">
				<input type="hidden" name="sbjTitle" value="${sbjTitle}">

					<div class="col-12 fv-plugins-icon-container">
						<div class="input-group input-group-merge">
							<input type="text" id="modalAdd" name="rrTitle" class="form-control" placeholder="제목" aria-describedby="modalAdd2" required />
							<span class="input-group-text cursor-pointer p-1" id="modalAddCard2"><span class="card-type"></span></span>
						</div>
					</div>
					<div class="col-12">
						<input class="form-control" type="file" id="formFile" name="uploadFile" required />
					</div>
					<div class="col-12 text-center">
						<button type="button" class="btn btn-primary me-sm-3 me-1 mt-3" id="autoBtn">자동채우기</button>
						<button type="submit" class="btn btn-primary me-sm-3 me-1 mt-3">등록</button>
						<button type="reset" class="btn btn-label-secondary btn-reset mt-3" data-bs-dismiss="modal" aria-label="Close">취소</button>
					</div>
					<input type="hidden">
				</form>
			</div>
		</div>
	</div>
</div>

<script>
$(document).on("click", ".btnDownload", function(){
	let rrNm = $(this).prev().text();
	location.href="/download?fileName="+ rrNm;
});

$(document).on("click", "#btnDelete", function(){
	let l_rrNum = $(this).prev('p').text();

	Swal.fire({
//		   title: '삭제하시겠습니까?',
		   text: '삭제하시겠습니까?',
		   icon: 'warning',

		   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
		   confirmButtonText: '확인', // confirm 버튼 텍스트 지정
		   cancelButtonText: '취소', // cancel 버튼 텍스트 지정

		   reverseButtons: true, // 버튼 순서 거꾸로

		}).then(result => {

		   // 만약 Promise리턴을 받으면,
		   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면

		      Swal.fire({
		    	  text: '삭제되었습니다.',
		    	  icon: 'success',

		    	  confirmButtonText: '확인'

		      }).then(result => {
		    	  location.href = "/course/deleteReference?rrNum=" + l_rrNum + "&&sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}";
		      	});
			}
		});
});

$(function(){
	$("#autoBtn").on("click", function(){
		$("#modalAdd").val("자료입니다");
	})

})
// $(function(){
// 	$(".table-bordered").DataTable({
// 		aaSorting : []
// 		order : [[ 0, "desc" ]]
// 	});
// });
</script>
