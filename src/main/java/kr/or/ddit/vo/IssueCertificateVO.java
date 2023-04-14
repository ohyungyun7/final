package kr.or.ddit.vo;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value = "issueCertificateVO")
public class IssueCertificateVO {
	private String icNum;
	private String ctSnum;
	private int stuNum;
	private Date icDt;
	private String icUsage;
}
