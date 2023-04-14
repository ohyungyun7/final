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

<script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>
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

	// 교직원 정보 가져오기
	let admNum = $("#admNum").val();
	let data2 = {"admNum" : admNum};
	$.ajax({
		url : "/admin/mainAdmInfo",
		type: "post",
		data : data2,
		dataType : "json",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(result){
			$("#admDp").text(result.empGroup + " " + result.empDp);
		}
	});
});

	$.ajax({
		url : "/admin/mainInfo",
		type: "post",
		dataType : "json",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(result){
			$("#allStu").text(result.ALLSTU + "명");
			$("#newStu").text("신입생 : " + result.NEWSTU + "명");
			$("#oldStu").text("재학생 : " + (result.ALLSTU - result.NEWSTU) + "명");

			$("#allEmp").text((result.TEA + result.ADM) + "명");
			$("#tea").text("교수 : " + result.TEA + "명");
			$("#emp").text("교직원 : " + result.ADM + "명");

			$("#allDp").text(result.DP + "개");
			$("#allColl").text("단과대 수 : " + result.COLL + "개");
			$("#allRoom").text("강의실 수 : " + result.ROOM + "개");

		}
	});


</script>



<input type="hidden" id="admNum" value="<%=userVO.getUsername() %>" />

<div class="row">

	<div class="col-md-5">
		<div class="card" style="height: 555px;">
			<div class="card-body">
				<div class="mx-auto mb-3 text-center">
          			<img src="/resources/upload<%=userVO.getPhoto() %>" alt="Avatar Image" class="rounded-circle w-px-100">
        		</div>
        		<div class="text-center">
        			<p style="font-size: 1.2em;"><%=userVO.getName() %>(<%=userVO.getUsername() %>)</p>
        			<p id="admDp"></p>
        		</div>
        		<hr/>
        		<br/><br/>
        		<div class="row text-center">
        			<div class="col-md-4">
        				<p style="font-size: 1.0em; font-weight: bold;">
        					<i class='bx bxs-cube'></i>
        					학적변동 신청</p>
        				<p class="sta">1건</p>
        			</div>
        			<div class="col-md-4">
        				<p style="font-size: 1.0em; font-weight: bold;">
        					<i class='bx bxs-cube'></i>
        					강의개설 신청</p>
        				<p class="sta">3건</p>
        			</div>
        			<div class="col-md-4  text-center">
        				<p style="font-size: 1.0em; font-weight: bold;">
        					<i class='bx bxs-cube'></i>
        					장학생 추천</p>
        					<p class="sta">0건</p>
        			</div>
        		</div>
        		<br/>
        		<div class="row text-center">
        			<div class="col-md-6">
        				<p style="font-size: 1.0em; font-weight: bold;">
        					<i class='bx bx-food-menu'></i>
        					스터티 신고</p>
        				<p class="sta">0건</p>
        			</div>
        			<div class="col-md-6">
        				<p style="font-size: 1.0em; font-weight: bold;">
	        				<i class='bx bxs-buildings'></i>
        					시설 건의</p>
        					<p class="sta">0건</p>
        			</div>
        		</div>
			</div>
		</div>
	</div>

	<div class="col-md-7">
		<div class="row">

		   <div class="col-lg-4">
			<div class="card" style="height: 260px;">
				<div class="card-body">
				  <div class="card-title d-flex align-items-start justify-content-between">
				    <div class="avatar flex-shrink-0">
				      <img src="/resources/sneat/assets/img/icons/unicons/paypal.png" alt="Credit Card" class="rounded">
				    </div>
				    <div class="dropdown">
				      <button class="btn p-0" type="button" id="cardOpt6" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				        <i class="bx bx-dots-vertical-rounded"></i>
				      </button>
				      <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt6">
				        <a class="dropdown-item" href="javascript:void(0);">더보기</a>
				      </div>
				    </div>
				  </div>
				  <span style="font-weight: bold;">현재 총 학생수</span>
				  <h2 class="card-title text-nowrap mb-1" id="allStu"></h2><br/>
				  <p id="newStu"></p>
				  <p id="oldStu"></p>
				</div>
			</div>
		   </div>
		   <div class="col-lg-4">
			<div class="card" style="height: 260px;">
				<div class="card-body">
				  <div class="card-title d-flex align-items-start justify-content-between">
				    <div class="avatar flex-shrink-0">
				      <span class="badge bg-label-success rounded p-2">
				        <i class="bx bx-user bx-sm"></i>
				      </span>
				    </div>
				    <div class="dropdown">
				      <button class="btn p-0" type="button" id="cardOpt6" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				        <i class="bx bx-dots-vertical-rounded"></i>
				      </button>
				      <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt6">
				        <a class="dropdown-item" href="javascript:void(0);">더보기</a>
				      </div>
				    </div>
				  </div>
				  <span style="font-weight: bold;">현재 총 교직원수</span>
				  <h2 id="allEmp" class="card-title text-nowrap mb-1"></h2><br/>
				  <p id="tea"></p>
				  <p id="emp"></p>
				</div>
			</div>
		   </div>
		   <div class="col-lg-4">
			<div class="card" style="height: 260px;">
				<div class="card-body">
				  <div class="card-title d-flex align-items-start justify-content-between">
				    <div class="avatar flex-shrink-0">
					  <span class="avatar-initial rounded bg-label-info"><i class="bx bx-home-alt"></i></span>
				    </div>
				    <div class="dropdown">
				      <button class="btn p-0" type="button" id="cardOpt6" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				        <i class="bx bx-dots-vertical-rounded"></i>
				      </button>
				      <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt6">
				        <a class="dropdown-item" href="javascript:void(0);">더보기</a>
				      </div>
				    </div>
				  </div>
				  <span style="font-weight: bold;">현재 총 학과수</span>
				  <h2 id="allDp" class="card-title text-nowrap mb-1">341개</h2><br/>
				  <p id="allColl"> 단과대 수 : 12개</p>
				  <p id="allRoom"> 강의실 수 : 12개</p>
				</div>
			</div>
		   </div>


		</div>
		<br />
		<div class="card" style="height: 270px;">
			<div class="row">
				<div class="col-md-5 card-header">
					<h6 style="font-weight: bold;"><i class='bx bxs-flag-alt'></i>학사 공지사항</h6>
				</div>
				<div class="col-md-7">
					<a href="/acadNotice/list" type="button" class="btn btn-sm btn-secondary" style="margin-left: 78%; margin-top: 5%;">
						+ 더보기</a>
				</div>
			</div>
			<div class="table-responsive text-nowrap">
			    <table class="table" style="text-align: center;">
			      <thead>
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
		<div class="card" style="height: 480px;">
			<div class="row">
				<div class="col-md-5 card-header">
					<h6 style="font-weight: bold;"><i class='bx bx-calendar'></i>&nbsp;학사 일정</h6>
				</div>
				<div class="col-md-7">
					<a href="/acadCal/acadCal" type="button" class="btn btn-sm btn-secondary" style="margin-left: 78%; margin-top: 5%;">
						+ 더보기</a>
				</div>
			</div>
				<div class="text-center" style="margin-bottom: 20px; font-size: 1.5em; font-weight: bold;">2023학년도 04월 학사일정</div>
				<div class="card">
				<div class="row">
					<div class="col-md-6 col-10 ms-3 mt-4">
								<table class="table bordered" style="margin-left:10px; width:80%; text-align: center;">
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
				      <div class="col-md-5 col-12">
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
		<div class="card" style="height: 510px;">
		<h6 class="card-header" style="font-weight: bold;"><i class='bx bx-won'></i>등록금 납부 현황</h6>
		<div class="card-body">
			<canvas id="myChart" width="400" height="420"></canvas>
		</div>
		</div>
	</div>

</div>

<br/><br/>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript">

			let sum_19, sum_20, sum_21, sum_22, sum_23;
			$.ajax({
				url : "/admin/statistics",
				type: "get",
				dataType : "json",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
			        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result){
					sum_19 = result[0].SUM;
					sum_20 = result[1].SUM;
					sum_21 = result[2].SUM;
					sum_22 = result[3].SUM;
					sum_23 = result[4].SUM;
		            var context = document
		                .getElementById('myChart')
		                .getContext('2d');
		            var myChart = new Chart(context, {
		                type: 'bar', // 차트의 형태
		                data: { // 차트에 들어갈 데이터
		                    labels: [
		                        //x 축
		                        '2019년','2020년','2021년','2022년','2023년'
		                    ],
		                    datasets: [
		                        { //데이터
		//                             label: '등록금 내역 현황', //차트 제목
		                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
		                            data: [
		                            	sum_19, sum_20, sum_21, sum_22, sum_23 //x축 label에 대응되는 데이터 값
		                            ],
		                            backgroundColor: [
		                                //색상
		                                'rgba(255, 99, 132, 0.2)',
		                                'rgba(54, 162, 235, 0.2)',
		                                'rgba(255, 206, 86, 0.2)',
		                                'rgba(75, 192, 192, 0.2)',
		                                'rgba(153, 102, 255, 0.2)',
		                                'rgba(255, 159, 64, 0.2)'
		                            ],
		                            borderColor: [
		                                //경계선 색상
		                                'rgba(255, 99, 132, 1)',
		                                'rgba(54, 162, 235, 1)',
		                                'rgba(255, 206, 86, 1)',
		                                'rgba(75, 192, 192, 1)',
		                                'rgba(153, 102, 255, 1)',
		                                'rgba(255, 159, 64, 1)'
		                            ],
		                            borderWidth: 1 //경계선 굵기
		                        }/* ,
		                        {
		                            label: 'test2',
		                            fill: false,
		                            data: [
		                                8, 34, 12, 24
		                            ],
		                            backgroundColor: 'rgb(157, 109, 12)',
		                            borderColor: 'rgb(157, 109, 12)'
		                        } */
		                    ]
		                },
		                options: {
		            	    legend: {
		            	        	display: false
		            	    },
		                    scales: {
		                        yAxes: [
		                            {
		                                ticks: {
		                                    beginAtZero: true
		                                }
		                            }
		                        ]
		                    }
		                }
		            });
				}
			});


        </script>

