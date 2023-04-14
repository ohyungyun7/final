package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ScholarshipVO {
	private int slNum;
	private String slNm;
	private int slAmt;

	private String slNumber;
	private String slWon;
	private int sreNum;//장학금 추천 기본키
	private int stuNum;
	private int stuNum1;
	private int paymentNum;
	private String stuNmKor;
	private String stuPn;
	private String deptNm;
	private int srNum;
	private String sreYn;
	private String srYn;
	private int showStuNum;
	private int teaNum;
	private String sreReason;
	private String sreComre;
	private String sreSemester;
	private String srSemester;
	private String sreYear;
	private String sreYsemester;
	private String srYsemester;
	private int deptNum;
	private String nowDate;
	private String srDate;
}
