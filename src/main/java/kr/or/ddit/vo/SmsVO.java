package kr.or.ddit.vo;

import lombok.Data;

@Data
public class SmsVO {
	// 기존 Sms
	private int smsNum;			//문자발송번호
	private String smsContent;  //문자발송내용
	private String smsDt;		//문자발송시간
	private String smsPn;		//문자수신번호
	private String smsNm;		//문자수신이름

}
