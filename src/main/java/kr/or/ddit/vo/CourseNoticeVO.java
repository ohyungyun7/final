package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CourseNoticeVO {
	private int rowNum;
	private int snNum;
	private String sbjNum;
	private String snTitle;
	private String snContent;
	private String teaNmKor; 
	private Date snDt;
	private String snFilename;
	private int snHit;
	private int snRead;
	
	private int teaNum;
}