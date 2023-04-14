package kr.or.ddit.vo;

import lombok.Data;

@Data
public class CourseAtVO {
	//출석 번호
	private int atNum;
	//강의시간 번호
	private int ltNum;
	//출석 주차
	private int atWeek;
	//출석 학번
	private int atStuNum;
	//출석체크
	private double atCheck;
}
