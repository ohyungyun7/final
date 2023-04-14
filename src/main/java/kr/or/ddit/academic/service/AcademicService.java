package kr.or.ddit.academic.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AcaDeptVO;
import kr.or.ddit.vo.AcademicVO;

public interface AcademicService {

	/**
	 * (학생)학적정보 출력
	 * @param stuNum
	 * @return
	 */
	public Map<String, Object> getStuInfo(int stuNum);


	/**
	 * (학생)휴학 신청
	 * @param academicVO
	 * @return
	 */
	public int appLeave(AcademicVO academicVO);

	//(학생)각 학적변동 신청 건수 조회(처리상태:대기)
	public int getAcCnt(Map<String, Object> cntMap);

	//(학생)학적상태 조회
	public int getStuStatus(int stuNum);

	//(학생)휴학생 휴학 신청내역 조회
	public List<AcademicVO> getLeaveHistory(int stuNum);

	//(학생)복학 신청
	public int appReturn(Map<String, Object> reMap);

	//자퇴
	//(학생)자퇴 신청
	public int appDropout(Map<String, Object> dropMap);

	//복수전공/부전공
	//(학생)복수전공/부전공 신청 - 단과대학 명 & 단과대학별 소속학과 출력
	public List<AcaDeptVO> getCollNDeptList();

	//(학생)복수전공/부전공 신청 - 단과대 내 학과 목록 출력
	public List<AcaDeptVO> getDeptList(String collNm);

	//(학생)단과대학&학과명 동시 출력
	public List<Map<String, Object>> getCnDList(String collNum);

	//(학생)복수전공/부전공 신청
	public int appDM(Map<String, Object> dmMap);

	//(학생)복수전공/부전공 신청 내역 조회
	public int getDMHistory(Map<String, Object> checkMap);

	//(학생)복수전공/부전공 신청 요건 조회(이수학기, 평균평점, 전공과목 이수학점
	public Map<String, Object> getStuQual(int stuNum);

	//전과
	//(전과 신청 조건)학과번호, 재학/휴학 인원 조회
	public Map<String, Object> getTRCon(int tranDeptNum);

	//추가 등록금 조회(기존학과 등록금 - 전과학과 등록금)
	public Map<String, Object> getAddFee(Map<String, Object> feeMap);

	//(학생)전과신청 내역 조회
	public int getTRHistory(Map<String, Object> rqhMap);

	//전과 신청
	public int appTR(Map<String, Object> trMap);

	//(학생)학적변동 신청 목록 조회
	public List<Map<String, Object>> getAcChgList(int stuNum);

	//(학생)복수전공/부전공 신청 목록 조회
	public List<Map<String, Object>> getDMList(int stuNum);

	//(학생)전과 신청 목록 조회
	public List<Map<String, Object>> getTranList(int stuNum);

	//(학생)전과 신청목록 조회2
	public List<Map<String, Object>> getTranList2(int stuNum);

	//(학생)학적변동 반려사유 조회
	public Map<String, Object> getChgRejectReason(int acNum);

	//복수전공/부전공 반려사유 조회
	public Map<String, Object> getDMRejectReason(int dmNum);

	//전과 반려사유 조회
	public Map<String, Object> getTRRejectReason(int trNum);

	//(관리자) 승인대기 상태인 학적변동 + 졸업유예 신청내역 조회
	public List<Map<String, Object>> getAcGpList();

	//(관리자) 학적변동 + 졸업유예 신청 건수 조회
	public int getAcGpCnt();

	//학적변동 OR 졸업유예 개별 신청 건 조회
	public Map<String, Object> getSingleAppHistory(Map<String, Object> ahMap);

	//(관리자) 학적변동 승인처리에 따른 학생 학적상태 변경
	public int updateStuStatus(Map<String, Object> updateMap);

	//(관리자) 학적변동 승인 처리
	public int processAcChg(int acNum);

	//(관리자) 졸업유예 승인 처리
	public int processGp(int gpNum);

	//(관리자) 졸업유예 반려 처리
	public int rejectGp(Map<String, Object> rjMap);

	//(관리자) 학적변동 반려처리
	public int rejectAcChg(Map<String, Object> acChgMap);

	//(관리자) 복수전공/부전공 신청내역 조회
	public List<Map<String, Object>> getDMListAdm();

	//(관리자) 복수전공/부전공 신청 건수 조회
	public int getDMCnt();

	//(관리자) 복수전공 신청 승인처리
	public int approveDM(int dmNum);

	//(관리자) 복수전공 신청 승인처리에 따른 학생정보 수정
	public int updateStuInfo(Map<String, Object> stuInfoMap);

	/**
	 * (관리자) 복수전공 개별 신청 건 조회
	 * @param stuNum
	 * @return
	 */
	public Map<String, Object> getSingleDMHistory(int dmNum);

	//(관리자) 복수전공 반려처리
	public int rejectDM(Map<String, Object> dmRjMap);

	//(관리자) 전과 신청내역 조회
	public List<Map<String, Object>> getTRListAdm();

	//(관리자) 전과 신청 건수 조회
	public int getTDCnt();

	//(관리자) 전과 신청 승인처리
	public int approveTD(int tdNum);

	//(관리자) 전과 신청 승인처리에 따른 학생정보 수정
	public int updateStuInfoByTD(Map<String, Object> tdAppMap);

	/**
	 * (관리자) 전과 개별 신청 건 조회
	 * @param tdNum
	 * @return
	 */
	Map<String, Object> getSingleTDHistory(int tdNum);

	//(관리자) 전과 신청 반려처리
	public int rejectTD(Map<String, Object> tdRejectMap);


//	검색
	//(관리자) 학적변동 + 졸업유예 신청목록 조회(검색포함)
	public List<Map<String, Object>> getAcGpListIncSearch(Map<String, Object> infoMap);

	//학적변동 + 졸업유예 신청내역 중 '학생명'으로 검색한 결과 COUNT
	public int getAcGpListIncSearchCNT(Map<String, Object> infoMap);

	//학적변동 + 졸업유예 신청목록 출력(학과명으로 검색한 결과)
	public List<Map<String, Object>> getAcGpListIncSearchDept(Map<String, Object> infoMap);

	//학적변동 + 졸업유예 신청내역 중 '학과명'으로 검색한 결과 COUNT
	public int getAcGpListIncSearchDeptCNT(Map<String, Object> infoMap);

	//복수전공/부전공 신청목록 출력(학생명으로 검색한 결과)
	public List<Map<String, Object>> getDMListIncSearch(Map<String, Object> infoMap);

	//복수전공/부전공 신청내역 중 학생명으로 검색한 결과 count
	public int getDMListIncSearchCNT(Map<String, Object> infoMap);

	//복수전공/부전공 신청목록 출력(학과명으로 검색한 결과)
	public List<Map<String, Object>> getDMListIncSearchDept(Map<String, Object> infoMap);

	//복수전공/부전공 신청내역 중 학과명으로 검색한 결과 count
	public int getDMListIncSearchDeptCNT(Map<String, Object> infoMap);

	//전과 신청내역 중 학생명으로 검색한 결과
	public List<Map<String, Object>> getTDListIncSearch(Map<String, Object> infoMap);

	//전과 신청내역 중 학생명으로 검색한 결과 count
	public int getTDListIncSearchCNT(Map<String, Object> infoMap);

	//전과 신청내역 중 학과명으로 검색한 결과
	public List<Map<String, Object>> getTDListIncSearchDept(Map<String, Object> infoMap);

	//전과 신청내역 중 학과명으로 검색한 결과 count
	public int getTDListIncSearchDeptCNT(Map<String, Object> infoMap);
















}
