<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- Vendors CSS -->
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/typeahead-js/typeahead.css" />
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/dropzone/dropzone.css" />

<script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>

<!-- <nav class="navbar navbar-expand-lg bg-white"> -->
<!-- 	<div class="container-fluid"> -->
<!-- 		<div class="collapse navbar-collapse" id="navbar-ex-6"> -->
<!-- 			<div class="navbar-nav me-auto"> -->
<%-- 				<a class="nav-item nav-link" href="/course/detail?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">주차</a> --%>
<%-- 				<a class="nav-item nav-link" href="/course/notice?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">공지</a> --%>
<%-- 				<a class="nav-item nav-link active" href="/course/attendStu?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">출석</a> --%>
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
	      	<a class="nav-item nav-link"
	      		href="/course/notice?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">공지</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link active"
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
<br />
<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bx-collection page-icon"></i>
	<span class="fw-light" onclick="location.href='/course/list'" style="cursor: pointer;">강의목록 / </span>
	<span onclick="location.href='/course/detail?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}'" class="categoryBar fw-light" style="cursor: pointer;">${sbjTitle} / </span>
	출석
</h4>
<div class="card">
	<div class="card-header">
			<div class="row" style="text-align:right;">
				<div class="row mb-3">
		            <label class="col-sm-2 col-form-label" for="basic-default-name">학번</label>
		            <div class="col-sm-2">
		              <input type="text" class="form-control" id="basic-default-name" value="${basicInfo.DEPT_NM}" disabled>
		            </div>
		            <label class="col-sm-1 col-form-label" for="basic-default-name">학과</label>
		            <div class="col-sm-2">
		              <input type="text" class="form-control" id="basic-default-name" value="${basicInfo.STU_NUM}" disabled>
		            </div>
		            <label class="col-sm-1 col-form-label" for="basic-default-name">이름</label>
		            <div class="col-sm-2">
		              <input type="text" class="form-control" id="basic-default-name" value="${basicInfo.STU_NM_KOR}" disabled>
		            </div>
	          	</div>
        	</div>
		</div>
		<br />

	<div class="card-body ">
		<br/>
		<table class="table table-bordered " style="margin:auto; margin-bottom:100px; text-align:center;">
		<thead class="table-active">

			<tr class="text-nowrap h-px-10" >
				<c:forEach begin="1" end="5"  varStatus="stat">
					<th colspan="${2*count}">${stat.count}주차</th>
				</c:forEach>

<%-- 				<th colspan="${count}">${stuAtList[0].atList[0].atWeek}주차</th> --%>
<%-- 				<th colspan="${count}">${stuAtList[0].atList[1].atWeek}주차</th> --%>
<%-- 				<th colspan="${count}">${stuAtList[0].atList[2].atWeek}주차</th> --%>
<%-- 				<th colspan="${count}">${stuAtList[0].atList[3].atWeek}주차</th> --%>
<%-- 				<th colspan="${count}">${stuAtList[0].atList[4].atWeek}주차</th> --%>
			</tr>
			<tr class="text-nowrap h-px-10">
			  <c:forEach var="dayMap" items="${dayList}" varStatus="stat">
				<th colspan="2">${dayMap.get("TIME_TCODE") }</th>
			  </c:forEach>
			  <c:forEach var="dayMap" items="${dayList}" varStatus="stat">
				<th colspan="2">${dayMap.get("TIME_TCODE") }</th>
			  </c:forEach>
			  <c:forEach var="dayMap" items="${dayList}" varStatus="stat">
				<th colspan="2">${dayMap.get("TIME_TCODE") }</th>
			  </c:forEach>
			  <c:forEach var="dayMap" items="${dayList}" varStatus="stat">
				<th colspan="2">${dayMap.get("TIME_TCODE") }</th>
			  </c:forEach>
			  <c:forEach var="dayMap" items="${dayList}" varStatus="stat">
				<th colspan="2">${dayMap.get("TIME_TCODE") }</th>
			  </c:forEach>
			</tr>

		</thead>
		<tbody>
			<tr class="fs-tiny">
			  <c:if test="${empty stuAtList1}">
			  	<c:forEach begin="1" end="5" varStatus="stat">
			  		<c:forEach var="dayMap" items="${dayList}" varStatus="stat">
			  			<td colspan="2">-</td>
			  		</c:forEach>
			  	</c:forEach>
			  </c:if>

<%-- 			<c:forEach begin="1" end="5"> --%>


			  <c:forEach var="atMap" items="${stuAtList1}" varStatus="stat">
			    <c:choose>
			      <c:when test="${atMap.AT_CHECK eq '1'}">
			      	<td colspan="2">O</td>
			      </c:when>
			      <c:when test="${atMap.AT_CHECK eq '0.67'}">
			      	<td colspan="2">△</td>
			      </c:when>
			      <c:when test="${atMap.AT_CHECK eq '0'}">
			      	<td colspan="2">X</td>
			      </c:when>
			    </c:choose>
			  </c:forEach>

			  <c:set var="dayListCnt" value="${fn:length(dayList) }" />
			  <c:set var="dayListCnt5" value="${fn:length(dayList)*5 }" />
			  <c:set var="stuAtList1LT" value="${fn:length(stuAtList1) }" />
			  <c:if test="${stuAtList1LT!=0 && dayListCnt5 > stuAtList1LT }">
			  	<c:forEach begin="${stuAtList1LT +1}" end="${dayListCnt5}">
			  		<td colspan="2">-</td>
			  	</c:forEach>
			  </c:if>


<%-- 			    ${atMap.AT_CHECK} --%>
<%-- 			    <td colspan="${count}"> --%>
<%-- 				<c:if test="${atMap.AT_CHECK eq 1}">1</c:if> --%>
<%-- 			    <c:if test="${atMap.AT_CHECK eq 0.67}">2</c:if> --%>
<%-- 			    <c:if test="${atMap.AT_CHECK eq 0}">3</c:if> --%>
<%-- 			    <c:if test="${atMap.AT_CHECK == null || atMap.AT_CHECK == ''}">4</c:if> --%>
<!-- 				</td> -->

<%-- 			</c:forEach> --%>
			</tr>
		</tbody>

		<thead class="table-active">

			<tr class="text-nowrap h-px-10" >
				<c:forEach begin="6" end="10"  varStatus="stat">
					<th colspan="${2*count}">${stat.count + 5}주차</th>
				</c:forEach>

<%-- 				<th colspan="${count}">${stuAtList[0].atList[5].atWeek}주차</th> --%>
<%-- 				<th colspan="${count}">${stuAtList[0].atList[6].atWeek}주차</th> --%>
<%-- 				<th colspan="${count}">${stuAtList[0].atList[7].atWeek}주차</th> --%>
<%-- 				<th colspan="${count}">${stuAtList[0].atList[8].atWeek}주차</th> --%>
<%-- 				<th colspan="${count}">${stuAtList[0].atList[9].atWeek}주차</th> --%>
			</tr>
			<tr class="text-nowrap h-px-10">
			  <c:forEach var="dayMap" items="${dayList}" varStatus="stat">
				<th colspan="2">${dayMap.get("TIME_TCODE") }</th>
			  </c:forEach>
			  <c:forEach var="dayMap" items="${dayList}" varStatus="stat">
				<th colspan="2">${dayMap.get("TIME_TCODE") }</th>
			  </c:forEach>
			  <c:forEach var="dayMap" items="${dayList}" varStatus="stat">
				<th colspan="2">${dayMap.get("TIME_TCODE") }</th>
			  </c:forEach>
			  <c:forEach var="dayMap" items="${dayList}" varStatus="stat">
				<th colspan="2">${dayMap.get("TIME_TCODE") }</th>
			  </c:forEach>
			  <c:forEach var="dayMap" items="${dayList}" varStatus="stat">
				<th colspan="2">${dayMap.get("TIME_TCODE") }</th>
			  </c:forEach>
			</tr>
		</thead>
		<tbody>
			<tr class="fs-tiny">
			  <c:if test="${empty stuAtList2}">
			  	<c:forEach begin="1" end="5" varStatus="stat">
			  		<c:forEach var="dayMap" items="${dayList}" varStatus="stat">
			  			<td colspan="2">-</td>
			  		</c:forEach>
			  	</c:forEach>
			  </c:if>

			  <c:forEach var="atMap" items="${stuAtList2}" varStatus="stat">
			  <c:choose>
			      <c:when test="${atMap.AT_CHECK eq '1'}">
			      	<td colspan="2">O</td>
			      </c:when>
			      <c:when test="${atMap.AT_CHECK eq '0.67'}">
			      	<td colspan="2">△</td>
			      </c:when>
			      <c:when test="${atMap.AT_CHECK eq '0'}">
			      	<td colspan="2">X</td>
			      </c:when>
			    </c:choose>
			  </c:forEach>

			  <c:set var="dayListCnt" value="${fn:length(dayList) }" />
			  <c:set var="dayListCnt5" value="${fn:length(dayList)*5 }" />
			  <c:set var="stuAtList2LT" value="${fn:length(stuAtList2) }" />
			  <c:if test="${stuAtList2LT!=0 && dayListCnt5 > stuAtList2LT }">
			  	<c:forEach begin="${stuAtList2LT +1}" end="${dayListCnt5}">
			  		<td colspan="2">-</td>
			  	</c:forEach>
			  </c:if>

			</tr>
		</tbody>

		<thead class="table-active">

			<tr class="text-nowrap h-px-10" >
				<c:forEach begin="6" end="10"  varStatus="stat">
					<th colspan="${2*count}">${stat.count + 10}주차</th>
				</c:forEach>

<%-- 				<th colspan="${count}">${stuAtList[0].atList[10].atWeek}주차</th> --%>
<%-- 				<th colspan="${count}">${stuAtList[0].atList[11].atWeek}주차</th> --%>
<%-- 				<th colspan="${count}">${stuAtList[0].atList[12].atWeek}주차</th> --%>
<%-- 				<th colspan="${count}">${stuAtList[0].atList[13].atWeek}주차</th> --%>
<%-- 				<th colspan="${count}">${stuAtList[0].atList[14].atWeek}주차</th> --%>
			</tr>
			<tr class="text-nowrap h-px-10">
			  <c:forEach var="dayMap" items="${dayList}" varStatus="stat">
				<th colspan="2">${dayMap.get("TIME_TCODE") }</th>
			  </c:forEach>
			  <c:forEach var="dayMap" items="${dayList}" varStatus="stat">
				<th colspan="2}">${dayMap.get("TIME_TCODE") }</th>
			  </c:forEach>
			  <c:forEach var="dayMap" items="${dayList}" varStatus="stat">
				<th colspan="2">${dayMap.get("TIME_TCODE") }</th>
			  </c:forEach>
			  <c:forEach var="dayMap" items="${dayList}" varStatus="stat">
				<th colspan="2">${dayMap.get("TIME_TCODE") }</th>
			  </c:forEach>
			  <c:forEach var="dayMap" items="${dayList}" varStatus="stat">
				<th colspan="2">${dayMap.get("TIME_TCODE") }</th>
			  </c:forEach>

			</tr>
		</thead>
		<tbody>
			<tr class="fs-tiny">

			  <c:if test="${empty stuAtList3}">
			  	<c:forEach begin="1" end="5" varStatus="stat">
			  		<c:forEach var="dayMap" items="${dayList}" varStatus="stat">
			  			<td colspan="2">-</td>
			  		</c:forEach>
			  	</c:forEach>
			  </c:if>

			  <c:forEach var="atMap" items="${stuAtList3}" varStatus="stat">
			  <c:choose>
			      <c:when test="${atMap.AT_CHECK eq '1'}">
			      	<td colspan="2">O</td>
			      </c:when>
			      <c:when test="${atMap.AT_CHECK eq '0.67'}">
			      	<td colspan="2}">△</td>
			      </c:when>
			      <c:when test="${atMap.AT_CHECK eq '0'}">
			      	<td colspan="2">X</td>
			      </c:when>
			    </c:choose>
			  </c:forEach>


			  <c:set var="dayListCnt" value="${fn:length(dayList) }" />
			  <c:set var="dayListCnt5" value="${fn:length(dayList)*5 }" />
			  <c:set var="stuAtList3LT" value="${fn:length(stuAtList3) }" />
			  <c:if test="${stuAtList3LT!=0 && dayListCnt5 > stuAtList3LT }">
			  	<c:forEach begin="${stuAtList3LT +1}" end="${dayListCnt5}">
			  		<td colspan="2">-</td>
			  	</c:forEach>
			  </c:if>


			</tr>
		</tbody>

	</table>



<!-- 		<table class="table table-bordered " style="margin:auto; margin-bottom:100px; text-align:center;"> -->
<!-- 			<thead class="table-active"> -->

<!-- 				<tr class="text-nowrap h-px-10" > -->
<%-- 					<th colspan="2">${stuAtList[0].atList[0].atWeek}주차</th>  --%>
<%-- 					<th colspan="2">${stuAtList[0].atList[1].atWeek}주차</th> --%>
<%-- 					<th colspan="2">${stuAtList[0].atList[2].atWeek}주차</th> --%>
<%-- 					<th colspan="2">${stuAtList[0].atList[3].atWeek}주차</th> --%>
<%-- 					<th colspan="2">${stuAtList[0].atList[4].atWeek}주차</th> --%>
<!-- 				</tr>  -->
<!-- 				<tr class="text-nowrap h-px-10"> -->
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<%-- 					<th colspan="2">${dayMap.get("TIME_TCODE") }</th>  --%>
<%-- 				  </c:forEach> --%>
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<%-- 					<th colspan="2">${dayMap.get("TIME_TCODE") }</th>  --%>
<%-- 				  </c:forEach> --%>
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<%-- 					<th colspan="2">${dayMap.get("TIME_TCODE") }</th>  --%>
<%-- 				  </c:forEach> --%>
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<%-- 					<th colspan="2">${dayMap.get("TIME_TCODE") }</th>  --%>
<%-- 				  </c:forEach> --%>
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<%-- 					<th colspan="2">${dayMap.get("TIME_TCODE") }</th>  --%>
<%-- 				  </c:forEach>			   --%>
<!-- 				</tr> -->
<!-- 			</thead> -->
<!-- 			<tbody> -->
<!-- 				<tr class="fs-tiny"> -->
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<%-- 					<td colspan="2">O<c:forEach var="atList" items="${stuAtList[0].atList}" varStatus="stat"><c:if test="${atList[0]}"></c:if> </c:forEach> </td> --%>
<%-- 				  </c:forEach> --%>
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<!-- 					<td colspan="2">O</td> -->
<%-- 				  </c:forEach> --%>
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<!-- 					<td colspan="2">O</td> -->
<%-- 				  </c:forEach> --%>
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<!-- 					<td colspan="2">O</td> -->
<%-- 				  </c:forEach> --%>
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<!-- 					<td colspan="2">O</td> -->
<%-- 				  </c:forEach>	 --%>
<!-- 				</tr> -->
<!-- 			</tbody> -->

<!-- 			<thead class="table-active"> -->

<!-- 				<tr class="text-nowrap h-px-10" > -->
<%-- 					<th colspan="2">${stuAtList[0].atList[5].atWeek}주차</th>  --%>
<%-- 					<th colspan="2">${stuAtList[0].atList[6].atWeek}주차</th> --%>
<%-- 					<th colspan="2">${stuAtList[0].atList[7].atWeek}주차</th> --%>
<%-- 					<th colspan="2">${stuAtList[0].atList[8].atWeek}주차</th> --%>
<%-- 					<th colspan="2">${stuAtList[0].atList[9].atWeek}주차</th> --%>
<!-- 				</tr>  -->
<!-- 				<tr class="text-nowrap h-px-10"> -->
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<%-- 					<th colspan="2">${dayMap.get("TIME_TCODE") }</th>  --%>
<%-- 				  </c:forEach> --%>
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<%-- 					<th colspan="2">${dayMap.get("TIME_TCODE") }</th>  --%>
<%-- 				  </c:forEach> --%>
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<%-- 					<th colspan="2">${dayMap.get("TIME_TCODE") }</th>  --%>
<%-- 				  </c:forEach> --%>
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<%-- 					<th colspan="2">${dayMap.get("TIME_TCODE") }</th>  --%>
<%-- 				  </c:forEach> --%>
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<%-- 					<th colspan="2">${dayMap.get("TIME_TCODE") }</th>  --%>
<%-- 				  </c:forEach> --%>
<!-- 				</tr> -->
<!-- 			</thead> -->
<!-- 			<tbody> -->
<!-- 				<tr class="fs-tiny"> -->
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<!-- 					<td colspan="2">O</td> -->
<%-- 				  </c:forEach> --%>
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<!-- 					<td colspan="2">O</td> -->
<%-- 				  </c:forEach> --%>
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<!-- 					<td colspan="2">O</td> -->
<%-- 				  </c:forEach> --%>
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<!-- 					<td colspan="2">O</td> -->
<%-- 				  </c:forEach> --%>
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<!-- 					<td colspan="2">O</td> -->
<%-- 				  </c:forEach> --%>
<!-- 				</tr> -->
<!-- 			</tbody> -->

<!-- 			<thead class="table-active"> -->

<!-- 				<tr class="text-nowrap h-px-10" > -->
<%-- 					<th colspan="2">${stuAtList[0].atList[10].atWeek}주차</th>  --%>
<%-- 					<th colspan="2">${stuAtList[0].atList[11].atWeek}주차</th> --%>
<%-- 					<th colspan="2">${stuAtList[0].atList[12].atWeek}주차</th> --%>
<%-- 					<th colspan="2">${stuAtList[0].atList[13].atWeek}주차</th> --%>
<%-- 					<th colspan="2">${stuAtList[0].atList[14].atWeek}주차</th> --%>
<!-- 				</tr>  -->
<!-- 				<tr class="text-nowrap h-px-10"> -->
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<%-- 					<th colspan="2">${dayMap.get("TIME_TCODE") }</th>  --%>
<%-- 				  </c:forEach> --%>
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<%-- 					<th colspan="2">${dayMap.get("TIME_TCODE") }</th>  --%>
<%-- 				  </c:forEach> --%>
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<%-- 					<th colspan="2">${dayMap.get("TIME_TCODE") }</th>  --%>
<%-- 				  </c:forEach> --%>
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<%-- 					<th colspan="2">${dayMap.get("TIME_TCODE") }</th>  --%>
<%-- 				  </c:forEach> --%>
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<%-- 					<th colspan="2">${dayMap.get("TIME_TCODE") }</th>  --%>
<%-- 				  </c:forEach> --%>
<!-- 				</tr> -->
<!-- 			</thead> -->
<!-- 			<tbody> -->
<!-- 				<tr class="fs-tiny"> -->
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<!-- 					<td colspan="2">O</td> -->
<%-- 				  </c:forEach> --%>
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<!-- 					<td colspan="2">O</td> -->
<%-- 				  </c:forEach> --%>
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<!-- 					<td colspan="2">O</td> -->
<%-- 				  </c:forEach> --%>
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<!-- 					<td colspan="2">O</td> -->
<%-- 				  </c:forEach> --%>
<%-- 				  <c:forEach var="dayMap" items="${dayList}" varStatus="stat"> --%>
<!-- 					<td colspan="2">O</td> -->
<%-- 				  </c:forEach> --%>
<!-- 				</tr> -->
<!-- 			</tbody> -->

<!-- 		</table> -->
	</div>
</div>

<script src="/resources/sneat/assets/vendor/libs/dropzone/dropzone.js"></script>
<!-- Page JS -->
<script src="/resources/sneat/assets/js/forms-file-upload.js"></script>

<script>
$(document).ready(function(){

});
</script>