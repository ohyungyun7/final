package kr.or.ddit.enroll.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BuildingVO;
import kr.or.ddit.vo.RoomVO;
import kr.or.ddit.vo.SubjectVO;

public interface EnrollService {

	/**
	 * 전체 과목 리스트
	 * @param subjectVO 교수 교번이 담긴 vo
	 * @return 과목 리스트
	 */
	public List<SubjectVO> getSubjectList(SubjectVO subjectVO);

	/**
	 * 강의 insert를 위해 과목번호 만들어오기
	 * @param teaNum 강의를 신청한 담당 교수 교번
	 * @return 과목번호
	 */
	public String makeSbjNum(int teaNum);
	
	/**
	 * 강의개설 insert
	 * @param param : Subject, Subject_Plan, Subject_Index 테이블에 insert할 데이터
	 * 
	 * update도 가능하게 추가
	 * @param : insert 할때 넘어오는 param에 spNum값 추가
	 */
	public void insertSubject(Map<String, Object> param);

	/**
	 * 강의 계획서 보기
	 * @param sbjNum 보기를 누른 과목번호
	 * @return 개설과목, 강의계획서, 학습목차가 모두 담긴 map
	 */
	public Map<String, Object> getSubjectAjax(String sbjNum);

	
	/**
	 * 개설 신청 취소(삭제)
	 * @param sbjNum : 취소한 과목 번호
	 */
	public void deleteSubject(String sbjNum);

	/**
	 * 건물 테이블의 데이터 리스트
	 * @return
	 */
	public List<BuildingVO> getBuilding();
	
	/**
	 * 선택한 건물에 속한 강의실 리스트
	 * @param buildingCode : 선택한 건물코드
	 * @return : 속한 강의실 리스트
	 */
	public List<RoomVO> getRoomList(String buildingCode);

	/**	/**
	 * 선택한 강의실에 잡혀있는 강의 리스트
	 * @param roomCode : 선택한 강의실
	 * @return : 강의 + 시간 리스트
	 */
	public List<SubjectVO> getTimeTable(String roomCode);

	/**
	 * 강의시간 선택후 submit
	 * @param map : 선택한 강의 번호, 건물코드, 강의실 코드, 시간
	 * map : {sbjNum=CHE01001, sel_times=SCIENCE_BUILD-SC_101-MON1, SCIENCE_BUILD-SC_101-MON2, SCIENCE_BUILD-SC_101-MON3, }
	 */
	public void insertTime(Map<String, Object> map);

	/**
	 * 선택한 강의의 건물, 강의실, 시간 정보 가져오기
	 * @param sbjNum : 선택한 강의
	 * @return
	 */
	public List<Map<String, Object>> getTimeData(String sbjNum);

	// 관리자--------------------------------------------------------------------
	/**
	 * 개설한 과목을 승인
	 * @param sbjNum
	 */
	public void updateSubjectOk(String sbjNum);

	/**
	 * 반려한 강의 사유 update
	 * @param subjectVO : 반려한 강의의 과목번호, 반려사유
	 * @return
	 */
	public void updateSubjectCom(SubjectVO subjectVO);
	
}
