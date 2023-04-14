package kr.or.ddit.vo;

import javax.websocket.Session;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value = "wsSessionVO")
public class WsSessionVO {
	private String stuNmKor;
	private int stuNum;
	private Session session;
	private int status;	// 0 : 채팅창 끈 상태 / 1: 킨 상태
	
	
	public WsSessionVO(int stuNum, String stuNmKor, Session session, int status) {
		super();
		this.stuNmKor = stuNmKor;
		this.session = session;
		this.stuNum = stuNum;
		this.status = status;
	}

	
}
