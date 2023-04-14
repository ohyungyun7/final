package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class DepartmentNoticeVO {
	
	private int dnNum;
	private int teaNum;
	private String dnTitle;
	private String dnContent;
	private Date dnDt;
	private int dnHit;
	private int dnRead;
	private int deptNum;
	
	private int rnum;	
	private String name;
	private String chk;
	
	private MultipartFile[] files;
	
	private List<DepartmentFileVO> dfVOList;

}
