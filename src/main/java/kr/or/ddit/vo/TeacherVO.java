package kr.or.ddit.vo;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class TeacherVO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	// 교수 teacherVO

	private int teaNum;
	private int deptNum;
	private String teaNmKor;
	private String teaNmEng;
	private String teaPn;
	private int teaReg1;
	private int teaReg2;
	private String teaEmail;
	private String teaPhoto;
	private String teaZip;
	private String teaAddr1;
	private String teaAddr2;
	private String major;
	private String teaLnum;
	private String teaLnm;
	private String teaNation;
	private String teaTitle;
	private String teaBank;
	private String teaAccount;
	private String teaHdc;

	private String auth;
	private String password;
	private String collNm;
	private String deptNm;
	private MultipartFile image;
	private String birth;
	private String chk;

	private int teaNum1;
	private String teaNmKor1;
	private String teaNmEng1;
	private String teaPn1;
	private int teaReg3;
	private int teaReg4;
	private String teaEmail1;
	private String teaZip1;
	private String teaAddr3;
	private String teaAddr4;
	private String major1;
	private String teaTitle1;
	private String teaBank1;
	private String teaAccount1;
	private int deptNum1;
	private String deptNm1;

	private String year;
	private String clSemester;
}
