<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="kr.or.ddit.vo.UserVO"%>
<%@page import="kr.or.ddit.vo.StudyVO"%>
<%@page import="org.apache.catalina.Session"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/typeahead-js/typeahead.css" />
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

<script src="../../assets/vendor/js/helpers.js"></script>
<script src="../../assets/vendor/js/template-customizer.js"></script>
<script src="../../assets/js/config.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.36.0/apexcharts.min.js"></script>

<style>

.fc-scroller.fc-scroller-liquid-absolute{
	overflow: hidden;
}

.months{
	margin-left: 30px;
	margin-right: 20px;
	margin-top: 15px;
}

/* .table th{ */
/* 	font-size: 1.0em; */
/* } */

</style>

<script>
const csrfHeaderName = "${_csrf.headerName}";
const csrfToken = "${_csrf.token}";

$(function(){

	let today = new Date();

	let year = today.getFullYear(); // 년도
	let month = today.getMonth() + 1;  // 월
	let week = getWeek(new Date(today)); // 주
	let date = today.getDate();  // 날짜
	let day = today.getDay();  // 요일
	let wfd = date;
	let x = 1 - day;
		x = x * -1;
	wfd = today.getDate() - x;

	$("#tableTitle").text(month + "월 " + week + "번째주");


	let tt = year + "/" + month + "/" + wfd;
		tt = new Date(tt);

	dateArr = [];
	for(let i = 1; i < 7; i++){

		let hm = new Date();
		hm.setDate(tt.getDate() + (i - 1));
		hm = new Date(hm);
		tttMonth = hm.getMonth() + 1;
		tttDate = hm.getDate();

		let ttd;
		if(i == 1){
			ttd = "(월)";
		}else if(i == 2){
			ttd = "(화)";
		}else if(i == 3){
			ttd = "(수)";
		}else if(i == 4){
			ttd = "(목)";
		}else if(i == 5){
			ttd = "(금)";
		}else{
			ttd = "(토)";
		}
		$("th[id='" + i + "']").text(tttMonth + "/" + tttDate + ttd);
		dateArr.push(tttMonth + "/" + tttDate);
	}

	$("#prev").on("click", function(){

		let th1 = $("th[id='1']").text();
		let aaa = year + "/" +  th1;
		aaa = new Date(aaa);


		let ptt = new Date(aaa);
		ptt.setDate(aaa.getDate() - 7);
		ptt = new Date(ptt);

		let pmonth = ptt.getMonth() + 1;  // 월
		let pweek = getWeek(new Date(ptt)); // 주
		$("#tableTitle").text(pmonth + "월 " + pweek + "번째주");

		for(let i = 1; i < 7; i++){

			let ttt = new Date(ptt);
			ttt.setDate(ptt.getDate() + (i - 1));
			ttt = new Date(ttt);

			tttMonth = ttt.getMonth() + 1;
			tttDate = ttt.getDate();

			let ttd;
			if(i == 1){
				ttd = "(월)";
			}else if(i == 2){
				ttd = "(화)";
			}else if(i == 3){
				ttd = "(수)";
			}else if(i == 4){
				ttd = "(목)";
			}else if(i == 5){
				ttd = "(금)";
			}else{
				ttd = "(토)";
			}
			$("th[id='" + i + "']").text(tttMonth + "/" + tttDate + ttd);
		}

	});

	$("#next").on("click", function(){

		let th1 = $("th[id='1']").text();
		let aaa = year + "/" +  th1;
		aaa = new Date(aaa);


		let ptt = new Date(aaa);
		ptt.setDate(aaa.getDate() + 7);

		let nmonth = ptt.getMonth() + 1;  // 월
		let nweek = getWeek(new Date(ptt)); // 주
		$("#tableTitle").text(nmonth + "월 " + nweek + "번째주");

		for(let i = 1; i < 7; i++){

			let ttt = new Date(ptt);
			ttt.setDate(ptt.getDate() + (i - 1));
			ttt = new Date(ttt);

			tttMonth = ttt.getMonth() + 1;
			tttDate = ttt.getDate();

			let ttd;
			if(i == 1){
				ttd = "(월)";
			}else if(i == 2){
				ttd = "(화)";
			}else if(i == 3){
				ttd = "(수)";
			}else if(i == 4){
				ttd = "(목)";
			}else if(i == 5){
				ttd = "(금)";
			}else{
				ttd = "(토)";
			}
			$("th[id='" + i + "']").text(tttMonth + "/" + tttDate + ttd);
		}
	});

	$("#autoBtn").on("click", function(){
		$("#voteTitle").val("스터디일정 투표참여부탁해요");
		$("#voteEnddate").val("2023-04-20");
	});

});



function getWeek(date){
	  const currentDate = date.getDate();
	  const firstDay = new Date(date.setDate(1)).getDay();
	  return Math.ceil((currentDate + firstDay) / 7);
};

</script>

<!-- fullcalendar -->
<%
	StudyVO studyVO = (StudyVO) session.getAttribute("studyVO");
	UserVO userVO = (UserVO) session.getAttribute("userVO");
	String name = userVO.getName();
	String username = userVO.getUsername() + "";
	String sNum = studyVO.getsNum() + "";
%>
<input type="hidden" id="name" value="<%=name %>" />
<input type="hidden" id="username" value="<%=username %>" />
<input type="hidden" id="sNum" value="<%=sNum %>" />

<h4 class="title" id="dropdown-icon-demo">
	<i class="bx bxs-pencil page-icon"></i>
	&nbsp;&nbsp;<%=studyVO.getsNm() %>
	<span class="mt-1" style="font-size: 0.9em; float: right;">메뉴</span>
	<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAkCAYAAADhAJiYAAAAAXNSR0IArs4c6QAAAJlJREFUWEftlcEKwCAMQ+ufb1++4cGRw2zEIrQQT2JnF19TbZZstGR6TIJYRURIhBgBFi/loQdOg8JxnR3Yi//C8AhJUMdZykMRf2zvFSGGziN0mdnotBsS4TrL78Ux5/ed2n5y2S4R6qUZYzaPlAxzLgmK/Gx7r9qeoStFSK89e+3TEWL+OxIvZeojBFhSERIhRoDF5SFG6AUGLBYl/5ufmwAAAABJRU5ErkJggg=="
		style="position: relative; bottom: 2px; padding: 0px; float: right;" id="menuTab" class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"/>
	<ul class="dropdown-menu">
		<li><a href="/study/myStudyList" class="dropdown-item d-flex align-items-center"><i class="bx bx-chevron-right scaleX-n1-rtl"></i>목록으로</a></li>
		<li><a href="/study/studyMain" class="dropdown-item d-flex align-items-center"><i class="bx bx-chevron-right scaleX-n1-rtl"></i>메인</a></li>
		<li><a href="/study/scheduleMain" class="dropdown-item d-flex align-items-center"><i class="bx bx-chevron-right scaleX-n1-rtl"></i>스터디 일정</a></li>
		<li><a href="/study/timeTableMain" class="dropdown-item d-flex align-items-center"><i class="bx bx-chevron-right scaleX-n1-rtl"></i>스케줄 비교</a></li>
		<li>
			<hr class="dropdown-divider">
		</li>
		<li><a href="javascript:void(0);" id="btnExit" class="dropdown-item d-flex align-items-center" style="color: red;"><i class="bx bx-chevron-right scaleX-n1-rtl"></i>스터디 나가기</a></li>
		<li>
			<a href="javascript:void(0);" class="dropdown-item d-flex align-items-center" style="color: red;"
				data-bs-toggle="modal" data-bs-target="#reportModal"><i class="bx bx-chevron-right scaleX-n1-rtl"></i>신고하고 나가기
			</a>
		</li>
	</ul>
</h4>

<div class="row">

	 <div class="col-md-7">
	   <div class="card" style="height: 835px;">
		  <div class="row" style="height: 40px;">
			  <div class="col-md-5 card-header" style="margin-bottom: 0px; margin-top: 0px;"><h5>&nbsp;&nbsp;&nbsp;일정비교 시간표</h5></div>
			  <div class="col-md-7">
				<button type="button" id="voteBtn" class="btn btn-label-primary" style="margin-left: 68%; margin-bottom: 50px; margin-top: 20px;">투표 만들기</button>
			  </div>
		  </div>
	     	<div class="row" style="margin-top: 50px; margin-bottom: 0px;">
		     	<div id="" class="col-md-10 text-end" style="text-align: center; margin-top: 25px;">
<!-- 		     		<input type="text" id="tableTitle"  /> -->
		     		<h6 id="tableTitle"></h6>
		     	</div>
				<div class="col-md-2 demo-inline-spacing">
					<div class="text-end">
						<nav aria-label="Page navigation">
							<ul class="pagination pagination-secondary">
							  <li class="page-item prev active">
							    <button id="prev" class="page-link"><i class="tf-icon bx bx-chevron-left"></i></button>
							  </li>
							  <li class="page-item next active">
							    <button id="next" class="page-link"><i class="tf-icon bx bx-chevron-right"></i></button>
							  </li>
							</ul>
						</nav>
					</div>
				</div>
        	</div>
	     <div class="card-body">
			<table class="table table-bordered" style="text-align: center; height: 100%;">
				<thead>
				  <tr>
				    <th style="width: 20%;">/</th>
				    <th id="1">월</th>
				    <th id="2">화</th>
				    <th id="3">수</th>
				    <th id="4">목</th>
				    <th id="5">금</th>
				    <th id="6">토</th>
				  </tr>
				</thead>
				<tbody>
				  <tr>
				    <th id="class1">09:00~10:00</th>
				    <td class="weekTable" id="wMON1"></td>
				    <td class="weekTable" id="wTUE1"></td>
				    <td class="weekTable" id="wWEN1"></td>
				    <td class="weekTable" id="wTHU1"></td>
				    <td class="weekTable" id="wFRI1"></td>
				    <td class="weekTable" id="wSAT1"></td>
				  </tr>
				  <tr>
				    <th id="class2">10:00~11:00</th>
				    <td class="weekTable" id="wMON2"></td>
				    <td class="weekTable" id="wTUE2"></td>
				    <td class="weekTable" id="wWEN2"></td>
				    <td class="weekTable" id="wTHU2"></td>
				    <td class="weekTable" id="wFRI2"></td>
				    <td class="weekTable" id="wSAT2"></td>
				  </tr>
				  <tr>
				    <th id="class3">11:00~12:00</th>
				    <td class="weekTable" id="wMON3"></td>
				    <td class="weekTable" id="wTUE3"></td>
				    <td class="weekTable" id="wWEN3"></td>
				    <td class="weekTable" id="wTHU3"></td>
				    <td class="weekTable" id="wFRI3"></td>
				    <td class="weekTable" id="wSAT3"></td>
				  </tr>
				  <tr>
				    <th id="class4">12:00~13:00</th>
				    <td class="weekTable" id="wMON4"></td>
				    <td class="weekTable" id="wTUE4"></td>
				    <td class="weekTable" id="wWEN4"></td>
				    <td class="weekTable" id="wTHU4"></td>
				    <td class="weekTable" id="wFRI4"></td>
				    <td class="weekTable" id="wSAT4"></td>
				  </tr>
				  <tr>
				    <th id="class5">13:00~14:00</th>
				    <td class="weekTable" id="wMON5"></td>
				    <td class="weekTable" id="wTUE5"></td>
				    <td class="weekTable" id="wWEN5"></td>
				    <td class="weekTable" id="wTHU5"></td>
				    <td class="weekTable" id="wFRI5"></td>
				    <td class="weekTable" id="wSAT5"></td>
				  </tr>
				  <tr>
				    <th id="class6">14:00~15:00</th>
				    <td class="weekTable" id="wMON6"></td>
				    <td class="weekTable" id="wTUE6"></td>
				    <td class="weekTable" id="wWEN6"></td>
				    <td class="weekTable" id="wTHU6"></td>
				    <td class="weekTable" id="wFRI6"></td>
				    <td class="weekTable" id="wSAT6"></td>
				  </tr>
				  <tr>
				    <th id="class7">15:00~16:00</th>
				    <td class="weekTable" id="wMON7"></td>
				    <td class="weekTable" id="wTUE7"></td>
				    <td class="weekTable" id="wWEN7"></td>
				    <td class="weekTable" id="wTHU7"></td>
				    <td class="weekTable" id="wFRI7"></td>
				    <td class="weekTable" id="wSAT7"></td>
				  </tr>
				  <tr>
				    <th id="class8">16:00~17:00</th>
				    <td class="weekTable" id="wMON8"></td>
				    <td class="weekTable" id="wTUE8"></td>
				    <td class="weekTable" id="wWEN8"></td>
				    <td class="weekTable" id="wTHU8"></td>
				    <td class="weekTable" id="wFRI8"></td>
				    <td class="weekTable" id="wSAT8"></td>
				  </tr>
				  <tr>
				    <th id="class9">17:00~18:00</th>
				    <td class="weekTable" id="wMON9"></td>
				    <td class="weekTable" id="wTUE9"></td>
				    <td class="weekTable" id="wWEN9"></td>
				    <td class="weekTable" id="wTHU9"></td>
				    <td class="weekTable" id="wFRI9"></td>
				    <td class="weekTable" id="wSAT9"></td>
				  </tr>
				  <tr>
				    <th id="class10">18:00~19:00</th>
				    <td class="weekTable" id="wMON10"></td>
				    <td class="weekTable" id="wTUE10"></td>
				    <td class="weekTable" id="wWEN10"></td>
				    <td class="weekTable" id="wTHU10"></td>
				    <td class="weekTable" id="wFRI10"></td>
				    <td class="weekTable" id="wSAT10"></td>
				  </tr>
				  <tr>
				    <th id="class11">19:00~20:00</th>
				    <td class="weekTable" id="wMON11"></td>
				    <td class="weekTable" id="wTUE11"></td>
				    <td class="weekTable" id="wWEN11"></td>
				    <td class="weekTable" id="wTHU11"></td>
				    <td class="weekTable" id="wFRI11"></td>
				    <td class="weekTable" id="wSAT11"></td>
				  </tr>
				</tbody>
			</table>

	     </div>
	   </div>
	</div>

<!-- 오른쪽 카드 -->
	<div class="col-md-5 col-12">

	<div class="col-md-12 col-sm-12">
	    <div class="card overflow-hidden mb-4" style="height: 350px;">
	      <h5 class="card-header">스터디 참여자 목록</h5>
	      <div class="card-body ps ps--active-y" id="vertical-example">
			<div class="col-md-12 col-12 mb-md-0 mb-4">
			   <ul class="list-group list-group-flush" id="clone-source-1">

<!-- 			     <li class="list-group-item"> -->
<!-- 			       <input class="form-check-input" type="checkbox" value="" id="customCheckDark"> -->
<!-- 			       &nbsp;&nbsp; -->
<!-- 			       <img class="rounded-circle" src="../../assets/img/avatars/1.png" height="32" width="32"> -->
<!-- 			       &nbsp; -->
<!-- 			       <span>Buy products.</span> -->
<!-- 			       <button style="float: right;" type="button" class="btn btn-sm btn-outline-secondary">시간표확인하기</button> -->
<!-- 			     </li> -->

			     <c:forEach var="stuVO" items="${stuList}">
			     <li class="list-group-item">
			       <input class="form-check-input" type="checkbox" name="${stuVO.stuNmKor}" id="${stuVO.stuNum}">
			       &nbsp;&nbsp;
			       <img class="rounded-circle" src="/resources/upload${stuVO.stuPhoto}" height="32" width="32">
			       &nbsp;
			       <c:set  var="me" value="<%=username %>"/>
			       <c:if test="${stuVO.stuNum == me}">
			       <span>${stuVO.stuNmKor}(본인)</span>
			       </c:if>
			       <c:if test="${stuVO.stuNum != me}">
			       <span>${stuVO.stuNmKor}</span>
			       </c:if>
			       <button style="float: right;" type="button" id="${stuVO.stuNum}" name="${stuVO.stuNmKor}" class="btn btn-sm btn-outline-secondary">시간표확인하기</button>
			     </li>
			     </c:forEach>

			   </ul>
			</div>
	      <div class="ps__rail-x" style="left: 0px; bottom: 0px;"><div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps__rail-y" style="top: 0px; height: 232px; right: 0px;"><div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 45px;"></div></div></div>
	    </div>
	  </div>

		<div class="col-md-12 col-12">
		  <div class="card"  style="height: 462px;">
		  <div class="row" style="height: 40px;">
			  <div class="col-3 card-header" style="margin-bottom: 0px; margin-top: 0px;"><h5>&nbsp;&nbsp;&nbsp;&nbsp;시간표</h5></div>
			  <div class="col-9">
			  	<span class="badge bg-label-primary" style="margin-top: 20px; margin-left:78%; font-size: 1.0em;"
			  				 id="stuTable"></span>
			  </div>
		  </div>
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

</div>

<br />
<!-- 투표리스트 -->

<div class="col-12">
	<div class="card overflow-hidden" style="height: 336px;">
	<div class="row" style="height: 60px;">
		<div class="card-header col-md-3" style="margin-bottom: 0px; margin-top: 0px;"><h5>&nbsp;&nbsp;&nbsp;투표 진행</h5></div>
		<div class="col-md-9">
<!-- 			<button type="button" id="voteBtn" class="btn btn-label-info" style="margin-left: 65%; margin-bottom: 50px; margin-top: 20px;">참여중인 투표</button> -->
<!-- 			&nbsp;&nbsp;&nbsp; -->
<!-- 			<button type="button" id="voteBtn" class="btn btn-label-info" style="margin-bottom: 50px; margin-top: 20px;">전체 투표</button> -->
			<div class="btn-group" role="group" aria-label="Basic example" style="margin-left: 73%;">
				<button id="myVoteBtn" style="margin-bottom: 50px; margin-top: 20px;" type="button" class="btn btn-outline-primary">참여중인 투표</button>
				<button id="allVoteBtn" style="margin-bottom: 50px; margin-top: 20px;" type="button" class="btn btn-primary">전체 투표</button>
			</div>
		</div>
	</div>
		<div class="card-body ps ps--active-x ps--active-y" id="both-scrollbars-example">
<br />
<table class="table" style="text-align: center;">
      <thead>
        <tr>
          <th>투표 제목</th>
          <th>일정 기간</th>
          <th>참여자</th>
          <th>투표 마감일</th>
          <th>투표 상황</th>
          <th>투표 보기</th>
        </tr>
      </thead>
      <tbody class="table-border-bottom-0">
      <c:forEach var="voteVO" items="${voteList}">
        <tr id="voteListTr">
          <td>${voteVO.voteTitle}</td>
          <td>${voteVO.period}</td>
          <td style="text-align: center;">
            <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
            <c:forEach var="votersVO" items="${voteVO.votersList}" varStatus="stat">
              <li data-bs-toggle="tooltip" data-bs-offset="0,-335" data-popup="tooltip-custom" id="${votersVO.votersStu}"
              				data-bs-placement="top" class="avatar avatar-xs pull-up" title="${votersVO.votersName}">
                <img src="/resources/upload${votersVO.votersPhoto}" alt="Avatar" class="rounded-circle">
              </li>
            </c:forEach>
            </ul>
          </td>
          <fmt:formatDate value="${voteVO.voteEnddt}" pattern="yyyy-MM-dd" var="voteEnddt" />
          <td>${voteEnddt}</td>
          <jsp:useBean id="now" class="java.util.Date" />
          <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
          <c:if test="${today > voteVO.voteEnddt}">
	          <td><span class="badge bg-label-success me-1">투표마감</span></td>
          </c:if>
          <c:if test="${today <= voteVO.voteEnddt}">
	          <td><span class="badge bg-label-info me-1">진행중</span></td>
          </c:if>
          <td>
          	  <button type="button" class="btn btn-icon btn-primary" name="vvBtn" id="${voteVO.voteNum}">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard" viewBox="0 0 16 16">
				  <path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z"/>
				  <path d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z"/>
				</svg>
              </button>
          </td>
        </tr>
        </c:forEach>
      </tbody>
    </table>



			<div class="ps__rail-x" style="left: 0px; bottom: 0px;">
				<div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
			</div>
			<div class="ps__rail-y" style="top: 0px; height: 232px; right: 0px;">
				<div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 45px;"></div>
			</div>
		</div>
	</div>
</div>




<!-- 투표 모달창 -->
<div class="modal fade" id="voteModal" tabindex="-1" style="display: none;" aria-modal="true" role="dialog">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="fw-bold py-3 mb-4">투표 만들기</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form>
				<div class="modal-body">
					<div class="col mb-3">
						<label for="nameWithTitle" class="fw-bold me-2">일정 기간</label>
						<input type="text" id="period" class="form-control" readonly />
					</div>
					<div class="col mb-3">
						<label for="nameWithTitle" class="fw-bold me-2">투표 제목</label>
						<input type="text" id="voteTitle" class="form-control" required />
					</div>
					<div class="col mb-3">
						<label for="nameWithTitle" class="fw-bold me-2">투표 종료일</label>
						<input type="date" id="voteEnddate" class="form-control" required />
					</div>
					<div class="col mb-3" id="votersStu">
					</div>
				</div>
			</form>
			<div class="modal-footer">
				<button type="button" class="btn btn-label-secondary" id="autoBtn">자동채우기</button>
				<button type="button" class="btn btn-secondary" id="closeBtn"
					data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="insertBtn">등록하기</button>
			</div>
		</div>
	</div>
</div>

<!-- 투표 진행 모달창 -->
<div class="modal fade" id="voteINGModal" tabindex="-1" style="display: none;" aria-modal="true" role="dialog">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="fw-bold py-3 mb-4">투표하기</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form>
				<input type="hidden" id="voteNum" />
				<div class="modal-body">
					<div class="col mb-3">
						<label for="nameWithTitle" class="fw-bold me-2">투표 제목</label>
						<input type="text" id="voteTitleD" class="form-control" readonly />
					</div>
					<div class="col mb-3">
						<label for="nameWithTitle" class="fw-bold me-2">일정 기간</label>
						<input type="text" id="periodD" class="form-control" readonly />
					</div>
					<div class="col mb-3">
						<label for="nameWithTitle" class="fw-bold me-2">투표 종료일</label>
						<input type="text" id="voteEnddateD" class="form-control" readonly />
					</div>
					<div class="col mb-3">
				        <div class="col-lg-12">
				          <div class="card">
				            <div class="card-body">
				              <h5 class="card-title">투표 진행 상황</h5>

				              <!-- Radial Bar Chart -->
				              <div id="radialBarChart"></div>

				              <script>

				              </script>

				            </div>
				          </div>
				        </div>
					</div>
					<br/>
					<div class="col mb-3">
						<label for="nameWithTitle" class="fw-bold me-2">투표하기</label>
						<span style="font-size: 0.8em; color: blue;" id="yn"></span>
						<br/>
						<div id="ynDiv" class="btn-group" role="group" aria-label="Basic radio toggle button group">
			                <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off">
			                <label class="btn btn-outline-primary" for="btnradio1">찬성</label>
			                <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
			                <label class="btn btn-outline-primary" for="btnradio2">반대</label>
			              </div>
					</div>
				</div>
			</form>
			<div class="modal-footer" id="voteFooter1">
				<button type="button" class="btn btn-secondary" id="closeBtn"
					data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="voteeBtn">투표하기</button>
			</div>
			<div class="modal-footer" id="voteFooter2" style="display: none;">
				<button type="button" class="btn btn-secondary" id="closeBtn"
					data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-danger" id="delBtn">삭제하기</button>
				<button type="button" class="btn btn-primary" id="voteeBtn">투표하기</button>
			</div>
			<div class="modal-footer" id="voteFooter3" style="display: none;">
				<span style="font-size: 1.2em; font-weight: bold;">투표가 종료되었습니다.</span><br/>
				<button type="button" class="btn btn-secondary" id="closeBtn"
					data-bs-dismiss="modal">닫기</button>
			</div>
			<div class="modal-footer" id="voteFooter4" style="display: none;">
				<span style="font-size: 1.2em; font-weight: bold;">투표가 종료되었습니다.</span><br/>
				<button type="button" class="btn btn-secondary" id="closeBtn"
					data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-danger" id="delBtn">삭제하기</button>
				<button type="button" class="btn btn-warning" id="scheInBtn">회의일정 등록</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="reportModal" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered modal-simple modal-add-new-cc">
		<div class="modal-content p-3 p-md-5">
			<div class="modal-body">
				<button type="button" class="btn-close report-close" data-bs-dismiss="modal" aria-label="Close"></button>
				<div class="row g-3">
					<div class="col-md-12">
						<h4 class="col-md-2">신고</h4>
					</div>
					
					<span class="col-sm-10 col-form-label" id="comEmpty" style="color: red; display: none; padding: 0px; padding-left: 10px;">신고사유를 작성해주세요</span>
					
					<div class="col-sm-12">
						<textarea class="form-control" id="reason" name="reason" rows="3" cols="" placeholder="신고 사유를 작성해주세요." ></textarea>
					</div>
					
					<br/>
					<div class="col-md-12 text-center formButtons">
						<button type="button" id="btnReport" class="btn btn-primary me-sm-3 me-1">제출</button>
						<button type="reset" class="btn btn-label-secondary report-close" data-bs-dismiss="modal" aria-label="Close">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 채팅 -->
<jsp:include page="/WEB-INF/views/study/studyChat.jsp" />
<!-- 채팅 -->

<script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>

<script	src="/resources/sneat/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
  <script src="/resources/sneat/assets/js/extended-ui-perfect-scrollbar.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script type="text/javascript">
$(function(){
	let today = new Date();
	let year = today.getFullYear();

	$(document).on("click", ".btn-outline-secondary", function(){
// 		$("td[class='timeTable']").css("background", "#A0A0FF");
		$("td[class='timeTable']").css("background", "none");

		let name = $(this).attr("name");
	    $("#stuTable").html(name);

		let stuNum = $(this).attr("id");
// 			stuNum = '201801010';

		$.ajax({
			url: "/study/getTimeTableData",
			data: {"stuNum" : stuNum},
			type: "post",
			dataType: "json",
			async: false,
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader(csrfHeaderName, csrfToken);
			},
	        success: function(result) {
	        	$.each (result, function (index, data) {
	        		  $("td[id='"+ data.timeTcode +"']").css("background", "lightgray");
	        		});
	        },
	        error:function(xhr){
				Swal.fire({
					title: "error : "+ xhr.status,
					showClass: {
						popup: 'animate__animated animate__bounceIn'
					},
					icon: 'error',
					customClass: {
						confirmButton: 'btn btn-primary'
					},
					buttonsStyling: false
				});
	        }
		});
	});

	$('input:checkbox').on("change", function(){
		$("td[class='weekTable']").css("background", "none");
		$("td[class='weekTable']").text("");
		let length = $('input:checkbox').length;
		for(let i = 0; i < length; i++){
			if($('input:checkbox').eq(i).is(":checked")==true){
				let stuNum = $('input:checkbox').eq(i).attr("id");
// 					stuNum = '201801010';

				$.ajax({
					url: "/study/getTimeTableData",
					data: {"stuNum" : stuNum},
					type: "post",
					dataType: "json",
					async: false,
					beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
			            xhr.setRequestHeader(csrfHeaderName, csrfToken);
					},
			        success: function(result) {
			        	$.each (result, function (index, data) {
			        		  $("td[id='w"+ data.timeTcode +"']").css("background", "lightgray");
			        		  $("td[id='w"+ data.timeTcode +"']").text("x");

			        		});
			        },
			        error:function(xhr){
						Swal.fire({
							title: "error : "+ xhr.status,
							showClass: {
								popup: 'animate__animated animate__bounceIn'
							},
							icon: 'error',
							customClass: {
								confirmButton: 'btn btn-primary'
							},
							buttonsStyling: false
						});
			        }
				});

			}
		}
	});

	$("td[class='weekTable']").on("click", function(){
		if($(this).text() != "x"){
			if(!$(this).hasClass("selected")){
			$(this).addClass("selected");
			$(this).css("background", "#B4B4FF");
			}else{
			$(this).removeClass("selected");
			$(this).css("background", "none");
			}
		}
	});

	$("#voteBtn").on("click", function(){

		let cbcount = $('input:checkbox:checked').length;
		if(cbcount == 0){
			  Swal.fire({
				    title: '투표에 참여할 학생을 <br/> 선택해주세요.',
				    showClass: {
				      popup: 'animate__animated animate__bounceIn'
				    },
				    icon: 'warning',
				    customClass: {
				      confirmButton: 'btn btn-primary'
				    },
				    buttonsStyling: false
				  });
			  return;
		}

		let tdArr = document.querySelectorAll("td[class='weekTable selected']");
		let length = tdArr.length
		if(length == 0){
			  Swal.fire({
				    title: '일정 시간을 선택해주세요.',
				    showClass: {
				      popup: 'animate__animated animate__bounceIn'
				    },
				    icon: 'warning',
				    customClass: {
				      confirmButton: 'btn btn-primary'
				    },
				    buttonsStyling: false
				  });
		}else{
			let first = tdArr.item(0).id;
			let end = tdArr.item(length-1).id;

			let periodTime;
			if(first == end){
				let firstT = first.slice(4);
				for(var i = 1; i <= 12; i++){
					if(i == firstT){
						periodTime = $("th[id='class"+ i +"']").text();
					}
				}

			}else{
				let firstT = first.slice(4);
				let endT = end.slice(4);
				for(var i = 1; i <= 12; i++){
					if(i == firstT){
						periodTime1 = $("th[id='class"+ i +"']").text();
						let pArr = periodTime1.split("~");
						periodTime = pArr[0];
					}
				}
				for(var i = 1; i <= 12; i++){
					if(i == endT){
						periodTime2 = $("th[id='class"+ i +"']").text();
						let pArr = periodTime2.split("~");
						periodTime = periodTime + "~" + pArr[1];
					}
				}
			}

			let dayy = first.substring(0, first.length - 1);
				dayy = dayy.slice(1);
			let periodDay;
			if(dayy == "MON"){
				periodDay = $("th[id='1']").text();
			}else if(dayy == "TUE"){
				periodDay = $("th[id='2']").text();
			}else if(dayy == "WEN"){
				periodDay = $("th[id='3']").text();
			}else if(dayy == "THU"){
				periodDay = $("th[id='4']").text();
			}else if(dayy == "FRI"){
				periodDay = $("th[id='5']").text();
			}else{
				periodDay = $("th[id='6']").text();
			}

			periodDay = year + "/" + periodDay;
			periodDay = new Date(periodDay);

			let pYear = periodDay.getFullYear(); // 년도
			let pMonth = String(periodDay.getMonth()+1);  // 월
			if(pMonth.length == 1){
				pMonth = "0" + pMonth;
			}
			let pDate = String(periodDay.getDate());  // 날짜
			if(pDate.length == 1){
				pDate = "0" + pDate;
			}

			periodDay = pYear + "-" + pMonth + "-" + pDate;
			let period = periodDay + " " + periodTime;

			$("#voteModal").modal("show");
			$("div[id='votersStu']").empty();
			$("#voteTitle").val();
			$("#period").val(period);
			$("#voteEnddate").attr("max", periodDay);

			let html = "<label for='nameWithTitle' class='fw-bold me-2'>투표 참여자</label><br/>";
			let vmName = $("#name").val();
			html += "<span name='voters' class='badge bg-label-primary' style='font-size: 1.0em;'>" + vmName + "</span>&nbsp;&nbsp;";

			vpArr = document.querySelectorAll("input[type='checkbox']:checked");
			for(var i = 0; i < vpArr.length; i++){
				let vpName = vpArr.item(i).name;
				if(vmName == vpName){
					html += "";
				}else{
					html += "<span name='voters' class='badge bg-label-dark' style='font-size: 1.0em;'>" + vpName + "</span>&nbsp;&nbsp;";
				}
			}
			$("div[id='votersStu']").append(html);
		}
	});

	$("#insertBtn").on("click", function(){

		var voters = new Array();
		let votersArr = document.querySelectorAll("input[type='checkbox']:checked");
		for(var i = 0; i < votersArr.length; i++){
			let voter = votersArr.item(i).id;
			voters.push(voter);
		}

		let data = {
				"sNum" : $("#sNum").val(),
				"voteTitle" : $("#voteTitle").val(),
				"voteEnddt" : $("#voteEnddate").val(),
				"voteAdmin" : $("#username").val(),
				"period" : $("#period").val(),
				"voters" : voters
		};

        $.ajax({
	          type: "post",
	          contentType: "application/json;charset=utf-8",
	          url: "/study/addVote",
	          data: JSON.stringify(data),
	          dataType: "json",
	  		  async: false,
			  beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                xhr.setRequestHeader(csrfHeaderName, csrfToken);
			  },
	          success: function (response) {
				  Swal.fire({
					    title: '투표가 생성되었습니다.',
					    showClass: {
					      popup: 'animate__animated animate__bounceIn'
					    },
					    icon: 'success',
					    customClass: {
					      confirmButton: 'btn btn-primary'
					    },
					    buttonsStyling: false
					  }).then(function(){
						  location.href="/study/timeTableMain";
					  });
	          },
	          error:function(xhr){
					Swal.fire({
						title: "error : "+ xhr.status,
						showClass: {
							popup: 'animate__animated animate__bounceIn'
						},
						icon: 'error',
						customClass: {
							confirmButton: 'btn btn-primary'
						},
						buttonsStyling: false
					});
	          }
        });
	});


	$(document).on("click", "button[name='vvBtn']", function(){
		let voteNum = $(this).attr("id");
		let votersStu = $("#username").val();
		let data = {
			"voteNum" : voteNum,
			"votersStu" : votersStu
		};
        $.ajax({
	          type: "post",
	          contentType: "application/json;charset=utf-8",
	          url: "/study/checkVoters",
	          data: JSON.stringify(data),
	  		  async: false,
			  beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                xhr.setRequestHeader(csrfHeaderName, csrfToken);
			  },
	          success: function (result) {
	        	  if(result == 0){
					  Swal.fire({
						    title: '투표참여자만 볼 수 있습니다.',
						    text: '투표상황은 투표 참여자만 조회 가능합니다.',
						    showClass: {
						      popup: 'animate__animated animate__bounceIn'
						    },
						    icon: 'warning',
						    customClass: {
						      confirmButton: 'btn btn-primary'
						    },
						    buttonsStyling: false
						  });
					  return;
	        	  }else{

	        	  }
	          }
      	});

	    $.ajax({
	       type: "post",
	       contentType: "application/json;charset=utf-8",
	       url: "/study/voteDetail",
	       data: JSON.stringify(data),
	       dataType : "json",
		  async: false,
		  beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
		             xhr.setRequestHeader(csrfHeaderName, csrfToken);
		   },
	      success: function (result) {
	    	 		$("#radialBarChart").empty();
					$("#voteINGModal").modal("show");
					setTimeout(function() {
						voteModalShow(result);
						}, 500);
				}
 		});
	});

	function voteModalShow(result){
		   let voterStu = $("#username").val();
		   $("input:radio").attr("disabled", false);
	 	   $("#btnradio1").prop("checked", false);
				$("#btnradio2").prop("checked", false);
				let vote_data = {
				        series: [result.participation, result.yes, result.no],
				        chart: {
				          height: 350,
				          type: 'radialBar',
				          toolbar: {
				            show: false
				          }
				        },
				        plotOptions: {
				          radialBar: {
			              startAngle: 0,
			              endAngle: 270,
				            dataLabels: {
				              name: {
				                fontSize: '22px',
				              },
				              value: {
				                fontSize: '16px',
				              },
				            }
				          }
				        },
				        labels: ['투표참여율', '찬성', '반대'],
				        legend: {
				            show: true,
				            floating: true,
				            fontSize: '16px',
				            position: 'left',
				            offsetX: 60,
				            offsetY: 15,
				        }
				      };
				$("#radialBarChart").empty();
				new ApexCharts(document.querySelector("#radialBarChart"),vote_data).render();

				$("#voteEnddateD").val(result.voteDate);

				$("#voteTitleD").val(result.voteTitle);
				$("#periodD").val(result.period)
				if(result.voteAns == 0){
					$("#yn").text("미참여");
				}else if(result.voteAns == 1){
					$("#yn").text("참여");
					$("#btnradio1").prop("checked", true);
					$("#btnradio2").prop("checked", false);
				}else{
					$("#yn").text("참여");
					$("#btnradio1").prop("checked", false);
					$("#btnradio2").prop("checked", true);
				}
				$("#voteNum").val(result.voteNum);
				let today = new Date();
				let voteDay = new Date(result.voteDate);
				$("#voteFooter2").css("display", "none");
				$("#voteFooter3").css("display", "none");
				$("#voteFooter4").css("display", "none");
				if(today <= voteDay){
					if(result.voteAdmin == voterStu){
						$("#voteFooter1").css("display", "none");
						$("#voteFooter2").css("display", "block");
					}else{
						$("#voteFooter2").css("display", "none");
						$("#voteFooter1").css("display", "block");
					}
				}
				if(today > voteDay){
					$("input:radio").attr("disabled", true);
					if(result.voteAdmin == voterStu){
						$("#voteFooter1").css("display", "none");
						$("#voteFooter4").css("display", "block");
					}else{
						$("#voteFooter1").css("display", "none");
						$("#voteFooter3").css("display", "block");
					}
			}
		}

	$(document).on("click", "#delBtn", function(){
		let delNum = $("#voteNum").val();
		console.log("delNum : ", delNum);
        $.ajax({
	          type: "post",
	          contentType: "application/json;charset=utf-8",
	          url: "/study/delVote",
	          data: delNum,
	  		  async: false,
			  beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                xhr.setRequestHeader(csrfHeaderName, csrfToken);
			  },
	          success: function (result) {
	        	  if(result > 0){
					  Swal.fire({
						    title: '투표가 삭제되었습니다.',
						    showClass: {
						      popup: 'animate__animated animate__bounceIn'
						    },
						    icon: 'success',
						    customClass: {
						      confirmButton: 'btn btn-primary'
						    },
						    buttonsStyling: false
						  }).then(function(){
							  location.href="/study/timeTableMain";
						  });
	        	  }
	          },
	          error:function(xhr){
					Swal.fire({
						title: "error : "+ xhr.status,
						showClass: {
							popup: 'animate__animated animate__bounceIn'
						},
						icon: 'error',
						customClass: {
							confirmButton: 'btn btn-primary'
						},
						buttonsStyling: false
					});
	          }
      	});

	});

	$(document).on("click", "#voteeBtn", function(){
		if($('input:radio:checked').length == 0){
			Swal.fire({
			   title: '투표버튼을 클릭해주세요.',
			   showClass: {
			     popup: 'animate__animated animate__bounceIn'
			   },
			   icon: 'warning',
			   customClass: {
			     confirmButton: 'btn btn-primary'
			   },
			   buttonsStyling: false
			 })
		}

		let yn = $('input:radio:checked').attr("id");
		yn = yn.slice(-1);
		let voteNum = $("#voteNum").val();
		let stuNum = $("#username").val();

		let data = {
			"voteNum" : voteNum,
			"votersStu" : stuNum,
			"voteAns" : yn
		};

		$.ajax({
	          type: "post",
	          contentType: "application/json;charset=utf-8",
	          url: "/study/voteUpdate",
	          data: JSON.stringify(data),
	          async: false,
			  beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                xhr.setRequestHeader(csrfHeaderName, csrfToken);
			  },
	          success: function (result) {
	        	  if(result > 0){
					  Swal.fire({
						    title: '투표가 완료되었습니다.',
						    text: '투표종료일 전까지 수정 가능합니다.',
						    showClass: {
						      popup: 'animate__animated animate__bounceIn'
						    },
						    icon: 'success',
						    customClass: {
						      confirmButton: 'btn btn-primary'
						    },
						    buttonsStyling: false
						  }).then(function(){
							    $.ajax({
								       type: "post",
								       contentType: "application/json;charset=utf-8",
								       url: "/study/voteDetail",
								       data: JSON.stringify(data),
								       dataType : "json",
								       async: false,
									  beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
									             xhr.setRequestHeader(csrfHeaderName, csrfToken);
									   },
								      success: function (result) {
												voteModalShow(result);
												$("#voteINGModal").modal("show");
											}
							 		});
						  });
	        	  }
	          },
	          error:function(xhr){
					Swal.fire({
						title: "error : "+ xhr.status,
						showClass: {
							popup: 'animate__animated animate__bounceIn'
						},
						icon: 'error',
						customClass: {
							confirmButton: 'btn btn-primary'
						},
						buttonsStyling: false
					});
	          }
    	});
	});

	$("#myVoteBtn").on("click", function(){
		$("#myVoteBtn").attr("class", "btn btn-primary");
		$("#allVoteBtn").attr("class", "btn btn-outline-primary");

		let voteArr = document.querySelectorAll("tr[id='voteListTr']");
		for(var i = 0; i < voteArr.length; i++){
			let vote = voteArr.item(i);
			vote.style.display = 'none';
		}

		let myNum = $("#username").val();
		let stuArr = document.querySelectorAll("li[data-bs-toggle='tooltip']");
		for(var i = 0; i < stuArr.length; i++){
			if(myNum != stuArr.item(i).id){
				let myvote = $("li[id="+ myNum +"]").closest("tr");
				myvote.css("display", "");
			}
		}
	});

	$("#allVoteBtn").on("click", function(){
		$("#allVoteBtn").attr("class", "btn btn-primary");
		$("#myVoteBtn").attr("class", "btn btn-outline-primary");

		let voteArr = document.querySelectorAll("tr[id='voteListTr']");
		for(var i = 0; i < voteArr.length; i++){
			let vote = voteArr.item(i);
			vote.style.display = '';
		}
	});

	$(document).on("click", "#scheInBtn", function(){
		let period = $("#periodD").val();
		let periodArr = period.split(" ");
		period = periodArr[0];
		let timeArr = periodArr[1].split("~");

        let newEvent = {
                "title": $("#voteTitleD").val(),
                "start": period + " " + timeArr[0],
                "end": period + " " + timeArr[1],
      		    "allDay" : false,
      		    "stuNum": $("#username").val(),
      		    "srNum" : $("#sNum").val(),
      		    "description": "투표 결과 이후 만든 회의일정입니다.",
                "extendedProps": {
                  "calendar": "Holiday"
                }
        };

        $.ajax({
	          type: "post",
	          contentType: "application/json;charset=utf-8",
	          url: "/study/addEvent",
	          data: JSON.stringify(newEvent),
	          dataType: "json",
	  		  async: false,
			  beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                xhr.setRequestHeader(csrfHeaderName, csrfToken);
			  },
	          success: function (result) {
				if(result > 0){
				  Swal.fire({
					    title: '회의일정이 등록되었습니다.',

					    showClass: {
					      popup: 'animate__animated animate__bounceIn'
					    },
					    icon: "success",
					    customClass: {
					      confirmButton: 'btn btn-primary'
					    },
					    buttonsStyling: false
					  }).then(function(){
						  location.href="/study/scheduleMain";
					  });
				}
	          },
	          error:function(xhr){
					Swal.fire({
						title: "error : "+ xhr.status,
						showClass: {
							popup: 'animate__animated animate__bounceIn'
						},
						icon: 'error',
						customClass: {
							confirmButton: 'btn btn-primary'
						},
						buttonsStyling: false
					});
	          }
        });


	});
});


//나가기 버튼
$("#btnExit").on("click", function() {
	Swal.fire({
		title: "정말 \"<%=studyVO.getsNm() %>\"에서 나가시겠습니까?",
		showDenyButton: true,
		confirmButtonText: 'Yes',
		denyButtonText: 'No',
		customClass: {
			actions: 'my-actions',
			cancelButton: '',
			confirmButton: 'btn btn-primary',
			denyButton: 'btn btn-secondary',
		}
	}).then((result) => {
		if(result.isConfirmed){
			location.href = "/study/exitStudy";
		}
	});
});

//신고하고 나가기 버튼
$("#btnReport").on("click", function() {
	let target = $("#reason");
	
	if(target.val() == "" || target.val() == null){
		target.focus();
		$("#comEmpty").css("display", "inline-block");
		return;
	}
	
	Swal.fire({
		title: "정말" + isEndWithConsonant("<%=studyVO.getsNm() %>") + " 신고하고 나가시겠습니까?",
		showDenyButton: true,
		confirmButtonText: 'Yes',
		denyButtonText: 'No',
		customClass: {
			actions: 'my-actions',
			cancelButton: '',
			confirmButton: 'btn btn-primary',
			denyButton: 'btn btn-secondary',
		}
	}).then((result) => {
		if(result.isConfirmed){
			location.href = "/study/reportStudy?srlReason=" + target.val();
		}
	});
	
});

</script>
