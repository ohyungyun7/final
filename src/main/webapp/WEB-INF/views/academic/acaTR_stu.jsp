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
	<span class="fw-light" >학적변동 신청 / </span>전과
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
					<div class="row text-end" style="">
						<label for="ip_tranYear" class="col-md-1 col-form-label">전과년도</label>
						<div class="col-md-2">
							<fmt:formatDate value="${ymd}" pattern="yyyy" var="yyyy" />
							<input class="form-control" type="search" value="${yyyy}년도" id="ip_tranYear" readonly />
						</div>
						<label for="ip_semester" class="col-md-1 col-form-label">전과학기</label>
						<div class="col-md-3">
							<c:if test="${num < 8}">
								<input class="form-control" type="search" value="1학기" id="ip_semester" readonly />
							</c:if>
							<c:if test="${num >= 8}">
								<input class="form-control" type="search" value="2학기" id="html5-search-input" />
							</c:if>
<!-- 							<input class="form-control" type="search" value="2024년도-1학기" id="html5-search-input" /> -->
						</div>
<!-- 						<label for="html5-search-input" class="col-md-1 col-form-label">전과사유</label> -->
<!-- 						<div class="col-md-4"> -->
<!-- 							<input class="form-control" type="search" id="ipClick" required /> -->
<!-- 						</div> -->
					</div>
					<br/>
					<div class="row text-end" style="">
						<label for="selecColl" class="col-md-1 col-form-label">전과 대학</label>
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
						<label for="selectDept" class="col-md-1 col-form-label">전과학과</label>
						<div class="col-md-3">
							<select id="selectDept" class="selectpicker w-100" data-style="btn-default">
								<c:forEach var="cndMap" items="${cndMapList}" varStatus="stat">
<%-- 								<option value="${cndMap.DEPT_NUMBER}">(${cndMap.COLL_NM})${cndMap.DEPT_NM}</option> --%>
								<option value="${cndMap.DEPT_NUM}" >${cndMap.DEPT_NM}</option>
							  </c:forEach>
				            </select>
						</div>
						<label for="ipAddFee" class="col-md-1 col-form-label">추가 등록금</label>
						<div class="col-md-4" id="divAddFee">
							<input class="form-control" type="search"
								value="" id="ipAddFee" readonly />

<%-- 							<fmt:formatNumber --%>
<%--  								value="<input class="form-control" type="search" --%>
<%--  											value="" id="ipAddFee" readonly />" --%>
<%--  								type="currency" currencySymbol="\"></fmt:formatNumber> --%>


						</div>
					</div>
					<br/>
					<div class="row text-end">
						<label for="html5-search-input" id="dateLabel" class="col-md-1 col-form-label">신청일</label>
						<div class="col-md-4">
							<fmt:formatDate value="${ymd}" pattern="yyyy.MM.dd" var="yyMMdd" />
							<input class="form-control" type="search" value="${yyMMdd}" id="html5-search-input" readonly />
						</div>
					</div>
					<button type="button" id="btnAppTR" class="btn btn-primary col-2" style="float: right; margin: 20px;" >신청하기</button>
				</div>
			</div>
			<div class="card-footer"></div>
		</div>
	  </form>
	</div>
</div>

<script>
$(document).ready(function(){
	//가장 상단의 과로 전과 시 발생하는 추가등록금
	let tranDeptNum = $("#selectDept").val();
	let preDeptNum = ${stuInfo.DEPT_NUM};
	let data = {"preDeptNum":preDeptNum, "tranDeptNum":tranDeptNum};

	$.ajax({
		url : "/academic/addFee",
		contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
		data : JSON.stringify(data),		//=> 보내는 데이터(?)
		dataType : "json",										//=> dataType은 '응답타입'
		type : "post",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(result){
			let addFee = 0;
			if(result.ADDFEE < 0){
				addFee = 0;
			}
			else{
				addFee = result.ADDFEE;
			}

			let iAddFee = parseInt(addFee);
			$("#ipAddFee").val(str);


		},
		error : function(){

		}
	});

	$("#selecColl").on("change", function(){
		let collNum =  $(this).val();
		let data = { "collNum":collNum}
		location.href="/academic/acaTRStu?collNum="+collNum;
	});

	$("#selectDept").on("change", function(){
		let tranDeptNum = $(this).val();
		let preDeptNum = ${stuInfo.DEPT_NUM};
		let data = {"preDeptNum":preDeptNum, "tranDeptNum":tranDeptNum};

		$.ajax({
			url : "/academic/addFee",
			contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
			data : JSON.stringify(data),		//=> 보내는 데이터(?)
			dataType : "json",										//=> dataType은 '응답타입'
			type : "post",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
				let addFee = 0;
				if(result.ADDFEE < 0){
					addFee = 0;
				}
				else{
					addFee = result.ADDFEE;
				}

				$("#ipAddFee").val(addFee);

			},
			error : function(){
				Swal.fire({
					title: '실패.',
					showClass: {
						popup: 'animate__animated animate__bounceIn'
					},
					icon: 'error',
					customClass: {
						confirmButton: 'btn btn-primary'
					},
					buttonsStyling: false
				});
			}
		});
	});

	$("#btnAppTR").on("click", function(){
		let mRecode = ${stuInfo.get("MAJOR_RECODE")};
		let eRecode = ${stuInfo.get("ELECTIVE_RECODE")};
		let meSum = mRecode + eRecode;
		let stuNum = ${stuInfo.get("STU_NUM")};
		let data = {
						"tranDeptNum":tranDeptNum,
						"preDeptNum":preDeptNum,
						"stuNum":stuNum
					};

		if(meSum < 40){
			Swal.fire({
		    	  html: '40학점 이상 이수 시에만 전과신청이 가능합니다.',
		    	  icon: 'warning',

		    	  confirmButtonText: '확인'
		      });

		}else {

			$.ajax({
				url : "/academic/appTR",
				contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
				data : JSON.stringify(data),		//=> 보내는 데이터(?)
				dataType : "json",										//=> dataType은 '응답타입'
				type : "post",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result){
					if(result.result == 'wait'){
						Swal.fire({
					    	  html: '승인대기 상태인 전과신청 내역이 존재합니다.<br />학적변동 신청목록 화면으로 이동합니다.',
					    	  icon: 'warning',

					    	  confirmButtonText: '확인'
					      }).then(result => {
					    	  location.href = "/academic/acaListStu";
					      	});
					}else if(result.result == 'exist'){
						Swal.fire({
					    	  html: '승인완료된 전과신청 내역이 존재합니다.<br />학적변동 신청목록 화면으로 이동합니다.',
					    	  icon: 'warning',

					    	  confirmButtonText: '확인'
					      }).then(result => {
					    	  location.href = "/academic/acaListStu";
					      	});
					}else if(result.result == 'over'){
						Swal.fire({
					    	  text: '전과 신청정원을 초과하였습니다. 전과신청이 불가합니다.',
					    	  icon: 'warning',

					    	  confirmButtonText: '확인'
					      });
					}else if(result.result == 'success'){
						Swal.fire({
					    	  html: '전과신청이 등록되었습니다.<br />학적변동 신청목록 화면으로 이동합니다.',
					    	  icon: 'success',

					    	  confirmButtonText: '확인'
					      }).then(result => {
					    	  location.href = "/academic/acaListStu";
					      	});
					}else{
						Swal.fire({
							title: '전과신청이 처리되지 않았습니다. 다시 시도해주세요.',
							showClass: {
								popup: 'animate__animated animate__bounceIn'
							},
							icon: 'warning',
							customClass: {
								confirmButton: 'btn btn-primary'
							},
							buttonsStyling: false
						});
					}

				},
				error : function(){
					Swal.fire({
						title: '오류가 발생하였습니다. 관리자에게 문의해주세요.',
						showClass: {
							popup: 'animate__animated animate__bounceIn'
						},
						icon: 'error',
						customClass: {
							confirmButton: 'btn btn-primary'
						},
						buttonsStyling: false
					});
				}
			});
		}

	});
});
</script>
