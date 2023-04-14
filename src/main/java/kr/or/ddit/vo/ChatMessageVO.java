package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ChatMessageVO{
	private String command;
	private int sNum;
	private String message;
	private String name;
	
	public ChatMessageVO() {}

	public ChatMessageVO(String command, int sNum, String message, String name) {
		super();
		this.command = command;
		this.sNum = sNum;
		this.message = message;
		this.name = name;
	}

	public int getSNum() {
		return sNum;
	}

	public void setSNum(int sNum) {
		this.sNum = sNum;
	}
	
}
