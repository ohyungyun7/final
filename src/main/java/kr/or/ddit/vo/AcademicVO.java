package kr.or.ddit.vo;

import lombok.Data;

@Data
public class AcademicVO {
	//학적변동 번호
	private int acNum;
	//학생학번
	private int stuNum;
	//학적변동사유
	private String acReason;
	//학적변동종류
	private int acList;
	//학적변동시작일
	private String acSdt;
	//학적변동종료일
	private String acEdt;
	//학적변동승인여부
	private int acCheck;
	//학적변동반려사유
	private String acComre;
}
