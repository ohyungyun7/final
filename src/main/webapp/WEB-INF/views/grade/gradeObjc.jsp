<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>
<style type="text/css">
.card{
	min-height: 100%;
}
/* .categoryBar{ */
/* 	color: gray; */
/* } */
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
tr td:not(:first-of-type) {
  text-align: center;
}
.div-header{
	text-align: right;
	margin: 5px;
	padding-right: 1.625rem;
}
.innerCard{
	border: 1px solid lightgray;
	border-radius: 5px;
	margin: 5px;
	padding: 10px;
}
.search-sel{
	width: 20%;
	display: inline;
}
textarea{
	resize: none;
	width: 100%;
	maxlength: 300;
}
</style>
<script>
$(function(){
	var sbjNum = "";
	$(".detail").on("click",function(){

		var goList = $('input:checkbox[name=goList]').length;
		var Yn = $(this).parent().parent().find("#Yn").text();
		var textarea = $("#textarea").val();
		var dbCount = 0;
		var rcMtest = $("#rcMtest").val();

		sbjNum = $(this).parent().parent().find(".sbjNum").text();
		$("#sbjTitle").val($(this).text());
		$("#teaNmKor").val($(this).parent().prev().text());

		let datttta = {
						   "sbjNum" : sbjNum,
						   "stuNum" : $("#stuNum").val()
					   };

				let data = {
							"sbjNum" : sbjNum,
							"stuNum" : $("#stuNum").val()
							};
				$.ajax({
					url:"/grade/detail",
			         contentType:"application/json; charset:utf-8",
			         data: JSON.stringify(data),
			         type: "post",
			         dataType: "json",
			         async : false,
			         beforeSend : function(xhr) {  // 데이터 전송 전  헤더에 csrf값 설정
			           	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			 		 },
			         success : function(result){
			        	 arr = [];
				         $("input[type=checkbox]").prop("checked",false);

			        	 if(result.reportCardVO.length < 1){
			        		 Swal.fire({
			   				  icon: 'error',
			   				  title: '미 입력된 성적이라 확인 할 수 없습니다.',
			   				})
			   			return false;
			        	 }else{
			        		 	$("#gradeObjc").modal("show");
								$("#deptNm").val(result.reportCardVO[0].deptNm);
								$("#studentNum").val(result.reportCardVO[0].stuNum);
								$("#stuSemester").val(result.reportCardVO[0].stuSemester);
								$("#studentNmKor").val(result.reportCardVO[0].stuNmKor);
								$("#rcMtest").val(result.reportCardVO[0].rcMtest);
								$("#rcFtest").val(result.reportCardVO[0].rcFtest);
								$("#rcAttscore").val(result.reportCardVO[0].rcAttscore);
								$("#rcHw").val(result.reportCardVO[0].rcHw);
								$("#rcEtc").val(result.reportCardVO[0].rcEtc);

								for(var i =0; i<result.reportCardVO.length; i++){
									if(result.reportCardVO[i].goList == "중간"){
										arr.push("mTest");
									}else if(result.reportCardVO[i].goList == "기말"){
										arr.push("fTest");
									}else if(result.reportCardVO[i].goList == "출석"){
										arr.push("att");
									}else if(result.reportCardVO[i].goList == "과제"){
										arr.push("hw");
									}else if(result.reportCardVO[i].goList == "기타"){
										arr.push("etc");
									}
								}
								for(var i =0; i<result.reportCardVO.length; i++){
									$("#"+arr[i]).prop("checked",true);
								}

								if($("input[name=goList]").is(':checked') == true){
									$("input[name=goList]").prop("disabled",true);
									$("#textarea").attr("readonly",true);
									$("#submit").hide();
								}

								if($("input[name=goList]").is(':checked') == false){
									$("input[name=goList]").prop("disabled",false);
									$("#textarea").attr("readonly",false);
									$("#submit").show();
								}

								$("#textarea").val(result.reportCardVO[0].goReason);
								$("#textarea2").val(result.reportCardVO[0].goReply);
			        	 }
					}
				})


		});


	var arr = [];

	$(document).on("click","input[type=checkbox]", function(){
		if(arr.includes($(this).next().text())){
			for(let i = 0; i < arr.length; i++) {
			    if (arr[i] === $(this).next().text()) {
			    	arr.splice(i, 1);
			    }
			}
		}else{
			arr.push($(this).next().text());
		}
	});//체크박스 클릭시



	$("#submit").on("click",function(){
		if(arr.length==0){
			Swal.fire({
				  icon: 'warning',
				  title: '이의 항목을 체크해주세요',
	 	    	  confirmButtonText: '확인',
		    	  timer : 1500
				})
			return false;
		}

		var stuNum = $("#stuNum").val();//학번
		var textarea = $("#textarea").val();//신청사유
		var count = 0;

		for(var i =0; i<arr.length; i++){
			let data = {"sbjNum" : sbjNum,
						"stuNum" : stuNum,
						"goList" : arr[i],
						"goReason" : textarea
						};

			$.ajax({
				url:"/grade/create",
		         contentType:"application/json; charset:utf-8",
		         data: JSON.stringify(data),
		         type: "post",
		         dataType: "json",
		         async : false,
		         beforeSend : function(xhr) {  // 데이터 전송 전  헤더에 csrf값 설정
		           	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		 		},
		         success : function(result){
		        	 count++;
		        	 if(count == arr.length){
		        			Swal.fire({
		      				  icon: 'success',
		      				  title: '이의 신청이 완료되었습니다.',
		      				  confirmButtonText: '확인',
		      				  timer : 1500
		        			})
		        		 $("#gradeObjc").modal("hide");
// 		        		 location.reload();
		        	 }
				}
			});
		}
		//textarea
	})//submit 끝

	$("#autoBtn").on("click",function(){
		$("#textarea").val("중간고사 점수가 잘못된거 같습니다 수정 부탁드립니다 교수님!!");

	});

	function sayHi() {
		location.reload();
	}

});
</script>

<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bxs-report page-icon"></i>
	<span style="font-weight: normal;">성적조회 / </span>성적이의 신청
</h4>

<div class="card">

	<div class="container">
		<div class="card innerCard">
			<div class="row g-3">
				<div class="col-md-6">
					<div class="row infoDiv">
						<label class="col-sm-2 col-form-label text-sm-end" for="year">연도</label>
						<div class="col-sm-3">
							<input type="text" id="year" class="form-control" value="${student.year}" readonly>
						</div>

						<label class="col-sm-2 col-form-label text-sm-end" for="semester">학기</label>
						<div class="col-sm-3">
							<input type="text" id="semester" class="form-control" value="${student.clSemester}" readonly>
						</div>
					</div>
				</div>

				<div class="col-md-6">
					<div class="row infoDiv">
						<label class="col-sm-3 col-form-label text-sm-end">학번/성명</label>
						<div class="col-sm-4">
							<input type="text" id="stuNum" class="form-control" value="${student.stuNum}" readonly>
						</div>
						<div class="col-sm-4">
							<input type="text" id="stuNmKor" class="form-control" value="${student.stuNmKor}" readonly>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
	<table class="datatables-basic table border-top dataTable no-footer dtr-column table table-hover" style="text-align: center;">
			<thead class="table-active">
				<tr>
				   <th style="font-size: 1.0em; text-align: center;">년도</th>
			       <th style="font-size: 1.0em; text-align: center;">학기</th>
			       <th style="font-size: 1.0em; text-align: center;">이수구분</th>
			       <th style="font-size: 1.0em; text-align: center;">담당교수</th>
			       <th style="font-size: 1.0em; text-align: center;">과목명</th>
	 			   <th style="font-size: 1.0em; text-align: center;">승인여부</th>
			    </tr>
			<tbody class="table-border-bottom-0">
				<c:forEach var="courseListVO" items="${data}" varStatus="stat">
					<tr class="parentTr">
						<td class="sbjNum" style="display: none;">${courseListVO.sbjNum}</td>
						<td>${courseListVO.yearr}</td>
						<td>${courseListVO.gkrrl}</td>
						<td>${courseListVO.sbjRs}</td>
						<td id="tName">${courseListVO.teaNmKor}</td>
						<td><a class="detail" href="#">${courseListVO.sbjTitle}</a></td>
 						<td id="Yn">${courseListVO.goCheck}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</div>

<!-- <div class="modal fade" id="gradeObjc" tabindex="-1" style="display: none;" aria-hidden="true"> -->
<div class="modal fade" id="gradeObjc" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-simple">
		<div class="modal-content p-3 p-md-5">
			<div class="modal-body">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				<form id="gradeForm">
					<div class="row g-3">
						<div class="col-md-7">
							<div class="row infoDiv">
								<label class="col-sm-3 col-form-label text-sm-end" for="sbjTitle">교과목명</label>
								<div class="col-sm-9">
									<input type="text" id="sbjTitle" class="form-control" value="" readonly>
								</div>
							</div>
						</div>
						<div class="col-md-5">
							<div class="row">
								<label class="col-sm-4 col-form-label text-sm-end" for="teaNmKor">교수명</label>
								<div class="col-sm-8">
									<input type="text" id="teaNmKor" class="form-control" value="" readonly />
								</div>
							</div>
						</div>

						<div class="col-md-12 text-center">
							-------------------------------------------
							&nbsp; 신청자 &nbsp;
							-------------------------------------------
						</div>

						<div class="col-md-6">
							<div class="row">
								<label class="col-sm-3 col-form-label text-sm-end" for="deptNm">학부(과)</label>
								<div class="col-sm-9">
									<input type="text" id="deptNm" class="form-control" value="" readonly />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="row">
								<label class="col-sm-3 col-form-label text-sm-end" for="studentNum">학번</label>
								<div class="col-sm-9">
									<input type="text" id="studentNum" class="form-control" value="" readonly />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="row">
								<label class="col-sm-3 col-form-label text-sm-end" for="stuSemester">학년</label>
								<div class="col-sm-9">
									<input type="text" id="stuSemester" class="form-control" value="" readonly />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="row">
								<label class="col-sm-3 col-form-label text-sm-end" for="studentNmKor">성명</label>
								<div class="col-sm-9">
									<input type="text" id="studentNmKor" class="form-control" value="" readonly />
								</div>
							</div>
						</div>
						<div class="col-md-1"></div>
						<div class="col-md-2">
							<label class="form-label" for="rcMtest">중간</label>
							<input type="text" id="rcMtest" name="rcMtest" class="form-control" value="" readonly />
						</div>
						<div class="col-md-2">
							<label class="form-label" for="rcFtest">기말</label>
							<input type="text" id="rcFtest" class="form-control" value="" readonly />
						</div>
						<div class="col-md-2">
							<label class="form-label" for="rcAttscore">출석</label>
							<input type="text" id="rcAttscore" class="form-control" value="" readonly />
						</div>
						<div class="col-md-2">
							<label class="form-label" for="rcHw">과제</label>
							<input type="text" id="rcHw" class="form-control" value="" readonly />
						</div>
						<div class="col-md-2">
							<label class="form-label" for="rcEtc">기타</label>
							<input type="text" id="rcEtc" class="form-control" value="" readonly />
						</div>

						<div class="col-md-12 text-center">
							-----------------------------------
							&nbsp; 성적 이의신청 내용 &nbsp;
							-----------------------------------
						</div>

						<div class="col-md-3">
							이의 항목 체크
						</div>
						<div class="col-md-9">
							<input class="form-check-input" type="checkbox" id="mTest" name="goList">
							<label class="form-check-label" for="mTest">중간</label>
							&nbsp;&nbsp;
							<input class="form-check-input" type="checkbox" id="fTest" name="goList">
							<label class="form-check-label" for="fTest">기말</label>
							&nbsp;&nbsp;
							<input class="form-check-input" type="checkbox" id="att" name="goList">
							<label class="form-check-label" for="att">출석</label>
							&nbsp;&nbsp;
							<input class="form-check-input" type="checkbox" id="hw" name="goList">
							<label class="form-check-label" for="hw">과제</label>
							&nbsp;&nbsp;
							<input class="form-check-input" type="checkbox" id="etc" name="goList">
							<label class="form-check-label" for="etc">기타</label>
						</div>

						<div class="col-md-2 text-sm-end">
							내용작성
						</div>
						<div class="col-md-10">
							<textarea id="textarea" rows="5" cols=""></textarea>
						</div>

						<div class="col-md-12 text-center">
							----------------------------
							&nbsp; 성적 이의신청 결과에 대한 답변 &nbsp;
							----------------------------
						</div>

						<div class="col-md-2 text-sm-end">
							신청 결과
						</div>
						<br/>
						<div class="col-md-10">
						<textarea rows="5" cols="" readonly id="textarea2"></textarea>
							<br/>
							<br/>

						</div>
						<div class="col-md-12 text-center">
							<button type="button" class="btn btn-success" id="autoBtn">자동채우기</button>
							<button type="button" id="submit" class="btn btn-primary">저장</button>
							<button type="reset" id="cancel" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">취소</button>

						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
