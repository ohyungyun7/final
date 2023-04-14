<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

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

#listTr:hover {
	background-color: lightyellow;
}
</style>

<div class="card-header">
	<ul class="nav nav-pills flex-column flex-md-row mb-3">
	      <li class="nav-item">
	      	<a class="nav-item nav-link active"
	      		href="/course/studentList?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">학생목록</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link" href="/course/detailTea?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">주차</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link"
	      		href="/course/notice?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">공지</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link"
	      		href="/course/attendTea?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">출석</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link"
	      		href="/course/assignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">과제</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link"
	      		href="/course/reference?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">자료</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link"
	      		href="/course/reportCard?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">성적</a>
	      </li>
	</ul>
</div>
<br />

<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bx-collection page-icon"></i>
	<span class="fw-light" onclick="location.href='/course/list_pro?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}'" class="categoryBar'" style="cursor: pointer;">강의목록 / </span>
	<span onclick="location.href='/course/studentList?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}'" class="categoryBar fw-light" style="cursor: pointer;">${sbjTitle} / </span>
	학생목록
</h4>

<div class="card">
	<div class="card-body">
	<table class="table">
		<thead class="table-active">
			<tr class="text-nowrap">
				<th>번호</th>
				<th>학번</th>
				<th>학과</th>
				<th>학생명</th>
			</tr>
		</thead>
		<tbody style="text-align: center;">
		<c:forEach var="map" items="${data}" varStatus="stat">
			<tr id="listTr">
				<th scope="row">${stat.count}</th>
				<td><a href="#" id="stuNum" data-bs-toggle="modal" data-bs-target="#modalCenter">${map.get("STU_NUM") }</a></td>
				<td>${map.get("DEPT_NM") }</td>
				<td>${map.get("STU_NM_KOR") }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
</div>


<!-- Modal -->
<div class="modal fade" id="modalCenter" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalCenterTitle">학생 정보</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">

		<div class="row g-2 w-px-500">
		   <div class="col mb-0">
			   <div class="row g-1">
				   <label for="ip_stuNum" class="col-form-label col text-center">학번</label>
				   <input type="text" id="ip_stuNum" class="form-control col mb-0 form-control-sm" value="" readonly>
			   </div>
		   </div>
		   <div class="col mb-0">
			   <div class="row g-1">
				   <label for="ip_stuDept" class="col-form-label col text-center">학과</label>
				   <input type="text" id="ip_stuDept" class="form-control col md-3 form-control-sm" value="" readonly>
			   </div>
		   </div>
		 </div>
		 <br />
		<div class="row g-2 w-px-500">
		   <div class="col mb-0">
			   <div class="row g-1">
				   <label for="ip_stuGrade" class="col-form-label col text-center">학년</label>
				   <input type="text" id="ip_stuGrade" class="form-control col mb-0 form-control-sm" value="" readonly>
			   </div>
		   </div>
		   <div class="col mb-0">
			   <div class="row g-1">
				   <label for="ip_stuName" class="col-form-label col text-center">이름</label>
				   <input type="text" id="ip_stuName" class="form-control col md-3 form-control-sm" value="" readonly>
			   </div>
		   </div>
		 </div>
		 <br />
		<div class="row g-2 w-px-500">
		   <div class="col mb-0">
			   <div class="row g-1">
				   <label for="ip_email" class="col-form-label col text-center">이메일</label>
				   <input type="text" id="ip_email" class="form-control col mb-0 form-control-sm" value="" readonly>
			   </div>
		   </div>
		   <div class="col mb-0">
			   <div class="row g-1">
				   <label for="ip_contact" class="col-form-label col text-center">연락처</label>
				   <input type="text" id="ip_contact" class="form-control col md-3 form-control-sm" value="" readonly>
			   </div>
		   </div>
		 </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>



<script>
$(function(){
	var lang_kor = {
	        "decimal" : "",
	        "emptyTable" : "등록된 과제 게시글이 존재하지 않습니다.",
	        "info" : "_START_ - _END_ (총 _TOTAL_ 건)",
	        "infoEmpty" : "",
	        "infoFiltered" : "(전체 _MAX_ 건 중 검색결과)",
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

	$(".table-hover").DataTable({
		language : lang_kor
	});


});

	$(document).on("click","#stuNum",function(){



		let sbjNum = '${sbjNum}';
		let stuNum = $(this).parent("td").text();
		data = {
				"sbjNum" : sbjNum,
				"stuNum" : stuNum
				};

		$.ajax({
			url : "/course/getStuInfo",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			dataType : "json",
			type : "post",
			beforeSend : function(xhr) {
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(data){

				let IstuNum = data.STU_NUM;
				let Idept = data.DEPT_NM;
				let Isemester = data.STU_SEMESTER;

				if(Isemester== 1 || Isemester <= 2){
					Isemester = "1학년"
				}else if(Isemester== 3 || Isemester == 4){
					Isemester = "2학년"
				}else if(Isemester== 5 || Isemester == 6){
					Isemester = "3학년"
				}else if(Isemester== 7 || Isemester == 8){
					Isemester = "4학년"
				}

				let IstuNm = data.STU_NM_KOR;
				let IstuEmail = data.STU_EMAIL;
				let IstuPn = data.STU_PN;

				document.querySelector('#ip_stuNum').value = IstuNum;
				document.querySelector('#ip_stuDept').value = Idept;
				document.querySelector('#ip_stuGrade').value = Isemester;
				document.querySelector('#ip_stuName').value = IstuNm;
				document.querySelector('#ip_email').value = IstuEmail;
				document.querySelector('#ip_contact').value = IstuPn;





			},
			error : function(){

				Swal.fire({
			    	  html: '학생정보가 존재하지 않습니다.',
			    	  icon: 'warning',

			    	  confirmButtonText: '확인'

			      }).then(result => {
			    	  return false;
			      	});
			}
		});
	});

</script>
