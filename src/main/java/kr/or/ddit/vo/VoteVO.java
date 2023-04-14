package kr.or.ddit.vo;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class VoteVO {

	private int voteNum;
	private int sNum;
	private String voteTitle;
	private Date voteEnddt;
	private int voteAdmin;
	private String period;

	private String[] voters;
	private List<VotersVO> votersList;

	private int yes;
	private int no;
	private int participation;
	private int voteAns;
	
	private String voteDate;

}
