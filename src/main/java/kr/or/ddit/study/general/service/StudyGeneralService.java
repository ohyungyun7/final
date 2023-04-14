package kr.or.ddit.study.general.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.StudyReportVO;
import kr.or.ddit.vo.StudyVO;

public interface StudyGeneralService {

	/**
	 * 스터디 전체 리스트 가져오기
	 * @param studyVO : 로그인한 학생 학번이 담긴 VO
	 * @return
	 */
	public List<StudyVO> getStudyList(StudyVO studyVO);

	/**
	 * 스터디 신청 취소, 초대 수락, 거절
	 * @param studyVO : 선택한 스터디 번호, sGrade( -1 : 거절/취소, 0 : 수락), 대상 학번
	 * @return 
	 */
	public int modiStudyGrade(StudyVO studyVO);

	/**
	 * 입장을 누른 스터디의 정보를 ajax로 세션에 담음
	 * @param studyVO : 입장한 스터디 번호가 담긴 VO
	 * @return
	 */
	public StudyVO getStudy(StudyVO studyVO);

	/**
	 * 스터디에 참여, 초대, 신청한 모든 학생들 리스트
	 * @param studyVO : 스터디 번호가 담긴 VO
	 * @return
	 */
	public List<Map<String, Object>> getStudentList(StudyVO studyVO);

	public List<Map<String, Object>> inviteList(int sNum);

	public void reportStudy(StudyVO studyVO, StudyReportVO srVO);

	public List<Map<String, Object>> wholeStudyList(int stuNum);

	public List<Map<String, Object>> studentList();

	public void openStudy(int openStu, String sNm, String[] stuNumArr);

	public List<Map<String, Object>> banStudyList();

	public Map<String, Object> manageReportStudy(StudyVO studyVO, boolean history);

	public List<Map<String, Object>> reportedStudyList();

	public Map<String, Object> getReasonList(int sNum);

}
