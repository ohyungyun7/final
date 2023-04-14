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
		var Yn = $(this).parent().next().text();
		var checkVal = $("input[name=goCheck]:checked").val();
		var goList = $('input:checkbox[name=goList]').length;

 		if(Yn=="승인" || Yn=="반려"){
 			$("#goCheck1").prop("disabled",true);
 			$("#goCheck2").prop("disabled",true);
 			$("#textarea2").prop("disabled",true);
 			$("#submit").hide();
 		}else if(Yn=="대기"){
 			$("#goCheck1").prop("disabled",false);
 			$("#goCheck2").prop("disabled",false);
 			$("#textarea2").prop("disabled",false);
 		}


		var arr = [];
		var dbCount = 0;
		sbjNum = $(this).parent().parent().find(".sbjNum").text();
		stuNum = $(this).parent().parent().find("#stuNum").text();

		$("#gradeObjc").modal("show");
		let data = {
					"sbjNum" : sbjNum,
					"stuNum" : stuNum
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
				if(goList !=null){
					$("input[name=goList]").prop("disabled",true);
				}
				$("#textarea").val(result.reportCardVO[0].goReason);
				$("#textarea2").val(result.reportCardVO[0].goReply);
			}
		})//ajax끝
	});//detail 끝

	// 성적이의신청 결과 submit
	$("#submit").on("click",function(){
		var textarea2 = $("#textarea2").val();
		var checkVal = $("input[name=goCheck]:checked").val();//승인, 반려
		var goCheck = 0;
		var studentNum = $("#studentNum").val();
		if(checkVal == "성적 이의 신청에 대한 성적 정정이 가능합니다."){
			Swal.fire({
				  icon: 'success',
				  title: '승인후 성적 입력 수정 창으로 이동하겠습니다.',
				  timer : 1000
			})
			$("#gradeObjc").modal('hide');
			goCheck = 1;
			//grade_objc에 데이터 넘겨야할거 , sbjNum, stuNuM, goCheck, goReply
			setTimeout(sayHi3 ,1000,studentNum, goCheck , sbjNum , textarea2);
			return false;
		}
		if(checkVal == null || checkVal ==''){
			Swal.fire({
				  icon: 'error',
				  title: '신청결과를 체크해주세요.',
				})
			return false;
		}
		if(textarea2 == null || textarea2 == ''){
			$("#textarea2").focus();
			Swal.fire({
				  icon: 'error',
				  title: '신청결과를 작성해주세요.',
				})
			return false;
		}
		if(checkVal == "성적 이의 신청에 대한 성적 정정이 가능합니다."){
			Swal.fire({
				  icon: 'success',
				  title: '반려되었습니다.',
				  timer : 1000
				})
			  goCheck = 2;
			  setTimeout(sayHi2,1000,stuNum,goCheck,textarea2);
		}
	});
	////////////////////////////////////////////////////////////////////////////////
	function sayHi3(studentNum, goCheck , sbjNum , textarea2){//승인 후 GRADE_OBJC 수정
		window.location="/grade/updateGoCheck?stuNum="+studentNum+"&goCheck="+goCheck+"&goReply="+textarea2+"&sbjNum="+sbjNum;
	}



	function sayHi1(stuNum,goCheck) {
		window.location="/grade/updateGoCheck?stuNum="+stuNum+"&goCheck="+goCheck+"&goReply="+textarea2;
	};

	function sayHi2(stuNum,goCheck,textarea2) {
		window.location="/grade/updateGoCheck2?stuNum="+stuNum+"&goCheck="+goCheck+"&textarea2="+textarea2;
	};
	// 성적이의신청 반대 버튼 누를시 textarea2활성화
	$(".form-check-input").on("click",function(){
		var checkText = $('input[name=goCheck]:checked').val();
		if(checkText =='성적 이의 신청에 대한 성적 정정이 불가합니다.'){
			$("#textarea2").removeAttr('readonly');
			$("#textarea2").focus();
		}else{
			//$("#textarea2").attr('readonly','true');
		}

	});

	// 취소버튼 누를시 textarea2 비활성화
	$("#cancel").on("click",function(){
		if($("#submit").text()=="저장"){
			$("#textarea2").attr('readonly','true');
		}
	});

	$("#autoBtn").on("click",function(){
		$("#textarea2").val("수정해줄게요.");
	});

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
							<input type="text" id="year" class="form-control" value="2023년" readonly>
						</div>

						<label class="col-sm-2 col-form-label text-sm-end" for="semester">학기</label>
						<div class="col-sm-3">
							<input type="text" id="semester" class="form-control" value="01학기" readonly>
						</div>
					</div>
				</div>

				<div class="col-md-6">
					<div class="row infoDiv">
						<label class="col-sm-3 col-form-label text-sm-end">교번/성명</label>
						<div class="col-sm-4">
							<input type="text" id="teaNum" class="form-control" value="${teacher.teaNum}" readonly>
						</div>
						<div class="col-sm-4">
							<input type="text" id="teaNmKor" class="form-control" value="${teacher.teaNmKor}" readonly>
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
			       <th style="font-size: 1.0em; text-align: center;">학생명</th>
			       <th style="font-size: 1.0em; text-align: center;">과목명</th>
			       <th style="font-size: 1.0em; text-align: center;">승인여부</th>
			       	</tr>
			<tbody class="table-border-bottom-0">
				<c:forEach var="gradeOvjectVO" items="${data}" varStatus="stat">
					<tr class="parentTr">
						<td class="sbjNum" style="display: none;">${gradeOvjectVO.sbjNum}</td>
						<td>${gradeOvjectVO.yearr}</td>
						<td>${gradeOvjectVO.gkrrl}</td>
						<td>${gradeOvjectVO.sbjRs}</td>
						<td id="tName">${gradeOvjectVO.stuNmKor}</td>
						<td style="display : none;" id="stuNum">${gradeOvjectVO.stuNum}</td>
						<td><a class="detail" href="#">${gradeOvjectVO.sbjTitle}</a></td>
						<td id="Yn">${gradeOvjectVO.goCheck}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</div>

<div class="modal fade" id="gradeObjc" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-simple">
		<div class="modal-content p-3 p-md-5">
			<div class="modal-body">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				<form id="gradeForm">
				<input type="hidden" id="clNum" name="clNum">
					<div class="row g-3">

						<div class="col-md-12 text-center">
							-----------------------------------------------------
							&nbsp;신청자&nbsp;
							-----------------------------------------------------
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
							<input type="text" id="rcMtest" class="form-control" value="" readonly />
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
							---------------------------------------------
							&nbsp;성적 이의신청 내용&nbsp;
							---------------------------------------------
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
							<textarea id="textarea" rows="5" cols="" disabled></textarea>
						</div>

						<div class="col-md-12 text-center">
							--------------------------------------
							&nbsp;성적 이의신청 결과에 대한 답변&nbsp;
							--------------------------------------
						</div>

						<div class="col-md-2 text-sm-end">
							신청 결과
						</div>

						<div class="col-md-10">
						<textarea id="textarea2" rows="5" cols=""></textarea>
							<input class="form-check-input" type="radio" id="goCheck1" name="goCheck" value="성적 이의 신청에 대한 성적 정정이 가능합니다.">
							<label class="form-check-label" for="goCheck1">
								성적 이의 신청에 대한 성적 정정이 가능합니다.
							</label>
							<br/>
							<input class="form-check-input" type="radio" id="goCheck2" name="goCheck" value="성적 이의 신청에 대한 성적 정정이 불가합니다.">
							<label class="form-check-label" for="goCheck2">
								성적 이의 신청에 대한 성적 정정이 불가합니다.
							</label>
							<br/>

						</div>

						<div class="col-md-12 text-center">
							<button type="button" class="btn btn-success" id="autoBtn">자동채우기</button>
							<button type="button" id="submit" class="btn btn-primary">저장</button>
							<button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close" id="cancel">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
