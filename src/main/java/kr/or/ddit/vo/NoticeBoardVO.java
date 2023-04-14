package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeBoardVO {

	private int nbNum;
	private int empNum;
	private String nbTitle;
	private String nbContent;
	private Date nbDt;
	private int nbHit;
	private String nbCate;
	private String nbRead;
	
	private int rnum;
	private MultipartFile[] files;
	
	private List<NoticeBoardFileVO> fileVOList;
	
}
