<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="kr.or.ddit.vo.UserVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- Vendors CSS -->
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/typeahead-js/typeahead.css" />
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/dropzone/dropzone.css" />

<script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>

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
	userVO = (UserVO) session.getAttribute("userVO");
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

<%-- ${data } --%>
<div class="card">
<div class="card-body">
	<div class="row">
	<!-- Vertical Scrollbar -->
	<div class="col-lg-8 mx-auto">
		<div class="row g-3">
		<br /><br />
	            <div class="col-md-12" style="font-size: 2em;">
	            	${data.asTitle}
	            </div>
	            <hr />
<!-- 	            <div class="col-md-8"> -->
<!-- 	              <label class="form-label" for="fullname">작성자 &nbsp;&nbsp;</label> -->
<%-- 	              <span style="font-size: 1.0em;">${data.teaNmKor}</span> --%>
<!-- 	            </div> -->
<!-- 	            <div class="col-md-6"> -->
				  <span>
	              <label class="form-label" for="email">제출기간 &nbsp;&nbsp;</label>

					  	<fmt:formatDate pattern="yyyy.MM.dd" value="${data.asSdt}"/>
					  	 -
					  	<fmt:formatDate pattern="yyyy.MM.dd" value="${data.asEdt}"/>
					  </span>
<%-- 	              <span style="font-size: 1.0em;"><fmt:formatDate pattern="yyyy/MM/dd" value="${data.snDt}"/></span> --%>
<!-- 	            </div> -->
<!-- 	            <div class="col-md-6"> -->
<!-- 	              <label class="form-label" for="email">조회수 &nbsp;&nbsp;</label> -->
<%-- 	              <span style="font-size: 1.0em;">${data.snHit}</span> --%>
<!-- 	            </div> -->
				<hr />
	            <div class="col-md-12" style="height: auto;">
	              ${data.asContent}
	            <br /><br /><br /><br /><br /><br /><br />
	            </div>

<!-- 	            <label class="form-label" for="email" style="font-weight: bold;">첨부파일 &nbsp;&nbsp;</label> -->
<!-- 	            <div class="col-md-12"> -->

<!-- 			<label class="form-label" for=""> -->
<%-- 				<c:set var="snFilename" value="${fn:split(data.snFilename,'_')}" /> --%>
<%-- 				${snFilename[fn:length(snFilename)-1]} --%>
<!-- 	              </label> -->

<%-- 	              <a href="/course/downloadFile?fileName=${data.snFilename}" type="button" class="btn btn-xs btn-dark">다운로드</a> --%>
<!-- 	            </div> -->


		  <%
			if(userVO.getAuth().equals("ROLE_TEA")){
		  %>
		  		<hr />
	            <div class="col-md-9" style="padding-right: 0px;">
	            <a href="/course/assignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}" class="btn btn-sm btn-secondary">목록보기</a>
	            </div>
	            <div class="col-md-3 text-end">
	            	<a href="/course/assignmentModify?sbjNum=${sbjNum}&&asNum=${data.asNum}&&sbjTitle=${sbjTitle}" style="margin-left: 55px;" class="btn btn-sm btn-warning">수정하기</a>
			<button id="btnDelete" type="button" class="btn btn-sm btn-danger">삭제</button>
	            </div>
	            <%
			}
		  %>
	          </div>
			</div>
	<!--/ Vertical Scrollbar -->

		<%
		//if(userVO.getAuth().equals("ROLE_TEA")) {
		%>
<!-- 		<div> -->
<!-- 		<button type="button" id="btnDelete" class="btn btn-secondary">삭제</button> -->
<%-- 		<a href="/course/assignmentModify?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}&&asNum=${data.asNum}"><button type="button" class="btn btn-primary">수정</button></a> --%>
<%-- 		<a href="/course/assignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}"><button type="button" class="btn btn-info">리스트</button></a> --%>
<!-- 		</div> -->
<%-- 		<% --%>
<!-- // 		//} -->
<%-- 		%> --%>
<!-- 	</div> -->
	<%
	if(userVO.getAuth().equals("ROLE_STU")) {
	%>
	<hr style="border-top: 1px dashed #bbb;"/>
	<div class="row">
	  <div class="col-xl">
	    <div class="card mb-4">
	      <div class="card-header d-flex justify-content-between align-items-center">
	        <h5 class="mb-0">과제 제출</h5>
<!-- 	        <small class="text-muted float-end">Default label</small> -->
	      </div>
	      <div class="card-body">
	        <form action="/course/submitAssignment?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
<%-- 	        <c:if test="${submitData == null or submitData == '' }"> --%>
<!-- 	        	<input type="hidden" name="sbmAnum" value=""> -->
<%-- 	        </c:if> --%>
	        <c:if test="${submitData != null}">
	        	<input type="hidden" name="sbmNum" value="${submitData.sbmNum}">
	        	<input type="hidden" name="sbmAnum" value="${submitData.sbmAnum}">
	        </c:if>
	        <c:if test="${submitData == null }">
	        	<input type="hidden" name="sbmNum" value="${sbmNum}">
	        	<input type="hidden" name="sbmAnum" value="${data.asNum}">
	        </c:if>
	        <input type="hidden" name="sbjTitle" value="${sbjTitle}">
			<input type="hidden" name="sbjNum" value="${sbjNum}">
			<input type="hidden" name="stuNum" value="<%=userVO.getUsername()%>">

	          <div class="mb-3">
	            <label class="form-label" for="basic-default-message">내용</label>
	            <textarea id="basic-default-message" name="sbmContent" class="form-control" placeholder="과제 내용을 입력하세요" style="height: 6.25em; resize: none;">${submitData.sbmContent}</textarea>
	          </div>

				<div class="mb-3">
				  <label for="formFileMultiple" class="form-label">파일 업로드</label>
				  <c:if test="${submitData != null}">
<%-- 				  	<input type="text" name="fileName" value="${submitData.sbmFilename}" style="width: 300px;"> --%>
				  	<input class="form-control" type="file" id="formFileMultiple" name="uploadFile" required /> <br />
<%-- 				  	업로드된 파일 : <input type="text" value="${submitData.sbmFilename}" /> --%>
			      <hr />
			      	<c:set var="filename" value="${fn:split(fn,'_')}" />
				  	<strong>업로드한 파일</strong> : ${filename[fn:length(filename)-1]}
				  <hr />
				  </c:if>
				  <c:if test="${submitData == null}">
<!-- 				  	<input type="text" name="fileName"> -->
				  	<input class="form-control" type="file" id="formFileMultiple" name="uploadFile" required />
				  </c:if>

				</div>

	          <button type="submit" class="btn btn-primary">저장</button>
	          <a href="/course/assignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}"><button type="button" class="btn btn-info">목록</button></a>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>
	<%
	}
	%>

</div>
<!-- card-body end -->
</div>
<!-- card end -->




<script src="/resources/sneat/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="/resources/sneat/assets/js/extended-ui-perfect-scrollbar.js"></script>
<!-- Vendors JS -->
<script src="/resources/sneat/assets/vendor/libs/dropzone/dropzone.js"></script>
<script src="/resources/sneat/assets/js/forms-file-upload.js"></script>
<!-- Page JS -->

<script>
$("#btnDelete").on("click",function(){
	Swal.fire({
// 		   title: '삭제하시겠습니까?',
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
		    	  location.href = "/course/deleteAssignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}&&asNum=${data.asNum}";
		      	});
			}
		});
});
</script>