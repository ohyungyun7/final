<%@page import="kr.or.ddit.vo.UserVO"%>
<%@page import="kr.or.ddit.vo.StudyVO"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	StudyVO studyVO = (StudyVO) session.getAttribute("studyVO");
	int forChatSNum = studyVO.getsNum();
	int forChatId = studyVO.getStuNum();
	UserVO forChatUserVO = (UserVO) session.getAttribute("userVO");
	String forChatName = forChatUserVO.getName();
%>
<script type="text/javascript">
let chat_userId = "<%=forChatId %>";
let chat_userName = "<%=forChatName %>";
let chat_sNum = "<%=forChatSNum %>";
let chat_imgPath = "/resources/upload/chat";
</script>

<link rel="stylesheet" href="/resources/css/studyChat.css">
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>

<div class="openChat chatBox" id="openChat">
	<img class="openChat" src="/resources/images/off.png" id="chatImgIcon">
	<p class="badge bg-danger rounded-pill badge-notifications" id="countMsg"></p>
</div>

<div class="col app-chat-history" id="main-container">
	<div class="chat-history-wrapper">
		<div class="chat-history-header border-bottom" id="chatTopBar">
			<div class="d-flex justify-content-between align-items-center">
				<div class="d-flex overflow-hidden align-items-center">
					<i class="bx bx-menu bx-sm cursor-pointer d-lg-none d-block me-2"
						data-bs-toggle="sidebar" data-overlay=""
						data-target="#app-chat-contacts"></i>
					<div class="flex-shrink-0 avatar"></div>
					<div class="chat-contact-info flex-grow-1 ms-3"></div>
				</div>
				<div class="d-flex align-items-center">
					<i class='bx bx-x' id="closeChat"></i>
				</div>
			</div>
		</div>
		<div class="chat-history-body ps ps--active-y">
			<ul class="list-unstyled chat-history mb-0" id="chat-container"></ul>
		</div>
		<!-- Chat message form -->
		<div class="chat-history-footer"  id="bottom-container">
			<div class="form-send-message d-flex justify-content-between align-items-center ">
				<input id="messageText" class="form-control message-input border-0 me-3 shadow-none" placeholder="Type your message here...">
				<div class="message-actions d-flex align-items-center">
					<!--               <i class="speech-to-text bx bx-microphone bx-sm cursor-pointer"></i> -->
					<label for="file" class="form-label mb-0">
						<i class="bx bx-paperclip bx-sm cursor-pointer mx-3" style="color: #ffffff;"></i>
						<input type="file" id="file" style="display:none;" >
						<input id="send" type="button" value="send" style="display:none;">
					</label>
					<button class="btn btn-primary d-flex send-msg-btn"
						 id="btn_sendText" onclick="sendMessage()"
						 style="background: #ffffff; color: #000000;">
						<i class="bx bx-paper-plane me-md-1 me-0"></i> <span
							class="align-middle d-md-inline-block d-none">Send</span>
					</button>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 채팅 스크립트 -->
<script>
$("#openChat").draggable({handle: "#chatImgIcon"});
$("#main-container").draggable({handle: "#chatTopBar"});

var messageTextArea = document.getElementById("chat-container");
var messageText = document.getElementById("messageText")

$(function (){
	//웹소켓 초기화
	webSocket = new WebSocket("ws://192.168.145.10/studyChatServer.do");
// 	webSocket = new WebSocket("ws://localhost/studyChatServer.do");

	// 채팅창 켜기
	$("#openChat").on("click", function() {
		$("#openChat").css("display", "none");
		$("#main-container").css("display", "block");
		$("#countMsg").text("");
		$("#countMsg").css("padding", "0px");
		webSocket.send(createMessage("open", chat_userId));
		$('#chat-container').scrollTop($('#chat-container')[0].scrollHeight+100);
	});

	// 채팅창 끄기
	$("#closeChat").on("click", function() {
		$("#openChat").css("display", "block");
		$("#main-container").css("display", "none");
		webSocket.send(createMessage("close", chat_userId));
	});

	// 스터디 입장
	webSocket.onopen = function onOpen(event){
		webSocket.binaryType="arraybuffer";
		webSocket.send( createMessage("connect", chat_userId) );
	}

	//메시지가 오면
	webSocket.onmessage = function onMessge(message){
		//Json 풀기
		var jsonData = JSON.parse(message.data);

		var chatNum = jsonData.chatNum;
		var name = jsonData.name;
		var message = jsonData.message;
		var isConn = jsonData.isConn;
		var date = jsonData.date;
		var readCount = (jsonData.readCount == 0)? '' : jsonData.readCount;

		// 메시지 추가
		if(name == "countMsg"){
			if(message != '0'){
				$("#countMsg").text(message);
				$("#countMsg").css("padding", "0.2rem 0.4rem");
			}
			return;
		}

		if(isConn == "refresh"){
			var chatArr = [];
			if(name == chat_userName){
				chatArr = $(".my-chat-box");

			}else{
				chatArr = $(".chat-box");
			}
			$.each(chatArr, function(i, v) {
				if($(v).find('.chatNum').val() == chatNum){
					$(v).find(".readCount").text(readCount);
				}
			});
			return;
		}

		var chat = "";
		if(name == chat_userName){
			chat += '<li class="chat-message chat-message-right my-chat-box">';
			chat += '	<div class="d-flex overflow-hidden">                                      ';
			chat += '		<div class="chat-message-wrapper flex-grow-1">                        ';
			chat += '			<div class="chat-message-text" style="text-align: right;">        ';
			chat += '				<small class="readCount">' + readCount + '</small>   ';
			if(message.indexOf(chat_imgPath) != -1){
				if(isConn == 'img'){
					chat += '				<span class="mb-0 chat"><a href="' + message + '" download ><img src="' + message + '" alt="(만료된 이미지 입니다)" /></a></span>   ';
				}else{
					let fileName = message.substr(message.indexOf("_")+1);
					chat += '<span class="mb-0 chat"><a href="' + message + '" download="' + fileName + '" ><i class="bx bxs-download">' + fileName + '</i></a></span>';
				}
			}else{
				chat += '				<span class="mb-0 chat">' + message + '</span>   ';
			}
			chat += '			</div>                                                            ';
			chat += '			<div class="text-end text-muted mt-1 me-2">                            ';
			chat += '				<small>' + date + '</small>                                       ';
			chat += '			</div>                                                            ';
			chat += '		</div>                                                                ';
			chat += '	</div>                                                                    ';
		}else{
			chat += '<li class="chat-message chat-box">                                                        ';
			chat += '	<div class="d-flex overflow-hidden ms-2">                                                   ';
			chat += '		<div class="chat-message-text name">' + name + '</div>                              ';
			chat += '		<div class="chat-message-wrapper flex-grow-1">                                     ';
			chat += '			<div class="chat-message-text">                                                ';
			if(message.indexOf(chat_imgPath) != -1){
				if(isConn == 'img'){
					chat += '				<span class="mb-0 chat"><a href="' + message + '" download ><img src="' + message + '" alt="(만료된 이미지 입니다)" /></a></span>   ';
				}else{
					let fileName = message.substr(message.indexOf("_")+1);
					chat += '<span class="mb-0 chat"><a href="' + message + '" download="' + fileName + '" ><i class="bx bxs-download"></i>' + fileName + '</a></span>';
				}
			}else{
				chat += '				<span class="mb-0 chat">' + message + '</span>   ';
			}
			chat += '				 <small class="readCount">' + readCount + '</small>    ';
			chat += '			</div>                                                                         ';
			chat += '			<div class="text-muted mt-1 ms-2">                                                  ';
			chat += '				<small>' + date + '</small>                                                ';
			chat += '			</div>                                                                         ';
			chat += '		</div>                                                                             ';
			chat += '	</div>                                                                                 ';

			// 접속 상태에서 메시지가 오면
			if(isConn == 'false'){
				var status = $("#main-container").css("display");
				if(status != "none"){ // 채팅창이 켜진 상태라면 알람 = 0
					$("#countMsg").text('');
					$("#countMsg").css('padding', '0px');
				}else{	// 꺼진 상태라면 알림 +1
					var count = $("#countMsg").text();
					if(count == "") count = 0;
					count = parseInt(count) + 1;
					$("#countMsg").text(count);
					$("#countMsg").css("padding", "0.2rem 0.4rem");
				}
			}
		}
		chat += "<input type='hidden' class='chatNum' value=" + chatNum + " /></li>";
		$("#chat-container").append(chat);
		// 스크롤 아래로 유지
		$('#chat-container').scrollTop($('#chat-container')[0].scrollHeight+100);
	}

	webSocket.onerror = function showErrorMsg(event) {
		alert("오류 : " + event.data);
	}

	webSocket.onclose = function(event){
		messageTextArea.value = "";
		messageText.value = "";
	}

	$('#messageText').keydown(function(key){
		if(key.keyCode == 13){
			$('#messageText').focus();
			sendMessage();
		}
	})

	$("#file").on('change',function(){
		var fileName = $("#file").val().toString().split('/').pop().split('\\').pop();
		$("#messageText").val(fileName);
	});

	// 파일 전송
	$('#send').on('click', function() {
        var file = document.getElementById('file').files[0];

        if(file == null || file == ""){
			return;
		}

        let command = "";

        if(file.type.match("image.*")){
        	command = "img";
        }else{
        	command = "file";
        }

		webSocket.send( createMessage(command, file.name) );

        var reader = new FileReader();
        var rawData = new ArrayBuffer();

        reader.loadend = function() {    }

        reader.onload = function(e) {
            rawData = e.target.result;
            webSocket.send( rawData );		// 파일 내용 데이터 전송
            webSocket.send( createMessage(command, 'end') );		// 'end' 문자열 전송
        }
        reader.readAsArrayBuffer(file);
        $('#file').val("");
    });

})

// 메시지 구조  {"command" : "명령종류", "sNum" : "채팅방이름", "message" : "메시지" }
// 명령 종류 : "create" - 채팅방 만들기, "change" - 채팅방 이동, "message" - 메시지 전송, "connect" - 처음 접속

//메시지 보내기
function sendMessage(){
	if(messageText.value.trim()==""){
		messageText.focus();
		return;
	}

	var file = document.getElementById('file').files[0];
	if(file == null || file == ""){ // 파일이 없으면 텍스트 전송
		webSocket.send( createMessage("message", messageText.value) );
	}else{ // 파일이 있으면 사진전송 버튼 클릭처리
		$('#send').click();
	}

	messageText.value = "";
}


// 전송할 메시지를 작성하는 함수
function createMessage(command, message){
	return '{"command" : "' + command + '", "sNum" : "' + chat_sNum + '", "message" : "' + message + '", "name" : "' + chat_userName + '"}'
}

function closing(){
	webSocket.close();
}

window.onbeforeunload = function(){
	closing();
}
</script>