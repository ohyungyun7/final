package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class StudyVO {
	private int sNum;
	private int stuNum;
	private String sNm;
	private Date sDt;
	private int sGrade;
	private int sCount;
	private String od;
	
	// 참여중인 학생 수
	private int stuCount;

	public int getsNum() {
		return sNum;
	}

	public void setsNum(int sNum) {
		this.sNum = sNum;
	}

	public String getsNm() {
		return sNm;
	}

	public void setsNm(String sNm) {
		this.sNm = sNm;
	}

	public Date getsDt() {
		return sDt;
	}

	public void setsDt(Date sDt) {
		this.sDt = sDt;
	}

	public int getsGrade() {
		return sGrade;
	}

	public void setsGrade(int sGrade) {
		this.sGrade = sGrade;
	}

	public int getsCount() {
		return sCount;
	}

	public void setsCount(int sCount) {
		this.sCount = sCount;
	}
}
