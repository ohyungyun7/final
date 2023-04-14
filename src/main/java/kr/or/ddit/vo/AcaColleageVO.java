package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class AcaColleageVO {
	//단과대번호
	private int collNum;
	//단과대명
	private String collNm;
	//학과 목록
	private List<AcaDeptVO> acaDeptList;
}
