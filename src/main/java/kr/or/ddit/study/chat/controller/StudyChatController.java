package kr.or.ddit.study.chat.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.google.gson.Gson;

import kr.or.ddit.study.chat.service.StudyChatService;
import kr.or.ddit.vo.ChatMessageVO;
import kr.or.ddit.vo.StudyChatVO;
import kr.or.ddit.vo.WsSessionVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@ServerEndpoint(value = "/studyChatServer.do", configurator = ServerEndpointConfigurator.class)
public class StudyChatController{
	
	@Autowired
	StudyChatService studyChatService;
	
	//유저 집합 리스트
	private static Map<Integer, List<WsSessionVO>> sessionUsersMap = 
			Collections.synchronizedMap(new HashMap<Integer, List<WsSessionVO>>());

	private SimpleDateFormat sdf = new SimpleDateFormat("a hh:mm");
	
	private BufferedOutputStream bos;
	private BufferedOutputStream realBos;
//	    private String path = "d:/d_other/연습용/";   // 파일이 저장될 폴더 지정
    private String realPath = "C:\\eGovFrameDev-3.10.0-64bit\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\sik\\resources\\upload\\chat\\";   // 파일이 저장될 폴더 지정
    private String path = "C:\\eGovFrameDev-3.10.0-64bit\\workspace\\sik\\src\\main\\webapp\\resources\\upload\\chat\\";   // 파일이 저장될 폴더 지정
    private String fileName = "";
    
    
	/**
	 * 웹 소켓으로부터 메시지가 오면 호출한다.
	 * @param message 메시지
	 * @param userSession
	 * @throws IOException
	 */
	@OnMessage
	public void handleMessage(String message, Session userSession) throws IOException{
		// JSON구조의 문자열로 온 메시지를 객체형으로 변환한다.
		Gson gson = new Gson();
		ChatMessageVO chatMessageVo = gson.fromJson(message, ChatMessageVO.class);
		
		// command : connect, open, close, message
		// chatMessage : 학번        	 / message
		// sNum : 스터디 번호
		// name : 학생 명
		String command = chatMessageVo.getCommand();
		String chatMessage = chatMessageVo.getMessage();
		int sNum = chatMessageVo.getSNum(); 
		String name = chatMessageVo.getName();
		
		// onOpen 대신 첫 연결 처리
		if("connect".equals(command) ){
			userSession.getUserProperties().put("sNum", sNum);
			userSession.getUserProperties().put("stuNmKor", name);
			// Map에 List가 없으면 추가
			if(!sessionUsersMap.containsKey(sNum)) {
				sessionUsersMap.put(sNum, new ArrayList<WsSessionVO>() );
			} 
			int stuNum = Integer.parseInt(chatMessage);
			WsSessionVO newVo = new WsSessionVO(stuNum, name, userSession, 0);
			sessionUsersMap.get(sNum).add(newVo);
			
			// 전체 채팅 리스트를 가져와서 true, 채팅내용, 보낸사람, 안읽은 사람수를
			// 반복문을 통해서 하나씩 jsp로 전송
			StudyChatVO paramVO = new StudyChatVO(sNum, stuNum);
			List<StudyChatVO> chatList = studyChatService.getChatList(paramVO);
			log.info("chatList : " + chatList);
			for(StudyChatVO chatVO : chatList) {
				String isConn = "true";
				if(chatVO.getScTitle().contains("/resources/upload/chat/img")) {
					isConn = "img";
				}
				userSession.getBasicRemote().sendText(buildJsonTextMessage(isConn, chatVO.getScNum(), chatVO.getScTitle(), chatVO.getStuNmKor(), chatVO.getScSenddt(), chatVO.getReadCount()));
			}
			
			// 처음 연결했을때 쌓여있는 메시지 알림 수 전송
			int count = studyChatService.getMsgCount(paramVO);
			userSession.getBasicRemote().sendText(buildJsonTextMessage("true", -1, count + "", "countMsg", "", -1));
		}

		// 채팅창을 열었을 때
		if("open".equals(command)) {
			StudyChatVO paramVO = new StudyChatVO(sNum, Integer.parseInt(chatMessage));
			for(WsSessionVO wsVO : sessionUsersMap.get(sNum)) {
				if(wsVO.getSession() == userSession) {
					wsVO.setStatus(1);
					studyChatService.updateLast(paramVO);
					break;
				}
			}
			// 누가 채팅창을 열어서 읽으면 refresh
			List<StudyChatVO> chatList = studyChatService.getChatList(paramVO);
			for(WsSessionVO wsVO : sessionUsersMap.get(sNum)) {
				for(StudyChatVO chatVO : chatList) {
					wsVO.getSession().getBasicRemote().sendText(buildJsonTextMessage("refresh", chatVO.getScNum(), chatVO.getScTitle(), chatVO.getStuNmKor(), chatVO.getScSenddt(), chatVO.getReadCount()));
				}
			}
		}
		
		// 채팅창을 닫았을 때
		if("close".equals(command)) {
			for(WsSessionVO wsVO : sessionUsersMap.get(sNum)) {
				if(wsVO.getSession() == userSession) {
					wsVO.setStatus(0);
				}
			}
		}
		
		// 메시지가 오면
		if("message".equals(command) ){
			Date date = new Date();
			WsSessionVO sessionVO = null;
			int cnt = 0;
			
			// 보낸 사람 VO 찾기 >> 학번 가져오기 위함
			for(WsSessionVO wsVO : sessionUsersMap.get(sNum)) {
				if(wsVO.getSession() == userSession) {
					sessionVO = wsVO;
					break;
				}
			}
			// 찾은 VO에서 학번을 가져와서 테이블에 insert
			StudyChatVO chatVO = new StudyChatVO(sNum, sessionVO.getStuNum());
			chatVO.setScTitle(chatMessage);
			int chatNum = studyChatService.insertChat(chatVO);
			
			for(WsSessionVO wsVO : sessionUsersMap.get(sNum)) {
				// 채팅창이 열려있는 유저의 읽은 채팅 카운트 update
				if(wsVO.getStatus() == 1) {
					StudyChatVO scVO = new StudyChatVO(sNum, wsVO.getStuNum());
					studyChatService.updateLast(scVO);
				}
				// 채팅창이 닫혀있는 사람 카운트
				if(wsVO.getStatus() == 0) cnt++;
			}
			
			int stuCount = studyChatService.getStuCount(sNum);
			cnt += stuCount - sessionUsersMap.get(sNum).size();
			
			sendToAll(sNum, buildJsonTextMessage("false", chatNum, chatMessage, name, sdf.format(date).toString(), cnt));
		}
		
		// 받은 명령이 파일일때
		if("img".equals(command) || "file".equals(command)) {
			
			String msg = chatMessage;
			
			File filePath = new File(path + command);
			File fileRealPath = new File(realPath + command);
			if(!filePath.exists()) {
				filePath.mkdirs();
			}
			
			if(!fileRealPath.exists()) {
				fileRealPath.mkdirs();
			}
			
			// 클라이언트에서 파일이 끝났다는 신호로 "end" 문자열을 보낸다.
	        // msg가 end가 아니라면 파일로 연결된 스트림을 연다.
	        if(!msg.equals("end")){
	            UUID uid = UUID.randomUUID();
	        	
	        	fileName = uid + "_" + msg;
	        	
	            File file = new File(filePath.getPath(), fileName);
	            File realFile = new File(fileRealPath.getPath(), fileName);
	            try {
	                bos = new BufferedOutputStream(new FileOutputStream(file));
	                realBos = new BufferedOutputStream(new FileOutputStream(realFile));
	            } catch (FileNotFoundException e) {
	                e.printStackTrace();
	            }
	            
	        // msg가 'end'가 왔다면 전송이 완료되었음을 알리는 신호이므로 outputstream을 닫아준다.
	        }else{
	            try {
	                bos.flush();
	                realBos.flush();
	                bos.close();
	                realBos.close();
	            } catch (IOException e) {
	                e.printStackTrace();
	            }

				Date date = new Date();
				WsSessionVO sessionVO = null;
				int cnt = 0;
				
				// 보낸 사람 VO 찾기 >> 학번 가져오기 위함
				for(WsSessionVO wsVO : sessionUsersMap.get(sNum)) {
					if(wsVO.getSession() == userSession) {
						sessionVO = wsVO;
						break;
					}
				}
				StudyChatVO chatVO = new StudyChatVO(sNum, sessionVO.getStuNum());
				String file = "/resources/upload/chat/" + command + "/" + fileName;
				chatVO.setScTitle(file);
				int chatNum = studyChatService.insertChat(chatVO);
				
				for(WsSessionVO wsVO : sessionUsersMap.get(sNum)) {
					// 채팅창이 열려있는 유저의 읽은 채팅 카운트 update
					if(wsVO.getStatus() == 1) {
						StudyChatVO scVO = new StudyChatVO(sNum, wsVO.getStuNum());
						studyChatService.updateLast(scVO);
					}
					// 채팅창이 닫혀있는 사람 카운트
					if(wsVO.getStatus() == 0) cnt++;
				}
				
				int stuCount = studyChatService.getStuCount(sNum);
				cnt += stuCount - sessionUsersMap.get(sNum).size();
				
				sendToAll(sNum, buildJsonTextMessage(command, chatNum, chatVO.getScTitle(), name, sdf.format(date).toString(), cnt));
	        }
		}
		
	}
	
	/**
	 * 해당 채팅방 전체에게 메시지를 보낸다.
	 * @param sNum 채팅방이름
	 * @param message 메시지
	 * @throws IOException
	 */
	public void sendToAll(int sNum, String message) throws IOException{
		for(WsSessionVO wsVO : sessionUsersMap.get(sNum)) {
			wsVO.getSession().getBasicRemote().sendText(message);
		}
	}
	
	/**
	 * 웹소켓을 닫으면 해당 유저를 유저리스트에서 뺀다.
	 * @param userSession
	 * @throws IOException */
	@OnClose
	public void handleClose(Session userSession) throws IOException{
		int sNum = (int) userSession.getUserProperties().get("sNum");
		log.info("sNum 접속 종료 : " + sNum);
		
		Iterator<WsSessionVO> chatIter = sessionUsersMap.get(sNum).iterator();
		while(chatIter.hasNext()){
			WsSessionVO wsVo = chatIter.next();
			if(userSession.equals(wsVo.getSession())){
				//sessionUsers.remove(chatVo);
				chatIter.remove();
			}
		}
		if(sessionUsersMap.get(sNum).size() < 1) {
			// 접속한 멤버가 하나도 없으면 리스트를 삭제한다.
			sessionUsersMap.remove(sNum);
		}
		
	}
	
	/**
     * 웹 소켓이 에러가 나면 호출되는 이벤트
     * @param t
     */
    @OnError
    public void handleError(Throwable t){
        t.printStackTrace();
    }
    
	/**
	 * json타입의 메시지 만들기
	 * @param username
	 * @param message
	 * @return
	 */
	private String buildJsonTextMessage(String isConn, int chatNum, String chatMessage, String name, String date, int readCount) {
		Gson gson = new Gson();
		Map<String, String> jsonMap = new HashMap<String, String>();
		
		if(chatMessage != null) {
			jsonMap.put("isConn", isConn);
			jsonMap.put("chatNum", chatNum + "");
			jsonMap.put("message", chatMessage);
			jsonMap.put("name" , name);
			jsonMap.put("date" , date);
		}
		if(readCount != -1) {
			jsonMap.put("readCount", readCount + "");
		}
		
		String strJson = gson.toJson(jsonMap);
		log.info("strJson : " + strJson);
		
		return strJson;
	}
	
	// 바이너리 데이터가 오게되면 호출된다.
    @OnMessage
    public void processUpload(ByteBuffer msg, boolean last, Session session) {
        
        while(msg.hasRemaining()){
            try {
                bos.write(msg.get());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        
        msg.position(0);
        
        while(msg.hasRemaining()){
        	try {
        		realBos.write(msg.get());
        	} catch (IOException e) {
        		e.printStackTrace();
        	}
        }
    }
    
}
