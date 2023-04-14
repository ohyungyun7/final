<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/js/jquery-3.6.0.js"></script>
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
.left-container{
	width: 40%;
	float: left;
	margin: 10px;
}
.right-container{
	width: 55%;
	float: right;
	margin: 10px;
}
.border-box{
	border: 1px solid lightgray;
	border-radius: 5px;
}
textarea{
	resize: none;
	width: 100%;
	maxlength: 100;
}
</style>
<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bxs-report page-icon"></i>
	<span style="font-weight: normal;">성적조회 / </span>강의평가
</h4>

<form action="" method="post">
<div class="card">

	<div class="div-header">
		<!-- <button type="button" id="search" class="btn btn-label-primary btnWrite">조회</button> -->
		<button type="button" id="submit" class="btn btn-label-primary btnWrite">저장</button>
	</div>

	<div class="container">
		<div class="card innerCard">
			<div class="row g-3">
				<div class="col-md-6">
					<div class="row infoDiv" style="display : none;">
						<label class="col-sm-2 col-form-label text-sm-end" for="year">연도</label>
							<select id="year" class="col-sm-4 form-select search-sel year" aria-label="Default select example">
								<!-- <option value="2023" selected>2023</option>
								<option value="2022">2022</option>
								<option value="2022">2022</option> -->
							</select>
						<label class="col-sm-2 col-form-label text-sm-end" for="semester">학기</label>
						<select id="semester" class="col-sm-4 form-select search-sel semester" aria-label="Default select example">
							<option value="01">1</option>
							<option value="02">2</option>
						</select>
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

	<div class="card-body">
		<div class="left-container">
		<h5 class="title categoryBar">수강신청 강좌 목록</h5>
			<div class="border-box">
				<table class="table table-bordered">
					<thead class="table-active">
						<tr class="text-nowrap">
							<th class="si_target">교과목명</th>
							<th>담당교수</th>
							<th>강의평가<br/>여부</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<c:forEach var="lectureEvaVO" items="${data}" varStatus="stat">
							<tr class="subject">
								<td id="sbjNum" style="display : none;">${lectureEvaVO.sbjNum}</td>
								<td id="sbjTitle">${lectureEvaVO.sbjTitle}</td>
								<td>${lectureEvaVO.teaNmKor}</td>
								<c:if test="${lectureEvaVO.count < 1}">
									<td><a href="#"  class="counts">X</a></td>
								</c:if>
								<c:if test="${lectureEvaVO.count > 0}">
									<td><a href="#"  class="counts">O</a></td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<div class="right-container" style="display: none">
			<h5 class="title categoryBar">객관식 문항 [총 5건]&nbsp;&nbsp;<span id="teaName" style="font-weight: bold;"></span></h5>
			<div class="border-box">
				<table class="table table-bordered" style="table-layout: fixed; width: 100%; table-layout: fixed;">
					<thead class="table-active">
						<tr class="text-nowrap">
							<th class="si_target">평가 문항</th>
							<th style="padding: 0px;">전혀<br/>아니다</th>
							<th style="padding: 0px;">대체로<br/>아니다</th>
							<th style="padding: 0px;">보통이다</th>
							<th style="padding: 0px;">대체로<br/>그렇다</th>
							<th style="padding: 0px;">매우<br/>그렇다</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><span id="1">1</span>. 교수님은 강의 계획안에 나타난 강의목표를 충족시켰다</td>
							<td><input name="1" type="radio" value="5"></td>
							<td><input name="1" type="radio" value="4"></td>
							<td><input name="1" type="radio" value="3"></td>
							<td><input name="1" type="radio" value="2"></td>
							<td><input name="1" type="radio" value="1"></td>
						</tr>
						<tr>
							<td><span id="2">2</span>. 교수님은 강의 계획안에 나타난 강의목표를 충족시켰다</td>
							<td><input name="2" type="radio" value="5"></td>
							<td><input name="2" type="radio" value="4"></td>
							<td><input name="2" type="radio" value="3"></td>
							<td><input name="2" type="radio" value="2"></td>
							<td><input name="2" type="radio" value="1"></td>
						</tr>
						<tr>
							<td><span id="3">3</span>. 교수님의 설명은 명확하고 이해하기 쉬웠다</td>
							<td><input name="3" type="radio" value="5"></td>
							<td><input name="3" type="radio" value="4"></td>
							<td><input name="3" type="radio" value="3"></td>
							<td><input name="3" type="radio" value="2"></td>
							<td><input name="3" type="radio" value="1"></td>
						</tr>
						<tr>
							<td><span id="4">4</span>. 교수님은 강의 준비를 철저히 하였으며 열의를 가지고 강의를 하였다</td>
							<td><input name="4" type="radio" value="5"></td>
							<td><input name="4" type="radio" value="4"></td>
							<td><input name="4" type="radio" value="3"></td>
							<td><input name="4" type="radio" value="2"></td>
							<td><input name="4" type="radio" value="1"></td>
						</tr>
						<tr>
							<td><span id="5">5</span>. 교수님은 이 분야에 관한 나의 학습 동기를 높였다</td>
							<td><input name="5" type="radio" value="5"></td>
							<td><input name="5" type="radio" value="4"></td>
							<td><input name="5" type="radio" value="3"></td>
							<td><input name="5" type="radio" value="2"></td>
							<td><input name="5" type="radio" value="1"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<br/>
			<h5 class="title categoryBar"><span id="6" style="display: none;"></span>교수님께 하고싶은 말</h5>
			<textarea id="textarea" name="6" class="border-box" rows="5" cols="84" maxlength="100" placeholder="(100자 이내)"></textarea>
		</div>
	</div>
</div>
</form>
<script>
$(function(){
	var countCheck = 0;

	$(".counts").each(function(i, v){
		if($(v).text() == "O"){
			countCheck++;
		}
	})

	if($(".counts").length == countCheck){
		window.location = "/grade/gradeCheck";
	}

	var clNum = "";
	var sbjNum = "";
	var stuNum = $("#stuNum").val();//학번

	let data = {"stuNum" : stuNum};

	//학생이 수강들은 연도 가져오기
	$.ajax({
  		url : "/le/getStuLecture",
  		contentType : 'application/json;charset=utf-8',
  		dataType : "json",
  		type : "post",
  		async:false,
  		data : JSON.stringify(data),
  		 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(result){
			//myLectureList
			//year
			var str = "";
			str += "<option value=년도>년도</option>"
			for(var i =0; i<result.myLectureList.length; i++){
				var split = result.myLectureList[i].clSemester.split("-");
				if(i%2 == 0){
					str += "<option value="+split[0]+">"+split[0]+"</option>";
				}
			}//for문끝
			$("#year").append(str);
		}
	})//ajax끝

	$(document).on("click","input[type=radio]",function(){
		var answer = $(this).val();//클릭한 값 ex) 매우그렇다, 매우 아니다 등등...
		var queNum = $(this).attr("name");//질문 번호
		var leNum = "";

		////////////// LE_NUM 가져오기 ///////////////
		let data3 = {"sbjNum" : sbjNum , "stuNum" : stuNum, "clNum" : clNum, "lelNum" : queNum};

		$.ajax({
	  		url : "/le/getLeNum",
	  		contentType : 'application/json;charset=utf-8',
	  		dataType : "json",
	  		type : "post",
	  		async:false,
	  		data : JSON.stringify(data3),
	  		 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
				leNum = result.leNum;
			}
		})//ajax끝
		//////////////LE_NUM 가져오기 끝///////////////


		//항목번호     : queNum
		//수강목록번호 :  clNum
		//과목번호     :  sbjNum
		//학생번호     :  stuNum
		//강의평가과목별 답변 : answer


		//////////////  LECTURE_EVA INSERT 시작 /////////
	    let data2 = {"lelNum" : parseInt(queNum),
					 "clNum" : clNum,
					 "sbjNum" : sbjNum,
					 "stuNum" : parseInt(stuNum),
					 "answer" : answer,	//answer이 1,2,3,4,5 대체로그렇다 이런거
					 "leNum" : leNum
					 };
		$.ajax({
	  		url : "/le/insertLecEva",
	  		contentType : 'application/json;charset=utf-8',
	  		dataType : "json",
	  		type : "post",
	  		async:false,
	  		data : JSON.stringify(data2),
	  		 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){

			}
		})//ajax끝 */

})
	$(document).on("click","a",function(){
	//$("a").on("click",function(){
		sbjNum = $(this).parents(".subject").find("#sbjNum").text();

		/////////////// CL_NUM 가져오기 ///////////////////
		let data = {"sbjNum" : sbjNum , "stuNum" : stuNum};
		$.ajax({
	  		url : "/le/getClNum",
	  		contentType : 'application/json;charset=utf-8',
	  		dataType : "json",
	  		type : "post",
	  		async:false,
	  		data : JSON.stringify(data),
	  		 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
				clNum = result.clNum;
			}
		})//ajax끝
		/////////////// CL_NUM 끝 ///////////////////



		if($(this).text() == "O"){
			Swal.fire({
				title: '강의 평가를 변경 할 수 없습니다.',
				showClass: {
					popup: 'animate__animated animate__bounceIn'
				},
				icon: 'error',
				customClass: {
					confirmButton: 'btn btn-primary'
				},
				buttonsStyling: false
			});
		}else if($(this).text() == "X"){
			$("#teaName").text($(this).parent().prev().text()+"교수님");
			for(var i =1; i<=5; i++){
				$("input:radio[name='"+i+"']").prop('checked',false);
			}
			$(".right-container").css("display","block");
		}
	});

	$("#search").on("click",function(){
		let data = {"year" : $("#year").val() , "semester" : $("#semester").val()};

		//학기 선택 후 조회하기
		$.ajax({
	  		url : "/le/searchSemester",
	  		contentType : 'application/json;charset=utf-8',
	  		dataType : "json",
	  		type : "post",
	  		async:false,
	  		data : JSON.stringify(data),
	  		 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
				//stuLectureList2
				$("#tbody").empty();
				var str = "";
				for(var i =0; i<result.stuLectureList2.length; i++){
					str+= "<tr class='subject'>";
					str+= "<td id='sbjNum' style='display : none;'>"+result.stuLectureList2[i].sbjNum+"</td>";
					str+= "<td id='sbjTitle'>"+result.stuLectureList2[i].sbjTitle+"</td>";
					str+= "<td>"+result.stuLectureList2[i].teaNmKor+"</td>";
					if(result.stuLectureList2[i].count<1){
						str+="<td><a href='#'>X</a></td>";
					}else if(result.stuLectureList2[i].count>0){
						str+="<td><a href='#'>O</a></td>";
					}
					str+="</tr>";
				}//for문끝
				$(".right-container").css("display","none");
				$("#textarea").val("");
				$("#tbody").html(str);
			}//success끝
		})//ajax끝
	})//search끝

	$("#submit").on("click",function(){
		var count = 0;
		for(var i =1; i<=5; i++){
			if($("input:radio[name='"+i+"']:checked").length>0){
				count++;
			}
		}
		if(count<5){
			Swal.fire({
				title: '선택하지 않은 문항이 존재합니다.',
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

			////////////// LE_NUM 가져오기 ///////////////
			let data3 = {"sbjNum" : sbjNum,
						 "stuNum" : stuNum,
						 "clNum" : clNum,
						 "lelNum" : $("#textarea").attr("name")
						 };

			$.ajax({
		  		url : "/le/getLeNum",
		  		contentType : 'application/json;charset=utf-8',
		  		dataType : "json",
		  		type : "post",
		  		async:false,
		  		data : JSON.stringify(data3),
		  		 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result){
					leNum = result.leNum;
				}
			})//ajax끝
			//////////////LE_NUM 가져오기 끝///////////////

	    let data2 = {
			 "lelNum" : $("#textarea").attr("name"),	//맞음
			 "clNum" : clNum,							//맞음
			 "sbjNum" : sbjNum,							//맞음
			 "stuNum" : parseInt(stuNum),				//맞음
			 "answer" : $("#textarea").val(),			//이게 LE_REPLY값 들어가야함
			 "leNum" : leNum,							//맞음
			 "raNum" : $("#textarea").attr("name")		//맞음
			 };

		$.ajax({
	  		url : "/le/insertLecEva2",
	  		contentType : 'application/json;charset=utf-8',
	  		dataType : "json",
	  		type : "post",
	  		async:false,
	  		data : JSON.stringify(data2),
	  		 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
				Swal.fire({
					title: '강의평가가 성공적으로 완료되었습니다.',
					showClass: {
						popup: 'animate__animated animate__bounceIn'
					},
					icon: 'success',
					customClass: {
						confirmButton: 'btn btn-primary'
					},
					buttonsStyling: false
				});
				$(".right-container").css("display","none");
				$("#textarea").val("");
				location.reload();
			}
		})//ajax끝 */
	})
})



function reload(){
	let data = {"year" : $("#year").val() , "semester" : $("#semester").val()};
	//학기 선택 후 조회하기
	$.ajax({
  		url : "/le/searchSemester",
  		contentType : 'application/json;charset=utf-8',
  		dataType : "json",
  		type : "post",
  		async:false,
  		data : JSON.stringify(data),
  		 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(result){
			//stuLectureList2
			$("#tbody").empty();
			var str = "";
			for(var i =0; i<result.stuLectureList2.length; i++){
				str+= "<tr class='subject'>";
				str+= "<td id='sbjNum' style='display : none;'>"+result.stuLectureList2[i].sbjNum+"</td>";
				str+= "<td id='sbjTitle'>"+result.stuLectureList2[i].sbjTitle+"</td>";
				str+= "<td>"+result.stuLectureList2[i].teaNmKor+"</td>";
				if(result.stuLectureList2[i].count<1){
					str+="<td><a href='#'>X</a></td>";
				}else if(result.stuLectureList2[i].count>0){
					str+="<td><a href='#'>O</a></td>";
				}
				str+="</tr>";
			}//for문끝

			$("#tbody").html(str);
		}//success끝
	})//ajax끝
}
</script>

