package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ColleageVO {

	private int collNum;
	private String collNm;
	//,b.dept_num ,b.dept_nm , c.stu_nm_kor ,count(b.dept_num) count

	private String deptNum;
	private String deptNm;
	private String stuNmKor;
	private int count;
	//private String
}
