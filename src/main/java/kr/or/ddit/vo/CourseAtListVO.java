package kr.or.ddit.vo;

import lombok.Data;

@Data
public class CourseAtListVO {
	//학생 학번
	private int stuNum;
	//시간코드
	private String timeTcode;
	//출석 주차
	private int atWeek;
	//출석체크
	private double atCheck;
}
