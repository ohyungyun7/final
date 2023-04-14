<%@page import="kr.or.ddit.vo.UserVO"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

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
<!-- 				<a class="nav-item nav-link" href="javascript:void(0)">출석</a> -->
<!-- 				<a class="nav-item nav-link" href="javascript:void(0)">과제</a> -->
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
<!-- 				<a class="nav-item nav-link" href="javascript:void(0)">출석</a> -->
<!-- 				<a class="nav-item nav-link" href="javascript:void(0)">과제</a> -->
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
<!-- <br /> -->

<!-- <h5 class="title"> -->
<!-- 	<a href="#" class="categoryBar">메인</a>&nbsp;/&nbsp;<a href="#" class="categoryBar">강의목록</a> -->
<%-- 	&nbsp;/&nbsp;<a href="#" class="categoryBar">${sbjTitle}</a> --%>
<!-- </h5> -->


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



<!-- <div class="card"> -->
<!-- 	<div class="card-header"> -->
<%-- 		<h3 class="card-title">${data.snTitle} --%>
<!-- 			<div class="card-btn"> -->
<%-- 				<a href="/course/notice?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}"><button type="button" class="btn btn-label-primary">목록</button></a> --%>
<%-- 			<% --%>
<!-- // 			if(userVO.getAuth().equals("ROLE_TEA")){ -->
<%-- 			%> --%>
<%-- 				<a href="/course/noticeModify?sbjNum=${sbjNum}&&snNum=${data.snNum}&&sbjTitle=${sbjTitle}"><button type="button" class="btn btn-label-primary">수정</button></a> --%>
<%-- <%-- 				<a href="/course/deleteNotice?sbjNum=${sbjNum}&&snNum=${data.snNum}&&sbjTitle=${sbjTitle}"><button type="button" class="btn btn-label-primary">삭제</button></a> --%>
<!-- 				<button id="btnDelete" type="button" class="btn btn-label-primary">삭제</button> -->
<%-- 			<% --%>
<!-- // 			} -->
<%-- 			%> --%>
<!-- 			</div> -->
<!-- 		</h3> -->
<%-- 		<span>작성자 : ${data.teaNmKor}</span> --%>
<%-- 		<span>작성일 : <fmt:formatDate pattern="yyyy.MM.dd" value="${data.snDt}"/></span> --%>
<%-- 		<span>조회수 : ${data.snHit}</span> --%>
<!-- 	</div> -->

<!-- 	<div class="card-body"> -->
<%-- 		${data.snContent} --%>
<!-- 	</div> -->

<!-- 	<div class="card-footer"> -->
<!-- 		<a href="#">이전글 중간공지</a><br/> -->
<!-- 		<a href="#">다음글 기말공지2</a> -->
<!-- 	</div> -->
<!-- </div> -->

<!-- <div class="card" style="height: auto;"> -->
<!-- 	<div class="card-header"> -->


<%-- 		<h3 class="card-title">${data.snTitle} --%>

<!-- 		</h3> -->
<%-- 		<span>작성자 : ${data.teaNmKor}</span> --%>
<%-- 		<span>작성일 : <fmt:formatDate pattern="yyyy.MM.dd" value="${data.snDt}"/></span> --%>
<%-- 		<span>조회수 : ${data.snHit}</span> --%>
<!-- 	</div> -->

<!-- 	<div class="card-body"> -->
<%-- 		${data.snContent} --%>
<!-- 	</div> -->

<!-- 	<div class="card-footer"> -->
<!-- 		<a href="#">이전글 중간공지</a><br/> -->
<!-- 		<a href="#">다음글 기말공지2</a> -->
<!-- 	</div> -->

<!-- 	<div class="col-md-9"> -->
<%-- 		<a href="/course/notice?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">목록</a> --%>
<!-- 	</div> -->
<!-- 	<div class="col-md-3"> -->
<%-- 		<% --%>
<!-- // 		if(userVO.getAuth().equals("ROLE_TEA")){ -->
<%-- 		%> --%>
<%-- 			<a href="/course/noticeModify?sbjNum=${sbjNum}&&snNum=${data.snNum}&&sbjTitle=${sbjTitle}"><button type="button" class="btn btn-label-primary">수정</button></a> --%>
<!-- 			<button id="btnDelete" type="button" class="btn btn-label-primary">삭제</button> -->
<%-- 		<% --%>
<!-- // 		} -->
<%-- 		%> --%>
<!-- 	</div> -->
<!-- </div> -->



<div class="card" style="height: auto;">
	<div class="card-body">
		<div class="row">
			<div class="col-lg-8 mx-auto">
				<div class="row g-3">
				<br /><br />
	              <div class="col-md-12" style="font-size: 2em;">
	              	${data.snTitle}
	              </div>
	              <hr />
	              <div class="col-md-8">
	                <label class="form-label" for="fullname">작성자 &nbsp;&nbsp;</label>
	                <span style="font-size: 1.0em;">${data.teaNmKor}</span>
	              </div>
	              <div class="col-md-6">
	                <label class="form-label" for="email">작성일 &nbsp;&nbsp;</label>
	                <span style="font-size: 1.0em;"><fmt:formatDate pattern="yyyy/MM/dd" value="${data.snDt}"/></span>
	              </div>
	              <div class="col-md-6">
	                <label class="form-label" for="email">조회수 &nbsp;&nbsp;</label>
	                <span style="font-size: 1.0em;">${data.snHit}</span>
	              </div>
	              <hr />
	              <div class="col-md-6" style="height: auto;">
	                ${data.snContent}
	              <br /><br /><br /><br /><br /><br /><br />
	              </div>
	              <hr />
	              <label class="form-label" for="email" style="font-weight: bold;">첨부파일 &nbsp;&nbsp;</label>
<%-- 	              <c:set var="list" value="${data.dfVOList}" /> --%>
<%-- 	              <c:if test="${list == null || list.size() == 0}"> --%>
<!-- 	              	<p>첨부된 파일이 없습니다.<p> -->
<%-- 	              </c:if> --%>
<%-- 	              <c:forEach var="dfVO" items="${data.dfVOList}" varStatus="stat"> --%>
	              <div class="col-md-12">

					<label class="form-label" for="">
						<c:set var="snFilename" value="${fn:split(data.snFilename,'_')}" />
						${snFilename[fn:length(snFilename)-1]}
	                </label>
	                <c:if test="${empty data.snFilename}">
	                	<p>첨부파일이 존재하지 않습니다.</p>
	                </c:if>
					<c:if test="${!empty data.snFilename}">
	                	<a href="/downloadFile?fileName=${data.snFilename}" type="button" class="btn btn-xs btn-dark">다운로드</a>
	                </c:if>
	              </div>
<%-- 	              </c:forEach> --%>
	              <hr />

	              <div class="col-md-9" style="padding-right: 0px;">
	              <a href="/course/notice?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}" class="btn btn-sm btn-secondary">목록보기</a>
	              </div>
<!-- 	              <div class="col-md-9"> -->
<!-- 	              </div> -->

				  <%
					if(userVO.getAuth().equals("ROLE_TEA")){
				  %>
<!-- 	              <div class="col-md-9"> -->
<!-- <!-- 	              <a href="/dpNotieBoard/dpNoticeBoardList" class="btn btn-sm btn-secondary">목록보기</a> -->
	              <div class="col-md-3 text-end">
	              	<a href="/course/noticeModify?sbjNum=${sbjNum}&&snNum=${data.snNum}&&sbjTitle=${sbjTitle}" style="margin-left: 55px;" class="btn btn-sm btn-warning">수정하기</a>
<%-- 	              <a href="/dpNotieBoard/delete?dnNum=${data.dnNum}" class="btn btn-sm btn-danger">삭제하기</a> --%>
					<button id="btnDelete" type="button" class="btn btn-sm btn-danger">삭제</button>
<%-- 					<a href="/dpNotieBoard/delete?dnNum=${data.dnNum}" class="btn btn-sm btn-danger">삭제하기</a> --%>
	              </div>
	              <%
					}
				  %>
	            </div>
			</div>
		</div>
	</div>
</div>








<script>
$("#btnDelete").on("click",function(){
	Swal.fire({
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
		    	  location.href = "/course/deleteNotice?sbjNum=${sbjNum}&&snNum=${data.snNum}&&sbjTitle=${sbjTitle}";
		      	});
			}
		});
});

</script>