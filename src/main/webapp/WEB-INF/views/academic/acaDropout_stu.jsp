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
	<span class="fw-light" >학적변동 신청 / </span>자퇴
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

		<!-- /인적사항 -->
<!-- 		<hr/> -->
	</div>
</div>

<div class="card">
	<div class="card-body">
	  <form action="">
		<div class="card">
			<div class="card-body">
				<div class="mx-auto" >
				  <c:set var="ymd" value="<%=new java.util.Date()%>" />
				  <fmt:formatDate value="${ymd}" pattern="yyyy" var="yyyy" />
				  <fmt:formatDate value="${ymd}" pattern="MM" var="mm" />
				  <fmt:formatDate value="${ymd}" pattern="dd" var="dd" />
				  <fmt:parseNumber value="${mm}" var="num" />
				  <fmt:formatDate value="${ymd}" pattern="yyyy/MM/dd" var="yyyyMMdd" />

					<div class="row text-end" style="justify-content: center;">
						<label for="html5-search-input" class="col-md-1 col-form-label">자퇴년도</label>
						<div class="col-md-2">
							<input class="form-control" type="search" value="${yyyy}" id="html5-search-input" readonly />
						</div>
						<label for="html5-search-inputSm" class="col-md-1 col-form-label">신청학기</label>
						<div class="col-md-3">
							<c:if test="${num < 9}">
								<input class="form-control" type="text" value="1학기" id="html5-search-inputSm" readonly />
								<input class="form-control" type="hidden" id="ip_acSdt" value="${yyyy}-1"  />
							</c:if>
							<c:if test="${num >= 9}">
							    <input class="form-control" type="text" value="2학기" id="html5-search-inputSm" readonly />
							    <input class="form-control" type="hidden" id="ip_acSdt" value="${yyyy}-2"  />
							</c:if>
<!-- 							<input class="form-control" type="search" value="2024년도-1학기" id="html5-search-input" /> -->
						</div>
					</div>
					<br/>
					<div class="row text-end" style="justify-content: center;">
						<label for="html5-search-input1" class="col-md-1 col-form-label">신청일자</label>
						<div class="col-md-2">
							<input class="form-control" type="search" value="${yyyyMMdd}" id="html5-search-input1" readonly />
						</div>
						<label for="html5-search-input2" class="col-md-1 col-form-label"></label>
						<div class="col-md-3">
							<input class="form-control" type="hidden" value="2024년도-1학기" id="html5-search-input2" />
						</div>
					</div>
					<br/>
					<div class="row text-end" style="justify-content: center;">
						<label for="ip_acReason" class="col-md-1 col-form-label">자퇴사유</label>
						<div class="col-md-6">
							<input class="form-control" type="text" id="ip_acReason" required />
						</div>
					</div>
					<button type="button" id="btnDrop" class="btn btn-primary col-2" style="float: right; margin: 20px;" >신청하기</button>
				</div>
			</div>
			<div class="card-footer"></div>
		</div>
	  </form>
	</div>
</div>

<script>
$(document).ready(function(){

	$("#btnDrop").on("click", function(){
		let v_acReason = $("#ip_acReason").val();
		let acReason = v_acReason.replace(" ","");
		if(acReason == null || acReason == ""){
			Swal.fire({
				    	  html: '자퇴사유를 입력해주세요.',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      });
			$("#ip_acReason").focus();
			return false;
 		}
			let acSdt = $("#ip_acSdt").val();

			let data = {
						  "acReason":acReason,
						  "acSdt":acSdt
						}
			$.ajax({
				url : "/academic/appDropout",
				contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
				data : JSON.stringify(data),		//=> 보내는 데이터(?)
				dataType : "json",										//=> dataType은 '응답타입'
				type : "post",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(resultMap){

					if(resultMap.result==-2){

						Swal.fire({
					    	  html: '자퇴신청이 불가합니다. 학적상태를 확인하세요. <br /> (*자퇴신청 가능한 학적상태 : 재학, 휴학, 졸업유예)',
					    	  icon: 'warning',

					    	  confirmButtonText: '확인'

					      }).then(result => {
					    	  location.href = "/academic/acaDropout";
					      	});


					}else if(resultMap.result==-1){

						Swal.fire({
					    	  html: '승인대기 상태인 자퇴 신청내역이 존재합니다.<br /> 학적변동 신청목록 화면으로 이동합니다.',
					    	  icon: 'warning',

					    	  confirmButtonText: '확인'

					      }).then(result => {
					    	  location.href = "/academic/acaListStu";
					      	});

					}else if(resultMap.result==1) {

						Swal.fire({
					    	  html: '신청이 정상적으로 처리되었습니다.<br /> 학적변동 신청목록 화면으로 이동합니다.',
					    	  icon: 'success',

					    	  confirmButtonText: '확인'

					      }).then(result => {
					    	  location.href = "/academic/acaListStu";
					      	});

					}else{
						Swal.fire({
					    	  html: '자퇴신청 불가!',
					    	  icon: 'warning',

					    	  confirmButtonText: '확인'

					      }).then(result => {
					    	  location.href = "/academic/acaDropout";
					      	});
					}
				},
				error : function(){
					Swal.fire({
				    	  html: '자퇴신청 불가!',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaDropout";
				      	});
				}

			});

	});
});
</script>


