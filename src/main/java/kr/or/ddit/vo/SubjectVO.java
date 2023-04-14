package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class SubjectVO {
	private String sbjNum;
	private int deptNum;
	private int teaNum;
	private String sbjTitle;
	private int sbjGrade;
	private int sbjRecode;
	private int sbjPersonnel;
	private int sbjYn;
	private String sbjComre;
	private int sbjOc;
	private int sbjRs;
	private int currentData;
	
	private double clFscore;
	public String roomLect;//강의실이름 ex) 자연
	public String teaNmKor;//교수명
	public String timeTcode;//강의실명
	private String deptNm;//학과명DEPT_NM
	private List<TimeVO> timeTcodeList;
	private int count;
	private int rank;
	private String sumAtCheck;//출석의 총 점수
	private String sumAtWeek;//1주차부터 15주차까지의 합 360이 되야 다 출석 체크 한거임 360 이하는 출석체크 빠트린거임
}
