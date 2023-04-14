
package kr.or.ddit.common.controller;
/*
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import kr.or.ddit.vo.UserVO;
*/

//@Controller
//@ServerEndpoint(value="/msgA.do")
public class ReplyEchoHandler {
/*	List<WebSocketSession> sessions = new ArrayList<>();
	Map<String, WebSocketSession> userSessions = new HashMap<>();
	
	public void afterConnectionEstablished(Session session) throws Exception{
		System.out.println("afterConnectionEstablished:" + session);
//		sessions.add(session);
//		String senderId = getId(session);
//		userSessions.put(senderId, session);
	}
	
	protected void handleTextMessage(Session session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage:" + session + " : " + message);
		String senderId = getId(session);
//		for (WebSocketSession sess: sessions) {
//			sess.sendMessage(new TextMessage(senderId + ": " + message.getPayload()));
//		}
		
		//protocol: 보낸 사람, 받는 사람, 제목, 시간, 글번호  (ex: reply,user2,user1,234)
		String msg = message.getPayload();
		if (StringUtils.isNotEmpty(msg)) {
			String[] strs = msg.split(",");
			if (strs != null && strs.length == 5) {
				
//				WebSocketSession boardWriterSession = userSessions.get(boardWriter);
//				if ("reply".equals(cmd) && boardWriterSession != null) {
//					TextMessage tmpMsg = new TextMessage(replyWriter + "님이 "
//							+ "<a href='/board/read?bno=" + bno + "'>" + bno + "</a>번 게시글에 댓글을 달았습니다!");
//					boardWriterSession.sendMessage(tmpMsg);
//				}
			}
		}
	}
	
	private String getId(Session session) {
		UserVO userVO = null;
		if (null == userVO)
			return session.getId();
		else
			return userVO.getUsername()+"";
	}
	
	public void afterConnectionClosed(Session session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionEstablished:" + session + ":" + status);
	}
*/
}

/*
<script>
var userId = document.getElementById("username");

var socket = null;
$(document).ready( function() {
    connectWS();	
});

function connectWS() {
    console.log("connectWS() 실행");
//     "ws://localhost/replyEcho?bno=1234"
    var ws = new WebSocket("ws://localhost/message");
    socket = ws;

    ws.onopen = function () {
        console.log('Info: connection opened.');
        ws.send(createMessage("open", userId));
    };

    ws.onmessage = function (event) {
        console.log("ReceiveMessage:", event.data+'\n');
        let $socketAlert = $('div#socketAlert');
        $socketAlert.html(event.data);
        $socketAlert.css('display', 'block');
        
        setTimeout( function() {
        	$socketAlert.css('display', 'none');
        }, 3000);
    };

    ws.onclose = function (event) { 
        console.log('Info: connection closed.');
        //setTimeout( function(){ connect(); }, 1000); // retry connection!!
    };
    ws.onerror = function (err) { console.log('Error:', err); };
}

</script> 
 */
