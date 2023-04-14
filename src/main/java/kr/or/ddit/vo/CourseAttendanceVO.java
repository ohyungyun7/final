package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class CourseAttendanceVO { 
	//학생이름(한글)
	private String stuNmKor;
	//학생 학번
	private int stuNum;
	//학과 번호
	private String deptNm;
	//출석 수
	private int attend;
	//지각 수
	private int late;
	//결석 수
	private int absent;
	//출석 리스트
	private List<CourseAtListVO> atList;
}
