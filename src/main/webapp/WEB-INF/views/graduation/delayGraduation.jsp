<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style type="text/css">
body {
	font-family: 'Noto Sans KR', sans-serif;
}

input{
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
	<span class="fw-light" >졸업 / </span>졸업유예 신청
</h4>

<div class="card">
	<div class="card-body mx-auto">
		<p><i class='bx bx-badge'></i> 학사학위 취득 유예</p>
		<hr/>
		<br />
		<div class="container text-center">
			<div class="row" style="align-items: center;">
				<label for="html5-search-input" class="col-md-1">학번</label>
				<div class="col-md-3">
					<input class="form-control" type="search" value="${stuInfo.STU_NUM}" id="html5-search-input" readonly />
				</div>
				<label for="html5-search-input" class="col-md-1 ">이름</label>
				<div class="col-md-3">
					<input class="form-control" type="search" value="${stuInfo.STU_NM_KOR}" id="html5-search-input" readonly />
				</div>



			</div>
			<br/>
			<div class="row" style="align-items: center;">
				<label for="html5-search-input" class="col-md-1">단과대학</label>
				<div class="col-md-3">
					<input class="form-control" type="search" value="${stuInfo.COLL_NM}" id="html5-search-input" readonly />
				</div>
				<label for="html5-search-input" class="col-md-1 ">학과</label>
				<div class="col-md-3">
					<input class="form-control" type="search" value="${stuInfo.DEPT_NM}" id="html5-search-input" readonly />
				</div>

				<label for="html5-search-input" class="col-md-2">학년</label>
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
				<label for="html5-search-input" class="col-md-1">복수전공</label>
				<div class="col-md-3">
					<input class="form-control" type="search" value="${stuInfo.DMAJOR_NM}" id="html5-search-input" readonly />
				</div>
				<label for="html5-search-input" class="col-md-1 ">부전공</label>
				<div class="col-md-3">
					<input class="form-control" type="search" value="${stuInfo.MINOR_NM}" id="html5-search-input" readonly />
				</div>
				<label for="html5-search-input" class="col-md-2">학적상태</label>
				<div class="col-md-2">
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
				<button type="button" id="btnAppGP" class="btn btn-primary col-2" style="float: right; margin: 20px;" >신청</button>
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
				<th>신청일자</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
		  <c:forEach var="gpMap" items="${appGDList}" varStatus="stat">
			<tr>
				<th scope="row">${stat.count}</th>
				<td>졸업유예</td>
				<td><fmt:formatDate pattern="yyyy.MM.dd" value="${gpMap.GP_DT}"/></td>

				<c:choose>
				  <c:when test="${gpMap.GP_CHECK eq 0}">
				  	<td class="tdSt"><span class="badge rounded-pill bg-label-success">대기</span></td>
				  </c:when>
				  <c:when test="${gpMap.GP_CHECK eq 1}">
				  	<td class="tdSt"><span class="badge rounded-pill bg-label-info">승인</span></td>
				  </c:when>
				  <c:when test="${gpMap.GP_CHECK eq 2}">
				  	<td class="tdSt" colspan="2" style="width: 50px;">
				  		<p id="pGpNum" style="display: none;">${gpMap.GP_NUM}</p>
				  		<button type="button" id="btnRJ" class="btn rounded-pill btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#modalToggle">반려</button>
				  	</td>
				  </c:when>
				  <c:otherwise>
				  	<td class="tdSt"><span class="badge rounded-pill bg-label-success">대기</span></td>
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
                  <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">확인</button>
                </div>
              </div>
            </div>
          </div>

<script>
$(function(){
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

	$(document).on("click", "#btnRJ", function(){

		let gpNum= $(this).prev('p').text();
		let stuNum = ${stuInfo.STU_NUM};

		let data = {
						"gpNum":gpNum,
						"stuNum":stuNum
					};

		//모달창 내 반려사유 요청
		$.ajax({
			url : "/grad/getSingleAppGP",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			dataType : "json",
			type : "post",
			beforeSend : function(xhr) {
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){

				let gpComre = result.GP_COMRE;

				if(gpComre == null || gpComre ==''){
					$("#divModal").html("(입력된 반려사유 내용이 없습니다.)");
				}else {
					$("#divModal").html(gpComre);
				}
			},
			error : function(){

			}
		});
	});

	$("#btnAppGP").on("click", function(){

		$.ajax({
			url : "/grad/appGP",
			contentType : "application/json;charset=utf-8",
// 			data : JSON.stringify(data),
			dataType : "json",
			type : "post",
			beforeSend : function(xhr) {
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				if(result.result == 'exist'){

					Swal.fire({
				    	  html: "승인 대기 중인 졸업유예 신청내역이 존재합니다.",
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'
				      });
				}else if(result.result == 'success'){

					Swal.fire({
				    	  html: "졸업유예 신청이 등록되었습니다.",
				    	  icon: 'success',

				    	  confirmButtonText: '확인'
				      }).then(result => {
				    	  location.href = "/grad/delayGraduation";
				      	});



				}else{

					Swal.fire({
				    	  html: "졸업유예 신청 등록을 실패하였습니다.",
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'
				      });
				}
			},
			error : function(){

				Swal.fire({
			    	  html: "요청을 처리할 수 없습니다. 관리자에게 문의하세요.",
			    	  icon: 'error',

			    	  confirmButtonText: '확인'
			      });
			}
		});
	});
});
</script>







