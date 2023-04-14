<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
td{
	font-size: 1rem;
	text-align: center;
}

th{
	text-align: center;
}

#btnAC, #btnDM, #btnTR {
	font-size: 13px;
	padding: 0px;
	width: 42px;
	height: 23px;
}

#btnAC {
	padding-top: 0px;
}
#html5-search-input{
	font-size : 1.2rem;
}
</style>

<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bx-street-view page-icon"></i>
	<span class="fw-light" >학적변동 신청 / </span>학적변동 신청내역
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

<!-- 학적변동 신청내역 시작 -->
		<div class="card mb-3">
			<div class="card-body">
			<div class="table-responsive text-nowrap" >
				<table class="table" style="padding:20px;">
					<caption align="top"><i class='bx bxs-square'></i>학적변동 신청내역 &#91; <c:if test="${empty acChgList}">0</c:if>  ${acChgList[0].CNT} 건 &#93;</caption>
					<thead class="table-active">
						<div style="float: right;"><span>* '반려' 문구 클릭 시 반려사유 확인가능</span></div>
						<tr class="text-nowrap">
							<th>번호</th>
							<th>신청내용</th>
							<th>변동사유</th>
							<th>변동 시작학기</th>
							<th>변동 종료학기</th>
							<th scope="row">승인구분</th>
						</tr>
					</thead>
					<tbody>
					  <c:if test="${empty acChgList}">
					  	<tr>
					  		<td colspan="6">신청내역이 존재하지 않습니다.</td>
					  	</tr>
					  </c:if>

					  <c:forEach var="chgMap" items="${acChgList}" varStatus="stat">
						<tr>
							<td>${chgMap.ROW_NUM}</td>
							<c:choose>
								<c:when test="${chgMap.AC_LIST == 0}">
									<td>복학</td>
								</c:when>
								<c:when test="${chgMap.AC_LIST == 1}">
									<td>휴학</td>
								</c:when>
								<c:when test="${chgMap.AC_LIST == 2}">
									<td>자퇴</td>
								</c:when>
								<c:otherwise>
									<td>-</td>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${chgMap.AC_REASON == null || chgMap.AC_REASON == '' }">
									<td>-</td>
								</c:when>
								<c:otherwise>
									<td>${chgMap.AC_REASON}</td>
								</c:otherwise>
							</c:choose>

							<td>${chgMap.AC_SDT}학기</td>
							<c:choose>
								<c:when test="${chgMap.AC_EDT == null || chgMap.AC_EDT == '' }">
									<td>-</td>
								</c:when>
								<c:otherwise>
									<td>${chgMap.AC_EDT}학기</td>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${chgMap.AC_CHECK == '0'}">
									<td><span class="badge rounded-pill bg-label-success">대기</span></td>
								</c:when>
								<c:when test="${chgMap.AC_CHECK == '1'}">
									<td><span class="badge rounded-pill bg-label-info">승인</span></td>
								</c:when>
								<c:when test="${chgMap.AC_CHECK == '2'}">
									<td>
<!-- 										<button type="button" id="btnRJ" class="btn rounded-pill btn-outline-secondary" data-bs-toggle="modal" data-bs-target="modalCenter"> -->
										<p id="pAcNum" style="display: none;">${chgMap.AC_NUM}</p>
										<button type="button" id="btnAC" class="btn rounded-pill btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#modalCenter">
											반려
										</button>
									</td>
								</c:when>
							</c:choose>

						</tr>
					  </c:forEach>
					</tbody>
				</table>
			</div>
			</div>
			<div class="card-footer"></div>
		</div>
		<!-- 학적변동 신청내역 끝 -->

		<!-- 복수전공/부전공 신청내역 시작 -->
		<div class="card mb-3">
			<div class="card-body">
			<div class="table-responsive text-nowrap" >
				<table class="table" style="padding:20px;">
					<caption align="top"><i class='bx bxs-square'></i>복수전공/부전공 신청내역  &#91; <c:if test="${empty acDMList}">0</c:if> ${acDMList[0].CNT} 건 &#93;</caption>
					<thead class="table-active">
						<tr class="text-nowrap">
							<th>번호</th>
							<th>구분</th>
							<th>신청학과</th>
							<th>승인일자</th>
							<th scope="row">승인구분</th>
						</tr>
					</thead>
					<tbody>
					  <c:if test="${empty acDMList}">
					  	<tr>
					  		<td colspan="6">신청내역이 존재하지 않습니다.</td>
					  	</tr>
					  </c:if>

					  <c:forEach var="dmMap" items="${acDMList}" varStatus="stat">
						<tr>
							<td>${dmMap.ROW_NUM}</td>
							<c:choose>
								<c:when test="${dmMap.DM_DIVISION == 0}">
									<td>복수전공</td>
								</c:when>
								<c:when test="${dmMap.DM_DIVISION == 1}">
									<td>부전공</td>
								</c:when>
								<c:otherwise>
									<td>-</td>
								</c:otherwise>
							</c:choose>

							<td>${dmMap.DEPT_NM}</td>
							<c:choose>
								<c:when test="${dmMap.DM_CDT == null || dmMap.DM_CDT == ''}">
									<td>-</td>
								</c:when>
								<c:otherwise>
									<td><fmt:formatDate pattern="yyyy.MM.dd" value="${dmMap.DM_CDT}"/></td>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${dmMap.DM_CHECK == '0'}">
									<td><span class="badge rounded-pill bg-label-success">대기</span></td>
								</c:when>
								<c:when test="${dmMap.DM_CHECK == '1'}">
									<td><span class="badge rounded-pill bg-label-info">승인</span></td>
								</c:when>
								<c:when test="${dmMap.DM_CHECK == '2'}">
									<td>
<!-- 										<span class="badge rounded-pill bg-label-dark" > -->
										<p id="pDmNum" style="display: none;">${dmMap.DM_NUM}</p>
										<button type="button" id="btnDM" class="btn rounded-pill btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#modalCenter">
											반려
										</button>
<!-- 										</span> -->
									</td>
								</c:when>
							</c:choose>
						</tr>
					  </c:forEach>
					</tbody>
				</table>
			</div>
			</div>
			<div class="card-footer"></div>
		</div>
		<!-- 복수전공/부전공 신청내역 끝 -->

		<!-- 전과 신청내역 시작 -->
		<div class="card">
			<div class="card-body">
			<div class="table-responsive text-nowrap" >
				<table class="table" style="padding:20px;">
					<caption align="top"><i class='bx bxs-square'></i>전과 신청내역 &#91; <c:if test="${empty acTranList}">0</c:if> ${acTranList[0].CNT} 건 &#93;</caption>
					<thead class="table-active">
						<tr class="text-nowrap">
							<th>번호</th>
							<th>신청일자</th>
							<th>신청학과</th>
							<th>기존학과</th>
<!-- 							<th>변동 시작일</th> -->
<!-- 							<th>변동 종료일</th> -->
							<th scope="row">승인구분</th>
<!-- 							<th>첨부파일</th> -->
						</tr>
					</thead>
					<tbody>
					  <c:if test="${empty acTranList}">
					  	<tr>
					  		<td colspan="6">신청내역이 존재하지 않습니다.</td>
					  	</tr>
					  </c:if>

					  <c:forEach var="tranMap" items="${acTranList}" varStatus="stat">
						<tr>
							<td>${tranMap.ROW_NUM}</td>
							<td><fmt:formatDate pattern="yyyy.MM.dd" value="${tranMap.TD_DT}"/></td>
							<td>${tranMap.DEPT_NM}</td>
							<td>${tranMap.TD_OLD_NM}</td>
<!-- 							<td>2023년 1학기</td>  -->
<!-- 							<td>2023년 1학기</td> -->

							<c:choose>
								<c:when test="${tranMap.TD_CHECK == '0'}">
									<td><span class="badge rounded-pill bg-label-success">대기</span></td>
								</c:when>
								<c:when test="${tranMap.TD_CHECK == '1'}">
									<td><span class="badge rounded-pill bg-label-info">승인</span></td>
								</c:when>
								<c:when test="${tranMap.TD_CHECK == '2'}">
									<td>
<!-- 										<span class="badge rounded-pill bg-label-dark" > -->
<!-- 										<button type="button" class="btn btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter"> -->
										<p id="pTrNum" style="display: none;">${tranMap.TD_NUM}</p>
										<button type="button" id="btnTR" class="btn rounded-pill btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#modalCenter">
											반려
										</button>
<!-- 										</span> -->
									</td>
								</c:when>
							</c:choose>

<!-- 							<td><span class="badge rounded-pill bg-label-dark" ><button type="button" class="btn btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">거절</button></span></td> -->
<!-- 							<td>1</td> -->
						</tr>
					  </c:forEach>
					</tbody>
				</table>
			</div>
			</div>
			<div class="card-footer"></div>
		</div>
		<!-- 전과 신청내역 시작 -->


<!-- Modal -->
<div class="modal fade" id="modalCenter" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalCenterTitle">반려 사유</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col mb-3">
            <label for="nameWithTitle" class="form-label">사유</label>
            <input type="text" id="ipReason" class="form-control" placeholder="적합하지 않은 사유" value="합하지 않은 사유" readonly />
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">확인</button>
<!--         <button type="button" class="btn btn-dark">반려</button> -->
      </div>
    </div>
  </div>
</div>


<script>
$(document).ready(function(){

	$(document).on("click", "#btnAC", function(){
		let acNum = $(this).prev('p').text();

		let data = { "acNum":acNum }
		$.ajax({
			url : "/academic/getChgRejectReason",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			dataType : "json",
			type : "post",
			beforeSend : function(xhr) {
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){

				let acComre = result.AC_COMRE;
				if(acComre == null || acComre == 'null'){
					$("#ipReason").val("(등록된 반려사유가 존재하지 않습니다.)");
					return false;
				}
				
				$("#ipReason").val(acComre);

			},
			error : function(){
				}
			});

	});

	$(document).on("click", "#btnDM", function(){
		let dmNum = $(this).prev('p').text();
		let data = { "dmNum":dmNum };
		
		$.ajax({
			url : "/academic/getDMRejectReason",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			dataType : "json",
			type : "post",
			beforeSend : function(xhr) {
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				let dmComre = result.DM_COMRE;

				if(dmComre == null || dmComre == 'null'){
					$("#ipReason").val("(등록된 반려사유가 존재하지 않습니다.)");
					return false;
				}

				$("#ipReason").val(dmComre);
			},
			error : function(){

			}
		});
	});

	$(document).on("click", "#btnTR", function(){
		let trNum = $(this).prev('p').text();

		let data = { "trNum":trNum };
		$.ajax({
			url : "/academic/getTRRejectReason",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			dataType : "json",
			type : "post",
			beforeSend : function(xhr) {
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
				let check = result.result;

				if(check == 'nd'){

					$("#ipReason").val("(등록된 반려사유가 존재하지 않습니다.)");
					return false;
				}


				let tdComre = result.TD_COMRE;

				$("#ipReason").val(tdComre);

			},
			error : function(){

			}
		});

	});
});

</script>