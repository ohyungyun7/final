package kr.or.ddit.vo;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AdminVO implements Serializable {
	private static final long serialVersionUID = 1L;

	// 직원 employee VO
	
	private int empNum;						//관리자 사번
	private String empNmKor;				//관리자 이름(한글)
	private String empNmEng;				//관리자 이름(영문)
	private String empPhoto;				//관리자 프로필사진
	private String empPn;					//관리자 연락처
	private String empEmail;				//관리자 이메일
	private int empReg1;					//관리자 주민번호 앞
	private int empReg2;					//관리자 주민번호 뒤
	private String empNation;               //관리자 국적
	private String empZip;                  //관리자 우편번호
	private String empAddr1;                //관리자 주소
	private String empAddr2;                //관리자 상세주소
	private String empGroup;                //관리자 소속
	private String empDp;                   //관리자 부서
	private String empTitle;                //관리자 직함
	private String empMs;                   //관리자 병역여부
	private String empHdc;                  //관리자 장애여부
	private String empBank;                 //관리자 은행
	private String empAccount;              //관리자 계좌번호

	private String auth;
	private String password;
	private String birth;
	private MultipartFile image;
	private String chk;
	
	private int empNum1;              //관리자 사번  
	private String empNmKor1;         //관리자 이름(한
	private String empNmEng1;         //관리자 이름(영
	private String empGroup1;         //관리자 소속
	private String empDp1;            //관리자 부서  
	private int empReg3;              //관리자 주민번호 
	private int empReg4;              //관리자 주민번호
	private String empEmail1;         //관리자 이메일
	private String empPn1;            //관리자 연락처  
	private String empZip1;           //관리자 우편번호
	private String empAddr3;          //관리자 주소  
	private String empAddr4;          //관리자 상세주소
}                                      
