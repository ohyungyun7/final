package kr.or.ddit.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value = "consultVO")
public class ConsultVO {
	private int crNum;
	private int stuNum;
	private int teaNum;
	private String timeCode;
	private int crType;
	private String crReason;
	private int crCheck;
	private String crComre;
	private Date crDt;
}
