<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="kr.or.ddit.vo.UserVO"%>
<%@page import="org.apache.catalina.Session"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet"
	href="/resources/sneat/assets/vendor/libs/fullcalendar/fullcalendar.css" />
<link rel="stylesheet"
	href="/resources/sneat/assets/vendor/libs/flatpickr/flatpickr.css" />

<!-- Page CSS -->

<link rel="stylesheet"
	href="/resources/sneat/assets/vendor/css/pages/app-calendar.css" />

<style>

.fc-scroller.fc-scroller-liquid-absolute{
	overflow: hidden;
}

.months{
	margin-left: 30px;
	margin-right: 20px;
	margin-top: 15px;

}

.nav-link a_month{
	padding-left: 5px;
	padding-right: 10px;
}
</style>

<script>
$(".search-input-wrapper").css("display", "none");
const csrfHeaderName = "${_csrf.headerName}";
const csrfToken = "${_csrf.token}";
// 미리 week버튼 클릭되게 하기.
// window.onload= function(){
// 	$(".fc-button-primary[title='week view']").click();
// };

$(function(){

// 	$(".container-xxl flex-grow-1 container-p-y").css("padding-top", "0px");
// 	$(".card-body pb-0").css("padding-top", "0px");

	$("div[class='fc-header-toolbar fc-toolbar '").css("display", "none");

	let cur_month = $(".fc-toolbar-title").text();
	const arr = cur_month.split(" ");
	cur_month = arr[0];

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
	$("#mon").text(cur_month + "월");

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

});

</script>

<!-- fullcalendar -->
<%
	UserVO userVO = (UserVO) session.getAttribute("userVO");
	int username =userVO.getUsername();
	String user = username + "";

	String auth = userVO.getAuth();
%>
<input type="hidden" id="auth" value="<%=auth %>" />
<input type="hidden" id="cur_month" value="" />
<br/>
<div class="col-12">
	<div class="card">
	<div class="card body">
		<ul class="nav nav-pills flex-md-row mb-3" style="text-align: center;">
		      <li class="nav-item months">
		      	<button style="padding-left: 35px; padding-right: 15px;" type="button" class="nav-link a_month" id="1" >1월</button>
		      </li>
		      <li class="nav-item months">
		      	<button style="padding-left: 15px; padding-right: 15px;" type="button" class="nav-link a_month" id="2" >2월</button>
		      </li>
		      <li class="nav-item months">
		      	<button style="padding-left: 15px; padding-right: 15px;" type="button" class="nav-link a_month" id="3" >3월</button>
		      </li>
		      <li class="nav-item months">
		      	<button style="padding-left: 15px; padding-right: 15px;" type="button" class="nav-link a_month" id="4" >4월</button>
		      </li>
		      <li class="nav-item months">
		      	<button style="padding-left: 15px; padding-right: 15px;" type="button" class="nav-link a_month" id="5" >5월</button>
		      </li>
		      <li class="nav-item months">
		      	<button style="padding-left: 15px; padding-right: 15px;" type="button" class="nav-link a_month" id="6" >6월</button>
		      </li>
		      <li class="nav-item months">
		      	<button style="padding-left: 15px; padding-right: 15px;" type="button" class="nav-link a_month" id="7" >7월</button>
		      </li>
		      <li class="nav-item months">
		      	<button style="padding-left: 15px; padding-right: 15px;" type="button" class="nav-link a_month" id="8" >8월</button>
		      </li>
		      <li class="nav-item months">
		      	<button style="padding-left: 15px; padding-right: 15px;" type="button" class="nav-link a_month" id="9" >9월</button>
		      </li>
		      <li class="nav-item months">
		      	<button style="padding-left: 15px; padding-right: 15px;" type="button" class="nav-link a_month" id="10" >10월</button>
		      </li>
		      <li class="nav-item months">
		      	<button style="padding-left: 15px; padding-right: 15px;" type="button" class="nav-link a_month" id="11" >11월</button>
		      </li>
		      <li class="nav-item months">
		      	<button style="padding-left: 15px; padding-right: 15px;" type="button" class="nav-link a_month" id="12" >12월</button>
		      </li>
		</ul>
	</div>
	</div>
</div>

<div class="container-xxl flex-grow-1 container-p-y">
<div class="row">
      <div class="col-md-7">
        <div class="card">
          <div class="card-body">
            <!-- Connections -->
<div class="container-xxl flex-grow-1 container-p-y">


<div class="app-calendar-wrapper">
  <div class="row g-0">
    <!-- Calendar Sidebar -->


    <div class="col app-calendar-sidebar" id="app-calendar-sidebar" style="display: none;">
      <div class="border-bottom p-4 my-sm-0 mb-3">
        <div class="d-grid">
          <button class="btn btn-primary btn-toggle-sidebar" data-bs-toggle="offcanvas" data-bs-target="#addEventSidebar" aria-controls="addEventSidebar">
            <i class="bx bx-plus me-1"></i>
            <span class="align-middle">Add Event</span>
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
          <small class="text-small text-muted text-uppercase align-middle">Filter</small>
        </div>

        <div class="form-check mb-2">
          <input class="form-check-input select-all" type="checkbox" id="selectAll" data-value="all" checked="">
          <label class="form-check-label" for="selectAll">View All</label>
        </div>

        <div class="app-calendar-events-filter">
          <div class="form-check form-check-danger mb-2">
            <input class="form-check-input input-filter" type="checkbox" id="select-personal" data-value="personal" checked="">
            <label class="form-check-label" for="select-personal">Personal</label>
          </div>
          <div class="form-check mb-2">
            <input class="form-check-input input-filter" type="checkbox" id="select-business" data-value="business" checked="">
            <label class="form-check-label" for="select-business">Business</label>
          </div>
          <div class="form-check form-check-warning mb-2">
            <input class="form-check-input input-filter" type="checkbox" id="select-family" data-value="family" checked="">
            <label class="form-check-label" for="select-family">Family</label>
          </div>
          <div class="form-check form-check-success mb-2">
            <input class="form-check-input input-filter" type="checkbox" id="select-holiday" data-value="holiday" checked="">
            <label class="form-check-label" for="select-holiday">Holiday</label>
          </div>
          <div class="form-check form-check-info">
            <input class="form-check-input input-filter" type="checkbox" id="select-etc" data-value="etc" checked="">
            <label class="form-check-label" for="select-etc">ETC</label>
          </div>
        </div>
      </div>
    </div>
    <!-- /Calendar Sidebar -->

    <!-- Calendar & Modal -->
    <div class="col app-calendar-content">
      <div class="card shadow-none">
     	<div class="card-header">
          <h6 style="text-align: center;">2023년도</h6>
          <h4 id="mon" style="text-align: center;"></h4>
        </div>
        <div class="card-body pb-0 border">
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
            <div class="fv-plugins-message-container invalid-feedback"></div></div>
            <div class="mb-3 fv-plugins-icon-container">
              <label class="form-label" for="eventStartDate">시작 날짜</label>
              <input type="text" class="form-control flatpickr-input" id="eventStartDate" name="eventStartDate" placeholder="Start Date" readonly="readonly">
            <div class="fv-plugins-message-container invalid-feedback"></div></div>
            <div class="mb-3 fv-plugins-icon-container">
              <label class="form-label" for="eventEndDate">종료 날짜</label>
              <input type="text" class="form-control flatpickr-input" id="eventEndDate" name="eventEndDate" placeholder="End Date" readonly="readonly">
            <div class="fv-plugins-message-container invalid-feedback"></div></div>
            <div class="mb-3" style="display: none;">
              <label class="switch">
                <input type="checkbox" class="switch-input allDay-switch" value="true">
                <span class="switch-toggle-slider">
                  <span class="switch-on"></span>
                  <span class="switch-off"></span>
                </span>
                <span class="switch-label">All Day</span>
              </label>
            </div>
            <div class="mb-3">
              <label class="form-label" for="eventLabel">일정 종류</label>
              <div class="position-relative">
	              <select class="select2 select-event-label form-select select2-hidden-accessible" id="eventLabel" name="eventLabel" data-select2-id="eventLabel" tabindex="-1" aria-hidden="true">
	                <option data-label="primary" value="Business" selected="" data-select2-id="2">일반일정</option>
	                <option data-label="danger" value="Personal">중요일정</option>
	                <option data-label="info" value="Family">시험일정</option>
<!-- 	                <option data-label="success" value="Holiday">Holiday</option> -->
<!-- 	                <option data-label="info" value="ETC">ETC</option> -->
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
            <div class="mb-3" style="display: none;">
              <label class="form-label" for="username1">로그인 한 사람</label>
              <input type="text" class="form-control" id="username1" value="<%=user%>">
            </div>
            <div class="mb-3" style="display:none;">
              <label class="form-label" for="username2">작성자</label>
              <input type="text" class="form-control" id="username2" name="username2" value="">
            </div>
            <div class="mb-3" style="display:none;">
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
            <div><button type="button" id="autoBtn" class="btn btn-label-secondary btn-cancel me-sm-0 me-1">자동채우기</button></div>

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
      </div>


      <div class="col-md-5 col-12">
        <div class="card">
          <h5 class="card-header" style="padding-bottom: 0px; text-align: center; font-weight: bold;">학사 상세일정</h5>
          <div class="card-body">
          <div class="demo-inline-spacing mt-3" id="detailEvent"></div>
          </div>
        </div>
      </div>
    </div>
</div>


<!-- fullcalendar -->

<script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>

<script src="/resources/sneat/assets/vendor/js/menu.js"></script>
<script	src="/resources/sneat/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="/resources/sneat/assets/js/main.js"></script>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script src="/resources/sneat/calendarjs/acad-calendar-events.js"></script>
<script src="/resources/sneat/calendarjs/acad-calendar.js"></script>

<script
	src="/resources/sneat/assets/vendor/libs/fullcalendar/fullcalendar.js"></script>


<!-- build:js assets/vendor/js/core.js -->
<!-- <script src="/resources/sneat/assets/vendor/libs/select2/select2.js"></script> -->
<!-- <script src="/resources/sneat/assets/vendor/libs/flatpickr/flatpickr.js"></script> -->
<!-- <script src="/resources/sneat/assets/js/app-calendar.js"></script> -->
<!-- <script src="/resources/sneat/assets/js/app-calendar-events.js"></script> -->


<script>

$(function(){

	$(".a_month").on("click", function(){

		$(".a_month").removeClass("active");
		$("#detailEvent").empty();

		let month = $(this).attr("id");
		$("#mon").text(month + "월");

		$("#cur_month").val(month);

		data = {"month" : month};
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

// 		console.log("month : " + month);

		let cur_month = $(".fc-toolbar-title").text();
// 		console.log("cur_month : " + cur_month);

		const arr = cur_month.split(" ");
		cur_month = arr[0];
// 		console.log("afer cur_month : " + cur_month);

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
// 		console.log("number cur_month : " + cur_month);

// 		console.log("지금 월 : " + cur_month);

		let count = month - cur_month;
// 		console.log("count : " + count);
		if(count < 0){
			count = count * -1;
// 			console.log("after count : " + count);
			for(var i = 0; i < count; i++){
				$("button[title='Previous month']").click();
			}
		}else if(count > 0){
			for(var i = 0; i < count; i++){
				$("button[title='Next month']").click();
			}
		}
		$(this).addClass("active");
	});

});
</script>







