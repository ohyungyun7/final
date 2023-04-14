package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.ScholarshipVO;

@Repository
public interface ScholarshipMapper {
	// 추천받은 학생 리스트 가져오기 - 관리자
	public List<ScholarshipVO> admScholarshipList();

	// 추천 받은 학생 1명의 정보 가져오기 - 관리자
	public ScholarshipVO showNum(Map<String, Object> map);

	// 승인 받은 학생 1명의 정보 가져오기 - 관리자
	public ScholarshipVO paymentNum(Map<String, Object> map);

	// 추천 받은 학생 승인하기 - 관리자
	public int approvePost(ScholarshipVO scholarshipListVO);

	// 장학금 내역 리스트 가져오기 - 학생
	public List<ScholarshipVO> stuScholarshipList(Map<String, Object> map);

	// 추천 받은 학생 승인하기 - 관리자
	public int updateState(Map<String, Object> map);

	// 추천 받은 학생 반려하기 - 관리자
	public int updateState2(Map<String, Object> map);

	// 장학금 지급 승인하기 - 관리자
	public int updateState3(Map<String, Object> map);

	// 승인여부 리스트 가져오기 - 관리자
	public List<ScholarshipVO> paymentsList();

	// 승인 후 수혜내역으로 insert - 관리자
	public int insertRedetail(Map<String, Object> map);

	// 승인 후 추천에서 delete - 관리자
	public int deleteRecomm(int parseInt);

	// 학과의 학생 전체 리스트 조회 - 교수
	public List<ScholarshipVO> deptStudentList(Map<String, Object> map);

	// 학과의 학생 1명의 정보 가져오기 - 교수
	public ScholarshipVO deptNum(Map<String, Object> map);

	// 교수가 추천한 장학생 리스트 가져오기 - 교수
	public List<ScholarshipVO> deptProList(Map<String, Object> map);

	// 교수가 장학생 추천 - 교수
	public int insertRecommend(Map<String, Object> map);

	// 추천 받은 학생 1명의 정보 가져오기 - 교수
	public ScholarshipVO waitNum(Map<String, Object>map);

	// 해당 학번이 장학생 추천 테이블에 있는지 없는지 확인
	public int countRecomm(int stuNum);
}
