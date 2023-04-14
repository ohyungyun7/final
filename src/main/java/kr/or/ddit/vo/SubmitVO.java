package kr.or.ddit.vo;

import lombok.Data;

@Data
public class SubmitVO {
	private int sbmNum;
	private int sbmAnum;
	private String sbmContent; 
	private String sbmFilename;
	private int sbmScore;
	private int stuNum;
}
