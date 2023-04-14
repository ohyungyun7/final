package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class CourseVO {
	 //과목번호
	 private String sbjNum;
	 //교번
	 private int teaNum;
	 //과목명
	 private String sbjTitle;
	 //교수명
	 private String teaNmKor;
	 //학번
	 private int stuNum;
	 //강의시간
	 private List<LectureTmVO> ltList;
}
