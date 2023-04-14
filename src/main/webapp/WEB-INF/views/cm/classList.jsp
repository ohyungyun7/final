<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="card">
	<h5 class="card-header">강의 목록</h5>
	<div class="card-body">
	<table class="table table-bordered table-hover cell-fit text-center">
		<thead class="table-active">
					<tr class="text-nowrap ">
						<th class="text-center">과목번호</th>
						<th class="text-center">학과</th>
						<th class="text-center">교수</th>
						<th class="text-center">이름</th>
						<th class="text-center">학년</th>
						<th class="text-center">학점</th>
						<th class="text-center">기준</th>
						<th class="text-center">정원</th>
						<th class="text-center">승인</th>
						<th class="text-center">개강</th>
						<th class="text-center">개강관리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="data" items="${list}" varStatus="i">
						<tr name="${data.sbjNum}">
							<td class="tdSbjNum" >${data.sbjNum}</td>
							<td>${data.deptNum}</td>
							<td>${data.teaNum}</td>
							<td>${data.sbjTitle}</td>
							<td>${data.sbjGrade}</td>
							<td>${data.sbjRecode}</td>
							<td>
								<c:if test="${data.sbjRs eq 1}">
									<span class="badge bg-label-primary">필수</span>
								</c:if>
								<c:if test="${data.sbjRs eq 2}">
									<span class="badge bg-label-secondary">선택</span>
								</c:if>
							</td>
							<td>${data.sbjPersonnel} 명</td>
							<td>
								<c:if test="${data.sbjYn eq 1}">
									<span class="badge badge-dot bg-success me-1"></span>승인
								</c:if>
								<c:if test="${data.sbjYn eq 0}">
									<span class="badge badge-dot bg-primary me-1"></span>대기
								</c:if>
								<c:if test="${data.sbjYn eq 2}">
									<span class="badge badge-dot bg-warning me-1"></span>반려
								</c:if>
							</td>
							<td>
								<c:if test="${data.sbjOc eq 1}">
									<span class="badge badge-center rounded-pill bg-success"><i class='bx bx-radio-circle'></i></span>
									<input type="hidden" value="1" />
								</c:if>
								<c:if test="${data.sbjOc eq 0}">
									<span class="badge badge-center rounded-pill bg-danger"><i class='bx bx-x'></i></span>
									<input type="hidden" value="0" />
								</c:if>
								<c:if test="${data.sbjOc eq 2}">
									<span class="badge badge-center bg-secondary">폐강</span>
									<input type="hidden" value="2" />
								</c:if>
							</td>
							<td>
								<button type="button" class="btn btn-success btn-sm btnOK" >O</button>
								<button type="button" class="btn btn-danger btn-sm btnCom" >X</button>
								<button type="button" class="btn btn-dark btn-sm btnClose" >폐강</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
	</table>
	</div>
</div>



<script>
$(document).ready(function () {
   
    
    var lang_eng = {
	        "info" : "Showing _START_ to _END_ of _TOTAL_ entries",
	        "infoEmpty" : "Showing 0 to 0 of 0 entries",
	        "search" : "Search : ",
	        "zeroRecords" : "No matching records found",
	        "paginate" : {
	            "first" : "First",
	            "last" : "Last",
	            "next" : "Next",
	            "previous" : "Previous"
	        },
	        "aria" : {
	            "sortAscending" : " :  activate to sort column ascending",
	            "sortDescending" : " :  activate to sort column descending"
	        }
	    };

	    // Korean
	    var lang_kor = {
	        "info" : "",
	        "infoEmpty" : "",
	        "search" : "검색 : ",
	        "zeroRecords" : "검색된 데이터가 없습니다.",
	        "paginate" : {
	            "first" : "첫 페이지",
	            "last" : "마지막 페이지",
	            "next" : "다음",
	            "previous" : "이전"
	        },
	    };
	    
	    $('.table').DataTable({
	    	   "responsive": true, "lengthChange": false, "autoWidth": false,
	    	   aaSorting : [],
	           language : lang_kor,
	    });
});
$(function(){
	
	$(".btnOK").on("click", function(){
		let sbjNum = $(this).closest('tr').attr('name');;

		$.ajax({
	 		url: "/cm/approval.do",
	 		type: "get",
	 		data: {"sbjNum" : sbjNum},
	 		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	      	},
	 		success: function(result) {
	 			Swal.fire({
				    title: '승인 성공',
				    timer: 2000,
				    icon: 'success',
				    customClass: {
				      confirmButton: 'btn btn-primary'
				    },
				    buttonsStyling: false
				  });
	 			location.reload();
	 		}
		});
	});
	
	$(".btnCom").on("click", function(){
		let sbjNum = $(this).closest('tr').attr('name');;

		$.ajax({
	 		url: "/cm/declined.do",
	 		type: "get",
	 		data: {"sbjNum" : sbjNum},
	 		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	      	},
	 		success: function(result) {
	 			Swal.fire({
				    title: '승인 정지 성공',
				    timer: 2000,
				    icon: 'success',
				    customClass: {
				      confirmButton: 'btn btn-primary'
				    },
				    buttonsStyling: false
				  });
	 			location.reload();
	 		}
		});
	});
	
	$(".btnClose").on("click", function(){
		let sbjNum = $(this).closest('tr').attr('name');;

		$.ajax({
	 		url: "/cm/closed.do",
	 		type: "get",
	 		data: {"sbjNum" : sbjNum},
	 		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	      	},
	 		success: function(result) {
	 			Swal.fire({
				    title: '폐강 변경 성공',
				    timer: 2000,
				    icon: 'success',
				    customClass: {
				      confirmButton: 'btn btn-primary'
				    },
				    buttonsStyling: false
				  });
	 			location.reload();
	 		}
		});
	});
	
});
</script>