<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/js/jquery-3.6.0.js"></script>
<script src="/resources/js/jquery-3.6.3.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css">
tr{
	text-align: center;
}
.card{
	overflow: auto;
}
.input-box{
	width: 10%;
	display: inline;
}
.search-sel{
	width: 20%;
	display: inline;
}
.search-btn{
	display: inline;
}
.btnWrite{
	float: right;
	width: auto;
}
</style>

<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bx-wallet-alt page-icon"></i>
	<span class="fw-light" >등록금 · 장학금 / </span>장학생 추천 조회
</h4>

<div class="card">
	<div class="card-header">
		<h3 class="card-title">장학생 추천 조회</h3>
	</div>

	<div class="card-header">

	</div>
	<div class="card-body">
<!-- 		<div id="example1_wrapper" class="dataTables_wrapper dt-bootstrap4"> -->
		<div class="table-responsive text-nowrap">
			<div class="row">
				<div class="col-sm-12">
					<table id="example1" class="table table-bordered table-striped dataTable dtr-inline" aria-describedby="example1_info">
						<thead class="table-active">
							<tr class="text-nowrap">
								<th onclick="event.cancelBubble=true" style="text-align: center">번호</th>
								<th onclick="event.cancelBubble=true" style="text-align: center">학번</th>
								<th onclick="event.cancelBubble=true" style="text-align: center">이름</th>
								<th onclick="event.cancelBubble=true" style="text-align: center">연락처</th>
								<th onclick="event.cancelBubble=true" style="text-align: center">장학금명</th>
<!-- 								<th onclick="event.cancelBubble=true" style="text-align: center">추천사유</th> -->
								<th onclick="event.cancelBubble=true" style="text-align: center">비고</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="ScholarshipVO" items="${deptProList}"
								varStatus="stat">
								<tr id="fff${ScholarshipVO.stuNum}">
									<td>${stat.index+1}</td>
									<td>${ScholarshipVO.stuNum}</td>
									<td>${ScholarshipVO.stuNmKor}</td>
									<td>${ScholarshipVO.stuPn}</td>
									<td>${ScholarshipVO.slNm}</td>
<%-- 									<td>${ScholarshipVO.sreReason}</td> --%>
									<td>
										<a class="sreYn" data-stunum="${ScholarshipVO.stuNum}">
											<button class="btn" id="sreYn" style="color: blue; text-decoration: underline;" data-stunum="${paymentNum.stuNum}"
											data-bs-toggle="modal" data-bs-target="#editUser2" class="srYn" data-bs-target="#exampleModal" data-bs-toggle="modal">
											${ScholarshipVO.sreYn}
											</button>
										</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

	<br>

	<div class="card">

	<div class="card-header">
		<h3 class="card-title">학생 목록</h3>
	</div>
	<div class="card-body">
	   <div id="example1_wrapper" class="dataTables_wrapper dt-bootstrap4">
         <div class="row">
            <div class="col-sm-12">
               <table id="example2" class="table table-bordered table-striped dataTable dtr-inline" aria-describedby="example1_info">
					<thead class="table-active">
						<tr class="text-nowrap">
							<th style="display:none;"></th>
							<th style="text-align: center">번호</th>
							<th style="text-align: center">학번</th>
							<th style="text-align: center">이름</th>
							<th style="text-align: center">연락처</th>
							<th style="text-align: center">비고</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="ScholarshipVO" items="${deptStudentList}" varStatus="stat">
						<tr id="slNum${ScholarshipVO.stuNum}">
							<td style="display: none;">${ScholarshipVO.sreNum}</td>
							<td>${stat.index+1}</td>
							<td>${ScholarshipVO.stuNum}</td>
							<td>${ScholarshipVO.stuNmKor}</td>
							<td>${ScholarshipVO.stuPn}</td>
							<td>
								<a class="showSreYn" data-stunum="${ScholarshipVO.stuNum}">
									<button id="showSreYn" class="btn" style="color:blue; text-decoration: underline;" data-data-stunum="${ScholarshipVO.stuNum}" >
										추천
									</button>
								 </a>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
            </div>
          </div>
      </div>
</div>
<span class="badge rounded-pill bg-label-success"></span>



<!-- 교수가 추천할 학생 상세보기 -->
<div class="modal fade" id="editUser1" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-simple modal-edit-user">
		<div class="modal-content p-3 p-md-5">
			<div class="modal-body">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				<div class="text-left mb-4">
					<h3>장학생 추천</h3>
				</div>
				<hr />

				<form id="editUserForm" class="row g-3 fv-plugins-bootstrap5 fv-plugins-framework">
					<div class="col-12 col-md-6">
						<label class="form-label" for="stuNum">학번</label>
						<input type="text" id="stuNum" name="stuNum" class="form-control" value="" readonly>
					</div>
					<div class="col-12 col-md-6">
						<label class="form-label" for="stuNmKor">이름</label>
						<input type="text" id="stuNmKor" name="stuNmKor" class="form-control" value="" readonly>
					</div>
					<div class="col-12 col-md-6">
						<label class="form-label" for="date">신청학기</label>
						<input type="text" id="sreYsemester" name="sreYsemester" class="form-control modal-edit-tax-id" value="" readonly>
					</div>
					<div class="col-12 col-md-6">
						<label class="form-label" for="slNm">장학금명</label>
						<input type="text" id="sLNm" name="slNm" class="form-control modal-edit-tax-id" value="" readonly>
					</div>
					<div class="col-12">
						<label class="form-label" for="sreReason">추천 사유</label>
						<textarea id="recommendReason" name="recommendReason" class="form-control modal-edit-tax-id" rows="10"></textarea>
					</div>
					<div class="col-12 text-center">
<!-- 						<button type="button" class="btn btn-primary me-sm-3 me-1" id="recommend">추천</button> -->
						<button type="button" class="btn btn-success" id="autoBtn">자동채우기</button>
						<button type="button" class="btn btn-primary" id="recommend">저장</button>
						<button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal"  aria-label="Close">취소</button>
					</div>
					<div class="col-6">
						<input type="hidden" id="deptNum" name="deptNum" class="form-control" value="학과코드">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>


<!-- 교수가 추천한 학생 취소 가능한 모달창 -->
<div class="modal fade" id="editUser2" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-simple modal-edit-user">
		<div class="modal-content p-3 p-md-5">
			<div class="modal-body">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				<div class="text-left mb-4">
					<h3>장학생 추천</h3>
				</div>
				<hr />

				<form id="editUserForm" class="row g-3 fv-plugins-bootstrap5 fv-plugins-framework">
					<div class="col-12 col-md-6">
						<label class="form-label" for="stuNum">학번</label>
						<input type="text" id="stuNum1" name="stuNum" class="form-control" value="" readonly>
					</div>
					<div class="col-12 col-md-6">
						<label class="form-label" for="stuNmKor">이름</label>
						<input type="text" id="stuNmKor1" name="stuNmKor" class="form-control" value="" readonly>
					</div>
					<div class="col-12 col-md-6">
						<label class="form-label" for="srYsemester">신청학기</label>
						<input type="text" id="srYsemester" name="srYsemester" class="form-control modal-edit-tax-id" value="" readonly>
					</div>
					<div class="col-12 col-md-6">
						<label class="form-label" for="sLNm1">장학금명</label>
						<input type="text" id="slNm1" name="sLNm1" class="form-control modal-edit-tax-id" value="" readonly>
					</div>
					<div class="col-12">
						<label class="form-label" for="recommendReason1">추천 사유</label>
						<textarea id="recommendReason1" name="recommendReason" class="form-control modal-edit-tax-id" rows="10"></textarea>
					</div>
					<div class="col-12">
						<label class="form-label" for="sreComre">반려 사유</label>
						<textarea id="sreComre" name="sreComre" class="form-control modal-edit-tax-id" rows="10"></textarea>
					</div>
					<div class="col-12 text-center">
						<button type="button" class="btn btn-primary me-sm-3 me-1" id="close">닫기</button>
					</div>
					<div class="col-6">
						<input type="hidden" id="deptNum" name="deptNum" class="form-control" value="학과코드">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
$(function(){

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

//  $("#example1").DataTable({
//       "responsive": true, "lengthChange": false, "autoWidth": false,
//       language : lang_kor
//     });
 $("#example2").DataTable({
      "responsive": true, "lengthChange": false, "autoWidth": false,
       language : lang_kor
    });

 $(document).on("click",".showSreYn", function(){
		$("#sLNm").val("교수추천 장학금");
		let stuNum = $(this).data("stunum");
		$("#slNum"+stuNum).find(".btn").css("color","red");
		let data = {"stuNum" : stuNum};


	 	$.ajax({
			 url:"/scholarship/countRecomm",
	         contentType:"application/json; charset:utf-8",
	         data: JSON.stringify(data),
	         type: "post",
	         dataType: "json",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
	         success : function(result){
	        	 if(result.result>=1){
	        		 Swal.fire({
				    	  html: '이미 추천한 학생입니다.',
				    	  icon: 'warning',
				    	  confirmButtonText: '확인',
				    	  timer : 1500
				      })

	        	 }else{
	        		 $("#editUser1").modal("show");
	        	 }
	         }
		});//장학생 추천내역에 있는지 없는지 확인먼저하는  ajax

		//모달창 띄우는거
		 $.ajax({
			 url:"/scholarship/deptNum",
	         contentType:"application/json; charset:utf-8",
	         data: JSON.stringify(data),
	         type: "post",
	         dataType: "json",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
	         success : function(result){
		       	  $("#stuNum").val(result.ScholarshipVO.stuNum);
		       	  $("#stuNmKor").val(result.ScholarshipVO.stuNmKor);
// 		       	  $("#slNm").val(result.ScholarshipVO.slNumber);

		       	  //////연도 및 달 추출
		       	  var now = new Date();	// 현재 날짜 및 시간
		       	  var year = now.getFullYear();	// 연도
		          var month = now.getMonth()+1;
		       	  var semester = "";

		       	  if(month >= 3 && month<=6){
		       		  semester="1";
		       	  }else if(month >= 9 && month<=12){
		       		semester="2";
		       	  }else{
		       		semester="방학";
		       	  }

		       	  $("#sreYsemester").val(year+"-" + "0"+semester);
	         }
		});
	});


	 $(document).on("click",".sreYn", function(){
		let stuNum = $(this).data("stunum");
		$("#fff"+stuNum).find(".btn").css("color","red");
		let data = {"stuNum" : stuNum}
		$.ajax({
			url:"/scholarship/waitNum",
			 contentType:"application/json; charset:utf-8",
	         data:JSON.stringify(data),
	         type:"post",
	         dataType:"json",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
	         success:function(result){
	        	  $("#stuNum1").val(result.waitNum.stuNum);
		       	  $("#stuNmKor1").val(result.waitNum.stuNmKor);
		       	  $("#srYsemester").val(result.waitNum.srYsemester);
		       	  $("#slNm1").val(result.waitNum.slNm);
		       	  $("#recommendReason1").val(result.waitNum.sreReason);
		       	  $("#sreComre").val(result.waitNum.sreComre);
		       	  if(recommendReason1 != ""){
		       		$("#recommendReason1").attr("readonly","true");
		       	  }
		       	 if(sreComre != ""){
			       		$("#sreComre").attr("readonly","true");
		       	  }
	         }
		});

	});

	$("#recommend").on("click",function(){
		var sreNum = $("#sreNum"+stuNum).children().first().text();
		var stuNum  = $("#stuNum").val();
		var stuNmKor = $("#stuNmKor").val();
		var sreYsemester = $("#sreYsemester").val();
		var recommendReason = $("#recommendReason").val();
		var showSreYn = $("#showSreYn").val();
		$("#sLNm").val("교수추천 장학금");

			if(recommendReason == null || recommendReason == ''){
				Swal.fire({
			    	  html: '추천사유를 입력해주세요.',
			    	  icon: 'warning',
			    	  confirmButtonText: '확인',
			    	  timer : 1500
			      })
				$("#recommendReason").focus();
				return false;
			}else{
				Swal.fire({
			    	  html: '추천되었습니다.',
			    	  icon: 'success',
			    	  confirmButtonText: '확인',
			    	  timer : 1500
			      }).then(function(result){ //  창 꺼질때 실행할 함수
			    	    if(result) {
			    	    	location.href="/scholarship/recommendInsert?stuNum="+stuNum+"&sreYsemester="+sreYsemester+"&recommendReason="+recommendReason;
			    	    }
			      })
				$("#editUser").modal('hide');
			}
	});
	$('.modal').on('hidden.bs.modal', function (e) {
	    $(this).find('form')[0].reset()
	});

	$("#close").on("click",function(){
		$("#editUser2").modal('hide');
	});
	$("#autoBtn").on("click",function(){
		$("#recommendReason").val("위 학생은 학교생활을 성실한 자세로 하고 있는 모범적인 학생입니다.\n학업에 대한 열의가 남달라 최상위권 성적을 유지하고 있으며\n여러 창의적 체험활동에서 동아리 활동\n교내외 각종 캠프에 참가하는 등 꾸준한 진로 탐색을 통해 자신의 미래를 준비해 나가는 학생입니다.\n학급생활이 모범적이며 학급의 다양한 활동에 적극적으로 참여하는 모습을 보여줍니다.\n또한 예의 바른 행동으로 많은 선생님들의 칭찬을 받는 학생이기에 장학금 수혜 대상자로 적합하다고 판단되어 장학생으로 추천합니다.");
	});

});

</script>