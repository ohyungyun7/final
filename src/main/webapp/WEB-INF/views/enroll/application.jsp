<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style type="text/css">
.card{
	min-height: 100%;
}
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
tr td {
  text-align: center;
}
.div-header{
	text-align: right;
	margin: 5px;
	padding-top: 1.625rem;
	padding-bottom: 1rem;
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
.border-box{
	border: 1px solid lightgray;
	border-radius: 5px;
}
textarea{
	resize: none;
	width: 100%;
	maxlength: 100;
}
.modal-row{
	margin-bottom: 10px;
}
.timeTable td{
	height: 50px;
}
.timeTable td:first-child{
	--bs-table-accent-bg: var(--bs-table-active-bg);
	padding: 0px;
}
.timeTh-header{
	width: 8%;
}
.timeTable_td{
	width: 18%;
}
.modal-xl{
	--bs-modal-width: 1480px;
}
</style>

<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bx-collection page-icon"></i>
	<span class="fw-light">강의 / </span>강의 개설 신청
</h4>

<div class="card">
	<div class="div-header">
		<button type="button" class="btn btn-label-primary btnWrite" 
			data-bs-toggle="modal" data-bs-target="#spModal">개설 신청</button>
	</div>

 	<div class="container">
		<table class="table table-bordered" id="enrollTable">
			<thead class="table-active">
				<tr class="text-nowrap">
					<th class="si_target">강의명</th>
					<th>학년</th>
					<th>학점</th>
					<th>정원</th>
					<th>구분</th>
					<th>상태</th>
					<th>강의실 선택</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="subjectVO" items="${subjectVOList}" varStatus="status">
					<tr>
						<input type="hidden" class="sbjNum" value="${subjectVO.sbjNum}" />
						<td>${subjectVO.sbjTitle}</td>
						<td>
							<c:choose>
								<c:when test="${subjectVO.sbjGrade == 0}">전체</c:when>
								<c:otherwise>${subjectVO.sbjGrade}</c:otherwise>
							</c:choose>
						</td>
						<td>${subjectVO.sbjRecode}</td>
						<td>${subjectVO.sbjPersonnel}</td>
						<td>
							<c:choose>
								<c:when test="${subjectVO.deptNum == 0}">교양</c:when>
								<c:otherwise>전공</c:otherwise>
							</c:choose>
							<c:if test="${subjectVO.sbjRs == 1}">필수</c:if>
							<c:if test="${subjectVO.sbjRs == 2}">선택</c:if>
						</td>
						<c:choose>
							<c:when test="${subjectVO.sbjYn == 1}">
								<td>승인</td>
								<td>
									<c:if test="${subjectVO.count > 0 }">O</c:if>
									<c:if test="${subjectVO.count eq 0 }">X</c:if>
								</td>
								<td>
									<div class="dropdown">
										<button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></button>
										<div class="dropdown-menu">
											<a class="dropdown-item btnCheck" href="javascript:void(0);" 
												data-bs-toggle="modal" data-bs-target="#spModal"><i class='bx bx-list-check'></i> 강의계획서 보기</a>
											<a class="dropdown-item btnTimeTable" href="javascript:void(0);" 
												data-bs-toggle="modal" data-bs-target="#timeModal"><i class='bx bx-calendar-check'></i> 강의실/시간 선택</a>
										</div>
									</div>
			            		</td>
							</c:when>
							<c:when test="${subjectVO.sbjYn == 2}">
								<td>반려</td>
								<td>-</td>
								<td>
									<div class="dropdown">
										<button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></button>
										<div class="dropdown-menu">
											<a class="dropdown-item btnSbjComre" href="javascript:void(0);" 
												data-bs-toggle="modal" data-bs-target="#comreModal"><i class='bx bx-message-x'></i> 반려 사유</a>
											<a class="dropdown-item btnModify" href="javascript:void(0);" 
												data-bs-toggle="modal" data-bs-target="#spModal"><i class='bx bx-repost'></i> 수정 및 재신청</a>
										</div>
									</div>
			            		</td>
							</c:when>
							<c:otherwise>
								<td>대기</td>
								<td>-</td>
								<td>
									<div class="dropdown">
										<button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></button>
										<div class="dropdown-menu">
											<a class="dropdown-item btnModify" href="javascript:void(0);" 
												data-bs-toggle="modal" data-bs-target="#spModal"><i class="bx bx-edit-alt me-1"></i> 수정</a>
											<a class="dropdown-item btnDelete" href="javascript:void(0);"><i class="bx bx-trash me-1"></i> 신청 취소</a>
										</div>
									</div>
			            		</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	
	</div>
	
</div>

<div class="modal fade" id="spModal" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered1 modal-simple modal-add-new-cc">
		<div class="modal-content p-3 p-md-5">
			<div class="modal-body">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				<form id="subjectForm" method="post">
					<sec:csrfInput/>
					<div class="row g-3">
						<div class="col-md-12 text-end formButtons">
							<button type="button" class="btn btn-label-secondary" id="btnAuto">자동채우기</button>
							<button type="submit" class="btn btn-primary">등록</button>
							<button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">취소</button>
						</div>
						
						<input type="hidden" name="sbjNum" class="sbjNum" id="sbjNum" value="" />
						<input type="hidden" name="spNum" class="spNum" id="spNum" value="" />
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="sbjTitle">강의명</label>
								<div class="col-sm-10">
									<input type="text" id="sbjTitle" name="sbjTitle" class="form-control" maxlength="20" required />
								</div>
							</div>
						</div>
						
						<div class="col-md-4">
							<div class="row">
								<label class="col-sm-6 col-form-label text-sm-end" for="sbjGrade">학년</label>
								<div class="col-sm-6">
									<select id="sbjGrade" name="sbjGrade" class="form-select" aria-label="Default select example">
										<option value="0">전체</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
									</select>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="row">
								<label class="col-sm-6 col-form-label text-sm-end" for="sbjRecode">학점</label>
								<div class="col-sm-6">
									<select id="sbjRecode" name="sbjRecode" class="form-select" aria-label="Default select example">
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="row">
								<label class="col-sm-6 col-form-label text-sm-end" for="sbjPersonnel">정원</label>
								<div class="col-sm-6">
									<input type="number" id="sbjPersonnel" name="sbjPersonnel" class="form-control" required />
								</div>
							</div>
						</div>
						
						<div class="col-md-4">
							<div class="row">
								<label class="col-sm-6 col-form-label text-sm-end" for="deptNum">전공/교양</label>
								<div class="col-sm-6">
									<select id="deptNum" name="deptNum" class="form-select" aria-label="Default select example">
										<option value="1">전공</option>
										<option value="0">교양</option>
									</select>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="row">
								<label class="col-sm-6 col-form-label text-sm-end" for="sbjRs">필수/선택</label>
								<div class="col-sm-6">
									<select id="sbjRs" name="sbjRs" class="form-select" aria-label="Default select example">
										<option value="1">필수</option>
										<option value="2">선택</option>
									</select>
								</div>
							</div>
						</div>
						
						<hr />
						<div class="col-md-12">
							<h6 class="col-md-2 text-sm-end">점수비율</h6>
						</div>
						
						<div class="col-md-4">
							<div class="row">
								<label class="col-sm-6 col-form-label text-sm-end" for="spMiddleratio">중간</label>
								<div class="col-sm-6">
									<input type="number" id="spMiddleratio" name="spMiddleratio" class="form-control" required />
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="row">
								<label class="col-sm-6 col-form-label text-sm-end" for="spFinalratio">기말</label>
								<div class="col-sm-6">
									<input type="number" id="spFinalratio" name="spFinalratio" class="form-control" required />
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="row">
								<label class="col-sm-6 col-form-label text-sm-end" for="spHwratio">과제</label>
								<div class="col-sm-6">
									<input type="number" id="spHwratio" name="spHwratio" class="form-control" required />
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="row">
								<label class="col-sm-6 col-form-label text-sm-end" for="spAttratio">출석</label>
								<div class="col-sm-6">
									<input type="number" id="spAttratio" name="spAttratio" class="form-control" required />
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="row">
								<label class="col-sm-6 col-form-label text-sm-end" for="spEtcratio">기타</label>
								<div class="col-sm-6">
									<input type="number" id="spEtcratio" name="spEtcratio" class="form-control" required />
								</div>
							</div>
						</div>
						<hr />
						
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="spTextbook">참고 교재</label>
								<div class="col-sm-10">
									<textarea class="form-control" id="spTextbook" name="spTextbook" rows="3" cols=""></textarea>
								</div>
							</div>
						</div>
						
						<div class="col-md-4">
							<div class="row">
								<label class="col-sm-6 col-form-label text-sm-end" for="sbjRs">온라인 수업 여부</label>
								<div class="col-sm-6">
									<select id="sbjYn" name="sbjYn" class="form-select" aria-label="Default select example">
										<option value="0">N</option>
										<option value="1">Y</option>
									</select>
								</div>
							</div>
						</div>
												
						<hr />
						<div class="col-md-12">
							<h6 class="col-md-2 text-sm-end">학습목차</h6>
						</div>
						

						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_1">1주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_1" name="slTarget_1" class="form-control slTarget" maxlength="1000" required />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_2">2주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_2" name="slTarget_2" class="form-control slTarget" maxlength="1000" required />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_3">3주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_3" name="slTarget_3" class="form-control slTarget" maxlength="1000" required />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_4">4주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_4" name="slTarget_4" class="form-control slTarget" maxlength="1000" required />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_5">5주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_5" name="slTarget_5" class="form-control slTarget" maxlength="1000" required />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_6">6주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_6" name="slTarget_6" class="form-control slTarget" maxlength="1000" required />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_7">7주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_7" name="slTarget_7" class="form-control slTarget" maxlength="1000" required />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_8">8주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_8" name="slTarget_8" class="form-control slTarget" maxlength="1000" required />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_9">9주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_9" name="slTarget_9" class="form-control slTarget" maxlength="1000" required />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_10">10주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_10" name="slTarget_10" class="form-control slTarget" maxlength="1000" required />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_11">11주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_11" name="slTarget_11" class="form-control slTarget" maxlength="1000" required />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_12">12주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_12" name="slTarget_12" class="form-control slTarget" maxlength="1000" required />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_13">13주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_13" name="slTarget_13" class="form-control slTarget" maxlength="1000" required />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_14">14주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_14" name="slTarget_14" class="form-control slTarget" maxlength="1000" required />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_15">15주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_15" name="slTarget_15" class="form-control slTarget" maxlength="1000" required />
								</div>
							</div>
						</div>
						
						<div class="col-md-12 text-center formButtons">
							<button type="submit" class="btn btn-primary me-sm-3 me-1">등록</button>
							<button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="comreModal" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered modal-simple modal-add-new-cc">
		<div class="modal-content p-3 p-md-5">
			<div class="modal-body">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				<div class="row g-3">
					<div class="col-md-12">
						<h4 class="col-md-2">반려사유</h4>
					</div>
					<c:forEach var="subjectVO" items="${subjectVOList}" varStatus="status">
						<div class="col-md-12 innerCard sbjComre" id="sbjComre_${subjectVO.sbjNum}" style="display: none; height: calc(100px - 1px);">
							${subjectVO.sbjComre}
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="timeModal" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-xl modal-dialog-centered1 modal-simple modal-add-new-cc">
		<div class="modal-content p-3 p-md-5" style="min-height: 110%; position: relative; top: -20px;">
			<div class="modal-body">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				<form id="timeForm" method="post" action="/enroll/insertTime" onsubmit="return checkTime()">
					<sec:csrfInput/>
					<input type="hidden" name="sbjNum" id="sbjNum_time" /> 
					<input type="hidden" name="sel_times" id="sel_times" />
					<div class="row g-3">
						<div class="col-md-12 text-end formButtons">
							<button type="button" class="btn btn-label-secondary" id="btnAuto">자동채우기</button>
							<button type="button" class="btn btn-primary timeTable_btnModi">수정</button>
							<button type="submit" class="btn btn-primary timeTable_btnSubmit">등록</button>
							<button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">취소</button>
						</div>
						
						<h5 class="col-md-12">강의실/시간 선택</h5>
						<hr />
						
						<div class="innerCard">
							<div class="row g-3">
								<div class="col-md-6">
									<div class="row">
										<label class="col-sm-2 col-form-label text-sm-end" for="sbjTitle_timeT">강의명</label>
										<div class="col-sm-10">
											<input type="text" id="sbjTitle_timeT" class="form-control" disabled />
										</div>
									</div>
								</div>
								<div class="col-md-6"></div>
								
								<div class="col-md-3">
									<div class="row">
										<label class="col-sm-4 col-form-label text-sm-end" for="sbjGrade_timeT">학년</label>
										<div class="col-sm-8">
											<input type="text" id="sbjGrade_timeT" class="form-control" disabled />
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="row">
										<label class="col-sm-4 col-form-label text-sm-end" for="deptNum_timeT">구분</label>
										<div class="col-sm-8">
											<input type="text" id="deptNum_timeT" class="form-control" disabled />
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="row">
										<label class="col-sm-4 col-form-label text-sm-end" for="sbjRecode_timeT">학점</label>
										<div class="col-sm-8">
											<input type="text" id="sbjRecode_timeT" class="form-control" disabled />
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="row">
										<label class="col-sm-4 col-form-label text-sm-end" for="sbjPersonnel_timeT">정원</label>
										<div class="col-sm-8">
											<input type="text" id="sbjPersonnel_timeT" class="form-control" disabled />
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-md-6">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_10">건물</label>
								<div class="col-sm-10">
									<select id="buildingCode" class="form-select" 
										aria-label="Default select example">
									</select>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_10">강의실</label>
								<div class="col-sm-10">
									<select id="roomCode" class="form-select" 
										aria-label="Default select example">
									</select>
								</div>
							</div>
						</div>
						
						<div class="col-md-7">
							<table class="table table-bordered timeTable">
								<thead class="table-active">
									<tr class="text-nowrap">
										<th class="timeTh-header"></th>
										<th>월</th>
										<th>화</th>
										<th>수</th>
										<th>목</th>
										<th>금</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1교시<br/>09:00~09:50</td>
										<td id="MON1" class="timeTable_td 월"></td>
										<td id="TUE1" class="timeTable_td 화"></td>
										<td id="WEN1" class="timeTable_td 수"></td>
										<td id="THU1" class="timeTable_td 목"></td>
										<td id="FRI1" class="timeTable_td 금"></td>
									</tr>
									<tr>
										<td>2교시<br/>10:00~10:50</td>
										<td id="MON2" class="timeTable_td 월"></td>
										<td id="TUE2" class="timeTable_td 화"></td>
										<td id="WEN2" class="timeTable_td 수"></td>
										<td id="THU2" class="timeTable_td 목"></td>
										<td id="FRI2" class="timeTable_td 금"></td>
									</tr>
									<tr>
										<td>3교시<br/>11:00~11:50</td>
										<td id="MON3" class="timeTable_td 월"></td>
										<td id="TUE3" class="timeTable_td 화"></td>
										<td id="WEN3" class="timeTable_td 수"></td>
										<td id="THU3" class="timeTable_td 목"></td>
										<td id="FRI3" class="timeTable_td 금"></td>
									</tr>
									<tr>
										<td>4교시<br/>12:00~12:50</td>
										<td id="MON4" class="timeTable_td 월"></td>
										<td id="TUE4" class="timeTable_td 화"></td>
										<td id="WEN4" class="timeTable_td 수"></td>
										<td id="THU4" class="timeTable_td 목"></td>
										<td id="FRI4" class="timeTable_td 금"></td>
									</tr>
									<tr>
										<td>5교시<br/>13:00~13:50</td>
										<td id="MON5" class="timeTable_td 월"></td>
										<td id="TUE5" class="timeTable_td 화"></td>
										<td id="WEN5" class="timeTable_td 수"></td>
										<td id="THU5" class="timeTable_td 목"></td>
										<td id="FRI5" class="timeTable_td 금"></td>
									</tr>
									<tr>
										<td>6교시<br/>14:00~14:50</td>
										<td id="MON6" class="timeTable_td 월"></td>
										<td id="TUE6" class="timeTable_td 화"></td>
										<td id="WEN6" class="timeTable_td 수"></td>
										<td id="THU6" class="timeTable_td 목"></td>
										<td id="FRI6" class="timeTable_td 금"></td>
									</tr>
									<tr>
										<td>7교시<br/>15:00~15:50</td>
										<td id="MON7" class="timeTable_td 월"></td>
										<td id="TUE7" class="timeTable_td 화"></td>
										<td id="WEN7" class="timeTable_td 수"></td>
										<td id="THU7" class="timeTable_td 목"></td>
										<td id="FRI7" class="timeTable_td 금"></td>
									</tr>
									<tr>
										<td>8교시<br/>16:00~16:50</td>
										<td id="MON8" class="timeTable_td 월"></td>
										<td id="TUE8" class="timeTable_td 화"></td>
										<td id="WEN8" class="timeTable_td 수"></td>
										<td id="THU8" class="timeTable_td 목"></td>
										<td id="FRI8" class="timeTable_td 금"></td>
									</tr>
									<tr>
										<td>9교시<br/>17:00~17:50</td>
										<td id="MON9" class="timeTable_td 월"></td>
										<td id="TUE9" class="timeTable_td 화"></td>
										<td id="WEN9" class="timeTable_td 수"></td>
										<td id="THU9" class="timeTable_td 목"></td>
										<td id="FRI9" class="timeTable_td 금"></td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<div class="col-md-5">
							<div class="border-box">
								<div class="container" id="selected_time" style="height: 85%; word-break:break-all;"></div>
							</div>
							<br/>
							<div class="col-md-12 text-center formButtons">
								<button type="button" class="btn btn-primary timeTable_btnClear" style="display: none;">초기화</button>
								<button type="button" class="btn btn-primary me-sm-3 me-1 timeTable_btnModi">수정</button>
								<button type="submit" class="btn btn-primary me-sm-3 me-1 timeTable_btnSubmit">등록</button>
								<button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">취소</button>
							</div>
						</div>
						
					</div>
					
				</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(function() {
	let lang_kor = {
	        "emptyTable" : "개설 신청 내역이 없습니다.",
	        "thousands" : ",",
	        "lengthMenu" : "_MENU_ 개씩 보기",
	        "loadingRecords" : "로딩중...",
	        "processing" : "처리중...",
	        "search" : "검색 : ",
	        "zeroRecords" : "검색된 강의가 없습니다.",
	        "paginate" : {
	            "first" : "첫 페이지",
	            "last" : "마지막 페이지",
	            "next" : "다음",
	            "previous" : "이전"
	        },
	        "aria" : {
	            "sortAscending" : " :  오름차순 정렬",
	            "sortDescending" : " :  내림차순 정렬"
	        }
	};
	
	$("#enrollTable").DataTable({
		info: false,
		order: [ [ 5, "asc" ] ],
		language : lang_kor
	});
});

// 신청
$(".btnWrite").on("click", function () {
	// 태그 사용가능하게 변경
	formAbled();
	// form태그 세팅
	$("#subjectForm")[0].reset();
	$("#subjectForm").attr("action", "/enroll/insertSubject");
	$("#sbjNum").val("");
	$("#spNum").val("");
	
	// sbjNum 세팅
	$.ajax({
		url: "/enroll/makeSbjNum",
		type: "post",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success: function(result) {
			$("#sbjNum").val(result);
		}
	}); // ajax 끝
});

// 강의계획서 보기
$(".btnCheck").on("click", function() {
	$("#spModal input, #spModal textarea").val("");
	let sbjNum = $(this).closest("tr").find(".sbjNum").val();
	
	$.ajax({
		url: "/enroll/getSubjectAjax",
		data: {"sbjNum" : sbjNum},
		type: "post",
		dataType: "json",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success: function(result) {
			// 태그들 수정 불가
			formDisabled();
			
			// form에 데이터 세팅
			setDataToForm(result);
		}
	}); // ajax 끝
});

// 신청 취소(삭제)
$(".btnDelete").on("click", function() {
	let sbjNum = $(this).closest("tr").find(".sbjNum").val();
	
	let form = document.createElement("form");
	form.action = "/enroll/deleteSubject";
	form.method = "post";
	
	let input_csrf = document.createElement("input");
	input_csrf.setAttribute("type", "hidden");
	input_csrf.setAttribute("name", "${_csrf.parameterName}");
	input_csrf.setAttribute("value", "${_csrf.token}");
	
	let input_sbjNum = document.createElement("input");
	input_sbjNum.setAttribute("type", "text");
	input_sbjNum.setAttribute("name", "sbjNum");
	input_sbjNum.setAttribute("value", sbjNum);
	
	form.appendChild(input_sbjNum);
	form.appendChild(input_csrf);
	
	document.body.appendChild(form);
	
	form.submit();
});

// 수정, 재신청
$(".btnModify").on("click", function() {
	let sbjNum = $(this).closest("tr").find(".sbjNum").val();
	$("#sbjNum").val(sbjNum);
	$("#subjectForm").attr("action", "/enroll/insertSubject");
	
	$.ajax({
		url: "/enroll/getSubjectAjax",
		data: {"sbjNum" : sbjNum},
		type: "post",
		dataType: "json",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success: function(result) {
			// 태그 사용가능하게 변경
			formAbled();
			// form에 데이터 세팅
			setDataToForm(result);
		}
	}); // ajax 끝
});

// 반려사유 확인
$(".btnSbjComre").on("click", function() {
	$(".sbjComre").css("display", "none");
	let sbjNum = $(this).closest("tr").find(".sbjNum").val();
	$("#sbjComre_" + sbjNum).css("display", "block");
});

//----------------------------------------------------------------
// 강의실/시간 선택 모달창 오픈시
// 이미 선택한 시간이 있다면 가져온다.
$(".btnTimeTable").on("click", function() {
	// 모달 창 초기화
	$("#timeForm")[0].reset();
	$("#selected_time").empty();
	$(".timeTable_btnClear").css("display", "none");
	
	let table_tdArr = [];
	table_tdArr = $(".timeTable_td");
	for(var i = 0; i < table_tdArr.length; i++){
		table_tdArr[i].innerText = "";
		table_tdArr[i].style.background = "none";
		table_tdArr[i].classList.remove('timeDisAble', 'selTime');
	}
	
	// 선택한 과목번호 세팅
	let trTags = $(this).closest("tr").find(".sbjNum");
	let sbjNum = trTags.val();
	$("#sbjNum_time").val(sbjNum);
	
	// 강의 정보들 담아주기
	trTags = trTags.next();
	$("#sbjTitle_timeT").val(trTags.text());
	trTags = trTags.next();
	$("#sbjGrade_timeT").val(trTags.text().trim());
	trTags = trTags.next();
	$("#sbjRecode_timeT").val(trTags.text());
	trTags = trTags.next();
	$("#sbjPersonnel_timeT").val(trTags.text());
	trTags = trTags.next();
	$("#deptNum_timeT").val(trTags.text().replace(/\s+/g, ""));
	
	$.ajax({
		url: "/enroll/getTimeData",
		type: "post",
		data: {"sbjNum" : sbjNum},
		dataType: "json",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success: function(result) {
			timeData = result;
			
			if(timeData.length > 1){ // 이미 시간을 정했다면
				time_flag = true;
			
				// div에 시간 띄우기
				let str = "";
				$.each(result, function(i, v) {
					let $_day = $("#" + v.TIME_TCODE).attr("class").split(" ")[1];
					let $_time = $("#" + v.TIME_TCODE).closest("tr").children().eq(0).html().replace("<br>", " ");
					
					str += "<p id='" + v.BUILDING_CODE + "-" + v.ROOM_CODE  + "-" + v.TIME_TCODE + "'>";
					str += v.BUILDING_NAME + " " + v.ROOM_LECT + " " + $_day + " " + $_time + "</p>";
				});
				$("#selected_time").append(str);
				
				// 건물, 강의실 change 이벤트
				$("#buildingCode").on("change", buildingChange);
				$("#roomCode").on("change", roomChange);
				// 테이블 관련 이벤트 제거
				$(".timeTable_td").off();
				// 등록버튼 > 수정버튼
				$(".timeTable_btnModi").css("display", "inline-block");
				$(".timeTable_btnSubmit").css("display", "none");
			}else{ // 아직 시간을 정하지 않았다면
				time_flag = false;

				// 이벤트 추가
				$("#buildingCode").on("change", buildingChange);
				$("#roomCode").on("change", roomChange);
				$(".timeTable_td").on("mouseover", tdMouseOver);
				$(".timeTable_td").on("mouseout", tdMouseOut);
				$(".timeTable_td").on("click", tdClick);
				// 수정버튼 > 등록버튼
				$(".timeTable_btnModi").css("display", "none");
				$(".timeTable_btnSubmit").css("display", "inline-block");
			}
			
			timeTable_btnClick();
		}
	}); // ajax 끝
});

// 건물 리스트 가져오기
function timeTable_btnClick() {
	$.ajax({
		url: "/enroll/getBuilding",
		type: "post",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success: function(result) {
			let str = "<option>건물을 선택하세요</option>";
			$.each(result, function(i, v) {
				str += "<option value='" + v.buildingCode + "'>" + v.buildingName + "</option>";
			});
			
			$("#buildingCode").html(str);

			if(time_flag){
				$("#buildingCode").val(timeData[timeData.length -1].BUILDING_CODE);
				buildingChange();
			} // if문 끝
		}
	}); // ajax 끝
	
}

// 건물 선택 시 강의실 목록 변경
function buildingChange() {
	let buildingCode = $("#buildingCode").val();

	$.ajax({
		url: "/enroll/getRoomList",
		type: "post",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		data: {"buildingCode" : buildingCode},
		success: function(result) {
			let str = "<option>강의실을 선택하세요</option>";
			$.each(result, function(i, v) {
				str += "<option value='" + v.roomCode + "'>" + v.roomLect + "</option>";
			});
			$("#roomCode").html(str);
			
			if(time_flag){
				$("#roomCode").val(timeData[timeData.length -1].ROOM_CODE);
				roomChange();
			} // if문 끝
		}
	}); // ajax 끝
}

// 강의실 선택 시 시간표 출력
function roomChange() {
	let roomCode = $("#roomCode").val();
	
	$.ajax({
		url: "/enroll/getTimeTable",
		type: "post",
		data: {"roomCode" : roomCode},
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success: function(result) {
			// clear table
			let tdArr = document.querySelectorAll(".timeTable_td");
			for(var i = 0; i < tdArr.length; i++){
				tdArr[i].innerText = "";
				$(tdArr[i]).css("background", "none");
				$(tdArr[i]).removeClass("timeDisAble");
				$(tdArr[i]).removeClass("selTime");
			}
			
			$.each(result, function(i, v) {
				let title = v.sbjTitle;
				$.each(v.timeTcodeList, function(j, w) {
					$("#" + w.timeTcode).text(title);
					$("#" + w.timeTcode).css("background", "lightgray");
					$("#" + w.timeTcode).addClass("timeDisAble");
				});
			}); // $.each 끝

			let sel_child = $("#selected_time").children();
			
			for(var i = 0; i < sel_child.length; i++){
				let child_id = sel_child.eq(i).attr("id");
				
				if($("#roomCode").val() == child_id.split("-")[1]){
					$("#" + child_id.split("-")[2]).css("background", "lightblue");
					$("#" + child_id.split("-")[2]).addClass("selTime");
				}
			}
			
		}
	}); // ajax 끝
}

// timeTable 마우스 이벤트 ----------------------------------
function tdMouseOver() {
	if(!($(this).hasClass("timeDisAble") || $(this).hasClass("selTime"))){
		$(this).css("background", "rgb(236, 238, 241)");
		$(this).addClass("mouseover");
	}
}
function tdMouseOut() {
	if($(this).hasClass("mouseover")){
		$(this).removeClass("mouseover");
		if(!$(this).hasClass("selTime")){
			$(this).css("background", "none");
		}
	}
}

// timeTable에서 시간 선택시
function tdClick() {
	if($("#buildingCode").val() == '건물을 선택하세요'){
		Swal.fire({
			title: '건물을 먼저 선택해주세요.',
			showClass: {
				popup: 'animate__animated animate__bounceIn'
			},
			icon: 'warning',
			customClass: {
				confirmButton: 'btn btn-primary'
			},
			buttonsStyling: false
		});
		return;
	}
	if($("#roomCode").val() == "강의실을 선택하세요"){
		Swal.fire({
			title: '강의실을 먼저 선택해주세요.',
			showClass: {
				popup: 'animate__animated animate__bounceIn'
			},
			icon: 'warning',
			customClass: {
				confirmButton: 'btn btn-primary'
			},
			buttonsStyling: false
		});
		return;
	}
	
	if(!$(this).hasClass("timeDisAble")){
		// code값 - DB용
		let $_buildingCode = $("#buildingCode").val();
		let $_roomCode = $("#roomCode").val();
		let $_timeCode = $(this).attr("id");
		// name값 - 출력용
		let $_buildingName = $("#buildingCode option:checked").text();
		let $_roomName = $("#roomCode option:checked").text();
		let $_day = $(this).attr("class").split(" ")[1];
		let $_time = $(this).closest("tr").children().eq(0).html().replace("<br>", " ");
		
		let $_id = $_buildingCode + "-" + $_roomCode + "-" + $_timeCode;
		
		if($(this).hasClass("selTime")){
			$(this).css("background", "none");
			$(this).removeClass("selTime");
			
			$("#selected_time").find("#" + $_id).remove();
		}else{
			$(this).css("background", "skyblue");
			$(this).addClass("selTime");
			
			let str = "<p id='" + $_id + "'>" + $_buildingName + " " + $_roomName + " " + $_day + " " + $_time + "</p>";
			$("#selected_time").append(str);
		}
	}
}

// timeTable submit
function checkTime() {
	let selTimeArr = $("#selected_time").children();
	
	if(selTimeArr.length < 2){
		Swal.fire({
			title: '최소 2시간을 선택해야 합니다.',
			showClass: {
				popup: 'animate__animated animate__bounceIn'
			},
			icon: 'warning',
			customClass: {
				confirmButton: 'btn btn-primary'
			},
			buttonsStyling: false
		});
		return false;
	}
	
	let timeVal = "";
	for(var i = 0; i < selTimeArr.length; i++){
		timeVal += selTimeArr.eq(i).attr("id") + ", ";
	}
	
	$("#sel_times").val(timeVal);
}

// 강의실, 시간 선택 수정
$(".timeTable_btnModi").on("click", function() {
	// 버튼 변경
	$(".timeTable_btnClear").css("display", "inline-block");
	$(".timeTable_btnSubmit").css("display", "inline-block");
	$(".timeTable_btnModi").css("display", "none");
	// 이벤트 추가
	$(".timeTable_td").on("mouseover", tdMouseOver);
	$(".timeTable_td").on("mouseout", tdMouseOut);
	$(".timeTable_td").on("click", tdClick);
	$(".selTime").removeClass("timeDisAble");
	$(".selTime").text("");
});

// 초기화 버튼
$(".timeTable_btnClear").on("click", function() {
	let table_tdArr = [];
	table_tdArr = $(".timeTable_td");
	for(var i = 0; i < table_tdArr.length; i++){
		if($(table_tdArr[i]).hasClass("selTime")){
			table_tdArr[i].innerText = "";
			table_tdArr[i].style.background = "none";
			table_tdArr[i].classList.remove('selTime');
		}
	}
	
	$("#selected_time").empty();
});

//-----------------------------------------------
// 자동 채우기 버튼
$("#btnAuto").on("click", function() {
	// 강의명
	$("#sbjTitle").val("화학의 이해");
	// 학년
	$("#sbjGrade").val(3);
	// 학점	
	$("#sbjRecode").val(3);
	// 필수/선택
	$("#sbjRs").val(2);
	// 정원
	$("#sbjPersonnel").val(40);
	// 점수 비율
	$("#spMiddleratio").val(40);
	$("#spFinalratio").val(40);
	$("#spHwratio").val(10);
	$("#spAttratio").val(10);
	$("#spEtcratio").val(0);
	// 참고교재
	$("#spTextbook").val('화학 교재 연구 및 지도');
	// 온라인 여부
	$("#sbjYn").val(1);
	// 학습목표
	$("#slTarget_1").val('화학식량과 몰');
	$("#slTarget_2").val('화학 반응식과 용액의 농도');
	$("#slTarget_3").val('원자의 구조');
	$("#slTarget_4").val('원소의 주기적 성질');
	$("#slTarget_5").val('화학 결합과 분자의 세계');
	$("#slTarget_6").val('동적 평형');
	$("#slTarget_7").val('중간고사');
	$("#slTarget_8").val('산 염기와 중화 반응');
	$("#slTarget_9").val('물질의 세 가지 상태와 용액');
	$("#slTarget_10").val('반응 엔탈피');
	$("#slTarget_11").val('화학 평형과 평형 이동');
	$("#slTarget_12").val('산 염기 평형');
	$("#slTarget_13").val('반응 속도와 촉매');
	$("#slTarget_14").val('전기 화학과 이용');
	$("#slTarget_15").val('기말고사');
});

// form 사용 가능
function formAbled() {
	$(".formButtons").css("display", "block");
	$("#subjectForm input").removeAttr("disabled");
	$("#subjectForm select").removeAttr("disabled");
	$("#subjectForm textarea").removeAttr("disabled");
}

//form 사용 불가능
function formDisabled() {
	$("#subjectForm .formButtons").css("display", "none");
	$("#subjectForm input").attr("disabled", "true");
	$("#subjectForm select").attr("disabled", "true");
	$("#subjectForm textarea").attr("disabled", "true");
}

// 불러온 데이터 form에 세팅
function setDataToForm(result) {
	// subjectVO
	$("#sbjNum").val(result.subjectVO.sbjNum);
	// 강의명
	$("#sbjTitle").val(result.subjectVO.sbjTitle);
	// 학년
	$("#sbjGrade").val(result.subjectVO.sbjGrade);
	// 학점
	$("#sbjRecode").val(result.subjectVO.sbjRecode);
	// 정원
	$("#sbjPersonnel").val(result.subjectVO.sbjPersonnel);
	// 전공/교양
	$("#deptNum").val(result.subjectVO.deptNum);
	// 필수/선택
	$("#sbjRs").val(result.subjectVO.sbjRs);
	
	// spVO
	$("#spNum").val(result.spVO.spNum);
	// 점수비율
	$("#spMiddleratio").val(result.spVO.spMiddleratio);
	$("#spFinalratio").val(result.spVO.spFinalratio);
	$("#spHwratio").val(result.spVO.spHwratio);
	$("#spAttratio").val(result.spVO.spAttratio);
	$("#spEtcratio").val(result.spVO.spEtcratio);
	// 참고교재
	$("#spTextbook").val(result.spVO.spTextbook);
	// 온라인 수업 여부
	$("#spOnlineyn").val(result.spVO.spOnlineyn);
	
	// siVOList
	// 학습목차
	let slArr = [];
	slArr = $(".slTarget");
	for(var i = 0; i < slArr.length; i++){
		slArr[i].value = result.siVOList[i].siTarget;
	} // 반복문 끝
}
</script>