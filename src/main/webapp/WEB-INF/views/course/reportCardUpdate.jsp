<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
.categoryBar{
	color: gray;
}
.si_target{
	width: 60%;
	text-align: center;
}
thead{
	text-align: center;
}
.btnWrite{
	width: auto;
}
.div-header{
	margin: 5px;
}
#gradeForm .infoDiv{
	margin-top: 10px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(function(){
	var sbjNum = "";	//해당 과목번호
	var stuNum = "";	//해당 학번
	var stuNmKor = "";	//해당 학생의 한글이름
	var deptNm = "";	//학과명
	var sbjTitle = "";	//과목명

	var attScore = ""; //출석점수
	var mtest = "";		//중간점수
	var ftest = "";		//기말점수
	var hw = "";		//과제점수
	var etc = "";		//기타점수
	var fscore = "";	//총점
	var avgFscore = ""; //보내야 하는 학점 (ex 4.5)
	var rcNum = "";
	$("#autoButton").on("click",function(){
		mtest = Math.floor(Math.random() * 30);
		ftest = Math.floor(Math.random() * 30);
		hw = Math.floor(Math.random() * 20);
		etc = 0;
		$("#mtest").val(mtest);
		$("#ftest").val(ftest);
		$("#hw").val(hw);
		$("#etc").val(etc);
		fscore = parseInt(attScore) + parseInt(mtest) + parseInt(ftest) + parseInt(hw) + parseInt(etc) ;
		$("#fscore").val(fscore);


		if(fscore >=95){
			avgFscore="4.5";
		}else if(fscore>=90 && fscore<=94){
			avgFscore="4.0";
		}else if(fscore>=85 && fscore<=89){
			avgFscore="3.5";
		}else if(fscore>=80 && fscore<=84){
			avgFscore="3.0";
		}else if(fscore>=75 && fscore<=89){
			avgFscore="2.5";
		}else if(fscore>=70 && fscore<=84){
			avgFscore="2.0";
		}else if(fscore>=65 && fscore<=69){
			avgFscore="1.5";
		}else if(fscore>=60 && fscore<=64){
			avgFscore="1.0";
		}else{
			avgFscore="0.0";
		}
	})//#autoButton 끝



	$("#insertGrade").on("click",function(){
		var arr = ["attscore","mtest","ftest","hw","etc"];
		//모달창에 학생의 상세정보 입력
		$("#stuNumGrade").val($("#stuNum").text());
		$("#stuNmKorGrade").val($("#stuNmKor").text());
		$("#deptNmGrade").val($("#deptNm").text());

		stuNum = $("#stuNum").text();
		stuNmKor = $("#stuNmKor").text();
		deptNm = $("#deptNm").text();
		sbjNum = $("#sbjNum").text();
		sbjTitle = $("#sbjTitle").text();
		let data = {"sbjNum" : $("#sbjTitle").text() , "stuNum" : stuNum};

		$.ajax({
	  		url : "/course/getReportScore",
	  		contentType : 'application/json;charset=utf-8',
	  		dataType : "json",
	  		type : "post",
	  		data : JSON.stringify(data),
	  		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
					// studentVO
					// /resources/images/login.jpg
					// stuPic
					for(var j =0; j<result.getCourseInfo.length; j++){
						var ppp = "";

						if(result.getCourseInfo[j].goList == "출석"){
							ppp = "attscore";
						}else if(result.getCourseInfo[j].goList == "중간"){
							ppp = "mtest";
						}else if(result.getCourseInfo[j].goList == "기말"){
							ppp = "ftest";
						}else if(result.getCourseInfo[j].goList == "과제"){
							ppp = "hw";
						}else if(result.getCourseInfo[j].goList == "기타"){
							ppp = "etc";
						}

						for(let i = 0; i < arr.length; i++){
							if (arr[i] === ppp) {
								arr.splice(i, 1);
						        i--;
						    }
						}
					}

				$("#stuPic").attr("src" , "/resources/upload"+result.studentVO.stuPic);

				for(var i =0; i<arr.length; i++){
					$("#"+arr[i]).prop("readonly",true);
					$("#"+arr[i]).css("background","#A4A4A4");
				}

					$('#fscore').prop("readonly",true);

					$("#attscore").val(result.getCourseInfo[0].rcAttscore);
					$("#mtest").val(result.getCourseInfo[0].rcMtest);
					$("#ftest").val(result.getCourseInfo[0].rcFtest);
					$("#hw").val(result.getCourseInfo[0].rcHw);
					$("#etc").val(result.getCourseInfo[0].rcEtc);
					$("#fscore").val(result.getCourseInfo[0].rcFscore);

					$("#addNewModal").modal("show");

			}
		})//ajax끝
	})//#addNewModal 끝


	$("#submit").on("click",function(){
		//attscore(출석)20
		//mtest(중간)30
		//ftest(기말)30
		//hw(숙제)20
		//etc(기타)0
		//fscore(최종)

		var attscore = parseInt($("#attscore").val());
		var mtest = parseInt($("#mtest").val());
		var ftest = parseInt($("#ftest").val());
		var hw = parseInt($("#hw").val());
		var etc = parseInt($("#etc").val());
		var fscore = parseInt($("#fscore").val());

		if((attscore) >20){
			Swal.fire({
				title: '출석점수는 <br/>20점이 넘을수 없습니다.',
				showClass: {
					popup: 'animate__animated animate__bounceIn'
				},
				icon: 'warning',
				customClass: {
					confirmButton: 'btn btn-primary'
				},
				buttonsStyling: false
			});
			return false;
		}
		if((mtest) >30){
			Swal.fire({
				title: '중간점수는 <br/>30점이 넘을수 없습니다.',
				showClass: {
					popup: 'animate__animated animate__bounceIn'
				},
				icon: 'warning',
				customClass: {
					confirmButton: 'btn btn-primary'
				},
				buttonsStyling: false
			});
			return false;
		}
		if((ftest) >30){
			Swal.fire({
				title: '기말점수는 <br/>30점이 넘을수 없습니다.',
				showClass: {
					popup: 'animate__animated animate__bounceIn'
				},
				icon: 'warning',
				customClass: {
					confirmButton: 'btn btn-primary'
				},
				buttonsStyling: false
			});
			return false;
		}
		if((hw) >30){
			Swal.fire({
				title: '기타점수는 <br/>20점이 넘을수 없습니다.',
				showClass: {
					popup: 'animate__animated animate__bounceIn'
				},
				icon: 'warning',
				customClass: {
					confirmButton: 'btn btn-primary'
				},
				buttonsStyling: false
			});
			return false;
		}


		$("#fscore").val(attscore+mtest+ftest+hw+etc);
		let data2 = {
						"sbjTitle" : $("#sbjTitle").text(),
						"stuNum" : stuNum
					};

		$.ajax({
	  		url : "/course/getRcNum2",
	  		contentType : 'application/json;charset=utf-8',
	  		dataType : "json",
	  		type : "post",
	  		data : JSON.stringify(data2),
	  		async : false,
	  		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
				rcNum = result.rcNum;
			}
		})//ajax끝



		let data = {
			"rcNum" : rcNum,
			"sbjTitle" :$("#sbjTitle").text(),
			"stuNum" : stuNum ,
			"attScore" : $("#attscore").val(),
			"mtest" : $("#mtest").val(),
			"ftest" : $("#ftest").val(),
			"hw" : $("#hw").val(),
			"etc" : $("#etc").val(),
			"fscore" : $("#fscore").val()
		};

		$.ajax({
	  		url : "/course/insertReportCardAndCsfscore2",
	  		contentType : 'application/json;charset=utf-8',
	  		dataType : "json",
	  		type : "post",
	  		data : JSON.stringify(data),
	  		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
				if(result.reportCardResult>0){
					Swal.fire({
						title: '성적 업데이트를 성공적으로 완료하였습니다.',
						showClass: {
							popup: 'animate__animated animate__bounceIn'
						},
						icon: 'success',
						customClass: {
							confirmButton: 'btn btn-primary'
						},
						buttonsStyling: false
					});
					window.location="/grade/gradeObjcCheck";
				}

			}
		})//ajax끝 */

	})//submit끝
})
</script>
<nav class="navbar navbar-expand-lg bg-white">
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="navbar-ex-6">
			<div class="navbar-nav me-auto">
				<a class="nav-item nav-link" href="javascript:void(0)">주차</a>
				<a class="nav-item nav-link" href="javascript:void(0)">학생목록</a>
				<a class="nav-item nav-link" href="javascript:void(0)">공지</a>
				<a class="nav-item nav-link" href="javascript:void(0)">출석</a>
				<a class="nav-item nav-link" href="javascript:void(0)">과제</a>
				<a class="nav-item nav-link" href="javascript:void(0)">자료</a>
				<a class="nav-item nav-link active" href="javascript:void(0)">성적</a>
			</div>
		</div>
	</div>
</nav>
<br />

<h5 class="title">
	<a href="#" class="categoryBar">메인</a>&nbsp;/&nbsp;<a href="#" class="categoryBar">강의목록</a>
	&nbsp;/&nbsp;<a href="#" id="sbjTitle" class="categoryBar">${getSubjectInfo}</a><!--해당 강의명 -->
</h5>

<div class="card">
	<table class="table table-bordered">
		<thead class="table-active">
			<tr class="text-nowrap">
				<th>번호</th>
				<th>학번</th>
				<th>이름</th>
				<th>학과</th>
				<th>연락처</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="courseVO" items="${getCourseListInfo}" varStatus="stat">
					<tr>
						<th scope="row">${courseVO.rnum}</th>
						<td id="sbjNum" style="display : none;">${sbjNum}</td>
						<td id="stuNum">${courseVO.stuNum}</td>
						<td id="stuNmKor">${courseVO.stuNmKor}</td>
						<td id="deptNm">${courseVO.deptNm}</td>
						<td>${courseVO.stuPn}</td>
						<td>
							<!-- 	data-bs-toggle="modal" data-bs-target="#addNewModal" -->
							<button type="button" id="insertGrade" data-bs-toggle="modal" data-bs-target="#addNewModal" class="btn btn-label-primary btnWrite">성적 변경</button>
							<!-- <button type="button" class="btn btn-label-primary btnWrite">성적 입력</button> -->
						</td>
					</tr>
				</c:forEach>
		</tbody>
	</table>

	<div class="card-footer">
		<div class="demo-inline-spacing">
			<nav class="paging" aria-label="Page navigation">
				<ul class="pagination justify-content-center">
					<li class="page-item first">
						<a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-left"></i></a>
					</li>
					<li class="page-item prev">
						<a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevron-left"></i></a>
					</li>
					<li class="page-item">
						<a class="page-link" href="javascript:void(0);">1</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="javascript:void(0);">2</a>
					</li>
					<li class="page-item active">
						<a class="page-link" href="javascript:void(0);">3</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="javascript:void(0);">4</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="javascript:void(0);">5</a>
					</li>
					<li class="page-item next">
						<a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevron-right"></i></a>
					</li>
					<li class="page-item last">
						<a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-right"></i></a>
					</li>
				</ul>
			</nav>
		</div>
	</div>

</div>

<div class="modal fade" id="addNewModal" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered1 modal-simple modal-add-new-cc">
		<div class="modal-content p-3 p-md-5">
			<div class="modal-body">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				<form id="gradeForm">
					<div class="row g-3">
						<div class="col-md-5">
							<img id="stuPic" alt="login.jpg" src="" style="width: 100%; height: auto;" />
							<!-- <img id="stuPic" alt="login.jpg" src="/resources/images/login.jpg" style="width: 100%; height: auto;" /> -->
						</div>
						<div class="col-md-7">
							<div class="row infoDiv">
								<label class="col-sm-3 col-form-label text-sm-end" for="stuNum">학번</label>
								<div class="col-sm-9">
									<input type="text" id="stuNumGrade" class="form-control" readonly>
								</div>
							</div>
							<div class="row infoDiv">
								<label class="col-sm-3 col-form-label text-sm-end" for="stuNmKor">이름</label>
								<div class="col-sm-9">
									<input type="text" id="stuNmKorGrade" class="form-control" readonly>
								</div>
							</div>
							<div class="row infoDiv">
								<label class="col-sm-3 col-form-label text-sm-end" for="deptNum">학과</label>
								<div class="col-sm-9">
									<input type="text" id="deptNmGrade" class="form-control" readonly>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-3 col-form-label text-sm-end" for="attscore">출석</label>
								<div class="col-sm-9">
									<input type="text" id="attscore" class="form-control" />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-3 col-form-label text-sm-end" for="mtest">중간</label>
								<div class="col-sm-9">
									<input type="text" id="mtest" class="form-control" />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-3 col-form-label text-sm-end" for="ftest">기말</label>
								<div class="col-sm-9">
									<input type="text" id="ftest" class="form-control" />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-3 col-form-label text-sm-end" for="hw">과제</label>
								<div class="col-sm-9">
									<input type="text" id="hw" class="form-control" />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-3 col-form-label text-sm-end" for="etc">기타</label>
								<div class="col-sm-9">
									<input type="text" id="etc" class="form-control" />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-3 col-form-label text-sm-end" for="fscore">총점</label>
								<div class="col-sm-9">
									<input type="text" id="fscore" class="form-control" />
								</div>
							</div>
						</div>
						<div class="col-md-12 text-center">
							<button type="button" id="submit" class="btn btn-primary me-sm-3 me-1">등록</button>
							<button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
