package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class CourseListVO {
	private String clNum;
	private String sbjNum;
	private String stuNum;
	private String clSemester;
	private String clFscore;
	private String sbjTitle;
	private String count;
	private String countFscore;
	private String avgClFscore;
	

	private String sbjRs;//전공필수, 전공선택, 교양과목
	private String agrade;//A+ , A , B...
	private String sbjRecode;//해당 과목의 부여 학점
	private String sumclSemester;	//해당 학기에들은 과목의 갯수
	private String sumsbjRecode;	//해당 학기에들은 과목의 총 학점
	private String avgclFscoree;	    //해당 학기에들은 과목의 평균점수
	private String sumRecode;			//교양들은 총 학점
	private int avgClFscoresss;		//학생의 총 평균
	private String rslt;			//직전학기 성적으로 최대 수강학점 가져오기
	private String rnum;			//행번호
	private String stuNmKor;		//한국이름
	private String deptNm;			//학과명
	private String stuPn;			//폰번호
	
	
	private String csYear;
	private String csSemester;
	private String countSbjNum;
	private String sumSbjRecodee;
	
	private String yearr;
	private String gkrrl;
	private String teaNmKor;
	
	private String subFscore;
	private String goCheck;
}
