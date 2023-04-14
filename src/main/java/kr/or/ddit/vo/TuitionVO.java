package kr.or.ddit.vo;

import lombok.Data;

@Data
public class TuitionVO {
	//기존 Tuition 
	private int tpNum;			//기본키
	private int stuNum;			//학생학번
	private String tpSemester;  //학기
	private String tpDt;		//등록금 납부일자
	private String tpYn;		//등록금 납부 여부, 상태
	private int tpAmt;			//등록금

	//추가된 항목
	private String tpYear;	 	//년도
	private int slAmt;			//장학금액
	private int toTal;			//등록금액 - 장학금액
	private String deptNm; 		//학과
	private String stuNmkor;	//학생이름
	private String stuPn;		//학생핸드폰번호
	private int tuitionNum;		//학생학번 상세보기
	
}
