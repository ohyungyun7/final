<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>
td{
	font-size: 0.9rem;
	text-align: center;
}
</style>

<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bx-street-view page-icon"></i>
	<span class="fw-light" >학적변동 신청 / </span>복수전공&부전공
</h4>

<div class="card mb-3 p-0">
	<p class="card-header p-0 pb-1 ms-3 mt-2"><i class='bx bxs-square'></i> 기본 인적 사항</p>
	<div class="card-body p-0 pb-1">
		<div class="d-flex flex-column flex-sm-row text-sm-start text-center mb-4">
	        <div class="flex-shrink-0 mt-n2 mx-sm-5 mx-auto">
	          <img src="/resources/upload${stuInfo.STU_PHOTO}" alt="user image" class="ms-0 ms-sm-4 p-4" style="width: 200px; border-radius: 6%;">
	        </div>
	        <div class="flex-grow-1 mt-3 mt-sm-5">
	          <div class="d-flex align-items-md-end align-items-sm-start align-items-center justify-content-md-between justify-content-start mx-4 flex-md-row flex-column gap-4">
	            <div class="user-profile-info">
              	<h4 class="fw-semibold">${stuInfo.STU_NM_KOR}</h4>
	              <ul class="list-inline mb-2 d-flex align-items-center flex-wrap justify-content-sm-start justify-content-center gap-2">
	                <li class="list-inline-item fw-semibold">
	                  <i class="bx bx-pen mb-1"></i><small class="text-muted">  학번 : &nbsp;</small>${stuInfo.STU_NUM}
	                </li>
	                <li class="list-inline-item fw-semibold">
	                  <i class="bx bx-star mb-1"></i><small class="text-muted"> 학년 · 학기 : &nbsp;</small>
						<c:choose>
							<c:when test="${stuInfo.STU_SEMESTER== 1 || stuInfo.STU_SEMESTER == 2}">
							1<span>학년</span>
							</c:when>
							<c:when test="${stuInfo.STU_SEMESTER== 3 || stuInfo.STU_SEMESTER == 4}">
							2<span>학년</span>
							</c:when>
							<c:when test="${stuInfo.STU_SEMESTER== 5 || stuInfo.STU_SEMESTER == 6}">
							3<span>학년</span>
							</c:when>
							<c:when test="${stuInfo.STU_SEMESTER== 7 || stuInfo.STU_SEMESTER == 8}">
							4<span>학년</span>
							</c:when>
							<c:when test="${stuInfo.STU_SEMESTER== 9 || stuInfo.STU_SEMESTER == 10}">
							5<span>학년</span>
							</c:when>
							<c:when test="${stuInfo.STU_SEMESTER== 11 || stuInfo.STU_SEMESTER == 12}">
							6<span>학년</span>
							</c:when>
							<c:otherwise>
							4<span>학년</span>
							</c:otherwise>
						</c:choose>
						<c:set var="ymd" value="<%=new java.util.Date()%>" />
						<fmt:formatDate value="${ymd}" pattern="MM" var="mm" />
						<fmt:parseNumber value="${mm}" var="num" />
						<c:if test="${stuInfo.STU_SEMESTER % 2 != 0}">
							1<span>학기</span>
						</c:if>
						<c:if test="${stuInfo.STU_SEMESTER % 2 == 0}">
							2<span>학기</span>
						</c:if>
	                </li>
	              </ul>
				<div class="row border-top border-bottom me-5" style="align-items: center;">
					<label for="html5-search-input" class="col-md-2 text-muted">학과(전공)</label>
					<div class="col-md-2">
						<input class="form-control border-0" type="search" value="${stuInfo.DEPT_NM}" id="html5-search-input" readonly />
					</div>
					<label for="html5-search-input" class="col-md-2 text-muted">복수전공</label>
					<div class="col-md-2">
						<input class="form-control border-0" type="search" value="<c:if test="${stuInfo.STU_DMAJOR == 0 || stuInfo.STU_DMAJOR == '' }">없음</c:if>${stuInfo.DMAJOR_NM}" id="html5-search-input" readonly />
					</div>
					<label for="html5-search-input" class="col-md-2 text-muted">부전공</label>
					<div class="col-md-2">
						<input class="form-control border-0" type="search" value="<c:if test="${stuInfo.STU_MINOR == 0 || stuInfo.STU_MINOR == '' }">없음</c:if>${stuInfo.MINOR_NM}" id="html5-search-input" readonly />
					</div>
				</div>
				<div class="row border-bottom me-5" style="align-items: center;">
					<label for="html5-search-input" class="col-md-2 text-muted">학적상태</label>
					<div class="col-md-2">
					  <c:choose>
						<c:when test="${stuInfo.STU_STATUS == 0 }"><input class="form-control border-0" type="search" value="재학" id="html5-search-input" readonly /></c:when>
						<c:when test="${stuInfo.STU_STATUS == 1 }"><input class="form-control border-0" type="search" value="휴학" id="html5-search-input" readonly /></c:when>
						<c:when test="${stuInfo.STU_STATUS == 2 }"><input class="form-control border-0" type="search" value="자퇴" id="html5-search-input" readonly /></c:when>
						<c:when test="${stuInfo.STU_STATUS == 3 }"><input class="form-control border-0" type="search" value="졸업" id="html5-search-input" readonly /></c:when>
						<c:when test="${stuInfo.STU_STATUS == 4 }"><input class="form-control border-0" type="search" value="제적" id="html5-search-input" readonly /></c:when>
						<c:when test="${stuInfo.STU_STATUS == 4 }"><input class="form-control border-0" type="search" value="졸업유예" id="html5-search-input" readonly /></c:when>
						<c:otherwise>정보없음</c:otherwise>
					  </c:choose>
					</div>
					<label for="html5-search-input" class="col-md-2 text-muted">전공학점</label>
					<div class="col-md-2">
						<input class="form-control border-0" type="search" value="${stuInfo.get('MAJOR_RECODE')}" id="html5-search-input" readonly />
					</div>
					<label for="html5-search-input" class="col-md-2 text-muted">교양학점</label>
					<div class="col-md-2">
						<input class="form-control border-0" type="search" value="${stuInfo.get('ELECTIVE_RECODE')}" id="html5-search-input" readonly />
					</div>
				</div>
            </div>
          </div>
        </div>
      </div>
	</div>
</div>

<div class="card">
	<div class="card-body">
	  <form action="" id="deptForm" >
		<div class="card">
			<div class="card-body">
				<div class="mx-auto" >
					<br/>
					<div class="row text-end" style="justify-content: center;">
						<label for="html5-search-input" class="col-md-1 col-form-label" style="text-align: center;" >구분 </label>
						<div class="col-md-2">
							<select id="selCate" class="selectpicker w-100" data-style="btn-default">
								<option>복수전공</option>
								<option>부전공</option>
				            </select>
						</div>

						<div class="col-md-3"></div>
					</div>
					<br/>
					<div class="row text-end" style="justify-content: center;">
						<label for="selecColl" class="col-md-2 col-form-label" >대상 대학</label>
						<div class="col-md-2">
							<select id="selecColl" class="selectpicker w-100" data-style="btn-default">
							  <c:forEach var="AcaColleageVO" items="${CNDList}" varStatus="stat">
							  	<c:if test="${cndMapList[0].COLL_NUM == AcaColleageVO.collNum}">
								<option value="${AcaColleageVO.collNum}" selected="selected">${AcaColleageVO.collNm}</option>
							  	</c:if>
								<c:if test="${cndMapList[0].COLL_NUM != AcaColleageVO.collNum}">
								<option value="${AcaColleageVO.collNum}">${AcaColleageVO.collNm}</option>
							  	</c:if>
							  </c:forEach>
				            </select>
						</div>
						<label for="selectDept" class="col-md-1 col-form-label" >대상 학과</label>
						<div class="col-md-3" id="selDiv">
							<select id="selectDept" class="selectpicker w-100" data-style="btn-default" >
							  <c:forEach var="cndMap" items="${cndMapList}" varStatus="stat">
								<option value="${cndMap.DEPT_NUM}" >${cndMap.DEPT_NM}</option>
							  </c:forEach>
				            </select>
						</div>
					</div>
					<br/>
					<div class="row text-end" style="justify-content: center;">
						<label for="html5-search-input" class="col-md-2 col-form-label" >신청일자</label>
						<div class="col-md-6">
							<c:set var="ymd" value="<%=new java.util.Date()%>" />
							<fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd" var="yyyy" />
							<input class="form-control" type="search" value="${yyyy}" id="html5-search-input" readonly />
						</div>
					</div>
					<button type="button" id="btnApp" class="btn btn-primary col-2" style="float: right; margin: 20px;" >신청하기</button>
				</div>
			</div>
			<div class="card-footer"></div>
		</div>
	  </form>
	</div>
</div>

<script>
$(document).ready(function(){

	$("#selecColl").on("change", function(){
		let collNum =  $(this).val();
		let data = { "collNum":collNum}
		location.href="/academic/acaDMStu?collNum="+collNum;
	});

	$("#btnApp").on("click", function(){
		let v_sc = $("#selCate").val();
		let dmDivision = 0;
		if(v_sc=='복수전공'){
			dmDivision = 0;
		}else if(v_sc == '부전공'){
			dmDivision = 1;
		}

		let selectDept = $("#selectDept").val();

		//학과번호, 복수/부전공 구분 넘겨야함.
		let data = {
					  "deptNo":selectDept,
					  "dmDivision":dmDivision
					};

		$.ajax({
			url : "/academic/appDM",
			contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
			data : JSON.stringify(data),		//=> 보내는 데이터(?)
			dataType : "json",										//=> dataType은 '응답타입'
			type : "post",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
				//신청 조건을 불충족한 경우(이수학기, 평균평점, 전공이수학점 등)
				if(result.result == 'Dfail'){	//복수전공 조건을 불충족한 경우
					let semester = result.semester;
					let ar = result.ar;
					let sumMajor = result.sumMajor;

					Swal.fire({
				    	  html: '복수전공 신청 조건을 충족하지 않습니다.<br/> 이수학기: '+ semester +'<br/>평균평점: '+ ar + '<br />전공이수학점: '
				    	  		+ sumMajor +'<br />',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  //location.href = "/academic/acaListStu";
				    	  return false;
				      	});

				}else if(result.result == 'Mfail'){
					let semester = result.semester;
					let ar = result.ar;

					Swal.fire({
				    	  html: '부전공 신청 조건을 충족하지 않습니다.<br/> 이수학기: '+ semester +'<br/>평균평점: '+ ar + '<br />',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  //location.href = "/academic/acaListStu";
				    	  return false;
				      	});



				//승인 대기 중인 신청 이력이 있거나, 승인 완료된 복수전공/부전공 신청 이력이 있는 경우
				}else if(result.result == 1){
					Swal.fire({
				    	  html: '신청 완료.<br /> 학적변동 신청목록 화면으로 이동합니다.',
				    	  icon: 'success',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListStu";
				      	});
				}else if(result.result == 'de'){
					Swal.fire({
				    	  html: '승인대기 상태인 복수전공 신청내역이 존재합니다.<br /> 학적변동 신청목록 화면으로 이동합니다.',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListStu";
				      	});
				}else if(result.result == 'me'){
					Swal.fire({
				    	  html: '승인대기 상태인 부전공 신청내역이 존재합니다.<br /> 학적변동 신청목록 화면으로 이동합니다.',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListStu";
				      	});
				}else if(result.result == 'deOK'){
					Swal.fire({
				    	  html: '승인완료된 복수전공 신청내역이 존재합니다.',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListStu";
				      	});
				}else if(result.result == 'meOK'){
					Swal.fire({
				    	  html: '승인완료된 부전공 신청내역이 존재합니다.',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListStu";
				      	});
				}else{
					Swal.fire({
				    	  html: '신청을 처리할 수 없습니다.',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaDMStu";
				      	});
				}
			},
			error : function(){
				Swal.fire({
			    	  html: '처리 실패.',
			    	  icon: 'warning',

			    	  confirmButtonText: '확인'

			      }).then(result => {
			    	  location.href = "/academic/acaDMStu";
			      	});
			}
		});

	});


});
</script>
