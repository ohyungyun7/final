package kr.or.ddit.tuition.service;

import java.util.Map;

public interface SmsService {
	// 문자 보내고 저장
	public int insertSms(Map<String, Object> map);

}
