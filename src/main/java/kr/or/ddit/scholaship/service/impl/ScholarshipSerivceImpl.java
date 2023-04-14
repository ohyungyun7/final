package kr.or.ddit.scholaship.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.ScholarshipMapper;
import kr.or.ddit.scholaship.service.ScholarshipService;
import kr.or.ddit.vo.ScholarshipVO;
import lombok.extern.slf4j.Slf4j;

//스프링이 인식하여 자바빈 객체로 등록해줌
@Slf4j
@Service
public class ScholarshipSerivceImpl implements ScholarshipService {
	// DI(의존성 주입)
	@Autowired
	ScholarshipMapper scholarshipMapper;

	// 추천받은 학생 리스트 가져오기 - 관리자
	@Override
	public List<ScholarshipVO> admScholarshipList() {
		return scholarshipMapper.admScholarshipList();
	}

	// 추천 받은 학생 1명의 정보 가져오기 - 관리자
	@Override
	public ScholarshipVO showNum(Map<String, Object> map) {
		return scholarshipMapper.showNum(map);
	}

	// 승인 받은 학생 1명의 정보 가져오기 - 관리자
	@Override
	public ScholarshipVO paymentNum(Map<String, Object> map) {
		return scholarshipMapper.paymentNum(map);
	}

	// 장학금 내역 리스트 가져오기 - 학생
	@Override
	public List<ScholarshipVO> stuScholarshipList(Map<String, Object> map) {
		return scholarshipMapper.stuScholarshipList(map);
	}

	// 추천 받은 학생 승인하기
	@Override
	public int updateState(Map<String, Object> map) {
		return scholarshipMapper.updateState(map);
	}

	// 추천 받은 학생 반려하기
	@Override
	public int updateState2(Map<String, Object> map) {
		return scholarshipMapper.updateState2(map);
	}

	// 승인여부 리스트 가져오기 - 관리자
	@Override
	public List<ScholarshipVO> paymentsList() {
		return scholarshipMapper.paymentsList();
	}

	// 승인 후 수혜내역으로 insert - 관리자
	@Override
	public int insertRedetail(Map<String, Object> map) {
		return scholarshipMapper.insertRedetail(map);
	}

	// 승인 후 추천에서 delete - 관리자
	@Override
	public int deleteRecomm(int parseInt) {
		return scholarshipMapper.deleteRecomm(parseInt);
	}

	// 학과의 학생 전체 리스트 조회 - 관리자
	@Override
	public List<ScholarshipVO> deptStudentList(Map<String, Object> map) {
		return scholarshipMapper.deptStudentList(map);
	}

	// 학과의 학생 1명의 정보 가져오기 - 관리자
	@Override
	public ScholarshipVO deptNum(Map<String, Object> map) {
		return scholarshipMapper.deptNum(map);
	}

	// 교수가 추천한 장학생 리스트 가져오기 - 교수
	@Override
	public List<ScholarshipVO> deptProList(Map<String, Object> map) {
		return scholarshipMapper.deptProList(map);
	}

	// 교수가 학생 장학금 추천
	@Override
	public int insertRecommend(Map<String, Object> map) {
		return scholarshipMapper.insertRecommend(map);
	}

	@Override
	public ScholarshipVO waitNum(Map<String, Object> map) {
		return scholarshipMapper.waitNum(map);
	}

	// 장학금 지급 승인하기 - 관리자
	@Override
	public int updateState3(Map<String, Object> map) {
		return scholarshipMapper.updateState3(map);
	}

	@Override
	public int countRecomm(int stuNum) {
		return scholarshipMapper.countRecomm(stuNum);
	}

}
