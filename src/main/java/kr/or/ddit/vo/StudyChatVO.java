package kr.or.ddit.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value = "studyChatVO")
public class StudyChatVO {
	private int scNum;
	private int sNum;
	private int stuNum;
	private String stuNmKor;
	private String scTitle;
	private String scSenddt;
	private int readCount;
	
	
	public StudyChatVO() {}
	
	public StudyChatVO(int sNum, int stuNum) {
		this.sNum = sNum;
		this.stuNum = stuNum;
	}

	public int getSNum() {
		return sNum;
	}

	public void setSNum(int sNum) {
		this.sNum = sNum;
	}
	
	
}
