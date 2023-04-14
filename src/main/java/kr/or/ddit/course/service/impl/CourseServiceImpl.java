package kr.or.ddit.course.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.course.service.CourseService;
import kr.or.ddit.mapper.CourseMapper;
import kr.or.ddit.vo.CourseAssignmentVO;
import kr.or.ddit.vo.CourseAtVO;
import kr.or.ddit.vo.CourseAttendanceVO;
import kr.or.ddit.vo.CourseDetailVO;
import kr.or.ddit.vo.CourseListVO;
import kr.or.ddit.vo.CourseNoticeVO;
import kr.or.ddit.vo.CourseReferenceVO;
import kr.or.ddit.vo.CourseVO;
import kr.or.ddit.vo.ReportCardVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.SubjectIndexVO;
import kr.or.ddit.vo.SubjectVO;
import kr.or.ddit.vo.SubmitVO;
import lombok.extern.slf4j.Slf4j;

//스프링이 인식하여 자바빈 객체로 등록해줌
@Slf4j
@Service
public class CourseServiceImpl implements CourseService {

	@Autowired
	CourseMapper CourseMapper;

	//금학기 수강과목 리스트 출력(학생)
	@Override
	public List<CourseVO> getCourseList(int stuNum){
		return CourseMapper.getCourseList(stuNum);
	}

	//금학기 강의목록 출력(교수)
	@Override
	public List<CourseVO> getCourseListPro(int teaNum){
		return CourseMapper.getCourseListPro(teaNum);
	}

	//금학기 강의목록 출력(교수) --> VO 추가 생성 없이 Map으로 조회하는 방법
	@Override
	public List<Map<String, Object>> getCourseListProByMap(int teaNum) {
		return CourseMapper.getCourseListProByMap(teaNum);
	}

	//과목별 상세조회
	@Override
	public List<CourseDetailVO> detail(CourseVO courseVO) {
		return CourseMapper.detail(courseVO);
	}

	//과목공지 조회수 증가
	@Override
	public int increaseNoticeHit(CourseNoticeVO courseNoticeVO) {
		return CourseMapper.increaseNoticeHit(courseNoticeVO);
	}

	//과목공지 리스트 출력
	@Override
	public List<CourseNoticeVO> getNoticeList(CourseVO courseVO){
		return CourseMapper.getNoticeList(courseVO);
	}

	//과제 목록 조회
	@Override
	public List<CourseAssignmentVO> getAssignmentList(Map<String, Object> asMap){
		return CourseMapper.getAssignmentList(asMap);
	}

	//과제 상세정보 조회
	@Override
	public CourseAssignmentVO assignmentDetail(CourseAssignmentVO courseAssignmentVO) {
		return CourseMapper.assignmentDetail(courseAssignmentVO);
	}

	//(학생)과제 제출 여부 조회
	@Override
	public SubmitVO submitCheck(SubmitVO submitVO) {
		return CourseMapper.submitCheck(submitVO);
	}

	//(학생)과제 제출
	@Override
	public int submitAssignment(SubmitVO submitVO) {
		return CourseMapper.submitAssignment(submitVO);
	}

	//(학생)MAX과제번호 +1
	@Override
	public int getSbmNum() {
		return CourseMapper.getSbmNum();
	}

	//(과목별)과제 등록가능한 주차 목록 출력
	@Override
	public List<SubjectIndexVO> getSiList(String sbjNum) {
		return CourseMapper.getSiList(sbjNum);
	}

	//과목 자료 리스트 출력
	@Override
	public List<CourseReferenceVO> getReferenceList(CourseVO courseVO){
		return CourseMapper.getReferenceList(courseVO);
	}

	//과목공지 상세내용 조회
	@Override
	public CourseNoticeVO noticeDetail(CourseNoticeVO courseNoticeVO){
		return CourseMapper.noticeDetail(courseNoticeVO);
	}

	//(교수)수강생 목록 조회
	@Override
	public List<Map<String, Object>> getStudentList(String sbjNum){
		return CourseMapper.getStudentList(sbjNum);
	}

	//(교수)수강생 기본정보 조회
	@Override
//	public List<Map<String, Object>> getStuInfo(Map<String, Object>InfoMap){
	public Map<String, Object> getStuInfo(Map<String, Object> InfoMap){
		return CourseMapper.getStuInfo(InfoMap);
	}

	//(교수)공지사항 등록
	@Override
	public int createNotice(CourseNoticeVO courseNoticeVO) {
		return CourseMapper.createNotice(courseNoticeVO);
	}

	//(교수)공지사항 수정
	@Override
	public int noticeModify(CourseNoticeVO courseNoticeVO) {
		return CourseMapper.noticeModify(courseNoticeVO);
	}

	//(교수)과제 수정
	@Override
	public int updateAssignment(CourseAssignmentVO courseAssignmentVO) {
		return CourseMapper.updateAssignment(courseAssignmentVO);
	}

	//(교수)과제 삭제
	@Override
	public int deleteAssignment(int asNum) {
		return CourseMapper.deleteAssignment(asNum);
	}

	//(교수)공지사항 삭제
	@Override
	public int deleteNotice(CourseNoticeVO courseNoticeVO) {
		return CourseMapper.deleteNotice(courseNoticeVO);
	}

	//(교수)과제 등록
	@Override
	public int createAssignment(CourseAssignmentVO courseAssignmentVO) {
		return CourseMapper.createAssignment(courseAssignmentVO);
	}

	//(교수)자료 게시글 등록
	@Override
	public int createReference(CourseReferenceVO courseReferenceVO) {
		return CourseMapper.createReference(courseReferenceVO);
	}

	//(교수)자료 게시글 삭제
	@Override
	public int deleteReference(CourseReferenceVO courseReferenceVO) {
		return CourseMapper.deleteReference(courseReferenceVO);
	}

	//과목별 수강생 출석현황 목록 출력
	@Override
	public List<Map<String, Object>> selectAttendanceList(String sbjNum){
		return CourseMapper.selectAttendanceList(sbjNum);
	}

	//전체 수강생 출석 목록 출력
	@Override
	public List<Map<String, Object>> getAllAtendanceList(String sbjNum){
		return CourseMapper.getAllAtendanceList(sbjNum);
	}

	//주차별 강의 횟수 카운트
	@Override
	public List<Map<String, Object>> countLecture(String sbjNum) {
		return CourseMapper.countLecture(sbjNum);
	}

	//주차별 강의 횟수 카운트(Map)
	@Override
	public Map<String, Object> countLectureMap(String sbjNum){
		return CourseMapper.countLectureMap(sbjNum);
	}

	//주차별 강의 요일
	@Override
	public List<Map<String, Object>> getCourseDay(String sbjNum){
		return CourseMapper.getCourseDay(sbjNum);
	}

	//과목별 수강생 출석현황 출력2
	@Override
	public List<Map<String, Object>> getAttendanceList(String sbjNum){
		return CourseMapper.getAttendanceList(sbjNum);
	}

	//과목별 수강생 목록 및 출석현황
	@Override
	public List<CourseAttendanceVO> getAtList(String sbjNum){
		return CourseMapper.getAtList(sbjNum);
	}

	//ltNum 출력
	@Override
	public List<Map<String, Object>> getLtNum(Map<String, Object> tMap){
		return CourseMapper.getLtNum(tMap);
	}

	//출석 insert 또는 update
	@Override
	public int updateAttendance(List<CourseAtVO> atList) {
		return CourseMapper.updateAttendance(atList);
	}

	//학생정보 조회
	@Override
	public Map<String, Object> basicStuInfo(int stuNum) {
		return CourseMapper.basicStuInfo(stuNum);
	}

	//(학생)기본정보 및 출석현황 조회
	@Override
	public List<CourseAttendanceVO> getStuAttendList(Map<String, Object> infoMap){
		return CourseMapper.getStuAttendList(infoMap);
	}

	//(학생)개별학생 출석 조회(주차별)
	@Override
	public List<Map<String, Object>> getStuAtList(Map<String, Object> seMap){
		return CourseMapper.getStuAtList(seMap);
	}


	/*** <-- 신동준작업
	 * 성적 입력창으로 넘어 올 시
	 * 메인/강의목록/${강의정보}
	 * 강의정보 값 가져오기
	 * @param sbjNum
	 * @param sbjTitle
	 */
	@Override
	public String getSubjectInfo(String sbjNum) {
		return CourseMapper.getSubjectInfo(sbjNum);
	}

	/***  <-- 신동준 작업
	 * 해당 과목을 듣는 현재학기 학생 목록 가져오기
	 * @param sbjNum
	 * @return
	 */
	@Override
	public List<CourseListVO> getCourseListInfo(String sbjNum) {
		return CourseMapper.getCourseListInfo(sbjNum);
	}

	/***	<-- 신동준 작업
	 * 해당 과목의 출석 즉 45점 만점 중 몇점인지 소계를 가져옴
	 * @param map
	 * @return
	 */
	@Override
	public SubjectVO getWeekSum(Map<String, Object> map) {
		return CourseMapper.getWeekSum(map);
	}

	/***
	 * REPORT_CARE의 기본값을 가져옴 MERGE INTO 사용할려고
	 * @param map
	 * @return
	 */
	@Override
	public String getRcNum(Map<String, Object> map) {
		return CourseMapper.getRcNum(map);
	}


	/***
	 * REPORT_CARD 와 COURSE_LIST에 최종성적 넣음
	 * @param map
	 * @return
	 */
	@Override
	public int insertReportCardAndCsfscore(Map<String, Object> map) {
		return CourseMapper.insertReportCardAndCsfscore(map);
	}

	/***
	 * REPORT_CARD 와 COURSE_LIST에 최종성적 넣음
	 * @param map
	 * @return
	 */
	@Override
	public int updateClFscore(Map<String, Object> map3) {
		return CourseMapper.updateClFscore(map3);
	}

	/***
	 * 해당 클릭한 성적의 값 가져오기
	 */
	@Override
	public List<ReportCardVO> getCourseInfo(Map<String, Object> map) {
		return CourseMapper.getCourseInfo(map);
	}


	/***
	 * 성적이의신청에서 승인 후 성적 바꾸기 위한 Rcnum 가져옴
	 * @param map
	 * @return
	 */
	@Override
	public String getRcNum2(Map<String, Object> map) {
		return CourseMapper.getRcNum2(map);
	}


	/***
	 * 이의 신청 한 후 성적을 최종으로 바꿔줌
	 * @param map
	 * @return
	 */
	@Override
	public int insertReportCardAndCsfscore2(Map<String, Object> map) {
		return CourseMapper.insertReportCardAndCsfscore2(map);
	}

	/**
	 * 학생의 정보를 가져옴
	 * @param map
	 * @return
	 */
	@Override
	public StudentVO studentInfo(Map<String, Object> map) {
		return CourseMapper.studentInfo(map);
	}
}
