package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.StudyReportVO;
import kr.or.ddit.vo.StudyVO;

public interface StudyGeneralMapper {

	/**
	 * 스터디 전체 리스트 가져오기
	 * @param studyVO : 로그인한 학생 학번이 담긴 VO
	 */
	public List<StudyVO> getStudyList(StudyVO studyVO);

	/**
	 * 스터디 신청 취소, 초대 거절
	 * @param studyVO : 스터디 번호, 취소한 학생 학번이 담긴 VO
	 * @return 
	 */
	public int deleteStudy(StudyVO studyVO);

	/**
	 * 스터디 초대 수락
	 * @param studyVO : 스터디 번호, 취소한 학생 학번이 담긴 VO
	 * @return 
	 */
	public int updateStudy(StudyVO studyVO);

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

	/**
	 * 스터디 나가기
	 * @param studyVO : 나갈 스터디 번호, 나가는 학번이 담긴 VO
	 */
	public void exitStudy(StudyVO studyVO);

	// 초대할 학생 리스트
	public List<Map<String, Object>> inviteList(int sNum);

	public int insertStudy(StudyVO studyVO);

	// 스터디 신고
	public void reportStudy(StudyReportVO srVO);

	public List<Map<String, Object>> wholeStudyList(int sNum);

	public List<Map<String, Object>> studentList();

	public int openStudy(StudyVO studyVO);

	public List<Map<String, Object>> banStudyList();

	public void manageReportStudy(StudyVO studyVO);

	public Map<String, Object> banStudyOne(StudyVO studyVO);

	public Map<String, Object> afterBanCancel(StudyVO studyVO);

	public List<Map<String, Object>> reportedStudyList();

	public void deleteHistory(StudyVO studyVO);

	public List<Map<String, Object>> getReasonList(int sNum);

}
