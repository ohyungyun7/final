<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
.card{
	min-height: 100%;
}
/* .categoryBar{ */
/* 	color: gray; */
/* } */
.si_target{
	width: 50%;
	text-align: center;
}
thead{
	text-align: center;
}
.table > thead {
	vertical-align: middle;
}
th{
 	white-space: pre-line;
 	text-align: center;
 }
tr td:not(:first-of-type) {
  text-align: center;
}
.div-header{
	text-align: right;
	margin: 5px;
	padding-right: 1.625rem;
}
.innerCard{
	border: 1px solid lightgray;
	border-radius: 5px;
	margin: 5px;
	padding: 10px;
}
.search-sel{
	width: 20%;
	display: inline;
}
textarea{
	resize: none;
	width: 100%;
	maxlength: 300;
}
</style>

<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bxs-report page-icon"></i>
	<span class="fw-light" >성적 조회  / </span>금학기 성적 조회
</h4>

<div class="card">

	<div class="card-header p-3">
		<div class="innerCard">
			<div class="row g-3 mb-2">
				<div class="col-md-6">
					<div class="row infoDiv">
						<label class="col-sm-2 col-form-label text-sm-end" for="year">연도</label>
						<div class="col-sm-3">
							<input type="text" id="year" class="form-control" value="${courseListVO.csYear}" readonly>
						</div>

						<label class="col-sm-2 col-form-label text-sm-end" for="semester">학기</label>
						<div class="col-sm-3">
							<input type="text" id="semester" class="form-control" value="${courseListVO.csSemester}" readonly>
						</div>
					</div>
				</div>

				<div class="col-md-6">
					<div class="row infoDiv">
						<label class="col-sm-3 col-form-label text-sm-end">학번/성명</label>
						<div class="col-sm-4">
							<input type="text" id="stuNum" class="form-control" value="${courseListVO.stuNum}" readonly>
						</div>
						<div class="col-sm-4">
							<input type="text" id="stuNmKor" class="form-control" value="${courseListVO.stuNmKor}" readonly>
						</div>
					</div>
				</div>
			</div>
			<div class="row g-3">
				<div class="col-md-6">
					<div class="row infoDiv">
						<label class="col-sm-2 col-form-label text-sm-end" for="countCourse">수강 과목수</label>
						<div class="col-sm-3">
							<input type="text" id="countCourse" class="form-control" value="${courseListVO.countSbjNum}" readonly>
						</div>

						<label class="col-sm-2 col-form-label text-sm-end" for="recode">수강 학점</label>
						<div class="col-sm-3">
							<input type="text" id="recode" class="form-control" value="${courseListVO.sumsbjRecode}" readonly>
						</div>
					</div>
				</div>

				<div class="col-md-6">
					<div class="row infoDiv">
						<label class="col-sm-3 col-form-label text-sm-end">평점 평균</label>
						<div class="col-sm-4">
							<input type="text" id="stuNum" class="form-control" value="${courseListVO.avgClFscore}" readonly>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="card-body">
		<table class="table table-bordered">
			<thead class="table-active">
				<tr class="text-nowrap">
					<th>이수구분</th>
					<th class="si_target">과목명</th>
					<th>교수명</th>
					<th>학점</th>
					<th>성적</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="courseListVO" items="${myCourseList}" varStatus="stat">
					<tr style="text-align: center;">
						<td>${courseListVO.sbjRs}</td>
						<td>${courseListVO.sbjTitle}</td>
						<td>${courseListVO.teaNmKor}</td>
						<td>${courseListVO.sbjRecode}</td>
						<td>${courseListVO.subFscore}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</div>
