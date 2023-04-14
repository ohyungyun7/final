package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BuildingVO;
import kr.or.ddit.vo.LectureTmVO;
import kr.or.ddit.vo.RoomVO;
import kr.or.ddit.vo.SubjectIndexVO;
import kr.or.ddit.vo.SubjectPlanVO;
import kr.or.ddit.vo.SubjectVO;

public interface EnrollMapper {
	
	/**
	 * 전체 과목 리스트
	 * @param subjectVO 교수 교번이 담긴 vo
	 * @return 과목 리스트
	 */
	public List<SubjectVO> getSubjectList(SubjectVO subjectVO);

	/**
	 * 개설과목 테이블에 insert
	 * @param param
	 * 
	 * update도 가능하게 추가
	 * @param : insert 할때 넘어오는 param에 spNum값 추가
	 */
	public void insertSubject(Map<String, Object> param);

	/**
	 * 강의계획서 테이블에 insert
	 * @param param
	 * @return 
	 */
	public int insertSubjectPlan(Map<String, Object> param);

	/**
	 * 강의 계획서 update
	 * @param param
	 */
	public void updateSubjectPlan(Map<String, Object> param);

	/**
	 * 강의 insert를 위해 과목번호 만들어오기
	 * @param teaNum 강의를 신청한 담당 교수 교번
	 * @return 과목번호
	 */
	public String makeSbjNum(int teaNum);
	
	/**
	 * 학습목차 테이블에 insert
	 * @param siVOList 1주차 ~ 15주차
	 * 
	 * update도 가능하게 추가
	 */
	public void insertSubjectIndex(List<SubjectIndexVO> siVOList);

	/**
	 * 과목번호로 개설과목 select
	 * @param sbjNum : select할 과목번호
	 * @return	SubjectVO
	 */
	public SubjectVO getSubject(String sbjNum);

	/**
	 * 과목번호로 강의계획서 select
	 * @param sbjNum : select할 과목번호
	 * @return	SubjectPlanVO
	 */
	public SubjectPlanVO getSubjectPlan(String sbjNum);

	/**
	 * 과목번호, 강의계획서 번호로 학습목차 리스트 select
	 * @param string : select할 강의계획서 번호
	 * @return	SubjectIndexVO List
	 */
	public List<SubjectIndexVO> getSubjectIndexList(String string);
	
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

	/**
	 * 선택한 강의실에 잡혀있는 강의 리스트
	 * @param roomCode : 선택한 강의실
	 * @return : 강의 + 시간 리스트
	 */
	public List<SubjectVO> getTimeTable(String roomCode);

	/**
	 * 강의실 시간표 테이블에 이미 있는 시간이라면 RS_ISEMPTY를 1로 UPDATE
	 * 없다면 INSERT
	 * @param ltVOList : ROOM_CODE, TIME_TCODE가 담겨있다.
	 */
	public void mergeRoomSchedule(List<LectureTmVO> ltVOList);

	/**
	 * 강의시간 선택후 submit
	 * @param map : 선택한 강의 번호, 건물코드, 강의실 코드, 시간
	 * map : {sbjNum=CHE01001, sel_times=TUE1,TUE2,TUE3, buildingCode=ENGINEERING_BUILD, roomCode=ENG_101}
	 */
	public void insertTime(List<LectureTmVO> ltVOList);

	/**
	 * 선택한 강의의 건물, 강의실, 시간 정보 가져오기
	 * @param sbjNum : 선택한 강의
	 */
	public List<Map<String, Object>> getTimeData(String sbjNum);

	/**
	 * 이미 insert한 값이 있는지 확인 (수정인지 체크하기 위함)
	 * @param sbjNum : 선택한 강의번호
	 * @return
	 */
	public int countTime(String sbjNum);

	/**
	 * 수정을 위해 insert 되어있는 값을 delete
	 * @param sbjNum : 선택한 강의 번호
	 */
	public void deleteTime(String sbjNum);

	// 관리자------------------------------------------------------------------
	
	/**
	 * 개설 신청한 강의 승인
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
