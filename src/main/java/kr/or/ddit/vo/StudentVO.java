package kr.or.ddit.vo;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class StudentVO implements Serializable {
	private static final long serialVersionUID = 1L;

	// 학생 student VO

	// 기존 테이블 컬럼명
	private int stuNum;
	private int deptNum;
	private String stuNmKor;
	private String stuNmEng;
	private int stuReg1;
	private int stuReg2;
	private String stuEmail;
	private String stuPn;
	private String stuPhoto;
	private String stuMs;
	private String stuHdc;
	private String stuNation;
	private int stuZip;
	private String stuAddr1;
	private String stuAddr2;
	private String stuMinor;
	private String stuDmajor;
	private String stuBank;
	private String stuAccount;
	private int stuStatus;
	private String stuSemester;

	private int count;
	private String stuGrade;

	// DB에 default값이 없음
	public StudentVO() {
		stuMs = "N";
		stuHdc = "N";
		stuNation = "대한민국";
	}

	// 효미) 추가
	private String auth;
	private String password;
	private String grade;
	private String deptNm;
	private String collNm;
	private String stustat;
	private String birth;
	private MultipartFile image;
	private String chk;
	private String clSemester;
	private String year;
	private int year2;

	public void setSemester(String semester) {
		this.stuSemester = semester.replace("학기", "");
	}

}
