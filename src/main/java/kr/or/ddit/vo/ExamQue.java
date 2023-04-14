package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class ExamQue {
	private int exmqueNum;
	private int exmNum;
	private String sbjNum;
	private String examqueQue;
	private String examqueAns;


	private String ansAns;
	private String stuNmKor;
	//각 문제에 대한 항목
	private List<ExamSel> examSelList;
}
