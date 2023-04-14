package kr.or.ddit.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;


@Data
public class CourseAssignmentVO {
	//행번호
	private int rowNum;
	//과제 번호
	private int asNum;
	//주차 번호
	private String siNum;
	//과제 제목
	private String asTitle;
	//과제 내용
	private String asContent;
	//강의계획서 번호
	private String spNum;
	//과목 번호
    private String sbjNum;
    //과제 시작날짜
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date asSdt;
    //과제 종료날짜
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date asEdt;
    
    //제출 번호
    private int sbmNum;
}
