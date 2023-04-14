package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;
@Data
public class LectureEvaVO {
	// 기존 LectureEva
	private int lelNum;				//항목번호
	private String lelContent;		//항목내용
	private String leNum;			//강의평가 번호
	private String clNum;			//수강목록번호
	private String sbjNum;			//과목번호
	private int stuNum;				//학생번호
	private String leRePLY;			//강의평가 과목별답변
	
	private String raAnswer;
	private String sbjTitle;		//과목명
	private String teaNmKor;		//교수이름
	private int count;				//각 과목당 작성한게 있는지 없는지 숫자로 표현
	
	private List<ReplyAnswerVO> replyAnswerList;

}
