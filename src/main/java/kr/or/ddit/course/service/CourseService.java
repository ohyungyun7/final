package kr.or.ddit.course.service;

import java.util.List;
import java.util.Map;

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

public interface CourseService {
	//메소드 시그니처

		//금학기 수강과목 리스트 출력(학생)
		public List<CourseVO> getCourseList(int stuNum);

		//금학기 강의목록 출력(교수)
		public List<CourseVO> getCourseListPro(int teaNum);
		// Map으로 가져옴
		public List<Map<String, Object>> getCourseListProByMap(int teaNum);

		//과목별 상세조회
		public List<CourseDetailVO> detail(CourseVO courseVO);

		//과목공지 조회수 증가
		public int increaseNoticeHit(CourseNoticeVO courseNoticeVO);

		//과목공지 리스트 출력
		public List<CourseNoticeVO> getNoticeList(CourseVO courseVO);

		//과목공지 상세내용 출력
		public CourseNoticeVO noticeDetail(CourseNoticeVO courseNoticeVO);

		//과제 목록 조회
		public List<CourseAssignmentVO> getAssignmentList(Map<String, Object> asMap);

		//과제 상세정보 조회
		public CourseAssignmentVO assignmentDetail(CourseAssignmentVO courseAssignmentVO);

		//(학생)과제 제출 여부 조회
		public SubmitVO submitCheck(SubmitVO submitVO);

		//(학생)과제 제출
		public int submitAssignment(SubmitVO submitVO);

		//(학생)MAX과제번호 +1
		public int getSbmNum();

		//(과목별)과제 등록가능한 주차 목록 출력
		public List<SubjectIndexVO> getSiList(String sbjNum);

		//(교수)과제 수정
		public int updateAssignment(CourseAssignmentVO courseAssignmentVO);

		//(교수)과제 등록
		public int createAssignment(CourseAssignmentVO courseAssignmentVO);

		//(교수)과제 삭제
		public int deleteAssignment(int asNum);

		//과목 자료 리스트 출력
		public List<CourseReferenceVO> getReferenceList(CourseVO courseVO);

		//(교수)수강생 목록 조회
		public List<Map<String, Object>> getStudentList(String sbjNum);

		//(교수)수강생 기본정보 조회
//		public List<Map<String, Object>> getStuInfo(Map<String, Object>InfoMap);
		public Map<String, Object> getStuInfo(Map<String, Object> InfoMap);


		//(교수)공지사항 등록
		public int createNotice(CourseNoticeVO courseNoticeVO);

		//(교수)공지사항 수정
		public int noticeModify(CourseNoticeVO courseNoticeVO);

		//(교수)공지사항 삭제
		public int deleteNotice(CourseNoticeVO courseNoticeVO);

		//(교수)자료 게시글 등록
		public int createReference(CourseReferenceVO courseReferenceVO);

		//(교수)자료 게시글 삭제
		public int deleteReference(CourseReferenceVO courseReferenceVO);

		//과목별 수강생 출석현황 목록 출력
		public List<Map<String, Object>> selectAttendanceList(String sbjNum);

		//주차별 강의 횟수 카운트
		public List<Map<String, Object>> countLecture(String sbjNum);

		//과목별 수강생 출석현황 출력2
		public List<Map<String, Object>> getAttendanceList(String sbjNum);

		//주차별 강의 횟수 카운트(Map)
		public Map<String, Object> countLectureMap(String sbjNum);

		//주차별 강의 요일
		public List<Map<String, Object>> getCourseDay(String sbjNum);

		//전체 수강생 출석 목록 출력
		public List<Map<String, Object>> getAllAtendanceList(String sbjNum);

		//과목별 수강생 목록 및 출석현황
		public List<CourseAttendanceVO> getAtList(String sbjNum);

		//ltNum 출력
		public List<Map<String, Object>> getLtNum(Map<String, Object> tMap);

		//출석 insert 또는 update
		public int updateAttendance(List<CourseAtVO> atList);

		//학생정보 조회
		public Map<String, Object> basicStuInfo(int stuNum);

		//(학생)기본정보 및 출석현황 조회
		public List<CourseAttendanceVO> getStuAttendList(Map<String, Object> infoMap);

		//(학생)개별학생 출석 조회(주차별)
		public List<Map<String, Object>> getStuAtList(Map<String, Object> seMap);

		/*** <-- 신동준 작업
		 * 성적 입력창으로 넘어 올 시
		 * 메인/강의목록/${강의정보}
		 * 강의정보 값 가져오기
		 * @param sbjNum
		 * @param sbjTitle
		 */
		public String getSubjectInfo(String sbjNum);

		/***  <-- 신동준 작업
		 * 해당 과목을 듣는 현재학기 학생 목록 가져오기
		 * @param sbjNum
		 * @return
		 */
		public List<CourseListVO> getCourseListInfo(String sbjNum);

		/***
		 * 해당 과목의 출석 즉 45점 만점 중 몇점인지 소계를 가져옴
		 * @param map
		 * @return
		 */
		public SubjectVO getWeekSum(Map<String, Object> map);

		/***
		 * REPORT_CARE의 기본값을 가져옴 MERGE INTO 사용할려고
		 * @param map
		 * @return
		 */
		public String getRcNum(Map<String, Object> map);


		/***
		 * REPORT_CARD 와 COURSE_LIST에 최종성적 넣음
		 * @param map
		 * @return
		 */
		public int insertReportCardAndCsfscore(Map<String, Object> map);

		/***
		 * REPORT_CARD 와 COURSE_LIST에 최종성적 넣음
		 * @param map
		 * @return
		 */
		public int updateClFscore(Map<String, Object> map3);

		/***
		 * 해당 클릭한 성적의 값 가져오기
		 * @param map
		 * @return
		 */
		public List<ReportCardVO> getCourseInfo(Map<String, Object> map);

		/***
		 * 성적이의신청에서 승인 후 성적 바꾸기 위한 Rcnum 가져옴
		 * @param map
		 * @return
		 */
		public String getRcNum2(Map<String, Object> map);


		/***
		 * 이의 신청 한 후 성적을 최종으로 바꿔줌
		 * @param map
		 * @return
		 */
		public int insertReportCardAndCsfscore2(Map<String, Object> map);

		/**
		 * 학생의 정보를 가져옴
		 * @param map
		 * @return
		 */
		public StudentVO studentInfo(Map<String, Object> map);


}
