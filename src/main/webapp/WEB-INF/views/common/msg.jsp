<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
@charset "UTF-8";

*{
	box-sizing: border-box;
}

#chatt{
	width: 800px;
	margin: 20px auto;
}

#chatt #talk{
	width: 800px;
	height: 400px;
	overflow: scroll;
	border : 1px solid #aaa;
}
#chatt #msg{
	width: 740px;
	height:100px;
	display: inline-block;
}

#chatt #sendZone > *{
	vertical-align: top;
	
}
#chatt #btnSend{
	width: 54px;
	height: 100px;
}

#chatt #talk div{
	width: 70%;
	display: inline-block;
	padding: 6px;
	border-radius:10px;
	
}

#chatt .me{
	background-color : #ffc;
	margin : 1px 0px 2px 30%;	
}

#chatt .other{
	background-color : #eee;
	margin : 2px;
}
</style>
<h3>여기는 알림 연습 페이지</h3>
<div id='chatt'>
		<h1>WebSocket Chatting</h1>
		<input type='text' id='mid' value='홍길동'>
		<input type='button' value='로그인' id='btnLogin'>
		<br/>
		<div id='talk'></div>
		<div id='sendZone'>
			<textarea id='msg' value='hi...' ></textarea>
			<input type='button' value='전송' id='btnSend'>
		</div>
	</div>
	
<script type="text/javascript">
function getId(id){
	return document.getElementById(id);
}

var data = {};//전송 데이터(JSON)

var ws ;
var mid = getId('mid');
var btnLogin = getId('btnLogin');
var btnSend = getId('btnSend');
var talk = getId('talk');
var msg = getId('msg');

btnLogin.onclick = function(){
	try {
			ws = new WebSocket("ws://" + location.host + "/message");
		} catch (error) {
		  console.error('웹소켓을 만들지 못 했다 :', error);
		}
	
	ws.onopen = function () {
//         console.log('테스트: connection opened.');
    };
	
	ws.onmessage = function(msg){
		var data = JSON.parse(msg.data);
		var css;
		
		if(data.mid == mid.value){
			css = 'class=me';
		}else{
			css = 'class=other';
		}
		
		var item = `<div ${css} >
		                <span><b>${data.mid}</b></span> [ ${data.date} ]<br/>
                      <span>${data.msg}</span>
						</div>`;
					
		talk.innerHTML += item;
		talk.scrollTop=talk.scrollHeight;//스크롤바 하단으로 이동
	}
}

msg.onkeyup = function(ev){
	if(ev.keyCode == 13){
		send();
	}
}

btnSend.onclick = function(){
	send();
}

function send(){
	if(msg.value.trim() != ''){
		data.mid = getId('mid').value;
		data.msg = msg.value;
		data.date = new Date().toLocaleString();
		var temp = JSON.stringify(data);
		ws.send(temp);
	}
	msg.value ='';
	
}
</script>