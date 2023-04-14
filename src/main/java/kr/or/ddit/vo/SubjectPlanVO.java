package kr.or.ddit.vo;

import lombok.Data;

@Data
public class SubjectPlanVO {
	private String spNum;
	private String sbjNum;
	private int spMiddleratio;
	private int spFinalratio;
	private int spHwratio;
	private int spAttratio;
	private int spEtcratio;
	private int spOnlineyn;
	private String spTextbook;
}
