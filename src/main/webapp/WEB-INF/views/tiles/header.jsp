<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@page import="kr.or.ddit.vo.UserVO"%>
<%@page import="org.apache.catalina.Session"%>
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/spinkit/spinkit.css" />

<%
	UserVO userVO = (UserVO) session.getAttribute("userVO");
	if(userVO != null){
%>

<script>
//실시간 알림
var userId ;
var alarmCnt = localStorage.getItem("alarmCnt");

window.onload = function() {
	userId = <%=userVO.getUsername()%>

    updateData();
}


function updateData(){
	var data =  "userId=" + userId;

	$.ajax({
		url: "/msg/alarm.do",
		type:"post",
// 		contentType:"application/json;charset=utf-8",
		data: data, //JSON.stringify(data),
		dataType: "json",
		beforeSend : function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(data){
			$(".unreadNumber").html(data);
			if(data == 0){
// 				console.log("가져온 알림 없음");
			}else if(alarmCnt == -1){
				// 최초의 알람
				alarmCnt = data;
				localStorage.setItem("alarmCnt", alarmCnt);
				Swal.fire({
				  icon: 'info',
				  html: '<a href="/msg/messageList">안 읽은 쪽지 확인하기</a>',
				  toast: true,
				  position: 'top-end',
				  timerProgressBar: true,
				  showConfirmButton: false,
				  timer: 3000,
				  didOpen: (toast) => {
					    toast.addEventListener('mouseenter', Swal.stopTimer)
					    toast.addEventListener('mouseleave', Swal.resumeTimer)
				  },
				  showCloseButton: true,
				  closeButtonHtml: '<i class="fas fa-times position-absolute"></i>'
				});
				
			}else if(alarmCnt<data){
				// 실시간 알람
				alarmCnt = data;
				localStorage.setItem("alarmCnt", alarmCnt);

				Swal.fire({
				  icon: 'info',
				  html: '<a href="/msg/messageList">새로운 쪽지 도착</a>',
				  toast: true,
				  position: 'top-end',
				  timerProgressBar: true,
				  showConfirmButton: false,
				  timer: 3000,
				  didOpen: (toast) => {
					    toast.addEventListener('mouseenter', Swal.stopTimer);
					    toast.addEventListener('mouseleave', Swal.resumeTimer);
				  },
				  showCloseButton: true,
				  closeButtonHtml: '<i class="fas fa-times position-absolute"></i>'
				});
			}else {
				// 알람이 없음
				alarmCnt = data;
			};
			
				getUpdateData();
		}
	});
    timerID = setTimeout("updateData()", 2000); // 2초 단위로 갱신 처리
//     clearTimeout(timerID); // 타이머 중지
}


function getUpdateData(){
	var data =  "userId=" + userId;
	$.ajax({
		url: "/msg/alarmList.do",
		type:"get",
// 		contentType:"application/json;charset=utf-8",
		data: data,
		dataType: "json",
		beforeSend : function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(data){
			var unreadData = "";
			if(data == 0 || data == null || data.length === 0){
				var unreadData = "";
				unreadData += '<li class="list-group-item dropdown-notifications-item" style="background-color: #f9f9f9;">                 ';
				unreadData += '<div class="d-flex align-items-center py-3 text-center">                                                    ';
				unreadData += ' <div class="flex-shrink-0 me-3">                                                                           ';
				unreadData += ' <div class="avatar">  </div></div>                                                                         ';
				unreadData += '<span style="color: #a2a2a2;">읽지 않은 쪽지가 없습니다.</span>                                             ';
				unreadData += '</div>                                                                                                      ';
				unreadData += '</li>                                                                                                       ';
				$(".unreadList").html(unreadData);
			}else{
				$.each(data, function(i, item){
					unreadData += '<li class="list-group-item list-group-item-action dropdown-notifications-item">                             ';
					unreadData += '<div class="d-flex">                                                                                        ';
					unreadData += '<div class="flex-shrink-0 me-3">                                                                            ';
					unreadData += '<div class="avatar">                                                                                        ';
	// 				console.log("photo : "+ item.photo );
					unreadData += '<img src="/resources/upload'+ item.photo +'" class="w-px-40 h-auto rounded-circle">     ';
					unreadData += '</div>                                                                                                      ';
					unreadData += '</div>                                                                                                      ';
					unreadData += '<div class="flex-grow-1">                                                                                   ';
					unreadData += '<h6 class="mb-1">' + item.noteTitle + '</h6>                                                                ';
					unreadData += '<p class="mb-0">' + item.sendNm + '</p>                                                                   ';
					
					var date = new Date(item.noteDt);
					var formattedDate = date.toLocaleString();
					
					unreadData += '<small class="text-muted">' + formattedDate + '</small>                                                       ';
					unreadData += '</div>                                                                                                      ';
					unreadData += '<div class="flex-shrink-0 dropdown-notifications-actions">                                                  ';
					unreadData += '<a href="javascript:void(0)"class="dropdown-notifications-read"><span class="badge badge-dot"></span></a>   ';
					unreadData += '<a href="javascript:void(0)" class="dropdown-notifications-archive"><span class="bx bx-x"></span></a>       ';
					unreadData += '</div>                                                                                                      ';
					unreadData += '</div>                                                                                                      ';
					unreadData += '</li>                                                                                                       ';
				});
				$(".unreadList").html(unreadData);
			}
		}
	});
}
</script>

<nav
	class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
	id="layout-navbar">

	<div
		class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none ">
		<a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
			<i class="bx bx-menu bx-sm "></i>
		</a>
	</div>


	<div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">


		<!-- Search -->
		<div class="navbar-nav align-items-center">
			<div class="nav-item navbar mb-0">
				<a class="nav-item nav-link px-0" onclick="voiceModalOpen(); speech_to_text();">
					<i class="bx bx-microphone bx-sm"></i>
				</a>
			</div>
			<div class="nav-item navbar mb-0">
				<span style="font-size: 2.0em;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
			</div>
			<div class="nav-item navbar mb-0">
				<a class="nav-item">
					<i class="bx bx-search bx-sm"></i>
					<span class="d-none d-md-inline-block text-muted">
						&nbsp;검색하기
					</span>
				</a>
			</div>
			<!-- test end -->
		</div>
		<!-- /Search -->

		<ul class="navbar-nav flex-row align-items-center ms-auto">

			<!-- 로그인 만료 세션 시간 -->
			<li>
			<span id="timer"></span>&nbsp;&nbsp;&nbsp;
			<button id="timeBtn" name="itmeBtn" type="button" class="btn btn-xs btn-secondary">시간연장</button>
			&nbsp;&nbsp;&nbsp;
			</li>
			<!-- 로그인 만료 세션 시간 -->

			<span style="font-size: 2.0em;">|&nbsp;&nbsp;</span>

			<!-- Notification -->
			<li
				class="nav-item dropdown-notifications navbar-dropdown dropdown me-3 me-xl-1">
				<a class="nav-link dropdown-toggle hide-arrow"
				href="javascript:void(0);" data-bs-toggle="dropdown"
				data-bs-auto-close="outside" aria-expanded="false"> <i
					class="bx bx-bell bx-sm"></i> <span
					class="badge bg-danger rounded-pill badge-notifications unreadNumber">0</span>
			</a>
				<ul class="dropdown-menu dropdown-menu-end py-0">
					<li class="dropdown-menu-header border-bottom">
						<div class="dropdown-header d-flex align-items-center py-3">
							<h5 class="text-body mb-0 me-auto">안 읽은 쪽지</h5>
							<a href="javascript:void(0)"
								class="dropdown-notifications-all text-body"
								data-bs-toggle="tooltip" data-bs-placement="top"
								aria-label="Mark all as read"
								data-bs-original-title="Mark all as read"><i
								class="bx fs-4 bx-envelope-open"></i></a>
						</div>
					</li>
					<li class="dropdown-notifications-list scrollable-container ps">
						<ul class="list-group list-group-flush unreadList">

						</ul>
						<div class="ps__rail-x" style="left: 0px; bottom: 0px;">
							<div class="ps__thumb-x" tabindex="0"
								style="left: 0px; width: 0px;"></div>
						</div>
						<div class="ps__rail-y" style="top: 0px; right: 0px;">
							<div class="ps__thumb-y" tabindex="0"
								style="top: 0px; height: 0px;"></div>
						</div>
					</li>
					<li class="dropdown-menu-footer border-top"><a
						href="/msg/messageList"
						class="dropdown-item d-flex justify-content-center p-3"> 쪽지 전체보기 </a></li>
				</ul>
			</li>
			<!--/ Notification -->
			<!-- User -->
			<li class="nav-item navbar-dropdown dropdown-user dropdown">
				<a	class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
					<div class="avatar avatar-online">
						<img id="smallpp" src="/resources/upload<%=userVO.getPhoto() %>" alt="" class="w-px-60 rounded-circle">
					</div>
				</a>
				<ul class="dropdown-menu dropdown-menu-end">
					<li><a class="dropdown-item"
						href="pages-account-settings-account.html">
							<div class="d-flex">
								<div class="flex-shrink-0 me-3">
									<div class="avatar avatar-online">
										<img src="/resources/upload<%=userVO.getPhoto() %>" alt=""	class="h-auto rounded-circle">
									</div>
								</div>
								<div class="flex-grow-1">
									<span class="fw-semibold d-block"><%=userVO.getName() %></span> <small
										class="text-muted"><%=userVO.getUsername() %></small>
								</div>
							</div>
					</a></li>
					<li>
						<div class="dropdown-divider"></div>
					</li>
					<li>
						<a class="dropdown-item" href="/main" >
							<i class='bx bx-home-smile me-2'></i>
							<span class="align-middle">홈</span>
						</a>
					</li>
					<li>
						<a class="dropdown-item" href="/student/mypagePWcheck">
							<i class="bx bx-user me-2"></i>
							<span class="align-middle">마이페이지</span>
						</a>
					</li>
					<li>
						<div class="dropdown-divider"></div>
					</li>
					<li>
						<form action="/logout" method="post">
							<button class="dropdown-item" type="submit">
								<i class='bx bx-power-off me-2'></i>
								<span class="align-middle">로그아웃</span>
							</button>
							<sec:csrfInput />
						</form>
					</li>
				</ul>
			</li>
			<!--/ User -->
		</ul>
	</div>

	<!-- Search Small Screens -->
<!-- 	<div class="navbar-search search-input-wrapper"> -->
<!-- 		<span class="twitter-typeahead" style="position: relative; display: inline-block;"> -->
<!-- 			<input type="text" class="form-control search-input container-xxl border-0 tt-input" placeholder="Search..." aria-label="Search..." autocomplete="off" spellcheck="false" dir="auto" style="position: relative; vertical-align: top;" /> -->
<!-- 			<pre aria-hidden="true" style="position: absolute; visibility: hidden; white-space: pre; font-family: &amp; amp; quot; Public Sans&amp;amp; quot; , -apple-system , BlinkMacSystemFont, &amp;amp; quot; Segoe UI&amp;amp; quot; , Oxygen , Ubuntu, Cantarell, &amp;amp; quot; Fira Sans&amp;amp; quot; , &amp; amp; quot; Droid Sans&amp;amp; quot; , &amp; amp; quot; Helvetica Neue&amp;amp; quot; , sans-serif; font-size: 15px; font-style: normal; font-variant: normal; font-weight: 400; word-spacing: 0px; letter-spacing: 0px; text-indent: 0px; text-rendering: auto; text-transform: none;"></pre> -->
<!-- 		</span> -->
<!-- 		<i class="bx bx-x bx-sm search-toggler cursor-pointer"></i> -->
<!-- 	</div> -->

</nav>
<%
	}
%>

<!-- 음성으로 검색하기 모달창 -->
<div class="modal modal-transparent fade" id="voiceModal"
	tabindex="-1" style="display: none;" aria-modal="true" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<a href="javascript:void(0);" class="btn-close text-white"
					data-bs-dismiss="modal" aria-label="Close"></a>
				<div class="row">
					<p class="text-white text-large fw-light mb-3 col-3" style="place-self: center;">
						<i class="bx bx-microphone bx-sm"></i>
						음성검색
					</p>
					<div class="col-4 mb-3">
						<div class="sk-wave sk-primary" id="wave">
				          <div class="sk-wave-rect"></div>
				          <div class="sk-wave-rect"></div>
				          <div class="sk-wave-rect"></div>
				          <div class="sk-wave-rect"></div>
				          <div class="sk-wave-rect"></div>
				        </div>
			        </div>
					<div class="col-5 mb-3">
						<button type="button" style="margin-left: 90px;"
						class="btn btn-sm btn-label-primary" id="speech" name="speech" onclick="speech_to_text()">다시 말하기</button>
					</div>
				</div>
				<div id="message" class="input-group input-group-lg mb-3">
					<input type="text" class="form-control bg-white border-0" id="stt" name="stt"
						placeholder="마이크에 검색할 내용을 말해주세요." aria-describedby="subscribe">
					<button class="btn btn-primary" type="button" id="vSerchBtn">검색</button>
				</div>
				<div class="text-start text-white opacity-50"></div>
			</div>
		</div>
	</div>
</div>

<!-- <script src="/resources/sneat/assets/vendor/libs/i18n/i18n.js"></script> -->
<script src="/resources/sneat/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
<script type="text/javascript" src="/resources/sneat/assets/js/extended-ui-sweetalert2.js"></script>
<!-- <script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script> -->
<script type="text/javascript">

$("#vSerchBtn").on("click", function(){
	let text = $("#stt").val();
		text = text.replace(/ /g, "");

	if(text == null || text == ''){
	  Swal.fire({
		    title: '검색어를 말해주세요.',
		    showClass: {
		      popup: 'animate__animated animate__bounceIn'
		    },
		    icon: 'warning',
		    customClass: {
		      confirmButton: 'btn btn-primary'
		    },
		    buttonsStyling: false
		  }).then(function(){
			 $("#speech").click();
		  });
	}

	let divList = document.querySelectorAll('div[data-i18n]');
// 	console.log("divList", divList);
// 	let aa = divList[0];
// 	console.log("aa", aa);
// 	let	ab = divList.item(0);
// 	console.log("ab", ab)
// 	let ac = divList.item(0).textContent;
// 	console.log("ac", ac);
// 	let pa = divList[0].parentNode;
// 	console.log("pa", pa);

	for(i = 0; i < divList.length; i++){
		let aside = divList.item(i).textContent;
		aside = aside.replace(/ /g, "");
		if(aside == text){
			let count = 1;
			divList[i].parentNode.click();
		}
	}

// 	if(count != 1){
// 	  Swal.fire({
// 		    title: '일치하는 검색어가 없습니다.',
// 		    showClass: {
// 		      popup: 'animate__animated animate__bounceIn'
// 		    },
// 		    icon: 'warning',
// 		    customClass: {
// 		      confirmButton: 'btn btn-primary'
// 		    },
// 		    buttonsStyling: false
// 		  }).then(function(){
// 			 $("#speech").click();
// 	}



});


function voiceModalOpen(){
	$("#voiceModal").modal("show");
}


var message = document.querySelector("#message");
var button = document.querySelector("#speech");
var korea = document.querySelector("#korea");
var english = document.querySelector("#english");
var isRecognizing = false;

if ('SpeechRecognition' in window) {
  // Speech recognition support. Talk to your apps!
//   console.log("음성인식을 지원하는 브라우저입니다.")
}
try {
    var recognition = new (window.SpeechRecognition || window.webkitSpeechRecognition || window.mozSpeechRecognition || window.msSpeechRecognition)();
} catch(e){
    console.error(e);
}
recognition.lang = 'ko-KR'; //선택하게 해줘야 할듯 .
recognition.interimResults = false;
recognition.maxAlternatives = 5;
//recognition.continuous = true;


function speech_to_text(){

    $("#stt").val("");
	$("#wave").css("visibility", "visible");
    recognition.start();
    isRecognizing = true;
   recognition.onstart = function(){
//         console.log("음성인식이 시작 되었습니다. 이제 마이크에 무슨 말이든 하세요.");
    }

   recognition.onspeechend = function(){
    }
   recognition.onresult = function(event) {
        // 결과를 출력
        var resText = event.results[0][0].transcript;
//         korea.innerHTML = resText;
       //text to sppech
//         text_to_speech(resText);
       $("#stt").val(resText);
       $("#wave").css("visibility", "hidden");
        return;
    };
   recognition.onend = function(){
        isRecognizing = false;
   }
}


function stop(){
    recognition.stop();
    isRecognizing = false;
}


// Text to speech
function text_to_speech(txt){
    // Web Speech API - speech synthesis
    if ('speechSynthesis' in window) {
     // Synthesis support. Make your web apps talk!
//          console.log("음성합성을 지원하는  브라우저입니다.");
    }
    var msg = new SpeechSynthesisUtterance();
    var voices = window.speechSynthesis.getVoices();
    //msg.voice = voices[10]; // 두번째 부터 완전 외국인 발음이 됨. 사용하지 말것.
    msg.voiceURI = 'native';
    msg.volume = 1; // 0 to 1
    msg.rate = 1.3; // 0.1 to 10
    //msg.pitch = 2; //0 to 2
    msg.text = txt;
    msg.lang = 'ko-KR';
   msg.onend = function(e) {
        if(isRecognizing == false){
            recognition.start();
        }
    };
    window.speechSynthesis.speak(msg);
}

</script>

<script>
/* 전역 변수 */
var initMinute;  // 최초 설정할 시간(min)
var remainSecond;  // 남은시간(sec)
var setTime = 1800;


$(document).ready(function(){
	   clearTime(setTime); // 세션 만료 적용 시간
	   setTimer();    // 문서 로드시 타이머 시작
	});


function clearTime(sec){ // 타이머 초기화 함수 (초단위)
   initMinute = sec;
   remainSecond = sec;
}

// function clearTime(min){ // 타이머 초기화 함수 (분단위)
//    initMinute = min;
//    remainSecond = min*60;
// }

function setTimer(){ // 1초 간격으로 호출할 타이머 함수

   // hh : mm 으로 남은시간 표기하기 위한 변수
   remainMinute_ = parseInt(remainSecond/60);
   remainSecond_ = remainSecond%60;

   if(remainSecond > 0){
      $("#timer").empty();
      $("#timer").append(Lpad(remainMinute_,2) + ":" + Lpad(remainSecond_,2));    // hh:mm 표기
      remainSecond--;
      setTimeout("setTimer()",1000); //1초간격으로 재귀호출!
   }else{
		Swal.fire({
			title: "로그인시간이 만료되어 로그아웃 되었습니다.",
			showClass: {
				popup: 'animate__animated animate__bounceIn'
			},
			icon: 'warning',
			customClass: {
				confirmButton: 'btn btn-primary'
			},
			buttonsStyling: false
		});
      sessionStorage.clear();
      location.href="/main";
   }
}

function Lpad(str,len){  // hh mm형식으로 표기하기 위한 함수
   str = str+"";
   while(str.length<len){
      str = "0"+str;
   }
   return str;
}

$("#timeBtn").on("click", function(){
	clearTime(setTime);
});

</script>

