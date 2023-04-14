package kr.or.ddit.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class UserVO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	// 아이디(학번, 교번, 사번)
	private int username;
	// 비밀번호
	private String password;
	
	private String enabled;
	
	// 권한
	private String auth;
	// 사용자 이름
	private String name;
	// 사용자 프로필사진
	private String photo;
	
	// 학생 및 교수 학과번호
	private int deptNum;
	// 학과명
//	private String deptNm;
	// 학생 학적상태
	private int status;
	// 교수 전공
	private String major;

}


