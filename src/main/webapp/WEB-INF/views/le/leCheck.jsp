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
tr td {
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
.border-box{
	border: 1px solid lightgray;
	border-radius: 5px;
}
textarea{
	resize: none;
	width: 100%;
	maxlength: 100;
}
.modal-row{
	margin-bottom: 10px;
}
</style>

<script>
$(function(){
	$(".abc").on("click",function(){
		var sbjNum =  $(this).data("sbj-num");
		var checkPeople = $(this).text();//총인원
		$("#checkPeople").text(checkPeople);
		let data = {"sbjNum" : sbjNum};

		//몇번 항목에 몇명과 몇명이 했는지 가져오기!
		$.ajax({
	  		url : "/le/getRatioLecture",
	  		contentType : 'application/json;charset=utf-8',
	  		dataType : "json",
	  		type : "post",
	  		async:false,
	  		data : JSON.stringify(data),
	  		 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
				//"#append"
				$("#append").empty();
				var ques = [1,2,3,4,5];
				var str = "";
				var count = 0;

				ques.push(result.getRatioLecture[0].lelContent);
				ques.push(result.getRatioLecture[5].lelContent);
				ques.push(result.getRatioLecture[10].lelContent);
				ques.push(result.getRatioLecture[15].lelContent);
				ques.push(result.getRatioLecture[20].lelContent);

				 for(var i=0; i<result.getRatioLecture.length; i++){
					if(i%5==0){
						count++;
						str+="<div class='col-12'><h5>"+count+". "+result.getRatioLecture[i].lelContent+"</h5></div>";
					}
					str+="<div class='col-md-12'>";
					str+=	"<div class='row container'>";
					str+=		"<div class='col-md-6'>"+result.getRatioLecture[i].raAnswer+"</div>";
					str+=		"<div class='col-md-6'>"+result.getRatioLecture[i].count+"명   "+Math.floor((parseInt(result.getRatioLecture[i].count)/parseInt(checkPeople))*100)+"%</div>";
					str+=	"</div>";
					str+=	"<br>";
					str+="</div>";
				}
				 var str2 = "";
				 for(var j=0; j<result.replyAnswer.length; j++){
					 str2+=result.replyAnswer[j].leRePLY+"\n";
				 }

				$("#append").html(str);
				$("#textarea").val(str2);

			}
		})//ajax끝 */

		$("#le_check").modal('show');
	})


})
</script>

  <h4 class="title fw-bold py-3 mb-2 categoryBar">
   <i class="bx bxs-graduation page-icon"></i>
   <span style="font-weight: normal;">성적조회 / </span>강의평가조회
</h4>
<div class="card">
	<div class="div-header">
		<button type="button" style="display : none;" class="btn btn-label-primary btnWrite">조회</button>
	</div>

	<div class="container">
		<div class="card innerCard">
			<div class="row g-3">
				 <div class="col-md-6">
					<div class="row infoDiv" style="display : none;">
						<label class="col-sm-2 col-form-label text-sm-end" for="year">연도</label>
						<select id="year" class="col-sm-4 form-select search-sel year" aria-label="Default select example">
							<option value="2023" selected>2023</option>
							<option value="2022">2022</option>
							<option value="2022">2022</option>
						</select>
						<label class="col-sm-2 col-form-label text-sm-end" for="semester">학기</label>
						<select id="semester" class="col-sm-4 form-select search-sel semester" aria-label="Default select example">
							<option value="1">1</option>
							<option value="2">2</option>
						</select>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row infoDiv">
						<label class="col-sm-3 col-form-label text-sm-end">사번/성명</label>
						<div class="col-sm-4">
							<input type="text" id="teaNum" class="form-control" value="${teaVO.teaNum}" readonly>
						</div>
						<div class="col-sm-4">
							<input type="text" id="teaNmKor" class="form-control" value="${teaVO.teaNmKor}" readonly>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="border-box">
			<table class="table table-bordered">
				<thead class="table-active">
					<tr class="text-nowrap">
						<th  style="width:300px;">과목코드</th>
						<th style="width:400px;">전공유무</th>
						<th style="width:400px;">교과목명</th>
						<th style="width:400px;">과목학년</th>
						<th style="width:400px;">과목학점</th>
						<th style="width:400px;">평가 인원</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="subjectVO" items="${data}" varStatus="stat">
						<tr>
						<!-- <tr data-bs-toggle="modal" data-bs-target="#le_check"> -->
							<td>${subjectVO.sbjNum}</td>
							<c:if test="${subjectVO.sbjRs eq 1}">
								<td>필수</td>
							</c:if>
							<c:if test="${subjectVO.sbjRs eq 2}">
								<td>선택</td>
							</c:if>
							<td>${subjectVO.sbjTitle}</td>
							<td>${subjectVO.sbjGrade}학년</td>
							<td>${subjectVO.sbjRecode}학점</td>
							<td><a class="abc" href="#" data-sbj-num="${subjectVO.sbjNum}">${subjectVO.count}명</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

<!-- 		<div class="card-footer">
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
		</div> -->
	</div>

</div>

<div class="modal fade" id="le_check" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-simple modal-edit-user">
		<div class="modal-content p-3 p-md-5">
			<div class="modal-body">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				<div class="text-left mb-4">
					<h3 style="display: inline-block;">강의평가(참여인원 : <span style="font-size: 30px;" id="checkPeople"></span>)</h3>
				</div>
				<hr />
				 <div class="row g-1">
				 	<div class="row modal-row" id="append">

					</div>
					<div class="row modal-row">
	 					<div class="col-12">
							6.교수님께 하고싶은말
						</div>
						<div class="col-md-12">
							<textarea id="textarea" rows="5" cols="" readonly style="overflow-y:scroll; overlow-x:scroll;"></textarea>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>