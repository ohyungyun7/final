<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style type="text/css">
body {
	font-family: 'Noto Sans KR', sans-serif;
}

input {
	text-align: center;
}

#btnRJ {
	font-size: 13px;
	padding: 0px;
	width: 60px;
	height: 30px;
}

.badge {
	text-align: center;
	padding-top: 10px;
	font-size: 13px;
	width: 60px;
	height: 30px;
}


</style>

<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bxs-graduation page-icon"></i>
	<span class="fw-light" >졸업 / </span>조기졸업 신청
</h4>

<div class="card">
	<div class="card-body mx-auto">
		<p><i class='bx bx-badge'></i>조기졸업 신청</p>
		<hr/>
		<br />
		<div class="container text-center">
			<div class="row" style="align-items: center;">
				<label class="col-md-1">학번</label>
				<div class="col-md-3">
					<input class="form-control" type="search" value="${stuInfo.STU_NUM}" id="html5-search-input" readonly />
				</div>
				<label class="col-md-1 ">이름</label>
				<div class="col-md-3">
					<input class="form-control" type="search" value="${stuInfo.STU_NM_KOR}" id="ipStuNm" readonly />
				</div>

			</div>
			<br/>
			<div class="row" style="align-items: center;">
				<label class="col-md-1">단과대학</label>
				<div class="col-md-3">
					<input class="form-control" type="search" value="${stuInfo.COLL_NM}" id="html5-search-input" readonly />
				</div>
				<label class="col-md-1 ">학과</label>
				<div class="col-md-3">
					<input class="form-control" type="search" value="${stuInfo.DEPT_NM}" id="html5-search-input" readonly />
				</div>

				<label class="col-md-2">학년</label>
				<div class="col-md-2">
					<c:choose>
						<c:when test="${stuInfo.STU_SEMESTER== 1 || stuInfo.STU_SEMESTER == 2}">
							<input class="form-control" type="search" value="1학년" id="html5-search-input" readonly />
						</c:when>
						<c:when test="${stuInfo.STU_SEMESTER== 3 || stuInfo.STU_SEMESTER == 4}">
							<input class="form-control" type="search" value="2학년" id="html5-search-input" readonly />
						</c:when>
						<c:when test="${stuInfo.STU_SEMESTER== 5 || stuInfo.STU_SEMESTER == 6}">
							<input class="form-control" type="search" value="3학년" id="html5-search-input" readonly />
						</c:when>
						<c:when test="${stuInfo.STU_SEMESTER== 7 || stuInfo.STU_SEMESTER == 8}">
							<input class="form-control" type="search" value="4학년" id="html5-search-input" readonly />
						</c:when>
						<c:when test="${stuInfo.STU_SEMESTER== 9 || stuInfo.STU_SEMESTER == 10}">
							<input class="form-control" type="search" value="5학년" id="html5-search-input" readonly />
						</c:when>
						<c:when test="${stuInfo.STU_SEMESTER== 11 || stuInfo.STU_SEMESTER == 12}">
							<input class="form-control" type="search" value="6학년" id="html5-search-input" readonly />
						</c:when>
						<c:otherwise>
							<input class="form-control" type="search" value="4학년" id="html5-search-input" readonly />
						</c:otherwise>
					</c:choose>
				</div>


			</div>
			<br/>
			<div class="row" style="align-items: center;">
				<label class="col-md-1">복수전공</label>
				<div class="col-md-3">
					<input class="form-control" type="search" value="${stuInfo.DMAJOR_NM}" id="ipDmajor" readonly />
				</div>
				<label class="col-md-1 ">부전공</label>
				<div class="col-md-3">
					<input class="form-control" type="search" value="${stuInfo.MINOR_NM}" id="ipMinor" readonly />
				</div>
				<label class="col-md-2">학적상태</label>
				<div class="col-md-2" id="divStatus">
				  <c:choose>
					<c:when test="${stuInfo.STU_STATUS == 0 }"><input class="form-control" type="search" value="재학" id="html5-search-input" readonly /></c:when>
					<c:when test="${stuInfo.STU_STATUS == 1 }"><input class="form-control" type="search" value="휴학" id="html5-search-input" readonly /></c:when>
					<c:when test="${stuInfo.STU_STATUS == 2 }"><input class="form-control" type="search" value="자퇴" id="html5-search-input" readonly /></c:when>
					<c:when test="${stuInfo.STU_STATUS == 3 }"><input class="form-control" type="search" value="졸업" id="html5-search-input" readonly /></c:when>
					<c:when test="${stuInfo.STU_STATUS == 4 }"><input class="form-control" type="search" value="제적" id="html5-search-input" readonly /></c:when>
					<c:when test="${stuInfo.STU_STATUS == 4 }"><input class="form-control" type="search" value="졸업유예" id="html5-search-input" readonly /></c:when>
					<c:otherwise>정보없음</c:otherwise>
				  </c:choose>
				</div>
			</div>

			<hr/>
			<br/>
			<form>
				<div class="row " style="align-items: center;">
					<label for="ipEgReason" class="col-md-2 text-center">신청 사유</label>
					<div class="col-md-9">
						<input class="form-control" type="text" value="" id="ipEgReason" placeholder="조기졸업 신청사유를 입력하세요." />
					</div>
				</div>
				<br/>
				<button type="button" id="btnAppEg" class="btn btn-primary col-2" style="float: right; padding-right: -10px;" >신청하기</button>
			</form>
		</div>
		<!-- /container -->
	</div>
</div>
<br/>
<div class="card">
	<div class="div-header">
	</div>
	<div class="card-body">
	<table class="table">
		<thead class="table-active">
			<tr class="text-nowrap">
				<th>번호</th>
				<th>구분</th>
				<th>신청학기</th>
				<th>신청사유</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
		  <c:forEach var="AcademicVO" items="${appEGList}" varStatus="stat">
			<tr>
				<th scope="row">${stat.count}</th>

				<c:if test="${AcademicVO.acList eq 3}">
					<td>조기졸업</td>
				</c:if>
				<c:if test="${AcademicVO.acList ne 3}">
					<td></td>
				</c:if>

				<td>${AcademicVO.acSdt}학기</td>
				<td>${AcademicVO.acReason}</td>

				<c:choose>
				  <c:when test="${AcademicVO.acCheck eq 0}">
				  	<td colspan="2"><span class="badge rounded-pill bg-label-success">대기</span></td>
				  </c:when>
				  <c:when test="${AcademicVO.acCheck eq 1}">
				  	<td colspan="2"><span class="badge rounded-pill bg-label-info" style="width: 100px; height: 100px;">승인</span></td>
				  </c:when>
				  <c:when test="${AcademicVO.acCheck eq 2}">
				  	<td colspan="2" style="width: 50px;">
				  		<p id="pAcNum" style="display: none;">${AcademicVO.acNum}</p>
				  		<button type="button" id="btnRJ" class="btn rounded-pill btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#modalToggle">반려</button>
				  	</td>
				  </c:when>
				  <c:otherwise>
				  	<td><span class="badge rounded-pill bg-label-success">대기</span></td>
				  </c:otherwise>
				</c:choose>
			</tr>
		  </c:forEach>
		  <div id="divInfo" style="float: right;"><span>* '반려' 문구 클릭 시 반려사유 확인가능</span></div>
		</tbody>
	</table>
	</div>

</div>

<!-- Modal 1-->
          <div class="modal fade" id="modalToggle" aria-labelledby="modalToggleLabel" tabindex="-1" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="modalToggleLabel">반려사유</h5>
                </div>
                <div id="divModal" class="modal-body">
                  Show a second modal and hide this one with the button below.
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
                </div>
              </div>
            </div>
          </div>

<script>
$(document).ready(function(){
	let status = $("#divStatus input").val();

	// Korean
    var lang_kor = {
        "decimal" : "",
        "emptyTable" : "신청내역이 존재하지 않습니다.",
        "info" : "_START_ - _END_ (총 _TOTAL_ 명)",
        "infoEmpty" : "",
        "infoFiltered" : "(전체 _MAX_ 명 중 검색결과)",
        "infoPostFix" : "",
        "thousands" : ",",
        "lengthMenu" : "_MENU_ 개씩 보기",
        "loadingRecords" : "로딩중...",
        "processing" : "처리중...",
        "search" : "검색 : ",
        "zeroRecords" : "검색된 데이터가 없습니다.",
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

	$(".table").DataTable({
		dom: '<"top">lrt<"bottom"p><"clear">',
		language: lang_kor
		});

	$("#btnAppEg").on("click", function(){
		let egReason = $("#ipEgReason").val();

		if(egReason == null || egReason == ''){
			Swal.fire({
		    	  html: "신청사유를 입력하세요.",
		    	  icon: 'warning',

		    	  confirmButtonText: '확인'
		      });

		}else if(status == '졸업'){

			Swal.fire({
		    	  html: "학적상태가 '졸업'인 경우에는 신청이 불가합니다.",
		    	  icon: 'warning',

		    	  confirmButtonText: '확인'
			});

		}else{


			//학생명
			let stuNm = $("#ipStuNm").val();

			//복수전공, 부전공 조회
			let v_dMajor = $("#ipDmajor").val();
			let dMajor = v_dMajor.trim();
			let v_minor = $("#ipMinor").val();
			let minor = v_minor.trim();

			//학생학기
			let strSemester = ${stuInfo.STU_SEMESTER};
			let semester = parseInt(strSemester, 10)

			//전공 이수학점, 교양 이수학점 조회
			//전공 이수학점
			let strMajorRecode = ${stuInfo.MAJOR_RECODE};
			let majorRecode = parseInt(strMajorRecode, 10);

			//교양 이수학점
			let strElectiveRecode = ${stuInfo.ELECTIVE_RECODE};
			let electiveRecode = parseInt(strElectiveRecode, 10);

			//총 이수학점
			let sumRecode = majorRecode + electiveRecode;

			if(dMajor != ''){

				Swal.fire({
			    	  html: "복수전공자는 조기졸업 신청이 불가합니다.",
			    	  icon: 'warning',

			    	  confirmButtonText: '확인'
			      });

			}else if(minor != ''){
				Swal.fire({
			    	  html: "부전공자는 조기졸업 신청이 신청이 불가합니다.",
			    	  icon: 'warning',

			    	  confirmButtonText: '확인'
			      });

			}else if(semester < 6){

				Swal.fire({
			    	  html: "6학기 이상 이수 시 신청 가능합니다.",
			    	  icon: 'warning',

			    	  confirmButtonText: '확인'
			      });

			}else if(majorRecode < 60){

				Swal.fire({
			    	  html: "전공과목 60학점 이상 이수 시 신청 가능합니다.",
			    	  icon: 'warning',

			    	  confirmButtonText: '확인'
			      });

			}else if(sumRecode < 130){

				Swal.fire({
			    	  html: "130학점 이상 이수 시에만 신청 가능합니다.",
			    	  icon: 'warning',

			    	  confirmButtonText: '확인'
			      });

			}else {	//평균평점 4.0이상, F학점 없을 시 조기졸업 신청 등록

				$.ajax({
					url : "/grad/earlyGraduation",
					contentType : "application/json;charset=utf-8",
					//data : JSON.stringify(data),
					dataType : "json",
					type : "post",
					beforeSend : function(xhr) {
			            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success : function(result){
						let avgFscore = result.avgFscore;
						if(result.result == 'lowScore'){

							Swal.fire({
						    	  html: stuNm + " 학생의 평균평점 : " + avgFscore + "<br />평균평점이 4.0 이상인 경우에만 신청 가능합니다.",
						    	  icon: 'warning',

						    	  confirmButtonText: '확인'
						      });

						}else if(result.result == 'fExist'){

							Swal.fire({
						    	  html: "F학점이 취득 이력이 존재합니다. 조기졸업 신청이 불가합니다.",
						    	  icon: 'warning',

						    	  confirmButtonText: '확인'
						      });

						}else if(result.result == 'success'){

							Swal.fire({
						    	  html: "조기졸업 신청이 정상적으로 처리되었습니다.",
						    	  icon: 'warning',

						    	  confirmButtonText: '확인'
						      });

						}else{

							Swal.fire({
						    	  html: "조기졸업 신청이 정상적으로 처리되지 않았습니다.",
						    	  icon: 'error',

						    	  confirmButtonText: '확인'
						      });
						}
					},
					error : function(){

						Swal.fire({
					    	  html: "조기졸업 신청이 정상적으로 처리되지 않았습니다. 관리자에게 문의하십시오.",
					    	  icon: 'error',

					    	  confirmButtonText: '확인'
					      });
						}
					});
				}
			}
	});

	$(document).on("click", "#btnRJ", function(){

		let stuNum = ${stuInfo.STU_NUM};
		let acNum= $(this).prev('p').text();

		let data = {
						"stuNum":stuNum,
						"acNum":acNum
					};

		$.ajax({
			url : "/grad/getSingleAppEG",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			dataType : "json",
			type : "post",
			beforeSend : function(xhr) {
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
				let acComre = result.result.acComre;
				$("#divModal").html(acComre);

			},
			error : function(){
				Swal.fire({
			    	  html: "오류발생. 다시 시도하십시오.",
			    	  icon: 'error',

			    	  confirmButtonText: '확인'
			      });
			}

		});

	});

});
</script>










