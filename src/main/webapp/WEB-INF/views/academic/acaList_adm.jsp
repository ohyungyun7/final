<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
td{
	font-size: 1rem;
}

#acTr:hover {
	background-color: lightyellow;
}

#dmTr:hover {
	background-color: lightyellow;
}

#acaTr:hover {
	background-color: lightyellow;
}


</style>

<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bx-street-view page-icon"></i>
	<span class="fw-light" style="cursor: pointer;" >학적변동 신청 / </span>
	학적변동 신청내역
</h4>

<div class="card">
	<div class="card-body">

		<div class="card">
			<div class="card-body overflow-hidden ps ps--active-y">
			<div class="row">
			  <!-- 신청사항 select -->
	          <div class="col-md-2 mb-3 mt-1">
				  <select id="searchSelect" class="form-select form-select-sm">
				    <option>선택</option>
				    <option value="1">학생명</option>
				    <option value="2">학과명</option>
				  </select>
	          </div>
	          <div class="col-md-2 mb-3 mt-1">
	          	<input id="ipKeyword" value="" class="form-control form-control-sm" type="text" placeholder="검색어" />
	          </div>
	          <div class="col-md-2 mb-3">
	          	<button type="button" id="btnSearch" class="btn rounded-pill bg-label-secondary" style="float: left;">검색</button>
	          </div>
	         </div>
				<div class="table-responsive text-nowrap h-px-500" style="overflow:auto;" id="">
					<table id="acaTable" class="table" style="padding:20px; text-align:center;" >
						<caption align="top"><i class='bx bxs-square'></i>학적변동 신청내역 &#91; ${acGpCnt} 건 &#93;</caption>
						<thead class="table-active">
							<tr class="text-nowrap">
								<th>번호</th>
								<th>상태</th>
								<th>학번</th>
								<th>학과</th>
								<th>이름</th>
								<th>신청사항</th>
								<th>신청사유</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="acTbody">
						  <c:forEach var="acaMap" items="${acaList}" varStatus="stat">
							<tr id="acTr">
								<td>${stat.count}</td>
							  <c:choose>
							    <c:when test="${acaMap.CHG_CHECK == '대기'}">
									<td><span class="badge rounded-pill bg-label-info">${acaMap.CHG_CHECK}</span></td>
								</c:when>
							    <c:when test="${acaMap.CHG_CHECK == '승인'}">
									<td><span class="badge rounded-pill bg-label-success">${acaMap.CHG_CHECK}</span></td>
								</c:when>
							    <c:when test="${acaMap.CHG_CHECK == '반려'}">
									<td><span class="badge rounded-pill bg-label-warning">${acaMap.CHG_CHECK}</span></td>
								</c:when>
							  </c:choose>
								<td>${acaMap.STU_NUM}</td>
								<td>${acaMap.DEPT_NM}</td>
								<td>${acaMap.STU_NM_KOR}</td>
								<td id="tdCont">${acaMap.CONT}</td>
								<td>${acaMap.REASON}</td>
								<td>
								  <c:if test="${acaMap.CHG_CHECK == '대기'}">
									<p style="display: none;">${acaMap.NUM}</p>
									<button type="button" id="btnGpApp" class="btn btn-info btn-sm">승인</button>
									<button type="button" id="btnGpRj" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">반려</button>
								  </c:if>
								</td>
							</tr>
						  </c:forEach>
						</tbody>
					</table>

				</div>
			</div>

			<div class="card-footer">
			</div>
		</div>
		<br /><br /><br />
		<!-- 두번째 -->
		<div class="card">
			<div class="card-body overflow-hidden ps ps--active-y">
			<div class="row">
			  <!-- 신청사항 select -->
	          <div class="col-md-2 mb-3 mt-1">
				  <select id="dmSelect" class="form-select form-select-sm">
				    <option>선택</option>
				    <option value="1">학생명</option>
				    <option value="2">학과명</option>
				  </select>
	          </div>
	          <div class="col-md-2 mb-3 mt-1">
	          	<input id="ipDmSearch" value="" class="form-control form-control-sm" type="text" placeholder="검색어" />
	          </div>
	          <div class="col-md-2 mb-3">
	          	<button type="button" id="btnDmSearch" class="btn rounded-pill bg-label-secondary" style="float: left;">검색</button>
	          </div>
	         </div>
				<div class="table-responsive text-nowrap h-px-500" style="overflow:auto;" id="">

					<table id="dmTable" class="table" style="padding:20px; text-align:center;" >
						<caption align="top"><i class='bx bxs-square'></i>복수전공/부전공 신청내역 &#91; ${dmCnt} 건 &#93;</caption>
						<thead class="table-active">
							<tr class="text-nowrap">
								<th>번호</th>
								<th>상태</th>
								<th>학번</th>
								<th>학과</th>
								<th>이름</th>
								<th>신청사항</th>
								<th>신청학과</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="dmTbody">
						  <c:forEach var="dmMap" items="${dmList}" varStatus="stat">
							<tr id="dmTr">
								<td>${stat.count}</td>
							  <c:choose>
							    <c:when test="${dmMap.DM_CHECK == '대기'}">
									<td><span class="badge rounded-pill bg-label-info">${dmMap.DM_CHECK}</span></td>
								</c:when>
							    <c:when test="${dmMap.DM_CHECK == '승인'}">
									<td><span class="badge rounded-pill bg-label-success">${dmMap.DM_CHECK}</span></td>
								</c:when>
							    <c:when test="${dmMap.DM_CHECK == '반려'}">
									<td><span class="badge rounded-pill bg-label-warning">${dmMap.DM_CHECK}</span></td>
								</c:when>
							  </c:choose>


								<td>${dmMap.STU_NUM}</td>
								<td>${dmMap.MAJOR_DEPT_NM}</td>
								<td>${dmMap.STU_NM_KOR}</td>
								<td id="tdCont">${dmMap.DM_DIVISION}</td>
								<td>${dmMap.APP_DEPT_NM}</td>
								<td>
									<p style="display: none;">${dmMap.DM_NUM}</p>
									<span style="display: none;">${dmMap.APP_DEPT_NUM}</span>
								  <c:if test="${dmMap.DM_CHECK == '대기'}">
									<button type="button" id="btnDmApp" class="btn btn-info btn-sm">승인</button>
									<button type="button" id="btnDmRj" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">반려</button>
								  </c:if>
								</td>
							</tr>
						  </c:forEach>
						</tbody>
					</table>

					<br /><br /><br />

				</div>
			</div>

			<div class="card-footer">
			</div>
		</div>
		<br /><br /><br />
		<!-- 세번째 -->
		<div class="card">
			<div class="card-body overflow-hidden ps ps--active-y">
			<div class="row">
			  <!-- 신청사항 select -->
	          <div class="col-md-2 mb-3 mt-1">
				  <select id="tdSelect" class="form-select form-select-sm">
				    <option>선택</option>
				    <option value="1">학생명</option>
				    <option value="2">학과명</option>
				  </select>
	          </div>
	          <div class="col-md-2 mb-3 mt-1">
	          	<input id="ipTdSearch" class="form-control form-control-sm" type="text" placeholder="검색어" />
	          </div>
	          <div class="col-md-2 mb-3">
	          	<button type="button" id="btnTdSearch" class="btn rounded-pill bg-label-secondary" style="float: left;">검색</button>
	          </div>
	         </div>
				<div class="table-responsive text-nowrap h-px-800" style="overflow:auto;" id="">

					<table id="tdTable" class="table" style="padding:20px; text-align:center;" >
						<caption align="top"><i class='bx bxs-square'></i>전과 신청내역 &#91; ${tdCnt} 건 &#93;</caption>
						<thead class="table-active">
							<tr class="text-nowrap">
								<th>번호</th>
								<th>상태</th>
								<th>학번</th>
								<th>학과</th>
								<th>이름</th>
								<th>신청학과</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="tdTbody">
						  <c:forEach var="trMap" items="${trList}" varStatus="stat">
							<tr id="acaTr">
								<td>${stat.count}</td>
								<c:choose>
							      <c:when test="${trMap.TD_CHECK == '대기'}">
									<td><span class="badge rounded-pill bg-label-info">${trMap.TD_CHECK}</span></td>
								  </c:when>
							      <c:when test="${trMap.TD_CHECK == '승인'}">
									<td><span class="badge rounded-pill bg-label-success">${trMap.TD_CHECK}</span></td>
								  </c:when>
							      <c:when test="${trMap.TD_CHECK == '반려'}">
									<td><span class="badge rounded-pill bg-label-warning">${trMap.TD_CHECK}</span></td>
								  </c:when>
							    </c:choose>

								<td>${trMap.STU_NUM}</td>
								<td>${trMap.MAJOR_DEPT_NM}</td>
								<td>${trMap.STU_NM_KOR}</td>
								<td>${trMap.APP_DEPT_NM}</td>
								<td>
									<p style="display: none;">${trMap.TD_NUM}</p>
									<span style="display: none;">${trMap.APP_DEPT_NUM}</span>
									<c:if test="${trMap.TD_CHECK == '대기'}">
										<button type="button" id="btnTdApp" class="btn btn-info btn-sm">승인</button>
										<button type="button" id="btnTdRj" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">반려</button>
									</c:if>
								</td>
							</tr>
						  </c:forEach>
						</tbody>
					</table>

					<br /><br /><br />

				</div>
			</div>

			<div class="card-footer">
			</div>
		</div>

	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="modalCenter" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalCenterTitle">반려 사유 입력</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">

		<div class="row g-2 w-px-500">
		   <div class="col mb-0">
			   <div class="row g-1">
				   <label for="emailSlideTop" class="col-form-label col text-center">학번</label>
				   <input type="text" id="ipStuNum" class="form-control col mb-0 form-control-sm" value="201901010" readonly>
			   </div>
		   </div>
		   <div class="col mb-0">
			   <div class="row g-1">
				   <label for="dobSlideTop" class="col-form-label col text-center">이름</label>
				   <input type="text" id="ipStuNm" class="form-control col md-3 form-control-sm" value="홍길동" readonly>
			   </div>
		   </div>
		 </div>
		<div class="row g-2 w-px-500">
		   <div class="col mb-0">
			   <div class="row g-1">
				   <label for="emailSlideTop" class="col-form-label col text-center">신청사항</label>
				   <input type="text" id="ipCont" class="form-control col mb-0 form-control-sm" value="휴학" readonly>
			   </div>
		   </div>
		   <div class="col mb-0">
			   <div class="row g-1">
				   <label for="dobSlideTop" class="col-form-label col text-center">신청사유</label>
				   <input type="text" id="ipReason" class="form-control col md-3 form-control-sm" value="개인사정" readonly>
			   </div>
		   </div>
		 </div>
        <hr/>
        <div class="row">
          <div class="col mb-3">
            <label for="nameWithTitle" class="form-label">반려 사유</label>
            <input type="text" id="rjReason" class="form-control" placeholder="반려사유" required />
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" id="btnMdRj" class="btn btn-dark">반려</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
// 	$("#select2Primary").select2();
// new PerfectScrollbar(document.getElementById('vertical-example'), {
// 	  wheelPropagation: false
// 	});
</script>

<script>
$(document).ready(function(){

	$(".firstTable").DataTable({
		aaSorting : []
	});

	//학적변동 + 졸업유예 신청 처리내용 시작
	//승인버튼 클릭 시
	$(document).on("click", "#btnGpApp", function(){
		let cont = $(this).parent().siblings("td:eq(5)").text();
		let stuNum = $(this).parent().siblings("td:eq(2)").text();
		let num = $(this).parent().find('p').text();

		if(cont == '졸업유예'){	//신청내용이 '졸업유예'인 경우
			let data = {
							"stuNum":stuNum
						  , "gpNum":num

						};

			$.ajax({
				url : "/academic/processGp",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data),
				dataType : "json",
				type : "post",
				beforeSend : function(xhr) {
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result){
					if(result > 0){	//졸업유예 신청 승인처리 성공 시

						Swal.fire({
					    	  html: '승인 완료',
					    	  icon: 'success',

					    	  confirmButtonText: '확인'

					      }).then(result => {
					    	  location.href = "/academic/acaListAdm";
					      	});
					}
					else{	//졸업유예 신청 승인처리 실패 시

						Swal.fire({
					    	  html: '승인 실패',
					    	  icon: 'warning',

					    	  confirmButtonText: '확인'

					      }).then(result => {
					    	  location.href = "/academic/acaListAdm";
					      	});
					}
				},
				error : function(){	//오류 발생 시

					Swal.fire({
				    	  html: '승인 실패',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListAdm";
				      	});
				}
			});
		}else {	//신청내용이 '학적변동'인 경우

			let data = {
					"stuNum":stuNum
				  , "acChgNum":num
				  , "cont":cont

				};

			$.ajax({
				url : "/academic/processAcChg",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data),
				dataType : "json",
				type : "post",
				beforeSend : function(xhr) {
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result){
					if(result > 0){	//학적변동 승인처리 성공 시
						Swal.fire({
					    	  html: '승인 완료',
					    	  icon: 'success',

					    	  confirmButtonText: '확인'

					      }).then(result => {
					    	  location.href = "/academic/acaListAdm";
//					    	  return false;
					      	});
					}else{	//학적변동 승인처리 실패 시

						Swal.fire({
					    	  html: '승인 실패',
					    	  icon: 'warning',

					    	  confirmButtonText: '확인'

					      }).then(result => {
					    	  location.href = "/academic/acaListAdm";
	//				    	  return false;
					      	});
					}
				},
				error : function(){	//오류 발생 시
					Swal.fire({
				    	  html: '승인 실패',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListAdm";
				      	});
				}

				});
		}

	});

	//반려버튼 클릭 시
	$(document).on("click", "#btnGpRj", function(){
		let cont = $(this).parent().siblings("td:eq(5)").text();
		let num = $(this).parent().find('p').text();

		let data = {	"num":num
					  , "cont":cont
					};

			//반려 모달창에 들어갈 학생정보 요청
			$.ajax({
				url : "/academic/getSingleGp",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data),
				dataType : "json",
				type : "post",
				beforeSend : function(xhr) {
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result){
					let stuNum = result.STU_NUM;
					let stuNm = result.STU_NM_KOR;
					let cont = result.CONT;
					let reason = result.REASON;
					let num = result.NUM;

					$("#ipStuNum").val(stuNum);
					$("#ipStuNm").val(stuNm);
					$("#ipCont").val(cont);
					$("#ipReason").val(reason);

				},
				error : function(){

					Swal.fire({
				    	  html: '반려처리 불가합니다. 관리자에게 문의하세요.',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListAdm";
				      	});

				}
			});




		//반려 모달창 내 반려버튼 클릭 시
		$(document).on("click", "#btnMdRj", function(){
			let cont = $("#ipCont").val();
			let rjReason = $("#rjReason").val().trim();

			if(rjReason == "" || rjReason == null ){	//반려사유란에 값이 존재하지 않는 경우
				Swal.fire({
			    	  html: '반려사유를 입력해주세요',
			    	  icon: 'warning',

			    	  confirmButtonText: '확인'

			      }).then(result => {
			    	  return false;
			      	});
			}

			if(cont == '졸업유예'){	//신청내용이 졸업유예인 경우
				let data = {
								"gpComre":rjReason
							  , "gpNum":num
							};

				//졸업유예 반려처리
				$.ajax({
					url : "/academic/rejectGp",
					contentType : "application/json;charset=utf-8",
					data : JSON.stringify(data),
					dataType : "json",
					type : "post",
					beforeSend : function(xhr) {
			            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success : function(result){	//졸업유예 신청 반려처리 성공 시
						Swal.fire({
					    	  html: '반려 완료. 신청목록으로 이동합니다.',
					    	  icon: 'success',

					    	  confirmButtonText: '확인'

					      }).then(result => {
					    	  location.href = "/academic/acaListAdm";
					      	});

					},
					error : function(){	//오류 발생 시
						Swal.fire({
					    	  html: '반려처리 불가합니다. 관리자에게 문의하세요.',
					    	  icon: 'warning',

					    	  confirmButtonText: '확인'

					      }).then(result => {
					    	  location.href = "/academic/acaListAdm";
					      	});
					}
				});

			}else{	//학적변동 반려처리

					let data = {
							"acComre":rjReason
						  , "acNum":num
						};

					$.ajax({
						url : "/academic/rejectAcChg",
						contentType : "application/json;charset=utf-8",
						data : JSON.stringify(data),
						dataType : "json",
						type : "post",
						beforeSend : function(xhr) {
				            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						},
						success : function(result){	//학적변동 신청 반려처리 성공 시
							if(result > 0){

								Swal.fire({
							    	  html: '반려 완료. 신청목록으로 이동합니다.',
							    	  icon: 'success',

							    	  confirmButtonText: '확인'

							      }).then(result => {
							    	  location.href = "/academic/acaListAdm";
							      	});
							}else{	//학적변동 신청 반려처리 실패 시
								Swal.fire({
							    	  html: '반려처리 불가합니다. 관리자에게 문의바랍니다.',
							    	  icon: 'warning',

							    	  confirmButtonText: '확인'

							      }).then(result => {
							    	  location.href = "/academic/acaListAdm";
							      	});
							}
						},
						error : function(){	//오류 발생 시
							Swal.fire({
						    	  html: '에러발생. 반려처리 불가합니다. 관리자에게 문의바랍니다.',
						    	  icon: 'warning',

						    	  confirmButtonText: '확인'

						      }).then(result => {
						    	  location.href = "/academic/acaListAdm";
						      	});
					}
				});

			}

		});
	});
	//학적변동 + 졸업유예 신청 처리내용 끝

	//복수전공 + 부전공 신청 처리내용 시작
	//승인버튼 클릭 시
	$(document).on("click", "#btnDmApp", function(){
		//신청번호
		let dmNum = $(this).parent().find('p').text();
		//학번
		let stuNum = $(this).parent().siblings("td:eq(2)").text();
		//신청학과번호
		let appDeptNum = $(this).parent().find('span').text();

		let data = {
						"dmNum":dmNum
					  , "stuNum":stuNum
					  , "stuDmajor":appDeptNum
					};

		//복수전공/부전공 신청승인 처리과정
		$.ajax({
			url : "/academic/approveDM",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			dataType : "json",
			type : "post",
			beforeSend : function(xhr) {
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
				if(result > 0){	//승인처리 성공 시

					Swal.fire({
				    	  html: '승인 완료',
				    	  icon: 'success',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListAdm";
				      	});
				}else{	//승인처리 실패 시

					Swal.fire({
				    	  html: '승인 실패',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListAdm";
				      	});

				}

			},
			error : function(){	//오류 발생 시

				Swal.fire({
			    	  html: '승인 실패',
			    	  icon: 'warning',

			    	  confirmButtonText: '확인'

			      }).then(result => {
			    	  location.href = "/academic/acaListAdm";
			      	});

			}
		});

	});

	//반려버튼 클릭 시
	$(document).on("click", "#btnDmRj", function(){
		let dmNum = $(this).parent().find('p').text();

		let data = {
						"dmNum":dmNum
					};

		//반려 모달창에 들어갈 학생정보 요청
		$.ajax({
			url : "/academic/getSingleDMHistory",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			dataType : "json",
			type : "post",
			beforeSend : function(xhr) {
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
				let stuNum = result.STU_NUM;
				let stuNm = result.STU_NM_KOR;
				let division = result.DM_DIVISION;
				let reason = result.REASON;

				$("#ipStuNum").val(stuNum);
				$("#ipStuNm").val(stuNm);
				$("#ipCont").val(division);
				$("#ipReason").val(reason);

			},
			error : function(){	//오류 발생 시
				Swal.fire({
			    	  html: '정보를 불러올 수 없습니다. 관리자에게 문의하세요.',
			    	  icon: 'warning',

			    	  confirmButtonText: '확인'

			      }).then(result => {
			    	  location.href = "/academic/acaListAdm";
			      	});

			}
		});

		//반려 모달창 내 반려버튼 클릭 시
		$(document).on("click", "#btnMdRj", function(){
			let rjReason = $("#rjReason").val().trim();
			let data = {
							"dmNum":dmNum
						  , "rjReason":rjReason
						};

			//복수전공/부전공 반려처리 과정
			$.ajax({
				url : "/academic/rejectDM",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data),
				dataType : "json",
				type : "post",
				beforeSend : function(xhr) {
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result){
					if(result > 0){	//반려처리 성공 시
						Swal.fire({
					    	  html: '반려 완료. 신청목록으로 이동합니다.',
					    	  icon: 'success',

					    	  confirmButtonText: '확인'

					      }).then(result => {
					    	  location.href = "/academic/acaListAdm";
					      	});
						return false;
					}

					//반려처리 실패 시
					Swal.fire({
				    	  html: '반려처리 실패',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListAdm";
				      	});

						return false;

				},
				error : function(){	//오류 발생 시
					Swal.fire({
				    	  html: '반려처리 불가합니다. 관리자에게 문의바랍니다.',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListAdm";
				      	});

						return false;
				}
			});
		});
	});
	//복수전공 + 부전공 신청 처리내용 끝

	//전과 신청 처리내용 시작
	//승인버튼 클릭 시
	$(document).on("click", "#btnTdApp", function(){
		//신청번호
		let tdNum = $(this).parent().find('p').text();

		//신청 학과번호
		let appDeptNum = $(this).parent().find('span').text();

		//학번
		let stuNum = $(this).parent().siblings("td:eq(2)").text();

		let data = {
						"tdNum":tdNum
					  , "appDeptNum":appDeptNum
					  , "stuNum":stuNum
					};

		//전과신청 승인처리 과정
		$.ajax({
			url : "/academic/approveTD",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			dataType : "json",
			type : "post",
			beforeSend : function(xhr) {
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
				if(result > 0){	//승인처리 성공 시


					Swal.fire({
				    	  html: '승인 완료',
				    	  icon: 'success',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListAdm";
				      	});
					return false;
				}

				//승인처리 실패 시
				Swal.fire({
			    	  html: '승인 실패',
			    	  icon: 'warning',

			    	  confirmButtonText: '확인'

			      }).then(result => {
			    	  location.href = "/academic/acaListAdm";
			      	});
				return false;

			},
			error : function(){		//오류 발생 시
				Swal.fire({
			    	  html: '승인 실패. 관리자에게 문의바랍니다.',
			    	  icon: 'warning',

			    	  confirmButtonText: '확인'

			      }).then(result => {
			    	  location.href = "/academic/acaListAdm";
			      	});
				return false;
			}
		});
	});

	//반려버튼 클릭 시
	$(document).on("click", "#btnTdRj", function(){
		let tdNum = $(this).parent().find('p').text();

		let data = {
						"tdNum":tdNum
					};

		//반려 모달창에 출력될 학생정보 요청
		$.ajax({
			url : "/academic/getSingleTDHistory",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			dataType : "json",
			type : "post",
			beforeSend : function(xhr) {
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){	//학생정보 가져오기 성공 시

				let stuNum = result.STU_NUM;
				let stuNm = result.STU_NM_KOR;
				let cont = result.CONT;
				let reason = result.REASON;

				$("#ipStuNum").val(stuNum);
				$("#ipStuNm").val(stuNm);
				$("#ipCont").val(cont);
				$("#ipReason").val(reason);
			},
			error : function(){	//오류 발생 시

			}
		});


		$(document).on("click", "#btnMdRj", function(){
			let rjReason = $("#rjReason").val().trim();

			let data = {
							"tdNum":tdNum
						  , "tdComre":rjReason
						};

			//전과신청 반려처리 과정
			$.ajax({
				url : "/academic/rejectTD",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data),
				dataType : "json",
				type : "post",
				beforeSend : function(xhr) {
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result){
					if(result > 0){	//반려처리 성공 시
						Swal.fire({
					    	  html: '반려 완료. 신청목록으로 이동합니다.',
					    	  icon: 'success',

					    	  confirmButtonText: '확인'

					      }).then(result => {
					    	  location.href = "/academic/acaListAdm";
					      	});
						return false;
					}

					//반려처리 실패 시
					Swal.fire({
				    	  html: '반려처리 실패. 신청목록으로 이동합니다.',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListAdm";
				      	});

						return false;

				},
				error : function(){	//오류 발생 시

					Swal.fire({
				    	  html: '반려처리 실패. 신청목록으로 이동합니다.',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListAdm";
				      	});

						return false;
				}
			});
		});


	});

	//전과 신청 처리내용 끝



	//검색포함 학적변동 + 졸업유예 신청목록 조회 시작
	$(document).on("click", "#btnSearch", function(){

		let searchVal = $("#searchSelect").val();	//	searchVal: 1인 경우에는 학생명, 2인 경우에는 학과명
		let ipKeyword = $("#ipKeyword").val();

		if(searchVal == '선택') {
			Swal.fire({
		    	  html: '검색옵션을 선택해주세요.',
		    	  icon: 'warning',

		    	  confirmButtonText: '확인'

		      });
		      return false;
		}

		if(ipKeyword == null || ipKeyword == ''){

			Swal.fire({
		    	  html: '검색어를 입력해주세요.',
		    	  icon: 'warning',

		    	  confirmButtonText: '확인'

		      });
		      return false;
		}

		if(searchVal == 1){	//searchVal: 1인 경우(학생명으로 검색한 경우)
			let data = { "keyStuNmKor":ipKeyword };

			$.ajax({
				url : "/academic/getAcGpListIncSearchStuNum",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data),
				dataType : "json",
				type : "post",
				beforeSend : function(xhr) {
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result){

					if(result.cnt == 0){	//검색결과가 존재하지 않는 경우
						Swal.fire({
					    	  html: '검색결과가 존재하지 않습니다.',
					    	  icon: 'warning',

					    	  confirmButtonText: '확인'

					     }).then(result => {
					    	 location.href = "/academic/acaListAdm";
						      return false;
					      	});
					}

					let str = "";

					$.each(result.gpListIncSearch, function(index, item) {
						let idx2 = index + 1;

						str += '<tr>';
						str += "<td>"+idx2+"</td>";

						if(item.CHG_CHECK == '대기'){
							str += '<td><span class="badge rounded-pill bg-label-info">'+item.CHG_CHECK+'</span></td>';
						}else if(item.CHG_CHECK == '승인'){
							str += '<td><span class="badge rounded-pill bg-label-success">'+item.CHG_CHECK+'</span></td>';
						}else {
							str += '<td><span class="badge rounded-pill bg-label-warning">'+item.CHG_CHECK+'</span></td>';
						}
						str += "<td>"+item.STU_NUM+"</td>";
						str += "<td>"+item.DEPT_NM+"</td>";
						str += "<td>"+item.STU_NM_KOR+"</td>";
						str += "<td>"+item.CONT+"</td>";
						str += "<td>"+item.REASON+"</td>";
						str += '<td style="font-size: font-size: 1rem;">';
						str +=	'<p style="display: none;">'+item.NUM+'</p>';
						if(item.CHG_CHECK == '대기'){
							str +=	'<button type="button" id="btnGpApp" class="btn btn-info btn-sm">승인</button>'
							str +=	'<button type="button" id="btnGpRj" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">반려</button>'
						}
						str += '</td>';
						str += '</tr>';


					});
						$("#acTbody").html(str);

					let cnt = result.cnt;
					let captionSon = $("#acaTable").find("caption").text();
					let captionStr = "<i class='bx bxs-square'></i>학적변동 신청내역 &#91; "+ cnt +"건 &#93;"
					$("#acaTable").find("caption").html(captionStr);
				},
				error : function(){

				}
			});

		}else if(searchVal == 2){	//searchVal: 2인 경우(학과명으로 검색한 경우)
			let data = { "keyDeptNm":ipKeyword };

			$.ajax({
				url : "/academic/getAcGpListIncSearchDept",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data),
				dataType : "json",
				type : "post",
				beforeSend : function(xhr) {
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result) {

					if(result.cnt == 0){	//검색결과가 존재하지 않는 경우
						Swal.fire({
					    	  html: '검색결과가 존재하지 않습니다.',
					    	  icon: 'warning',

					    	  confirmButtonText: '확인'

					     }).then(result => {
					    	 location.href = "/academic/acaListAdm";
						      return false;
					      	});
					}

					let str = "";

					$.each(result.AcGppListIncSearchDept, function(index, item) {
						let idx2 = index + 1;

						str += '<tr>';
						str += "<td>"+idx2+"</td>";
						if(item.CHG_CHECK == '대기'){
							str += '<td><span class="badge rounded-pill bg-label-info">'+item.CHG_CHECK+'</span></td>';
						}else if(item.CHG_CHECK == '승인'){
							str += '<td><span class="badge rounded-pill bg-label-success">'+item.CHG_CHECK+'</span></td>';
						}else {
							str += '<td><span class="badge rounded-pill bg-label-warning">'+item.CHG_CHECK+'</span></td>';
						}
						str += "<td>"+item.STU_NUM+"</td>";
						str += "<td>"+item.DEPT_NM+"</td>";
						str += "<td>"+item.STU_NM_KOR+"</td>";
						str += "<td>"+item.CONT+"</td>";
						str += "<td>"+item.REASON+"</td>";
						str += '<td>';
						str +=	'<p style="display: none;">'+item.NUM+'</p>';
						if(item.CHG_CHECK == '대기'){
							str +=	'<button type="button" id="btnGpApp" class="btn btn-info btn-sm">승인</button>'
							str +=	'<button type="button" id="btnGpRj" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">반려</button>'
						}
						str += '</td>';
						str += '</tr>';
					});
						$("#acTbody").html(str);

					let cnt = result.cnt;

					let captionSon = $("#acaTable").find("caption").text();

					let captionStr = "<i class='bx bxs-square'></i>학적변동 신청내역 &#91; " + cnt + " 건 &#93;"
					$("#acaTable").find("caption").html(captionStr);




				},
				error : function(){

				}
			});
		}
	});
	//검색포함 학적변동 + 졸업유예 신청목록 조회 끝

	//검색포함 부전공/복수전공 신청목록 조회 시작
	$(document).on("click", "#btnDmSearch", function(){
		let ipDmSearch = $("#ipDmSearch").val();
		let dmSelectVal = $("#dmSelect").val();

		if(dmSelectVal == '선택') {	//검색옵션을 선택하지 않은 경우
			Swal.fire({
		    	  html: '검색옵션을 선택해주세요.',
		    	  icon: 'warning',

		    	  confirmButtonText: '확인'

		      });
		      return false;
		}

		if(ipDmSearch == null || ipDmSearch == ''){	//검색어 미입력 시

			Swal.fire({
		    	  html: '검색어를 입력해주세요.',
		    	  icon: 'warning',

		    	  confirmButtonText: '확인'

		      });
		      return false;
		}

		if(dmSelectVal == 1) {	//학생명으로 검색한 경우
			let data = { "keyStuNmKor":ipDmSearch };

			$.ajax({
				url : "/academic/getDMListIncSearch",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data),
				dataType : "json",
				type : "post",
				beforeSend : function(xhr) {
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result) {
					if(result.cnt == 0){
						Swal.fire({
					    	  html: '검색결과가 존재하지 않습니다.',
					    	  icon: 'warning',

					    	  confirmButtonText: '확인'

					     }).then(result => {
					    	 location.href = "/academic/acaListAdm";
						      return false;
					      	});
					}

					let str = "";

					$.each(result.dmListIncSearch, function(index, item) {
						let idx2 = index + 1;

						str += '<tr>';
						str += '<td>' + idx2 + '</td>';
						if(item.DM_CHECK == '대기'){
							str += '<td><span class="badge rounded-pill bg-label-info">' + item.DM_CHECK + '</span></td>';
						}else if(item.DM_CHECK == '승인') {
							str += '<td><span class="badge rounded-pill bg-label-success">' + item.DM_CHECK + '</span></td>';
						}else {
							str += '<td><span class="badge rounded-pill bg-label-warning">' + item.DM_CHECK + '</span></td>';
						}

						str += '<td>' + item.STU_NUM + '</td>';
						str += '<td>' + item.MAJOR_DEPT_NM + '</td>';
						str += '<td>' + item.STU_NM_KOR + '</td>';
						str += '<td id="tdCont">' + item.DM_DIVISION + '</td>';
						str += '<td>' + item.APP_DEPT_NM + '</td>';
						str += '<td>';
						str += '<p style="display: none;">' + item.DM_NUM + '</p>';
						str += '<span style="display: none;">' + item.APP_DEPT_NUM + '</span>';
						if(item.DM_CHECK == '대기'){
							str += '<button type="button" id="btnDmApp" class="btn btn-info btn-sm">승인</button>';
							str += '<button type="button" id="btnDmRj" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">반려</button>';
						}
						str += '</td>';
						str += '</tr>';
					});
						$("#dmTbody").html(str);

					let cnt = result.cnt;
					let captionSon = $("#dmTable").find("caption").text();

					let captionStr = "<i class='bx bxs-square'></i>복수전공/부전공 신청내역 &#91; " + cnt + " 건 &#93;"
					$("#dmTable").find("caption").html(captionStr);

				},
				error : function(){

				}
			});

		}else if(dmSelectVal == 2){	//학과명으로 검색한 경우
			let data = { "deptNm":ipDmSearch };

			$.ajax({
				url : "/academic/getDMListIncSearchDept",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data),
				dataType : "json",
				type : "post",
				beforeSend : function(xhr) {
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result) {

					if(result.cnt == 0){	//검색결과가 존재하지 않는 경우
						Swal.fire({
					    	  html: '검색결과가 존재하지 않습니다.',
					    	  icon: 'warning',

					    	  confirmButtonText: '확인'

					     }).then(result => {
					    	 location.href = "/academic/acaListAdm";
						      return false;
					      	});
					}

					let str = "";
					$.each(result.dmListIncSearchDept, function(index, item) {
						let idx2 = index + 1;

						str += '<tr>';
						str += '<td>' + idx2 + '</td>';
						if(item.DM_CHECK == '대기'){
							str += '<td><span class="badge rounded-pill bg-label-info">' + item.DM_CHECK + '</span></td>';
						}else if(item.DM_CHECK == '승인') {
							str += '<td><span class="badge rounded-pill bg-label-success">' + item.DM_CHECK + '</span></td>';
						}else {
							str += '<td><span class="badge rounded-pill bg-label-warning">' + item.DM_CHECK + '</span></td>';
						}
						str += '<td>' + item.STU_NUM + '</td>';
						str += '<td>' + item.MAJOR_DEPT_NM + '</td>';
						str += '<td>' + item.STU_NM_KOR + '</td>';
						str += '<td id="tdCont">' + item.DM_DIVISION + '</td>';
						str += '<td>' + item.APP_DEPT_NM + '</td>';
						str += '<td>';
						str += '<p style="display: none;">' + item.DM_NUM + '</p>';
						str += '<span style="display: none;">' + item.APP_DEPT_NUM + '</span>';
						if(item.DM_CHECK == '대기'){
							str += '<button type="button" id="btnDmApp" class="btn btn-info btn-sm">승인</button>';
							str += '<button type="button" id="btnDmRj" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">반려</button>';
						}
						str += '</td>';
						str += '</tr>';
					});
						$("#dmTbody").html(str);

					let cnt = result.cnt;
					let captionSon = $("#dmTable").find("caption").text();

					let captionStr = "<i class='bx bxs-square'></i>복수전공/부전공 신청내역 &#91; " + cnt + " 건 &#93;"
					$("#dmTable").find("caption").html(captionStr);

				},
				error : function(){

				}
			});

		}

	});
	//검색포함 부전공/복수전공 신청목록 조회 끝


	//검색포함 전과 신청목록 조회 시작
	$(document).on("click", "#btnTdSearch", function(){
		let ipTdSearch = $("#ipTdSearch").val();
		let tdSelectVal = $("#tdSelect").val();

		if(tdSelectVal == '선택') {
			Swal.fire({
		    	  html: '검색옵션을 선택해주세요.',
		    	  icon: 'warning',

		    	  confirmButtonText: '확인'

		      });
		      return false;
		}

		if(ipTdSearch == null || ipTdSearch == ''){

			Swal.fire({
		    	  html: '검색어를 입력해주세요.',
		    	  icon: 'warning',

		    	  confirmButtonText: '확인'

		      });
		      return false;
		}

		if(tdSelectVal == 1){	//학생명으로 검색 시
			let data = { "keyStuNmKor":ipTdSearch };

			$.ajax({
				url : "/academic/getTDListIncSearch",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data),
				dataType : "json",
				type : "post",
				beforeSend : function(xhr) {
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result) {

					if(result.cnt == 0){	//검색결과가 존재하지 않는 경우
						Swal.fire({
					    	  html: '검색결과가 존재하지 않습니다.',
					    	  icon: 'warning',

					    	  confirmButtonText: '확인'

					     }).then(result => {
					    	 location.href = "/academic/acaListAdm";
						      return false;
					      	});
					}

					let str = "";
					$.each(result.tdListIncSearch, function(index, item) {
						let idx2 = index + 1;
						str += '<tr>';
						str += '<td>' + idx2 + '</td>';
						if(item.TD_CHECK == '대기'){
							str += '<td><span class="badge rounded-pill bg-label-info">'+item.TD_CHECK+'</span></td>';
						}else if(item.TD_CHECK == '승인'){
							str += '<td><span class="badge rounded-pill bg-label-success">'+item.TD_CHECK+'</span></td>';
						}else {
							str += '<td><span class="badge rounded-pill bg-label-warning">'+item.TD_CHECK+'</span></td>';
						}
						str += '<td>' + item.STU_NUM + '</td>';
						str += '<td>' + item.MAJOR_DEPT_NM + '</td>';
						str += '<td>' + item.STU_NM_KOR + '</td>';
						str += '<td>' + item.APP_DEPT_NM + '</td>';
						str += '<td>';
						str += '<p style="display: none;">' + item.TD_NUM + '</p>';
						str += '<span style="display: none;">' + item.APP_DEPT_NUM + '</span>';
						if(item.TD_CHECK == '대기'){
							str += '<button type="button" id="btnTdApp" class="btn btn-info btn-sm">승인</button>';
							str += '<button type="button" id="btnTdRj" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">반려</button>';
						}
						str += '</td>';
						str += '</tr>';
					});
						$("#tdTbody").html(str);

					let cnt = result.cnt;
					let captionSon = $("#tdTable").find("caption").text();

					let captionStr = "<i class='bx bxs-square'></i>전과 신청내역 &#91; " + cnt + " 건 &#93;"
					$("#tdTable").find("caption").html(captionStr);
				},
				error : function(){

				}
			});

		}else if(tdSelectVal == 2) {	//학과명으로 검색 시
			let data = { "deptNm":ipTdSearch };

			$.ajax({
				url : "/academic/getTDListIncSearchDept",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data),
				dataType : "json",
				type : "post",
				beforeSend : function(xhr) {
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result) {

					if(result.cnt == 0){	//검색결과가 존재하지 않는 경우
						Swal.fire({
					    	  html: '검색결과가 존재하지 않습니다.',
					    	  icon: 'warning',

					    	  confirmButtonText: '확인'

					     }).then(result => {
					    	 location.href = "/academic/acaListAdm";
						      return false;
					      	});
					}

					let str = "";
					$.each(result.tdListIncSearchDept, function(index, item) {
						let idx2 = index + 1;
						str += '<tr>';
						str += '<td>' + idx2 + '</td>';
						if(item.TD_CHECK == '대기'){
							str += '<td><span class="badge rounded-pill bg-label-info">'+item.TD_CHECK+'</span></td>';
						}else if(item.TD_CHECK == '승인'){
							str += '<td><span class="badge rounded-pill bg-label-success">'+item.TD_CHECK+'</span></td>';
						}else {
							str += '<td><span class="badge rounded-pill bg-label-warning">'+item.TD_CHECK+'</span></td>';
						}
						str += '<td>' + item.STU_NUM + '</td>';
						str += '<td>' + item.MAJOR_DEPT_NM + '</td>';
						str += '<td>' + item.STU_NM_KOR + '</td>';
						str += '<td>' + item.APP_DEPT_NM + '</td>';
						str += '<td>';
						str += '<p style="display: none;">' + item.TD_NUM + '</p>';
						str += '<span style="display: none;">' + item.APP_DEPT_NUM + '</span>';
						if(item.TD_CHECK == '대기'){
							str += '<button type="button" id="btnTdApp" class="btn btn-info btn-sm">승인</button>';
							str += '<button type="button" id="btnTdRj" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">반려</button>';
						}
						str += '</td>';
						str += '</tr>';
					});
						$("#tdTbody").html(str);

					let cnt = result.cnt;
					let captionSon = $("#tdTable").find("caption").text();
					let captionStr = "<i class='bx bxs-square'></i>전과 신청내역 &#91; " + cnt + " 건 &#93;"
					$("#tdTable").find("caption").html(captionStr);

				},
				error : function(){

				}
			});
		}


	});



});
</script>