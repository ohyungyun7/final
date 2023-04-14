package kr.or.ddit.vo;

import lombok.Data;

@Data
public class AcaDeptVO {
	//학과 번호
	private int deptNum;
	//단과대 번호
	private int collNum;
	//학과명
	private String deptNm;
	//학과 정원
	private int deptNumber;
	//학과 등록금
	private int deptFees;
}
