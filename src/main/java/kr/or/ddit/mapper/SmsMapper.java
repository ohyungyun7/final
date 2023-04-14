package kr.or.ddit.mapper;

import java.util.Map;

import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;


@Repository
public interface SmsMapper {
	// 문자 보내고 저장
	public int insertSms(Map<String, Object> map);

}
