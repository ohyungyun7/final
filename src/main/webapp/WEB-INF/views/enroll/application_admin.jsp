<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style type="text/css">
thead{
	text-align: center;
}
.card{
	overflow: auto;
}
.search-sel{
	width: 15%;
	display: inline;
}
.search-inp{
	width: 30%;
	display: inline;
}
.search-btn{
	display: inline;
}

.table-bordered{
	text-align: center;
}
.card-body{
	margin-top: 0px;
	padding-top: 0px;
}
textarea{
	resize: none;
	width: 100%;
	maxlength: 1000;
}
</style>

<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bx-collection page-icon"></i>
	<span class="fw-light">강의 관리 / </span>강의 개설 신청 목록
</h4>

<div class="card">

	<div class="card-body">
	<table class="table table-bordered">
		<thead class="table-active">
					<tr class="text-nowrap">
						<th class="si_target">강의명</th>
						<th>교수(교번)</th>
						<th>전공</th>
						<th>학년</th>
						<th>구분</th>
						<th>상태</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="subjectVO" items="${subjectVOList}" varStatus="status">
						<tr>
							<input type="hidden" class="sbjNum" value="${subjectVO.sbjNum}" />
							<td>${subjectVO.sbjTitle}</td>
							<td>${subjectVO.teaNmKor}(${subjectVO.teaNum})</td>
							<td>${subjectVO.deptNm}</td>
							<td>
								<c:choose>
									<c:when test="${subjectVO.sbjGrade == 0}">전체</c:when>
									<c:otherwise>${subjectVO.sbjGrade}</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:if test="${subjectVO.sbjRs == 1}">필수</c:if>
								<c:if test="${subjectVO.sbjRs == 2}">선택</c:if>
							</td>
							<c:choose>
								<c:when test="${subjectVO.sbjYn == 1}">
									<td>승인</td>
								</c:when>
								<c:when test="${subjectVO.sbjYn == 2}">
									<td>반려</td>
								</c:when>
								<c:otherwise>
									<td>대기</td>
								</c:otherwise>
							</c:choose>
							<td>
								<button type="button" class="btn btn-label-info btnCheck" 
									data-bs-toggle="modal" data-bs-target="#spModal">상세</button>
							</td>
							<td>
								<c:if test="${subjectVO.sbjYn < 1}">
									<button type="button" class="btn btn-info btnOK" onclick="btnOK('${subjectVO.sbjNum}', '${subjectVO.sbjTitle}')">승인</button>
									<button type="button" class="btn btn-dark btnCom" 
										data-bs-toggle="modal" data-bs-target="#comreModal" onclick="btnCom('${subjectVO.sbjNum}')">반려</button>
								</c:if>
							</td>
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
						<input type="hidden" name="sbjNum" class="sbjNum" id="sbjNum" value="" />
						<input type="hidden" name="spNum" class="spNum" id="spNum" value="" />
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="sbjTitle">강의명</label>
								<div class="col-sm-10">
									<input type="text" id="sbjTitle" name="sbjTitle" class="form-control" maxlength="20" disabled />
								</div>
							</div>
						</div>
						
						<div class="col-md-4">
							<div class="row">
								<label class="col-sm-6 col-form-label text-sm-end" for="sbjGrade">학년</label>
								<div class="col-sm-6">
									<select id="sbjGrade" name="sbjGrade" class="form-select" aria-label="Default select example" disabled >
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
									<select id="sbjRecode" name="sbjRecode" class="form-select" aria-label="Default select example" disabled >
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
									<input type="number" id="sbjPersonnel" name="sbjPersonnel" class="form-control" disabled />
								</div>
							</div>
						</div>
						
						<div class="col-md-4">
							<div class="row">
								<label class="col-sm-6 col-form-label text-sm-end" for="deptNum">전공/교양</label>
								<div class="col-sm-6">
									<select id="deptNum" name="deptNum" class="form-select" aria-label="Default select example" disabled >
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
									<select id="sbjRs" name="sbjRs" class="form-select" aria-label="Default select example" disabled >
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
									<input type="number" id="spMiddleratio" name="spMiddleratio" class="form-control" disabled />
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="row">
								<label class="col-sm-6 col-form-label text-sm-end" for="spFinalratio">기말</label>
								<div class="col-sm-6">
									<input type="number" id="spFinalratio" name="spFinalratio" class="form-control" disabled />
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="row">
								<label class="col-sm-6 col-form-label text-sm-end" for="spHwratio">과제</label>
								<div class="col-sm-6">
									<input type="number" id="spHwratio" name="spHwratio" class="form-control" disabled />
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="row">
								<label class="col-sm-6 col-form-label text-sm-end" for="spAttratio">출석</label>
								<div class="col-sm-6">
									<input type="number" id="spAttratio" name="spAttratio" class="form-control" disabled />
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="row">
								<label class="col-sm-6 col-form-label text-sm-end" for="spEtcratio">기타</label>
								<div class="col-sm-6">
									<input type="number" id="spEtcratio" name="spEtcratio" class="form-control" disabled />
								</div>
							</div>
						</div>
						<hr />
						
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="spTextbook">참고 교재</label>
								<div class="col-sm-10">
									<textarea class="form-control" id="spTextbook" name="spTextbook" rows="3" cols="" disabled ></textarea>
								</div>
							</div>
						</div>
						
						<div class="col-md-4">
							<div class="row">
								<label class="col-sm-6 col-form-label text-sm-end" for="sbjRs">온라인 수업 여부</label>
								<div class="col-sm-6">
									<select id="sbjRs" name="sbjYn" class="form-select" aria-label="Default select example" disabled >
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
									<input type="text" id="slTarget_1" name="slTarget_1" class="form-control slTarget" maxlength="1000" disabled />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_2">2주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_2" name="slTarget_2" class="form-control slTarget" maxlength="1000" disabled />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_3">3주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_3" name="slTarget_3" class="form-control slTarget" maxlength="1000" disabled />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_4">4주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_4" name="slTarget_4" class="form-control slTarget" maxlength="1000" disabled />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_5">5주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_5" name="slTarget_5" class="form-control slTarget" maxlength="1000" disabled />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_6">6주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_6" name="slTarget_6" class="form-control slTarget" maxlength="1000" disabled />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_7">7주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_7" name="slTarget_7" class="form-control slTarget" maxlength="1000" disabled />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_8">8주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_8" name="slTarget_8" class="form-control slTarget" maxlength="1000" disabled />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_9">9주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_9" name="slTarget_9" class="form-control slTarget" maxlength="1000" disabled />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_10">10주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_10" name="slTarget_10" class="form-control slTarget" maxlength="1000" disabled />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_11">11주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_11" name="slTarget_11" class="form-control slTarget" maxlength="1000" disabled />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_12">12주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_12" name="slTarget_12" class="form-control slTarget" maxlength="1000" disabled />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_13">13주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_13" name="slTarget_13" class="form-control slTarget" maxlength="1000" disabled />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_14">14주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_14" name="slTarget_14" class="form-control slTarget" maxlength="1000" disabled />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="slTarget_15">15주차</label>
								<div class="col-sm-10">
									<input type="text" id="slTarget_15" name="slTarget_15" class="form-control slTarget" maxlength="1000" disabled />
								</div>
							</div>
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
				
				<form method="post" action="/enroll/updateSubjectCom" onsubmit="return formCheck()">
					<sec:csrfInput/>
					<input type="hidden" name="sbjNum" class="sbjNum" id="sbjNum_form" value="" />
					<div class="row g-3">
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label text-sm-end" for="sbjTitle">강의명</label>
								<div class="col-sm-10">
									<input type="text" id="sbjTitle_form" class="form-control" maxlength="20" disabled />
								</div>
							</div>
						</div>
						
						<div class="col-md-4">
							<div class="row">
								<label class="col-sm-6 col-form-label text-sm-end" for="sbjGrade">학년</label>
								<div class="col-sm-6">
									<select id="sbjGrade_form" class="form-select" aria-label="Default select example" disabled >
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
									<select id="sbjRecode_form" class="form-select" aria-label="Default select example" disabled >
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
									<input type="number" id="sbjPersonnel_form" class="form-control" disabled />
								</div>
							</div>
						</div>
						
						<div class="col-md-4">
							<div class="row">
								<label class="col-sm-6 col-form-label text-sm-end" for="deptNum">전공/교양</label>
								<div class="col-sm-6">
									<select id="deptNum_form" class="form-select" aria-label="Default select example" disabled >
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
									<select id="sbjRs_form" class="form-select" aria-label="Default select example" disabled >
										<option value="1">필수</option>
										<option value="2">선택</option>
									</select>
								</div>
							</div>
						</div>
						
						<hr/>
						<div class="row">
							<div class="col-sm-2"></div>
							<span class="col-sm-10 col-form-label" id="comEmpty" style="color: red; display: none; padding: 0px;">반려사유를 작성해주세요</span>
						</div>
						<div class="col-md-12">
							<div class="row">
								<h6 class="col-sm-2 text-sm-end" >반려사유</h6>
								<div class="col-sm-10">
									<textarea class="form-control" id="sbjComre" name="sbjComre" rows="3" cols="" ></textarea>
								</div>
							</div>
						</div>
						
						<br/>
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

<script>
$(function(){
	let lang_kor = {
	        "emptyTable" : "강의 목록이 없습니다.",
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
	
	$(".table-bordered").DataTable({
		info: false,
		order: [ [ 5, "asc" ] ],
		language : lang_kor
	});
});

//강의계획서 보기
$(".btnCheck").on("click", function() {
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
			// 모달에 데이터 세팅
			setDataToForm(result, "", false);
		}
	}); // ajax 끝
});

// 반려
function btnCom(sbjNum) {
	$.ajax({
		url: "/enroll/getSubjectAjax",
		data: {"sbjNum" : sbjNum},
		type: "post",
		dataType: "json",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success: function(result) {
			// form에 데이터 세팅
			setDataToForm(result, "_form", true);
		}
	}); // ajax 끝
};

//불러온 데이터 form에 세팅
function setDataToForm(result, modalId, isForm) {
	// subjectVO
	$("#sbjNum" + modalId).val(result.subjectVO.sbjNum);
	// 강의명
	$("#sbjTitle" + modalId).val(result.subjectVO.sbjTitle);
	// 학년
	$("#sbjGrade" + modalId).val(result.subjectVO.sbjGrade);
	// 학점
	$("#sbjRecode" + modalId).val(result.subjectVO.sbjRecode);
	// 정원
	$("#sbjPersonnel" + modalId).val(result.subjectVO.sbjPersonnel);
	// 전공/교양
	$("#deptNum" + modalId).val(result.subjectVO.deptNum);
	// 필수/선택
	$("#sbjRs" + modalId).val(result.subjectVO.sbjRs);
	
	if(!isForm){
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
}

function btnOK(sbjNum, sbjTitle) {
	Swal.fire({
		title: "\"" + sbjTitle + "\" 강의를 승인하시겠습니까?",
		showDenyButton: true,
		confirmButtonText: 'Yes',
		denyButtonText: 'No',
		customClass: {
			actions: 'my-actions',
			cancelButton: '',
			confirmButton: 'btn btn-primary',
			denyButton: 'btn btn-secondary',
		}
	}).then((result) => {
		if(result.isConfirmed){
			let form = document.createElement("form");
			form.action = "/enroll/updateSubjectOk";
			form.method = "post";
			
			let input_sbjNum = document.createElement("input");
			input_sbjNum.setAttribute("type", "text");
			input_sbjNum.setAttribute("name", "sbjNum");
			input_sbjNum.setAttribute("value", sbjNum);
			
			let input_csrf = document.createElement("input");
			input_csrf.setAttribute("type", "hidden");
			input_csrf.setAttribute("name", "${_csrf.parameterName}");
			input_csrf.setAttribute("value", "${_csrf.token}");
			
			form.appendChild(input_sbjNum);
			form.appendChild(input_csrf);
			document.body.appendChild(form);
			form.submit();
		}
	});
}

function formCheck() {
	let text = $("#sbjComre").val();
	
	if(text == "" || text == null){
		$("#sbjComre").focus();
		$("#comEmpty").css("display", "inline-block");
		return false;
	}
}
</script>