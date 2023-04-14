<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
td{
	text-align: center;
	font-size: 0.9rem;
}
</style>

<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bx-street-view page-icon"></i>
	<span class="fw-light" >학적변동 신청 / </span>휴학&복학
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
		<!-- tab -->

			  <div class="nav-align-top mb-4">
			    <ul class="nav nav-tabs nav-fill" role="tablist">
			      <li class="nav-item" role="presentation">
			        <button type="button" id="btnNavLV" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-home" aria-controls="navs-justified-home" aria-selected="false" tabindex="-1">
			        	<i class='bx bx-leaf'></i> 휴학
			        </button>
			      </li>
			      <li class="nav-item" role="presentation">
<!-- 			        <button type="button" id="btnNavRT" class="nav-link " role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-profile" aria-controls="navs-justified-profile" aria-selected="true"> -->
			        <button type="button" id="btnNavRT" class="nav-link " role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-profile" aria-controls="navs-justified-profile" aria-selected="true">
			        	<i class='bx bxs-leaf' ></i> 복학
			        </button>
			      </li>
			    </ul>
			    <div class="tab-content">
					<div class="tab-pane fade active show" id="navs-justified-home" role="tabpanel">
						<!-- 휴학 신청양식 -->
				        <form action="">
				        	<input type="hidden" value="" />
					        <div class="mb-3 row">
						      <label for="html5-text-input" class="col-md-2 col-form-label">휴학 시작학기</label>
						      <div class="col-md-10">

						      	<c:set var="ymd" value="<%=new java.util.Date()%>" />
								<fmt:formatDate value="${ymd}" pattern="yyyy" var="yyyy" />
<%-- 								yy : ${yyyy} <br /> --%>
								<fmt:formatDate value="${ymd}" pattern="MM" var="mm" />
<%-- 								ymd : ${mm} <br /> --%>
								<fmt:parseNumber value="${mm}" var="num" />

<%-- 								num : ${num} --%>
								<c:if test="${num < 9}">
							        <input class="form-control" type="text" value="${yyyy}-1학기" id="acSdt" readonly />
								</c:if>
								<c:if test="${num >= 9}">
							        <input class="form-control" type="text" value="${yyyy}-2학기" id="acSdt" readonly />
								</c:if>

						      </div>
						    </div>
						    <div class="mb-3 row">
						      <label for="selectpickerBasic" class="col-md-2 col-form-label">사유</label>
						      	<div class="col-md-10">
							      	<select id="leaveSel" class="selectpicker w-100" data-style="btn-default">
							      	<option>개인사정</option>
										<option>군휴학</option>
										<option>건강악화</option>
						            </select>
					            </div>
						    </div>
						    <div class="mb-3 row">
						      <label for="html5-month-input" class="col-md-2 col-form-label">휴학기수</label>
						      <div class="col-md-4" id="seldiv1">
						        <select id="selectLV" class="selectpicker w-100" data-style="btn-default">
						        	<option selected="selected">1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
					            </select>
						      </div>
						      <label for="html5-search-input" class="col-md-2 col-form-label">복학 학기</label>
						      <div class="col-md-4">
						        <input class="form-control" type="search" value="2023-2학기" id="ip_return" readonly />
						      </div>
						    </div>
						    <div class="mb-3 row">
						    </div>
				          <button type="button" id="btnLeave" class="btn btn-primary col-2" style="float: right;" >신청하기</button>
				        </form>
				    </div>
					<!-- /휴학신청 끝 -->

			      <!-- 복학신청 시작 -->
			      <div class="tab-pane fade" id="navs-justified-profile" role="tabpanel">
						<form>
				        	<input type="hidden" value="" />
					        <div class="mb-3 row">
						      <label for="html5-text-input" class="col-md-2 col-form-label" style="text-align: center;">휴학 시작학기</label>
						      <div class="col-md-10">
						        <input class="form-control" type="text" value='<c:if test="${LHVOList!= null}">${LHVOList[0].acSdt}학기</c:if>'
						        	id="html5-text-input" style="width: 300px; text-align: center;" readonly />
						      </div>
						    </div>
<!-- 						    <div class="mb-3 row"> -->
<!-- 						      <label for="" class="col-md-2 col-form-label">사유</label> -->
<!-- 						      <div class="col-md-10"> -->
<%-- 						        <input class="form-control" type="text" value='<c:if test="${LHVOList!= null}">${LHVOList[0].acReason}</c:if>' id=""  readonly /> --%>
<!-- 						      </div>  -->
<!-- 						      	<div class="col-md-10"> -->
<!-- 							      	<select id="selectpickerBasic" class="selectpicker w-100" data-style="btn-default"> -->
<!-- 							      	<option>개인사정</option> -->
<!-- 										<option>군휴학</option> -->
<!-- 										<option>건강악화</option> -->
<!-- 						            </select> -->
<!-- 					            </div> -->
<!-- 						    </div> -->
						    <div class="mb-3 row">
<!-- 						      <label for="html5-month-input" class="col-md-2 col-form-label">휴학기수</label> -->
<!-- 						      <div class="col-md-4"> -->
<!-- 						        <select id="selectpickerBasic" class="selectpicker w-100" data-style="btn-default"> -->
<!-- 						        <option>1</option> -->
<!-- 									<option>2</option> -->
<!-- 					            </select> -->
<!-- 						      </div> -->
						      <label for="html5-search-input" class="col-md-2 col-form-label" style="text-align: center;">복학 예정학기</label>
						      <div class="col-md-4">
						        <input class="form-control" type="search" value='<c:if test="${LHVOList!= null}">${LHVOList[0].acEdt}학기</c:if>'
						        	id="html5-search-input" style="width: 300px; text-align: center;" readonly />
						      </div>
						      <label for="html5-search-input" class="col-md-2 col-form-label" style="text-align: center;">복학 신청학기</label>
						      <div class="col-md-4">
<!-- 						        <input class="form-control" type="search" value="" id="html5-search-input" /> -->
								<c:set var="ymd" value="<%=new java.util.Date()%>" />
								<fmt:formatDate value="${ymd}" pattern="yyyy" var="yyyy" />
<%-- 								yy : ${yyyy} <br /> --%>
								<fmt:formatDate value="${ymd}" pattern="MM" var="mm" />
<%-- 								ymd : ${mm} <br /> --%>
								<fmt:parseNumber value="${mm}" var="num" />

<%-- 								num : ${num} --%>
								<c:if test="${num < 9}">
							        <input class="form-control" type="text" value="${yyyy}-1학기"
							        	id="sdt" style="width: 300px; text-align: center;" readonly />
								</c:if>
								<c:if test="${num >= 9}">
							        <input class="form-control" type="text" value="${yyyy}-2학기"
							        	id="sdt" style="width: 300px; text-align: center;" readonly />
								</c:if>

						      </div>
						    </div>
						    <div class="mb-3 row">
						    </div>
				          <button type="button" id="btnRt" class="btn btn-primary col-2" style="float: right;" >신청하기</button>
				        </form>
			      </div>
			      <!-- /복학신청 끝 -->
			  </div>
			    <!-- /"tab-content" -->

		<!-- /tab -->
	</div>
</div>

<script type="text/javascript">
// $(function(){
$(document).ready(function(){

	$("#seldiv1").on("click", function(){
		let opt0 = $("#seldiv1").find("option").eq(0).text();
		let opt1 = $("#seldiv1").find("option").eq(1).text();
	});

	$("#selectLV").on("change", function(){
		let idx = $(this).parent().find("#selectLV option").index($(this).parent().find("#selectLV option:selected"));

		if(idx == 1){
			$("#ip_return").val("2024-1학기");
		}else if(idx == 0){
			$("#ip_return").val("2023-2학기");
		}else if(idx == 2){
			$("#ip_return").val("2024-2학기");
		}else if(idx == 3){
			$("#ip_return").val("2025-1학기");
		}else{
			$("#ip_return").val("2023-2학기");
		}
	});

	$("#btnLeave").on("click", function(){
		let v_acSdt = $("#acSdt").val();
		let acSdt = v_acSdt.substr(0,6);
		let v_acEdt = $("#ip_return").val();
		let acEdt = v_acEdt.substr(0,6);
		let acReason = $("#leaveSel").val();

		let data = {
					  "acReason":acReason,
					  "acSdt":acSdt,
					  "acEdt":acEdt,
					  "acList":1
					}

		$.ajax({
			url : "/academic/leaveStu",
			contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
			data : JSON.stringify(data),		//=> 보내는 데이터(?)
			dataType : "json",										//=> dataType은 '응답타입'
			type : "post",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
			 	if(result.stResult == -2){
			 		Swal.fire({
				    	  html: "학적상태가 '재학'인 경우에만 휴학신청이 가능합니다.<br />학적상태를 확인하십시오.",
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'
				      });
			 	}else{

					if(result.result > 0){
						Swal.fire({
					    	  html: "휴학신청이 처리되었습니다.<br />신청목록 화면으로 이동합니다.",
					    	  icon: 'success',

					    	  confirmButtonText: '확인'
					      }).then(result => {
					    	  location.href = "/academic/acaListStu";
					      	});

					}else if(result.result < 0){
						Swal.fire({
					    	  html: "승인 대기 중인 휴학신청 내역이 존재합니다.<br /> 신청목록 화면으로 이동합니다.",
					    	  icon: 'warning',

					    	  confirmButtonText: '확인'
					      }).then(result => {
					    	  location.href = "/academic/acaListStu";
					      	});
					}else{
						Swal.fire({
					    	  html: "휴학신청 처리를 실패하였습니다.<br />관리자에게 문의하십시오.",
					    	  icon: 'error',

					    	  confirmButtonText: '확인'
					      });
					}
			 	}



			},
			error : function(){
				Swal.fire({
					title: '신청 실패.<br/>재등록 요망',
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
		});
	});


	$("#btnNavRT").on("click", function(){



		$.ajax({
			url : "/academic/searchLeave",
			contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
			//data : JSON.stringify(data),		//=> 보내는 데이터(?)
			dataType : "json",										//=> dataType은 '응답타입'
			type : "post",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
				if(result > 0){
					$("#btnNavRT").attr("data-bs-target", "#navs-justified-profile");
				}else if(result < 0){
					Swal.fire({
				    	  text: "학적상태가 '휴학'인 경우에만 접근 가능합니다.",
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      });

					$("#btnNavLV").attr("class", "nav-link active");
					$("#btnNavRT").attr("class", "nav-link");
					$("#navs-justified-home").attr("class","tab-pane active show");
					$("#navs-justified-profile").attr("class","tab-pane fade");
				}
			},
			error : function(){
				Swal.fire({
			    	  text: "접근이 불가합니다.",
			    	  icon: 'error',

			    	  confirmButtonText: '확인'
			      });
			}
		});

	});

	$("#btnRt").on("click", function(){
		let v_sdt = $("#sdt").val();
		let sdt = v_sdt.substr(0,6);
		let data = {"acSdt":sdt}

		$.ajax({
			url : "/academic/appReturn",
			contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
			data : JSON.stringify(data),		//=> 보내는 데이터(?)
			dataType : "json",										//=> dataType은 '응답타입'
			type : "post",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
				if(result > 0){
					Swal.fire({
				    	  html: "복학신청이 등록되었습니다.<br />학적변동 신청목록 화면으로 이동합니다.",
				    	  icon: 'success',

				    	  confirmButtonText: '확인'
				      }).then(result => {
				    	  location.href = "/academic/acaListStu";
				      	});
				}else if(result == -1){
					Swal.fire({
				    	  text: "승인 대기 중인 복학신청 내역이 존재합니다.",
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'
				      });
				}else{
					Swal.fire({
				    	  html: "복학신청 처리를 실패하였습니다.<br />관리자에게 문의하십시오.",
				    	  icon: 'error',

				    	  confirmButtonText: '확인'
				      });
				}
			},
			error : function(){

			}
		});
	});

});

</script>

