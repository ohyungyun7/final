<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>
<script src="/resources/sneat/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
<script type="text/javascript" src="/resources/sneat/assets/js/extended-ui-sweetalert2.js"></script>

<style type="text/css">
.card{
	min-height: 100%;
}
.si_target{
	width: 60%;
	text-align: center;
}
thead{
	text-align: center;
}
.table > thead {
	vertical-align: middle;
}
th{
 	white-space: pre-line;
 	text-align: center;
 }
tr td {
  text-align: center;
}
.div-header{
	text-align: right;
}
.innerCard{
	border: 1px solid lightgray;
	border-radius: 5px;
	margin: 5px;
	padding: 10px;
}
.search-sel{
	width: 20%;
}
textarea{
	resize: none;
	width: 100%;
	maxlength: 300;
}
.infoDiv{
	margin: 10px;
}
</style>
<style type="text/css">
.categoryBar{
	color: gray;
}
.card:hover{
   transition-duration: 0.4s;
   box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}
.buttonDiv{
	text-align: right;
}
.span{
	font-size: 20em;
}
</style>

<h4 class="title fw-bold py-3 mb-2 categoryBar">
   <i class="bx bx-grid-alt page-icon"></i>
   <span class="fw-light">학과관리 / </span>학과관리
</h4>

	<h4 class="title">
		<button type="button" id="insertButton" class="btn btn-label-info" data-bs-toggle="modal" data-bs-target="#deptInfo" style="float: right;">학과추가</button>
	</h4>
	<br/>

	<h5>학과관리</h5>
	<div class="row mb-5 endterdDiv">
		<c:forEach var="departmentVO" items="${data}" varStatus="stat">
				<div class="col-md-6 col-lg-4 mb-3">
					<div class="card h-100 sub-card">
						<div class="card-body">
							<ul class="list-unstyled mb-4 mt-3" style="margin-left: 22%;">
								 <li class="d-flex align-items-center mb-3">
									 <span>
										 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-buildings-fill" viewBox="0 0 16 16">
										 <path d="M15 .5a.5.5 0 0 0-.724-.447l-8 4A.5.5 0 0 0 6 4.5v3.14L.342 9.526A.5.5 0 0 0 0 10v5.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V14h1v1.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5V.5ZM2 11h1v1H2v-1Zm2 0h1v1H4v-1Zm-1 2v1H2v-1h1Zm1 0h1v1H4v-1Zm9-10v1h-1V3h1ZM8 5h1v1H8V5Zm1 2v1H8V7h1ZM8 9h1v1H8V9Zm2 0h1v1h-1V9Zm-1 2v1H8v-1h1Zm1 0h1v1h-1v-1Zm3-2v1h-1V9h1Zm-1 2h1v1h-1v-1Zm-2-4h1v1h-1V7Zm3 0v1h-1V7h1Zm-2-2v1h-1V5h1Zm1 0h1v1h-1V5Z"/>
										 </svg>
									 </span>
									<span class="fw-semibold mx-2">단과대학 :</span>
		         				 	<span>${departmentVO.collNm}</span>
								 </li>
								 <li class="d-flex align-items-center mb-3">
									<span>
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-book" viewBox="0 0 16 16">
	  									<path d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811V2.828zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z"/>
										</svg>
									</span>
									<span class="fw-semibold mx-2">학과 :</span>
			         				<span>${departmentVO.deptNm}</span>
								 </li>
							     <li class="d-flex align-items-center mb-3">
									<span>
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
			  							<path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7Zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216ZM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5Z"/>
										</svg>
									</span>
									<span class="fw-semibold mx-2">정원 :</span>
		         				 	<span>${departmentVO.deptNumber}명</span>
								 </li>
							 	<li class="d-flex align-items-center mb-3">
									<span>
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-dollar" viewBox="0 0 16 16">
			  							<path d="M4 10.781c.148 1.667 1.513 2.85 3.591 3.003V15h1.043v-1.216c2.27-.179 3.678-1.438 3.678-3.3 0-1.59-.947-2.51-2.956-3.028l-.722-.187V3.467c1.122.11 1.879.714 2.07 1.616h1.47c-.166-1.6-1.54-2.748-3.54-2.875V1H7.591v1.233c-1.939.23-3.27 1.472-3.27 3.156 0 1.454.966 2.483 2.661 2.917l.61.162v4.031c-1.149-.17-1.94-.8-2.131-1.718H4zm3.391-3.836c-1.043-.263-1.6-.825-1.6-1.616 0-.944.704-1.641 1.8-1.828v3.495l-.2-.05zm1.591 1.872c1.287.323 1.852.859 1.852 1.769 0 1.097-.826 1.828-2.2 1.939V8.73l.348.086z"/>
										</svg>
									</span>
									<span class="fw-semibold mx-2">등록금 :</span>
			         				<span><fmt:formatNumber type="number" maxFractionDigits="3" value="${departmentVO.deptFees}"/>원</span>
							 	</li>
							</ul>

							<div class="buttonDiv">
								<button type="button" id="${departmentVO.deptNum}" class="btn btn-outline-primary btnDelete" style="float: right;">학과삭제</button>
								<button type="button" id="${departmentVO.deptNum}"  data-bs-toggle="modal" data-bs-target="#deptInfo1" class="btn btn-outline-primary btnUpdate" style="float: right;">학과수정</button>
							</div>
						</div>
					</div>
				</div>
		</c:forEach>
	</div>


<!-- 학과명 모달  -->
<div class="modal fade" id="deptInfo" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered1 modal-simple modal-add-new-cc">
		<div class="modal-content p-3 p-md-5">
			<div class="modal-body">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				<form id="gradeForm" name="gradeForm">
					<div class="row g-3">
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-3 col-form-label text-sm-end" for="university">단과대학</label>
								<div class="col-sm-9">
								<select id="university" name="university" class="form-select" aria-label="Default select example">
								</select>
								</div>
							</div>
						</div>

						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-3 col-form-label text-sm-end" for="deptNm">학과명</label>
								<div class="col-sm-9">
									<input type="text" id="deptNm" name="deptNm" class="form-control" value="" />
								</div>
							</div>
						</div>

						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-3 col-form-label text-sm-end" for="deptNumber">정원</label>
								<div class="col-sm-9">
									<input type="text" id="deptNumber" name="deptNumber" class="form-control" value="" placeholder="숫자만 입력해주세요"/>
								</div>
							</div>
						</div>

						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-3 col-form-label text-sm-end" for="deptFees">학과등록금</label>
								<div class="col-sm-9">
									<input type="text" id="deptFees" name="deptFees" class="form-control" value="" placeholder="숫자만 입력해주세요" />
								</div>
							</div>
						</div>
						<div class="col-md-12 text-center formButtons" >
							<button type="button" class="btn btn-success" id="btnAuto">자동채우기</button>
<!-- 							<button type="button" class="btn btn-primary me-sm-3 me-1 data-submit" id="create">추가</button> -->
							<button type="submit" class="btn btn-primary timeTable_btnSubmit" id="create">등록</button>
							<button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- 학과 수정 -->
<div class="modal fade" id="deptInfo1" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered1 modal-simple modal-add-new-cc">
		<div class="modal-content p-3 p-md-5">
			<div class="modal-body">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				<form id="updateForm" name="updateForm">
					<div class="row g-3">
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-3 col-form-label text-sm-end" for="university1">단과대학</label>
								<div class="col-sm-9">
								<select id="university1" name="university1" class="form-select" aria-label="Default select example" disabled>
								</select>
								</div>
							</div>
						</div>

						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-3 col-form-label text-sm-end" for="deptNm1">학과명</label>
								<div class="col-sm-9" id="sss">
									<input type="text" id="deptNm1" name="deptNm1" class="form-control" value="" disabled/>
								</div>
							</div>
						</div>

						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-3 col-form-label text-sm-end" for="deptNumber1">정원</label>
								<div class="col-sm-9">
									<input type="text" id="deptNumber1" name="deptNumber1" class="form-control" value="" placeholder="숫자만 입력해주세요" disabled/>
								</div>
							</div>
						</div>

						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-3 col-form-label text-sm-end" for="deptFees1">학과등록금</label>
								<div class="col-sm-9">
									<input type="text" id="deptFees1" name="deptFees1" class="form-control" value="" placeholder="숫자만 입력해주세요" disabled />
								</div>
							</div>
						</div>

						<div class="col-md-12 text-center" id="update33">
							<button type="button" class="btn btn-primary me-sm-3 me-1 data-submit" id="update">수정</button>
							<button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">취소</button>
						</div>

						<div class="col-md-12 text-center" id="update44">
							<button type="button" class="btn btn-primary me-sm-3 me-1 data-submit" id="save">저장</button>
							<button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close"id="cancel">취소</button>
						</div>

					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
$(function(){
	let deptNum = "";
	$(".btnDelete").on("click", function() {		//btndelete 시작

		let deptNum = $(this).attr("id");
		$.ajax({					//ajax 시작
			url: "/manage/deleteNum",
			data: {"deptNum" : deptNum},
			type: "post",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	      },
			success: function(result) {
					 Swal.fire({
						  position: 'top-center',
						  icon: 'success',
						  title: '삭제되었습니다.',
						  showConfirmButton: false,
						  timer: 1500
					})
					setTimeout(sayHi,1500);
			}
		});  //ajax 끝
	}); //btndelete 끝

	$(".btnUpdate").on("click",function(){		//btnUpdate 시작
		$("#update33").css("display","block");
		$("#update44").css("display","none");
		let deptNum = $(this).attr("id");

		let data = {"deptNum" : deptNum};

		$.ajax({
			url:"/manage/deptNum",
	         contentType:"application/json; charset:utf-8",
	         data: JSON.stringify(data),
	         type: "post",
	         dataType: "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
          	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function(result) {
				$("#deptNm1").val(result.data.deptNm);
				$("#deptNumber1").val(result.data.deptNumber);
				$("#deptFees1").val(result.data.deptFees);
	 			var str = "<option value='"+result.data.collNm+","+result.data.deptNum+"'disabled'>"+result.data.collNm+"</option>";
	 			$("#university1").html(str);
			}
		}); //모달에 단과대학 추가하는 ajax 끝
	}); //btnUpdate 끝

	$("#update").on("click",function(){
		$("#update33").css("display","none");
		$("#update44").css("display","block");
		$("#deptNm1").removeAttr("disabled","true");
		$("#deptNumber1").removeAttr("disabled","true");
		$("#deptFees1").removeAttr("disabled","true");
	});
	$("#save").click(function(){
// 		var updateForm = decodeURIComponent($("form[name=updateForm]").serialize() );
		var deptNm1 = $("#deptNm1").val();
		var deptFees1  = $("#deptFees1").val();
		var deptNumber1 = $("#deptNumber1").val();
		let university1 = $("#university1").val();

		let data = {
					"university1"      : university1,
					"deptNm1"     : deptNm1 ,
					"deptFees1"   : deptFees1,
					"deptNumber1" : deptNumber1
					}
		$.ajax({
		url:"/manage/updateForm",
        contentType:"application/json; charset:utf-8",
        data: JSON.stringify(data),
        type: "post",
        dataType: "json",
        beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
       		 },
        success : function(result){
    	 Swal.fire({
				  icon: 'success',
				  title: '수정되었습니다.',
				  confirmButtonText: '확인',
				  timer : 1500
			})
			setTimeout(sayHi,1500);
			 $("#deptInfo1").modal("hide");
    		}
		});
	});
	$("#insertButton").on("click",function(){
		//모달에 단과대학 추가하는 ajax 시작
		$.ajax({			//모달에 단과대학 추가하는 ajax 시작
			url : "/manage/getCollNm",
			contentType : 'application/json;charset=utf-8',
			dataType : "json",
			type : "post",
			async :false,
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
				var str = "";
				for(var i=0; i<result.data.length; i++){
					str+="<option value='"+result.data[i].collNm+"'''disabled'>"+result.data[i].collNm+"</option>";
				}
				$("#university").html(str);
			}
		}); //모달에 단과대학 추가하는 ajax 끝


	});


	//학과모달에서 학과 추가 시작
	$("#create").on("click",function(){
		var deptNm = $("#deptNm").val();
		var teaNmKor = $("#teaNmKor").val();
		var deptNumber = $("#deptNumber").val();
		var deptFees = $("#deptFees").val();
		var university = $("#university").val();

		let data  = {
						 "deptNm" : deptNm,
						 "teaNmKor" : teaNmKor,
						 "deptNumber" : deptNumber,
						 "deptFees" : deptFees,
						 "university" : university
					 };

		$.ajax({
			url : "/manage/createCollNm",
			contentType : 'application/json;charset=utf-8',
			data : JSON.stringify(data),
			dataType : "json",
			type : "post",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
          		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
				 Swal.fire({
					  position: 'top-center',
					  icon: 'success',
					  title: '학과를 등록하였습니다.',
					  showConfirmButton: false,
					  timer: 1500
				})
				setTimeout(sayHi,1500);
			}
		});
	});

	$("#btnAuto").on("click",function(){
		$("#deptNm").val("바이오학과");
		$("#deptNumber").val(250);
		$("#deptFees").val(3000000);
	});

	$("#cancel").on("click",function(){
		$("#deptNm1").attr("disabled","true");
		$("#deptNumber1").attr("disabled","true");
		$("#deptFees1").attr("disabled","true");
	})


});
	function sayHi() {
		location.reload();
	}



</script>

