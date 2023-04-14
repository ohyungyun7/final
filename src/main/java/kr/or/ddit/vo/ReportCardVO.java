package kr.or.ddit.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("reportCardVO")
public class ReportCardVO {
	private String rcNum;
	private String clNum;
	private String sbjNum;
	private int stuNum;
	private int rcAttscore;
	private int rcMtest;
	private int rcFtest;
	private int rcHw;
	private int rcEtc;
	private int rcFscore;
	private String goList;
	private String goReason;

	private String stuSemester;
	private String stuNmKor;
	private String deptNm;
	private String goReply;

}
