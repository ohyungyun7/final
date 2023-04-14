package kr.or.ddit.academic.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.academic.service.AcademicService;
import kr.or.ddit.mapper.AcademicMapper;
import kr.or.ddit.vo.AcaDeptVO;
import kr.or.ddit.vo.AcademicVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AcademicServiceImpl implements AcademicService {

	@Autowired
	AcademicMapper academicMapper;


	/**
	 * (학생) 학생 학적정보 출력
	 */
	@Override
	public Map<String, Object> getStuInfo(int stuNum){
		return academicMapper.getStuInfo(stuNum);
	}

	/**
	 * (학생) 휴학 신청
	 */
	@Override
	public int appLeave(AcademicVO academicVO) {
		return academicMapper.appLeave(academicVO);
	}

	/**
	 * (학생) 각 학적변동 신청 건수 조회(처리상태:대기)
	 */
	@Override
	public int getAcCnt(Map<String, Object> cntMap) {
		return academicMapper.getAcCnt(cntMap);
	}

	/**
	 * (학생) 학적상태 조회
	 */
	@Override
	public int getStuStatus(int stuNum) {
		return academicMapper.getStuStatus(stuNum);
	}

	/**
	 * (학생) 휴학생 휴학 신청내역 조회
	 */
	@Override
	public List<AcademicVO> getLeaveHistory(int stuNum) {
		return academicMapper.getLeaveHistory(stuNum);
	}

	/**
	 * (학생) 복학 신청
	 */
	@Override
	public int appReturn(Map<String, Object> reMap) {
		return academicMapper.appReturn(reMap);
	}

	/**
	 * (학생) 자퇴 신청
	 */
	@Override
	public int appDropout(Map<String, Object> dropMap) {
		return academicMapper.appDropout(dropMap);
	}

	/**
	 * (학생) 복수전공/부전공 신청 - 단과대학 명 & 단과대학별 소속학과 출력
	 */
	@Override
	public List<AcaDeptVO> getCollNDeptList(){
		return academicMapper.getCollNDeptList();
	}

	/**
	 * (학생) 복수전공/부전공 신청 - 단과대 내 학과 목록 출력
	 */
	@Override
	public List<AcaDeptVO> getDeptList(String collNm){
		return academicMapper.getDeptList(collNm);
	}

	/**
	 * (학생) 단과대학&학과명 동시 출력
	 */
	@Override
	public List<Map<String, Object>> getCnDList(String collNum){
		return academicMapper.getCnDList(collNum);
	}

	/**
	 * (학생) 복수전공/부전공 신청
	 */
	@Override
	public int appDM(Map<String, Object> dmMap) {
		return academicMapper.appDM(dmMap);
	}

	/**
	 * (학생) 복수전공/부전공 신청 내역 조회
	 */
	@Override
	public int getDMHistory(Map<String, Object> checkMap){
		return academicMapper.getDMHistory(checkMap);
	}

	/**
	 * (학생) 복수전공/부전공 신청 요건 조회(이수학기, 평균평점, 전공과목 이수학점
	 */
	@Override
	public Map<String, Object> getStuQual(int stuNum){
		return academicMapper.getStuQual(stuNum);
	}


	/**
	 * (전과 신청 조건) 학과번호, 재학/휴학 인원 조회
	 */
	@Override
	public Map<String, Object> getTRCon(int tranDeptNum){
		return academicMapper.getTRCon(tranDeptNum);
	}

	/**
	 * (학생) 추가 등록금 조회(기존학과 등록금 - 전과학과 등록금)
	 */
	@Override
	public Map<String, Object> getAddFee(Map<String, Object> feeMap){
		return academicMapper.getAddFee(feeMap);
	}

	/**
	 * (학생) 전과신청 내역 조회
	 */
	@Override
	public int getTRHistory(Map<String, Object> rqhMap) {
		return academicMapper.getTRHistory(rqhMap);
	}

	/**
	 * (학생) 전과 신청
	 */
	@Override
	public int appTR(Map<String, Object> trMap){
		return academicMapper.appTR(trMap);
	}

	/**
	 * (학생) 학적변동 신청 목록 조회
	 */
	@Override
	public List<Map<String, Object>> getAcChgList(int stuNum){
		return academicMapper.getAcChgList(stuNum);
	}

	/**
	 * (학생) 복수전공/부전공 신청 목록 조회
	 */
	@Override
	public List<Map<String, Object>> getDMList(int stuNum){
		return academicMapper.getDMList(stuNum);
	}

	/**
	 * (학생) 전과 신청 목록 조회
	 */
	@Override
	public List<Map<String, Object>> getTranList(int stuNum){
		return academicMapper.getTranList(stuNum);
	}

	/**
	 * (학생) 전과 신청목록 조회2
	 */
	@Override
	public List<Map<String, Object>> getTranList2(int stuNum){
		return academicMapper.getTranList2(stuNum);
	}

	/**
	 * (학생) 학적변동 반려사유 조회
	 */
	@Override
	public Map<String, Object> getChgRejectReason(int acNum){
		return this.academicMapper.getChgRejectReason(acNum);
	}

	/**
	 * (학생) 복수전공/부전공 반려사유 조회
	 */
	@Override
	public Map<String, Object> getDMRejectReason(int dmNum){
		return this.academicMapper.getDMRejectReason(dmNum);
	}

	/**
	 * (학생) 전과 반려사유 조회
	 */
	@Override
	public Map<String, Object> getTRRejectReason(int trNum){
		return this.academicMapper.getTRRejectReason(trNum);
	}

	/**
	 * (관리자) 승인대기 상태인 학적변동 + 졸업유예 신청내역 조회
	 */
	@Override
	public List<Map<String, Object>> getAcGpList(){
		return this.academicMapper.getAcGpList();
	}

	/**
	 * (관리자) 학적변동 + 졸업유예 신청 건수 조회
	 */
	@Override
	public int getAcGpCnt() {
		return this.academicMapper.getAcGpCnt();
	}

	/**
	 * (관리자) 학적변동+졸업유예 개별 신청 건 조회
	 */
	@Override
	public Map<String, Object> getSingleAppHistory(Map<String, Object> ahMap){
		return this.academicMapper.getSingleAppHistory(ahMap);
	}

	/**
	 * (관리자) 학적변동 승인처리에 따른 학생 학적상태 변경
	 */
	@Override
	public int updateStuStatus(Map<String, Object> updateMap) {
		return this.academicMapper.updateStuStatus(updateMap);
	}

	/**
	 * (관리자) 학적변동 승인 처리
	 */
	@Override
	public int processAcChg(int acNum) {
		return this.academicMapper.processAcChg(acNum);
	}

	/**
	 * (관리자) 졸업유예 승인 처리
	 */
	@Override
	public int processGp(int gpNum) {
		return this.academicMapper.processGp(gpNum);
	}

	/**
	 * (관리자) 졸업유예 반려 처리
	 */
	@Override
	public int rejectGp(Map<String, Object> rjMap) {
		return this.academicMapper.rejectGp(rjMap);
	}

	/**
	 * (관리자) 학적변동 반려처리
	 */
	@Override
	public int rejectAcChg(Map<String, Object> acChgMap) {
		return this.academicMapper.rejectAcChg(acChgMap);
	}

	/**
	 * (관리자) 복수전공/부전공 신청내역 조회
	 */
	@Override
	public List<Map<String, Object>> getDMListAdm(){
		return this.academicMapper.getDMListAdm();
	}

	/**
	 * (관리자) 복수전공/부전공 신청 건수 조회
	 */
	@Override
	public int getDMCnt() {
		return this.academicMapper.getDMCnt();
	}

	/**
	 * (관리자) 복수전공 신청 승인처리
	 */
	@Override
	public int approveDM(int dmNum) {
		return this.academicMapper.approveDM(dmNum);
	}

	/**
	 * (관리자) 복수전공 신청 승인처리에 따른 학생정보 수정
	 */
	@Override
	public int updateStuInfo(Map<String, Object> stuInfoMap) {
		return this.academicMapper.updateStuInfo(stuInfoMap);
	}

	/**
	 * (관리자) 복수전공 개별 신청 건 조회
	 */
	@Override
	public Map<String, Object> getSingleDMHistory(int dmNum){
		return this.academicMapper.getSingleDMHistory(dmNum);
	}

	/**
	 * (관리자) 복수전공 반려처리
	 */
	@Override
	public int rejectDM(Map<String, Object> dmRjMap) {
		return this.academicMapper.rejectDM(dmRjMap);
	}

	/**
	 * (관리자) 전과 신청내역 조회
	 */
	@Override
	public List<Map<String, Object>> getTRListAdm(){
		return this.academicMapper.getTRListAdm();
	}

	/**
	 * (관리자) 전과 신청 건수 조회
	 */
	@Override
	public int getTDCnt() {
		return this.academicMapper.getTDCnt();
	}

	/**
	 * (관리자) 전과 신청 승인처리
	 */
	@Override
	public int approveTD(int tdNum) {
		return this.academicMapper.approveTD(tdNum);
	}

	/**
	 * (관리자) 전과 신청 승인처리에 따른 학생정보 수정
	 */
	@Override
	public int updateStuInfoByTD(Map<String, Object> tdAppMap) {
		return this.academicMapper.updateStuInfoByTD(tdAppMap);
	}

	/**
	 * (관리자) 전과 개별 신청 건 조회
	 * @param tdNum
	 * @return
	 */
	@Override
	public Map<String, Object> getSingleTDHistory(int tdNum){
		return this.academicMapper.getSingleTDHistory(tdNum);
	}

	/**
	 * (관리자) 전과 신청 반려처리
	 */
	@Override
	public int rejectTD(Map<String, Object> tdRejectMap) {
		return this.academicMapper.rejectTD(tdRejectMap);
	}




//	검색

	//(관리자) 학적변동 + 졸업유예 신청목록 조회(검색포함)
	@Override
	public List<Map<String, Object>> getAcGpListIncSearch(Map<String, Object> infoMap){
		return this.academicMapper.getAcGpListIncSearch(infoMap);
	}

	//학적변동 + 졸업유예 신청내역 중 '학생명'으로 검색한 결과 COUNT
	@Override
	public int getAcGpListIncSearchCNT(Map<String, Object> infoMap) {
		return this.academicMapper.getAcGpListIncSearchCNT(infoMap);
	}

	//학적변동 + 졸업유예 신청목록 출력(학과명으로 검색한 결과)
	@Override
	public List<Map<String, Object>> getAcGpListIncSearchDept(Map<String, Object> infoMap){
		return this.academicMapper.getAcGpListIncSearchDept(infoMap);
	}

	//학적변동 + 졸업유예 신청내역 중 '학과명'으로 검색한 결과 COUNT
	@Override
	public int getAcGpListIncSearchDeptCNT(Map<String, Object> infoMap) {
		return this.academicMapper.getAcGpListIncSearchDeptCNT(infoMap);
	}

	//복수전공/부전공 신청목록 출력(학생명으로 검색한 결과)
	@Override
	public List<Map<String, Object>> getDMListIncSearch(Map<String, Object> infoMap){
		return this.academicMapper.getDMListIncSearch(infoMap);
	}

	//복수전공/부전공 신청내역 중 학생명으로 검색한 결과 count
	@Override
	public int getDMListIncSearchCNT(Map<String, Object> infoMap) {
		return this.academicMapper.getDMListIncSearchCNT(infoMap);
	}

	//복수전공/부전공 신청목록 출력(학과명으로 검색한 결과)
	@Override
	public List<Map<String, Object>> getDMListIncSearchDept(Map<String, Object> infoMap) {
		return this.academicMapper.getDMListIncSearchDept(infoMap);
	}

	//복수전공/부전공 신청내역 중 학과명으로 검색한 결과 count
	@Override
	public int getDMListIncSearchDeptCNT(Map<String, Object> infoMap) {
		return this.academicMapper.getDMListIncSearchDeptCNT(infoMap);
	}

	//전과 신청내역 중 학생명으로 검색한 결과
	@Override
	public List<Map<String, Object>> getTDListIncSearch(Map<String, Object> infoMap) {
		return this.academicMapper.getTDListIncSearch(infoMap);
	}

	//전과 신청내역 중 학생명으로 검색한 결과 count
	@Override
	public int getTDListIncSearchCNT(Map<String, Object> infoMap) {
		return this.academicMapper.getTDListIncSearchCNT(infoMap);
	}

	//전과 신청내역 중 학과명으로 검색한 결과
	@Override
	public List<Map<String, Object>> getTDListIncSearchDept(Map<String, Object> infoMap) {
		return this.academicMapper.getTDListIncSearchDept(infoMap);
	}

	//전과 신청내역 중 학과명으로 검색한 결과 count
	@Override
	public int getTDListIncSearchDeptCNT(Map<String, Object> infoMap) {
		return this.academicMapper.getTDListIncSearchDeptCNT(infoMap);
	}
}



