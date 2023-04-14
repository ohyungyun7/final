package kr.or.ddit.tuition.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.SmsMapper;
import kr.or.ddit.tuition.service.SmsService;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class SmsServiceImpl implements SmsService {

	@Autowired
	SmsMapper smsMapper;
	@Override
	public int insertSms(Map<String, Object> map) {
		log.info("=======================================================================");
		log.info("insertSms에서 파라미터 map의 값 : "+map);
		log.info("=======================================================================");
		return smsMapper.insertSms(map);
	}


	
}
