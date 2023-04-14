<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="kr.or.ddit.vo.UserVO"%>
<%@page import="org.apache.catalina.Session"%>

<style>

body{
	background-image: linear-gradient(
				        rgba(0.1, 0.3, 0.3, 0.3),
				        rgba(0.1, 0.3, 0.3, 0.3)
				      ),url('/resources/images/대학사진.png');
    height: 100vh;
	width: auto;
	background-size: cover;
	background-attachment: fixed;
}

.sta{
	font-size: 1.1rem;
    color: rgb(105, 108, 255);
    font-weight: bold;
}

</style>

<%
	UserVO userVO = (UserVO)session.getAttribute("userVO");
%>

<script>
var alarmCnt = -1;
localStorage.setItem("alarmCnt", alarmCnt);
$(function(){

	let date = new Date();
	let cur_month = date.getMonth() + 1;

	data = {"month" : cur_month};
	$.ajax({
		url : "/acadCal/getEventText",
		type: "post",
		data : data,
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(result){
			let html = "<hr />";
			    html += "<ul class='list-group list-group-timeline'>"
// 			if(result == null){
// 				html = "<p>일정이 없습니다.</p>";
// 			}
// 			console.log("result : " + JSON.stringify(result));
			$.each(result, function(index, data){
//				    console.log("date" + " : " + value.start);
				html += "<li class='list-group-item list-group-timeline-"+ data.calendar +"'>" + data.start + " : " + data.title + "</li>";
			});
			html += "</ul>";

			$("#detailEvent").append(html);

			$("#cur_month").val(cur_month);

			}
	});

	let idArr = [];
	for (i = 1; i < 13; i++) {
	   let mon = $('button').eq(i).attr('id');
	  if(mon == cur_month){
		  $("button").eq(i).addClass("active");
	  }
	 }

	$("a[aria-label='Sunday']").text('일');
	$("a[aria-label='Monday']").text('월');
	$("a[aria-label='Tuesday']").text('화');
	$("a[aria-label='Wednesday']").text('수');
	$("a[aria-label='Thursday']").text('목');
	$("a[aria-label='Friday']").text('금');
	$("a[aria-label='Saturday']").text('토');

	$(".fc-scroller-liquid-absolute").css("overflow", "hidden");

	// 학과 공지사항 가져오기
	let dpNum = $("#dpNum").val();
	let data2 = {"dpNum" : dpNum};
	$.ajax({
		url : "/dpNotieBoard/dpNoticeList",
		type: "post",
		data : data2,
		dataType : "json",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(result){
			$("#dpList").empty();
			let html = "";
			if(result == null || result.length == 0){
				html += "<tr><td colspan='4'>학과 공지사항이 없습니다.</td></tr>";
			}else{
				$.each(result, function(index, data){
				    html += "<tr>";
				    html += "<td><a href='/dpNotieBoard/detailView?dnNum="+ data.dnNum +"'>" + data.dnTitle + "</a></td>";
					html += "<td>" + data.name + "</td>";

					let dpDt = new Date(data.dnDt);
					let dpYear = dpDt.getFullYear();
					let dpMonth = dpDt.getMonth() + 1;
					let dpDate = dpDt.getDate();
					dpDt = dpYear + "/" + dpMonth + "/" + dpDate;

					html += "<td>" + dpDt + "</td>";
					html += "<td>" + data.dnHit + "</td>";
					html += "</tr>";
				});
			}
			$("#dpList").append(html);
		}
	});

	// 학사 공지사항 가져오기
	$.ajax({
		url : "/acadNotice/mainAcadNoticeList",
		type: "get",
		dataType : "json",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(result){
			$("#acadList").empty();
			let html = "";
			$.each(result, function(index, data){
			    html += "<tr>";
				html += "<td><a href='/acadNotice/detailView?nbNum="+ data.nbNum +"'>" + data.nbTitle + "</a></td>";

				let acadDt = new Date(data.nbDt);
				let acadYear = acadDt.getFullYear();
				let acadMonth = acadDt.getMonth() + 1;
				let acadDate = acadDt.getDate();
				acadDt = acadYear + "/" + acadMonth + "/" + acadDate;

				html += "<td>" + acadDt + "</td>";
				html += "<td>" + data.nbHit + "</td>";
				html += "</tr>";
			});
			$("#acadList").append(html);
		}
	});

	// 교수 시간표 가져오기
	let teaNum = $("#teaNum").val();
	let data3 = {"teaNum" : teaNum};
	$.ajax({
		url : "/study/teaTimetable",
		type: "post",
		data : data3,
		dataType : "json",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(result){
			$.each(result, function(index, data){
				 $("td[id='"+ data.timeTcode +"']").css("background", "#A5E3E6");
				 $("td[id='"+ data.timeTcode +"']").css("font-size", "0.7em");
				 $("td[id='"+ data.timeTcode +"']").css("margin", "0");
				 $("td[id='"+ data.timeTcode +"']").css("padding", "0");

				 let title = data.sbjTitle;
				 if(title.length > 6){
					 title = title.substr(0,4) + "...";
				 }
				 $("td[id='"+ data.timeTcode +"']").text(title);
			});
		}
	});

	// 교수 정보 가져오기
	$.ajax({
		url : "/teacher/mainTeaInfo",
		type: "post",
		data : data3,
		dataType : "json",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(result){
			$("#teaCollDp").text(result.collNm + " " + result.deptNm);
		}
	});

	// 상담신청, 이의신청 개수 가져오기
	$.ajax({
		url : "/teacher/getCount",
		type: "post",
		data : data3,
		dataType : "json",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(result){
			$("#conCount").text(result.OBJC + "건");
			$("#objCount").text(result.RSVT + "건");
		}
	});

});


</script>

<input type="hidden" id="dpNum" value="<%=userVO.getDeptNum() %>" />
<input type="hidden" id="teaNum" value="<%=userVO.getUsername() %>" />

<div class="row">

	<div class="col-md-5">
		<div class="card h-100" style="">
			<div class="card-header p-10 border-bottom">
				<div class="mx-auto mb-3 text-center p-2">
          			<img src="/resources/upload<%=userVO.getPhoto() %>" alt="Avatar Image" class="rounded-circle w-px-100">
        		</div>
        		<div class="text-center">
        			<p style="font-size: 1.2em;"><%=userVO.getName() %>(<%=userVO.getUsername() %>)</p>
        			<p id="teaCollDp"></p>
        		</div>
        		<hr/>
        		<br/>
        		<div class="row text-center">
        			<div class="col-md-4">
        				<p class="h5">
        					<i class='bx bxs-cube'></i>
        					상담신청</p>
        				<p id="conCount" class="sta"></p>
        			</div>
        			<div class="col-md-4">
        				<p class="h5">
        					<i class='bx bxs-cube'></i>
        					성적 이의신청</p>
        				<p id="objCount" class="sta"></p>
        			</div>
        			<div class="col-md-4  text-center">
        				<p class="h5">
        					<i class='bx bxs-cube'></i>
        					장학생 추천 현황</p>
        				<a href="/scholarship/recommendation" type="button" class="btn btn-sm btn-outline-primary">조회하기</a>
        			</div>
        		</div>
        		<br/>
        		<div class="row text-center">
        			<div class="col-md-6">
        				<p class="h5">
        					<i class='bx bx-food-menu'></i>
        					강의개설 신청 현황</p>
        				<a href="/enroll/application" type="button" class="btn btn-sm btn-outline-primary">조회하기</a>
        			</div>
        			<div class="col-md-6">
        				<p class="h5">
	        				<i class='bx bxs-food-menu' ></i>
        					강의평가 현황</p>
        				<a href="/le/leCheck" type="button" class="btn btn-sm btn-outline-primary">조회하기</a>
        			</div>
        		</div>
			</div>
		</div>
	</div>

	<div class="col-md-7">
		<div class="card np-bottom" style="height: 48%;">
			<div class="row card-header p-3">
				<div class="col-md-6 ">
					<h6 style="font-weight: bold;" class="mb-0">
						<i class='bx bxs-flag-alt'></i>
						&nbsp;학과 공지사항
					</h6>
					<small>제목을 클릭하면 해당 글로 이동합니다.</small>
				</div>
				<div class="col-md-6 text-end">
					<a href="/dpNotieBoard/dpNoticeBoardList" type="button" class="btn btn-sm btn-secondary" style="">
						+ 더보기</a>
				</div>
			</div>
			<div class="table-responsive text-nowrap">
			    <table class="table" style="text-align: center;">
			      <thead class="bora">
			        <tr>
			          <th>제목</th>
			          <th>작성자</th>
			          <th>날짜</th>
			          <th>조회수</th>
			        </tr>
			      </thead>
			      <tbody id="dpList" class="table-border-bottom-0">
			      </tbody>
			    </table>
			</div>
		</div>
		<br/>
		<div class="card" style="height: 48%;">
			<div class="row card-header p-3">
				<div class="col-md-6 ">
					<h6 style="font-weight: bold;" class="mb-0">
						<i class='bx bxs-flag-alt'></i>
						&nbsp;학사 공지사항
					</h6>
					<small>제목을 클릭하면 해당 글로 이동합니다.</small>
				</div>
				<div class="col-md-6 text-end">
					<a href="/dpNotieBoard/dpNoticeBoardList" type="button" class="btn btn-sm btn-secondary" style="">
						+ 더보기</a>
				</div>
			</div>
			<div class="table-responsive text-nowrap">
			    <table class="table" style="text-align: center;">
			      <thead class="bora">
			        <tr>
			          <th>제목</th>
			          <th>날짜</th>
			          <th>조회수</th>
			        </tr>
			      </thead>
			      <tbody id="acadList" class="table-border-bottom-0">
			      </tbody>
			    </table>
			</div>
		</div>
	</div>

</div>

<br />

<div class="row">

	<div class="col-md-8">
		<div class="card" style="height: 500px;">
			<div class="row card-header p-4 np-bottom">
				<div class="col-md-5">
					<h6 style="font-weight: bold;"><i class='bx bx-calendar'></i>&nbsp;학사 일정</h6>
				</div>
				<div class="col-md-7 text-end">
					<a href="/acadCal/acadCal" type="button" class="btn btn-sm btn-secondary" style="">
						+ 더보기</a>
				</div>
			</div>
				<div class="card-body">
					<div class="text-center h3" style="font-size: 1.5em; font-weight: bold;">
						2023학년도 04월 학사일정
					</div>
				<div class="row">
					<div class="col-md-5 ms-3 mt-4">
								<table class="table bordered" style="width:40%; text-align: center;">
									<thead style="background-color: #D2D2FF;">
										<tr>
											<th>일</th>
											<th>월</th>
											<th>화</th>
											<th>수</th>
											<th>목</th>
											<th>금</th>
											<th>토</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td>1</td>
										</tr>
										<tr>
											<c:forEach var="i" begin="1" end="7">
											<td>${1 + i}</td>
											</c:forEach>
										</tr>
										<tr>
											<c:forEach var="i" begin="1" end="7">
											<td>${8 + i}</td>
											</c:forEach>
										</tr>
										<tr>
											<c:forEach var="i" begin="1" end="7">
											<td>${15 + i}</td>
											</c:forEach>
										</tr>
										<tr>
											<c:forEach var="i" begin="1" end="7">
											<td>${22 + i}</td>
											</c:forEach>
										</tr>
										<tr>
											<td>30</td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
					</div>

				      <div class="col-md-6 ms-5">
				          <h5 class="card-header" style="padding-bottom: 0px;">상세일정</h5>
				          <div class="card-body" style="width: 115%;">
				          <div class="demo-inline-spacing mt-3" id="detailEvent"></div>
				          </div>
				      </div>
				</div>
				</div>
			</div>
		</div>

	<div class="col-md-4">
		<div class="card" style="height: 500px;">
			<h6 class="card-header" style="font-weight: bold;">
				<i class='bx bx-library'></i>
				현재 학기 시간표</h6>
			<div class="card-body">
				<table class="table table-bordered" style="text-align: center; height: auto;">
					<thead>
					  <tr>
					    <th style="padding-left: 0px; padding-right: 0px;">/</th>
					    <th>월</th>
					    <th>화</th>
					    <th>수</th>
					    <th>목</th>
					    <th>금</th>
					  </tr>
					</thead>
					<tbody>
					  <tr>
					    <th>1교시</th>
					    <td class="timeTable" id="MON1"></td>
					    <td class="timeTable" id="TUE1"></td>
					    <td class="timeTable" id="WEN1"></td>
					    <td class="timeTable" id="THU1"></td>
					    <td class="timeTable" id="FRI1"></td>
					  </tr>
					  <tr>
					    <th>2교시</th>
					    <td class="timeTable" id="MON2"></td>
					    <td class="timeTable" id="TUE2"></td>
					    <td class="timeTable" id="WEN2"></td>
					    <td class="timeTable" id="THU2"></td>
					    <td class="timeTable" id="FRI2"></td>
					  </tr>
					  <tr>
					    <th>3교시</th>
					    <td class="timeTable" id="MON3"></td>
					    <td class="timeTable" id="TUE3"></td>
					    <td class="timeTable" id="WEN3"></td>
					    <td class="timeTable" id="THU3"></td>
					    <td class="timeTable" id="FRI3"></td>
					  </tr>
					  <tr>
					    <th>4교시</th>
					    <td class="timeTable" id="MON4"></td>
					    <td class="timeTable" id="TUE4"></td>
					    <td class="timeTable" id="WEN4"></td>
					    <td class="timeTable" id="THU4"></td>
					    <td class="timeTable" id="FRI4"></td>
					  </tr>
					  <tr>
					    <th>5교시</th>
					    <td class="timeTable" id="MON5"></td>
					    <td class="timeTable" id="TUE5"></td>
					    <td class="timeTable" id="WEN5"></td>
					    <td class="timeTable" id="THU5"></td>
					    <td class="timeTable" id="FRI5"></td>
					  </tr>
					  <tr>
					    <th>6교시</th>
					    <td class="timeTable" id="MON6"></td>
					    <td class="timeTable" id="TUE6"></td>
					    <td class="timeTable" id="WEN6"></td>
					    <td class="timeTable" id="THU6"></td>
					    <td class="timeTable" id="FRI6"></td>
					  </tr>
					  <tr>
					    <th>7교시</th>
					    <td class="timeTable" id="MON7"></td>
					    <td class="timeTable" id="TUE7"></td>
					    <td class="timeTable" id="WEN7"></td>
					    <td class="timeTable" id="THU7"></td>
					    <td class="timeTable" id="FRI7"></td>
					  </tr>
					  <tr>
					    <th>8교시</th>
					    <td class="timeTable" id="MON8"></td>
					    <td class="timeTable" id="TUE8"></td>
					    <td class="timeTable" id="WEN8"></td>
					    <td class="timeTable" id="THU8"></td>
					    <td class="timeTable" id="FRI8"></td>
					  </tr>
					  <tr>
					    <th>9교시</th>
					    <td class="timeTable" id="MON9"></td>
					    <td class="timeTable" id="TUE9"></td>
					    <td class="timeTable" id="WEN9"></td>
					    <td class="timeTable" id="THU9"></td>
					    <td class="timeTable" id="FRI9"></td>
					  </tr>
					</tbody>
				</table>

			</div>
		</div>
	</div>

</div>

<br /><br />
