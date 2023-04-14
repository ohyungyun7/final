<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="kr.or.ddit.vo.UserVO"%>
<%@page import="kr.or.ddit.vo.StudyVO"%>
<%@page import="org.apache.catalina.Session"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet"
	href="/resources/sneat/assets/vendor/libs/fullcalendar/fullcalendar.css" />
<link rel="stylesheet"
	href="/resources/sneat/assets/vendor/libs/flatpickr/flatpickr.css" />

<!-- Page CSS -->

<link rel="stylesheet"
	href="/resources/sneat/assets/vendor/css/pages/app-calendar.css" />

<style type="text/css">
.categoryBar{
	color: gray;
}
thead{
	text-align: center;
}
.card{
	overflow: auto;
}
.search-sel{
	width: 15%;
	display: inline;
}
.search-inp{
	width: 30%;
	display: inline;
}
.search-btn{
	display: inline;
}

.table-bordered{
	text-align: center;
}
.card-body{
	margin-top: 10px;
	padding-top: 0px;
}
textarea{
	resize: none;
	width: 100%;
	maxlength: 1000;

}
</style>


<!-- fullcalendar -->
<%
    StudyVO studyVO = (StudyVO) session.getAttribute("studyVO");
	int snum = studyVO.getsNum();
	String sNum = snum + "";

	UserVO userVO = (UserVO) session.getAttribute("userVO");
	int username =userVO.getUsername();
	String user = username + "";
%>

<input type="hidden" id="nser" value="<%=username %>" />
<input type="hidden" id="srNum" value="<%=sNum %>" />

<script>
	var roomNumber = $("#srNum").val();
	const csrfHeaderName = "${_csrf.headerName}";
	const csrfToken = "${_csrf.token}";

	$(".search-input-wrapper").css("display", "none");

	let title = $(".fc-toolbar-title").text();

$(function(){

	let cur_month = $(".fc-toolbar-title").text();
	const arr = cur_month.split(" ");
	cur_month = arr[0];
	cur_year = arr[1];

	if(cur_month == 'January'){
		cur_month = 1;
	}else if(cur_month == 'February'){
		cur_month = 2;
	}else if(cur_month == 'March'){
		cur_month = 3;
	}else if(cur_month == 'April'){
		cur_month = 4;
	}else if(cur_month == 'May'){
		cur_month = 5;
	}else if(cur_month == 'June'){
		cur_month = 6;
	}else if(cur_month == 'July'){
		cur_month = 7;
	}else if(cur_month == 'August'){
		cur_month = 8;
	}else if(cur_month == 'September'){
		cur_month = 9;
	}else if(cur_month == 'October'){
		cur_month = 10;
	}else if(cur_month == 'November'){
		cur_month = 11;
	}else{
		cur_month = 12;
	}

	$(".fc-toolbar-title").text(cur_year + "년 " + cur_month + "월");

	$("a[aria-label='Sunday']").text('일');
	$("a[aria-label='Monday']").text('월');
	$("a[aria-label='Tuesday']").text('화');
	$("a[aria-label='Wednesday']").text('수');
	$("a[aria-label='Thursday']").text('목');
	$("a[aria-label='Friday']").text('금');
	$("a[aria-label='Saturday']").text('토');

	$(".fc-scroller-liquid-absolute").css("overflow", "hidden");

	$("button[title='month view']").text('월간');
	$("button[title='week view']").text('주간');
	$("button[title='day view']").text('일간');
	$("button[title='list view']").text('일정목록');

	$("button[title='Next month']").on("click", function(){

		let cur_month = $(".fc-toolbar-title").text();
		let nextArr = cur_month.split("월");
		let cur = nextArr[1];
		let curArr = cur.split(" ");

		next_month = curArr[0];
		next_year = curArr[1];

		if(next_month == 'January'){
			next_month = 1;
		}else if(next_month == 'February'){
			next_month = 2;
		}else if(next_month == 'March'){
			next_month = 3;
		}else if(next_month == 'April'){
			next_month = 4;
		}else if(next_month == 'May'){
			next_month = 5;
		}else if(next_month == 'June'){
			next_month = 6;
		}else if(next_month == 'July'){
			next_month = 7;
		}else if(next_month == 'August'){
			next_month = 8;
		}else if(next_month == 'September'){
			next_month = 9;
		}else if(next_month == 'October'){
			next_month = 10;
		}else if(next_month == 'November'){
			next_month = 11;
		}else{
			next_month = 12;
		}

		$(".fc-toolbar-title").text("");
		$(".fc-toolbar-title").text(next_year + "년 " + next_month + "월");

		$("button[title='month view']").text('월간');
		$("button[title='week view']").text('주간');
		$("button[title='day view']").text('일간');
		$("button[title='list view']").text('일정목록');
	});

	$("button[title='Previous month']").on("click", function(){

		let cur_month = $(".fc-toolbar-title").text();
		let prevArr = cur_month.split("월");
		let cur = prevArr[1];
		let curArr = cur.split(" ");

		prev_month = curArr[0];
		prev_year = curArr[1];

		if(prev_month == 'January'){
			prev_month = 1;
		}else if(prev_month == 'February'){
			prev_month = 2;
		}else if(prev_month == 'March'){
			prev_month = 3;
		}else if(prev_month == 'April'){
			prev_month = 4;
		}else if(prev_month == 'May'){
			prev_month = 5;
		}else if(prev_month == 'June'){
			prev_month = 6;
		}else if(prev_month == 'July'){
			prev_month = 7;
		}else if(prev_month == 'August'){
			prev_month = 8;
		}else if(prev_month == 'September'){
			prev_month = 9;
		}else if(prev_month == 'October'){
			prev_month = 10;
		}else if(prev_month == 'November'){
			prev_month = 11;
		}else{
			prev_month = 12;
		}

		$(".fc-toolbar-title").text("");
		$(".fc-toolbar-title").text(prev_year + "년 " + prev_month + "월");

		$("button[title='month view']").text('월간');
		$("button[title='week view']").text('주간');
		$("button[title='day view']").text('일간');
		$("button[title='list view']").text('일정목록');
	});

});

</script>

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


        <div class="card">
          <div class="card-body">
            <!-- Connections -->
<div class="container-xxl flex-grow-1 container-p-y">


<div class="card app-calendar-wrapper">
  <div class="row g-0">
    <!-- Calendar Sidebar -->


    <div class="col app-calendar-sidebar" id="app-calendar-sidebar">
      <div class="border-bottom p-4 my-sm-0 mb-3">
        <div class="d-grid">
          <button class="btn btn-primary btn-toggle-sidebar" data-bs-toggle="offcanvas" data-bs-target="#addEventSidebar" aria-controls="addEventSidebar">
            <i class="bx bx-plus me-1"></i>
            <span class="align-middle">일정 추가하기</span>
          </button>
        </div>
      </div>
      <div class="p-4">
        <!-- inline calendar (flatpicker) 작은달력 부분 -->
        <div class="ms-n2">
          <div class="inline-calendar flatpickr-input" readonly="readonly"></div>
		</div>
        <hr class="container-m-nx my-4">


        <!-- Filter 색 체크하는 부분 -->
        <div class="mb-4">
          <small class="text-small text-muted text-uppercase align-middle">일정분류</small>
        </div>

        <div class="form-check mb-2">
          <input class="form-check-input select-all" type="checkbox" id="selectAll" data-value="all" checked="">
          <label class="form-check-label" for="selectAll">모든 일정</label>
        </div>
		<br />
        <div class="app-calendar-events-filter">
          <div class="form-check form-check-danger mb-2">
            <input class="form-check-input input-filter" type="checkbox" id="select-personal" data-value="personal" checked="">
            <label class="form-check-label" for="select-personal">공통일정</label>
          </div>
          <div class="form-check mb-2" style="display: none;">
            <input class="form-check-input input-filter" type="checkbox" id="select-business" data-value="business" checked="">
            <label class="form-check-label" for="select-business">Business</label>
          </div>
          <div class="form-check form-check-warning mb-2">
            <input class="form-check-input input-filter" type="checkbox" id="select-family" data-value="family" checked="">
            <label class="form-check-label" for="select-family">개인일정</label>
          </div>
          <div class="form-check form-check-success mb-2">
            <input class="form-check-input input-filter" type="checkbox" id="select-holiday" data-value="holiday" checked="">
            <label class="form-check-label" for="select-holiday">회의일정</label>
          </div>
          <div class="form-check form-check-info">
            <input class="form-check-input input-filter" type="checkbox" id="select-etc" data-value="etc" checked="">
            <label class="form-check-label" for="select-etc">기타</label>
          </div>
        </div>
      </div>
    </div>
    <!-- /Calendar Sidebar -->

    <!-- Calendar & Modal -->
    <div class="col app-calendar-content">
      <div class="card shadow-none border-0">
        <div class="card-body pb-0">
          <!-- FullCalendar 캘린더 부분 -->
          <div id="calendar" class="fc fc-media-screen fc-direction-ltr fc-theme-standard">
		  </div>
		</div>
      </div>
      <div class="app-overlay"></div>
      <!-- FullCalendar Offcanvas -->

      <div class="offcanvas offcanvas-end event-sidebar"
      		tabindex="-1" id="addEventSidebar" aria-labelledby="addEventSidebarLabel">
        <div class="offcanvas-header border-bottom">
          <h5 class="offcanvas-title mb-2" id="addEventSidebarLabel">학사일정 추가하기</h5>
          <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
          <form class="event-form pt-0 fv-plugins-bootstrap5 fv-plugins-framework" id="eventForm" onsubmit="return false" novalidate="novalidate">
            <div class="mb-3 fv-plugins-icon-container">
              <label class="form-label" for="eventTitle">일정 제목</label>
              <input type="text" class="form-control" id="eventTitle" name="eventTitle" placeholder="일정을 입력해주세요.">
            <div class="fv-plugins-message-container invalid-feedback"></div>
           </div>
            <div class="mb-3 fv-plugins-icon-container">
              <label class="form-label" for="eventStartDate">시작 날짜</label>
              <input type="text" class="form-control flatpickr-input" id="eventStartDate" name="eventStartDate" placeholder="Start Date" readonly="readonly">
            <div class="fv-plugins-message-container invalid-feedback"></div></div>
            <div class="mb-3 fv-plugins-icon-container">
              <label class="form-label" for="eventEndDate">종료 날짜</label>
              <input type="text" class="form-control flatpickr-input" id="eventEndDate" name="eventEndDate" placeholder="End Date" readonly="readonly">
            <div class="fv-plugins-message-container invalid-feedback"></div></div>
            <div class="mb-3">
              <label class="switch">
                <input type="checkbox" class="switch-input allDay-switch" value="true">
                <span class="switch-toggle-slider">
                  <span class="switch-on"></span>
                  <span class="switch-off"></span>
                </span>
                <span class="switch-label">하루종일</span>
              </label>
            </div>
            <div class="mb-3">
              <label class="form-label" for="eventLabel">일정 종류</label>
              <div class="position-relative">
	              <select class="select2 select-event-label form-select select2-hidden-accessible" id="eventLabel" name="eventLabel" data-select2-id="eventLabel" tabindex="-1" aria-hidden="true">
<!-- 	                <option data-label="primary" value="Business" selected="" data-select2-id="2"></option> -->
	                <option data-label="danger" value="Personal">공통일정</option>
	                <option data-label="warning" value="Family">개인일정</option>
	                <option data-label="success" value="Holiday">회의일정</option>
	                <option data-label="info" value="ETC">기타</option>
	              </select>
			</div>
            </div>
            <div class="mb-3" style="display:none;">
              <label class="form-label" for="eventURL">Event URL</label>
              <input type="text" class="form-control" id="eventURL" name="eventURL" value="">
            </div>
            <div class="mb-3 select2-primary" style="display:none;">
              <label class="form-label" for="eventGuests">Add Guests</label>
              <div class="position-relative"><select class="select2 select-event-guests form-select select2-hidden-accessible" id="eventGuests" name="eventGuests" multiple="" data-select2-id="eventGuests" tabindex="-1" aria-hidden="true">
                <option data-avatar="1.png" value="Jane Foster">Jane Foster</option>
                <option data-avatar="3.png" value="Donna Frank">Donna Frank</option>
                <option data-avatar="5.png" value="Gabrielle Robertson">Gabrielle Robertson</option>
                <option data-avatar="7.png" value="Lori Spears">Lori Spears</option>
                <option data-avatar="9.png" value="Sandy Vega">Sandy Vega</option>
                <option data-avatar="11.png" value="Cheryl May">Cheryl May</option>
              </select>
				</div>
            </div>
            <div class="mb-3" style="display:none;">
              <label class="form-label" for="eventLocation">Location</label>
              <input type="text" class="form-control" id="eventLocation" name="eventLocation">
            </div>
            <div class="mb-3">
              <label class="form-label" for="writer">작성한 학생</label>
              <input type="text" class="form-control" id="writer" name="writer" value="">
            </div>
            <div class="mb-3">
              <label class="form-label" for="stuNum">작성할 학생</label>
              <input type="text" class="form-control" id="stuNum" name="stuNum" value="<%=user%>">
            </div>
            <div class="mb-3">
              <label class="form-label" for="sNum">방번호</label>
              <input type="text" class="form-control" id="sNum" value="<%=sNum%>">
            </div>
            <div class="mb-3">
              <label class="form-label" for="eventDescription">일정 내용</label>
              <textarea class="form-control" name="eventDescription" id="eventDescription"></textarea>
            </div>
            <div class="mb-3 d-flex justify-content-sm-between justify-content-start my-4">
              <div>
                <button type="submit" id="fullCalenderSubmit" class="btn btn-primary btn-add-event me-sm-3 me-1">저장</button>
                <button type="reset" class="btn btn-label-secondary btn-cancel me-sm-0 me-1" data-bs-dismiss="offcanvas">취소</button>
              </div>
              <div><button class="btn btn-label-danger btn-delete-event d-none">삭제</button></div>
            </div>
          <input type="hidden">

          </form>
        </div>
      </div>


    </div>
    <!-- /Calendar & Modal -->
  </div>
</div>


          </div>
            <!-- /Connections -->
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

<!-- fullcalendar -->

<script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>

<script src="/resources/sneat/assets/vendor/js/menu.js"></script>
<script	src="/resources/sneat/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="/resources/sneat/assets/js/main.js"></script>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script src="/resources/sneat/calendarjs/study-calendar-events.js"></script>
<script src="/resources/sneat/calendarjs/study-calendar.js"></script>

<script src="/resources/sneat/assets/vendor/libs/fullcalendar/fullcalendar.js"></script>

<script>

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







