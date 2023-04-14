package kr.or.ddit.subject.controller;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

@Controller
@ServerEndpoint(value="/echo.do")
public class WebSocketChat {

    private static final List<Session> sessionList=new ArrayList<Session>();;
    private static final Logger logger = LoggerFactory.getLogger(WebSocketChat.class);
    public WebSocketChat() {
        System.out.println("웹소켓(서버) 객체생성");
    }

    @OnOpen
    public void onOpen(Session session) {
        logger.info("Open session id:"+session.getId());
        try {
            final Basic basic=session.getBasicRemote();
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        sessionList.add(session);
    }

    /*
     * 모든 사용자에게 메시지를 전달한다.
     * @param self
     * @param sender
     * @param message
     */
    private void sendAllSessionToMessage(Session self, String sender, String message) {

        try {
            for(Session session : WebSocketChat.sessionList) {
                if(!self.getId().equals(session.getId())) {
                	logger.info("전체 뿌리는 메세지에의 넘겨받은 message의 값 : "+message);
                	
                	String[] splits = message.split(",");
                	message = splits[0];
                	
                    session.getBasicRemote().sendText(message+"");	//나 말고 남한테 보임
                }
            }
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    /*
     * 내가 입력하는 메세지
     * @param message
     * @param session
     */
    @OnMessage
    public void onMessage(String message,Session session) {
    	logger.info("message의 값 : "+message);
    	
    	String[] splits = message.split(",");
    	logger.info(Arrays.toString(splits));
    	
    	String sender =splits[2];
    	String message2 = splits[1];
    	message = splits[0];
    	
    	
    	int count = Integer.parseInt(message);
    	
        try {
        	for(Session sess : sessionList) {
        		final Basic basic=sess.getBasicRemote();
        		basic.sendText(count+","+message2);
        	}
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        message = message + "," +splits;
        sendAllSessionToMessage(session, sender, message);
    }

    @OnError
    public void onError(Throwable e,Session session) {

    }

    @OnClose
    public void onClose(Session session) {
        logger.info("Session "+session.getId()+" has ended");
        sessionList.remove(session);
    }
}