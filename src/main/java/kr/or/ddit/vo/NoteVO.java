package kr.or.ddit.vo;

import java.util.Date;

//import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class NoteVO {
	private int noteNum;
	private int noteSend;
	private String sendNm;
	private int noteRev;
	private String revNm;
	private String noteTitle;
	private String noteContent;
//	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date noteDt;
	private int noteStatus;
	private String photo;

	public NoteVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public NoteVO(NoteVO vo) {
		super();
		this.noteNum = vo.noteNum;
		this.noteSend = vo.noteSend;
		this.sendNm = vo.sendNm;
		this.noteRev = vo.noteRev;
		this.revNm = vo.revNm;
		this.noteTitle = vo.noteTitle;
		this.noteContent = vo.noteContent;
		this.noteDt = vo.noteDt;
		this.noteStatus = vo.noteStatus;
	}


	
	
}
