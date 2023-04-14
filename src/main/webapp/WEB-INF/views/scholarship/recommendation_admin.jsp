<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/js/jquery-3.6.0.js"></script>
<script src="/resources/js/jquery-3.6.3.min.js"></script>
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
 textarea {
    width: 100%;
    height: 9.25em;
    border: none;
    resize: none;
  }
</style>

<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bx-wallet-alt page-icon"></i>
	 <span class="fw-light">등록금관리 / </span>장학금 지급내역
</h4>

	<div class="card">

		<div class="card-header">
			<h3 class="card-title">장학금 지급 여부</h3>
		</div>
		<div class="card-body">
			<div id="example1_wrapper" class="dataTables_wrapper dt-bootstrap4">
				<div class="row">
					<div class="col-sm-12">
						<table id="example2" class="table table-bordered table-striped dataTable dtr-inline" aria-describedby="example1_info">

							<thead class="table-active">
								<tr class="text-nowrap">
<!-- 									<th style="display: none;"></th> -->
									<th onclick="event.cancelBubble=true" style="text-align: center">번호</th>
									<th onclick="event.cancelBubble=true" style="text-align: center">학번</th>
									<th onclick="event.cancelBubble=true" style="text-align: center">이름</th>
									<th onclick="event.cancelBubble=true" style="text-align: center">학과</th>
									<th onclick="event.cancelBubble=true" style="text-align: center">연락처</th>
									<th onclick="event.cancelBubble=true" style="text-align: center">장학금명</th>
									<th onclick="event.cancelBubble=true" style="text-align: center">지급상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="paymentNum" items="${paymentsList}" varStatus="stat">
									<tr id="fff${paymentNum.stuNum}">
<%-- 										<td style="display: none;">${paymentsList.srSemester}</td> --%>
										<td>${stat.index+1}</td>
										<td>${paymentNum.stuNum}</td>
										<td>${paymentNum.stuNmKor}</td>
										<td>${paymentNum.deptNm}</td>
										<td>${paymentNum.stuPn}</td>
										<td>${paymentNum.slNm}</td>
										<td>
											<a class=" text-body text-truncate sreYn" data-stunum="${paymentNum.stuNum}">
												<button class="btn" style="color: blue; text-decoration: underline;" data-stunum="${paymentNum.stuNum}"data-bs-toggle="modal" data-bs-target="#editUser2" class="srYn">
													${paymentNum.srYn}
												</button>
											</a>
										</td>

<!-- 										<td><a href="/acadNotice/detailView?nbNum=6">학사공지입니다</a></td> -->
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
		<h3 class="card-title">장학생 추천</h3>
	</div>

	<div class="card-body">
      <div id="example1_wrapper" class="dataTables_wrapper dt-bootstrap4">
         <div class="row">
            <div class="col-sm-12">

	 <table id="example1" class="table table-bordered table-striped dataTable dtr-inline" aria-describedby="example1_info">
		 <thead>
              <tr>
              		<th style="display: none;"></th>
              		<th onclick="event.cancelBubble=true" style="text-align: center">번호</th>
					<th onclick="event.cancelBubble=true" style="text-align: center">학번</th>
					<th onclick="event.cancelBubble=true" style="text-align: center">이름</th>
					<th onclick="event.cancelBubble=true" style="text-align: center">학과</th>
					<th onclick="event.cancelBubble=true" style="text-align: center">연락처</th>
					<th onclick="event.cancelBubble=true" style="text-align: center">장학금명</th>
					<th onclick="event.cancelBubble=true" style="text-align: center">승인상태</th>
              </tr>
           </thead>
		<tbody>

		<c:forEach var="ScholarshipListVO" items="${scholarshipList}" varStatus="stat">
			<tr id="ddd${ScholarshipListVO.stuNum}">
				<td style="display: none;">${ScholarshipListVO.sreNum}</td>
				<td>${stat.index+1}</td>
				<td>${ScholarshipListVO.stuNum}</td>
				<td>${ScholarshipListVO.stuNmKor}</td>
				<td>${ScholarshipListVO.deptNm}</td>
				<td>${ScholarshipListVO.stuPn}</td>
				<td>${ScholarshipListVO.slNm}</td>
				<td>
					<a class="showSreYn" data-stunum="${ScholarshipListVO.stuNum}">
						<button id="btn1" class="btn" style="color:blue; text-decoration: underline;" data-stunum="${ScholarshipListVO.stuNum}"  data-bs-toggle="modal" data-bs-target="#editUser">
							${ScholarshipListVO.sreYn}
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

<div class="modal fade" id="editUser" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-simple modal-edit-user">
		<div class="modal-content p-3 p-md-5">
			<div class="modal-body">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				<div class="text-left mb-4">
					<h3 id ="schreco">장학생 추천</h3>
				</div>
				<hr />

				<form id="frm" class="row g-3 fv-plugins-bootstrap5 fv-plugins-framework">
					<input type="text" style="display: none;" readonly id="slNum" name="slNum" class="form-control" value="" readonly>

					<div class="col-12 col-md-6">
						<label class="form-label" for="stuNum">학번</label>
						<input type="text" readonly id="stuNum" name="stuNum" class="form-control" value="" readonly>
					</div>

					<div class="col-12 col-md-6">
						<label class="form-label" for="stuNmKor">이름</label>
						<input type="text" readonly id="stuNmKor" name="stuNmKor" class="form-control" value="" readonly>
					</div>

					<div class="col-12 col-md-6">
						<label class="form-label" for="date">신청일</label>
						<input type="text" readonly id="sreYsemester" name="date" class="form-control modal-edit-tax-id" value="" readonly>
					</div>

					<div class="col-12 col-md-6">
						<label class="form-label" for="date">장학금 명</label>
						<input type="text" readonly id="slNm" name="date" class="form-control modal-edit-tax-id" value="" readonly>
					</div>

					<div class="col-12">
						<label class="form-label" for="sreReason">추천 사유</label>
						<textarea id="sreReason" readonly name="sreReason" class="form-control modal-edit-tax-id" rows="" readonly></textarea>
					</div>
					<hr />
					<div class="col-12 col-md-3">
						승인 여부
					</div>
					<div class="col-12 col-md-3">
						<input class="form-check-input" type="radio" value="승인" name="flexRadioDefault" id="flexRadioDefault1">
						<label class="form-check-label" for="flexRadioDefault1">승인</label>
					</div>
					<div class="col-12 col-md-3">
						<input class="form-check-input" type="radio" value="반려" name="flexRadioDefault" id="flexRadioDefault2">
						<label class="form-check-label" for="flexRadioDefault2">반려</label>
					</div>
					<div class="col-12">
						<label class="form-label" for="sreComre">반려 사유</label>
						<textarea id="sreComre" name="sreComre" class="form-control modal-edit-tax-id" rows="5" readonly></textarea>
					</div>
					<div class="col-12 text-center">
						<button type="button" id="updatePost" class="btn btn-primary me-sm-3 me-1">확인</button>
						<button type="reset" id="close"class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="editUser2" tabindex="-1">
	<div class="modal-dialog modal-lg modal-simple modal-edit-user">
		<div class="modal-content p-3 p-md-5">
			<div class="modal-body">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				<div class="text-left mb-4">
					<h3 id ="schreco">장학금 승인</h3>
				</div>
				<hr />
				<form id="frm" class="row g-3 fv-plugins-bootstrap5 fv-plugins-framework">
					<div class="col-12 col-md-6">
						<label class="form-label" for="stuNum">학번</label>
						<input type="text" readonly id="stuNum1" name="stuNum1" class="form-control" value="" readonly>
					</div>

					<div class="col-12 col-md-6">
						<label class="form-label" for="stuNmKor">이름</label>
						<input type="text" readonly id="stuNmKor1" name="stuNmKor1" class="form-control" value="" readonly>
					</div>

					<div class="col-12 col-md-6">
						<label class="form-label" for="srYsemester1">신청일</label>
						<input type="text" readonly id="srYsemester1" name="srYsemester1" class="form-control modal-edit-tax-id" value="" readonly>
					</div>

					<div class="col-12 col-md-6">
						<label class="form-label" for="srDate">승인일자</label>
						<input type="text" readonly id="srDate" name="srDate" class="form-control modal-edit-tax-id" value="" readonly>
					</div>

					<div class="col-12 col-md-6">
						<label class="form-label" for="slNm1">장학금명</label>
						<input type="text" readonly id="slNm1" name="slNm1" class="form-control modal-edit-tax-id" value="" readonly>
					</div>

					<div class="col-12 col-md-6">
						<label class="form-label" for="slWon">장학금액</label>
						<input type="text" readonly id="slWon" name="slWon" class="form-control modal-edit-tax-id" value="" readonly>
					</div>
					<div class="col-12 text-center">
						<button type="button" id="updatePost1" class="btn btn-primary me-sm-3 me-1">지급</button>
						<button type="button" id="updatePost2" class="btn btn btn-danger me-sm-3 me-1" data-bs-dismiss="modal" aria-label="Close">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">


$(function() {
	//location.reload();
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

	 $("#example1").DataTable({
	      "responsive": true, "lengthChange": false, "autoWidth": false,
	      "destroy": true,
	      info: false,
	      language : lang_kor
	    });
	 $("#example2").DataTable({
	      "responsive": true, "lengthChange": false, "autoWidth": false,
	      "destroy": true,
	      info: false,
	      language : lang_kor
	    });


	//장학금 추천 여부
	var slNum = "";

	$(".showSreYn").on("click",function(){

		let stuNum = $(this).data("stunum");
// 		$("#ddd"+stuNum).find(".btn").css("color","red");
		let data = {"stuNum" : stuNum};
		let flexRadioDefault1 = $("#flexRadioDefault1").val();
		let flexRadioDefault2 = $("#flexRadioDefault2").val();

		$.ajax({
			 url:"/scholarship/showNum",
	         contentType:"application/json; charset:utf-8",
	         data: JSON.stringify(data),
	         type: "post",
	         dataType: "json",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
	         success : function(result){
	        	 slNum = result.ScholarshipListVO.slNum;

		       	  $("#stuNum").val(result.ScholarshipListVO.stuNum);
		       	  $("#stuNmKor").val(result.ScholarshipListVO.stuNmKor);
		       	  $("#sreYsemester").val(result.ScholarshipListVO.sreYsemester);
		       	  $("#sreReason").val(result.ScholarshipListVO.sreReason);
		       	  $("#slNm").val(result.ScholarshipListVO.slNm);
		       	  $("#slNum").val(result.ScholarshipListVO.slNum);
		       	  $("#sreComre").val(result.ScholarshipListVO.sreComre);

		       		if(result.ScholarshipListVO.sreYn == "1"){				//승인
		       		 	$("#updatePost").css("display", "none");
		       		  	$('#flexRadioDefault1').attr('disabled', "true");
		       		  	$('#flexRadioDefault2').attr('disabled', "true");
		       		}else if(result.ScholarshipListVO.sreYn == "2"){			//반려
			       		$("#updatePost").css("display", "none");
			       		$('#flexRadioDefault1').attr('disabled', "true");
			       		$('#flexRadioDefault2').attr('disabled', "true");
			       	}else if(result.ScholarshipListVO.sreYn == "0"){			//대기
			       		$('#flexRadioDefault1').removeAttr('disabled', "true");
			       		$('#flexRadioDefault2').removeAttr('disabled', "true");
			       	}
	         }
		});


	});

	$(".form-check-input").on("click",function(){
		var valueCheck = $('input[name=flexRadioDefault]:checked').val();
		if(valueCheck =='반려'){
			$('#sreComre').removeAttr('readonly');
			$('#sreComre').focus();
		}

	});


	$("#updatePost").on("click",function(){
		var checkVal = $("input[name=flexRadioDefault]:checked").val();
		var sreComre = $("#sreComre").val();
		var status = 0;
		var stuNum = $("#stuNum").val();
		var sreYsemester = $("#sreYsemester").val();
		var sreNum = $("#ddd"+stuNum).children().first().text();
		var srDt = $();
		var now = new Date();	// 현재 날짜 및 시간
    	var year = now.getFullYear();	// 연도
        var month = now.getMonth()+1;
    	var date = now.getDate();
     	var nowDate = year+"년"+month+"월"+date+"일";

		sreYsemester = sreYsemester.substr(0,4)+"-"+sreYsemester.substr(6,2); //ex) 2022-1
		if(checkVal == null || checkVal == ''){
		 	Swal.fire({
		 		 html: '승인 여부를 체크해주세요.',
		    	 icon: 'warning',
		    	 confirmButtonText: '확인',
		    	 timer : 1500
			})
			return false;
		}


		if(checkVal=="반려"){
			if(sreComre == "" || sreComre ==null){
			 	Swal.fire({
			 		 html: '반려 사유를 작성해주세요.',
			    	 icon: 'warning',
			    	 confirmButtonText: '확인',
			    	 timer : 1500
				})
				return false;
			}else{
			 	Swal.fire({
			 		 html: '반려되었습니다.',
			    	 icon: 'success',
			    	 confirmButtonText: '확인',
			    	 timer : 1500
				}).then(function(result){
					status = 2;
					$('#editUser').modal('hide');
					location.href="/scholarship/updateState2?stuNum="+stuNum+"&status="+status+"&sreComre="+sreComre;

				})
			}
		}else if(checkVal == "승인"){

			Swal.fire({
				  icon: 'success',
				  title: '승인되었습니다.',
				  confirmButtonText: '확인',
				  timer : 1500
			}).then(function(result){ //  창 꺼질때 실행할 함수
				status = 1;
				$('#editUser').modal('hide');
				location.href="/scholarship/updateState?stuNum="+stuNum+"&status="+status+
	    		      "&slNum="+slNum+"&sreYsemester="+sreYsemester+"&nowDate="+nowDate;
	      })

// 		    setTimeout(sayHi2,1000,stuNum, status,slNum,sreYsemester,nowDate);
		}
	});

// 	function sayHi2(stuNum, status,slNum,sreYsemester,nowDate) {
// 		window.location="/scholarship/updateState?stuNum="+stuNum+"&status="+status+
// 	      "&slNum="+slNum+"&sreYsemester="+sreYsemester+"&nowDate="+nowDate;
		//$('#editUser').modal('hide');
		//location.reload();
		//location.reload();
// 	};

// 	//장학금 승인 여부 모달
	$(".sreYn").on("click",function(){
		let stuNum = $(this).data("stunum");
// 		$("#fff"+stuNum).find(".btn").css("color","red");


		let data = {
						"stuNum" : stuNum,
						"slNm" : $(this).parent().prev().text()
					};
		$.ajax({
			 url:"/scholarship/showStuNum",
	         contentType:"application/json; charset:utf-8",
	         data:JSON.stringify(data),
	         type:"post",
	         dataType:"json",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
	         success:function(result){
	        	 var num3 = result.paymentNum.slWon;
	        	 num2 = $.numberWithCommas(parseInt(num3));
		       	  $("#stuNum1").val(result.paymentNum.stuNum);
		       	  $("#stuNmKor1").val(result.paymentNum.stuNmKor);
		       	  $("#srYsemester1").val(result.paymentNum.srYsemester);
		       	  $("#srDt").val(result.paymentNum.srDt);
		       	  $("#slNm1").val(result.paymentNum.slNm);
		       	  $("#slWon").val(num2+"원");
		       	  $("#srDate").val(result.paymentNum.srDate);

		       	  if(result.paymentNum.srYn == "지급"){
		       		  $("#updatePost1").css("display", "none");
		       	  }else{
		       		$("#updatePost1").css("display", "inline-block");
		       	  }
	         }
		});
// 		status = 1;
// 		window.location="/scholarship/updateState3?stuNum1="+stuNum1+"&status="+status;

// 		Swal.fire({
// 	    	  html: '지급되었습니다.',
// 	    	  icon: 'success',
// 	    	  confirmButtonText: '확인',
// 	    	  timer : 1500
// 	      })
		$("#updatePost1").on("click",function(){
			let stuNum1 = $("#stuNum1").val();

// 			status = 1;
// 			window.location="/scholarship/updateState3?stuNum1="+stuNum1+"&status="+status;

// 			Swal.fire({
// 		    	  html: '지급되었습니다.',
// 		    	  icon: 'success',
// 		    	  confirmButtonText: '확인',
// 		    	  timer : 1500
// 		      })

		      Swal.fire({
			 		 html: '지급되었습니다.',
			    	 icon: 'success',
			    	 confirmButtonText: '확인',
			    	 timer : 1500
				}).then(function(result){
					status = 1;
					window.location="/scholarship/updateState3?stuNum1="+stuNum1+"&status="+status;

				})



			$('#editUser2').modal('hide');
		});
	});

	$("#close").on("click",function(){

	});


	$.numberWithCommas = function (x) {
		  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}


});
</script>
