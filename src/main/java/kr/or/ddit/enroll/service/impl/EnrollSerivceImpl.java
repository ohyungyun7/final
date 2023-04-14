package kr.or.ddit.enroll.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.enroll.service.EnrollService;
import kr.or.ddit.mapper.EnrollMapper;
import kr.or.ddit.vo.BuildingVO;
import kr.or.ddit.vo.LectureTmVO;
import kr.or.ddit.vo.RoomVO;
import kr.or.ddit.vo.SubjectIndexVO;
import kr.or.ddit.vo.SubjectPlanVO;
import kr.or.ddit.vo.SubjectVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EnrollSerivceImpl implements EnrollService {

	@Autowired
	EnrollMapper enrollMapper;

	/**
	 * 전체 과목 리스트
	 * @param subjectVO 교수 교번이 담긴 vo
	 * @return 과목 리스트
	 */
	@Override
	public List<SubjectVO> getSubjectList(SubjectVO subjectVO) {
		return enrollMapper.getSubjectList(subjectVO);
	}

	/**
	 * 강의 insert를 위해 과목번호 만들어오기
	 * @param teaNum 강의를 신청한 담당 교수 교번
	 * @return 과목번호
	 */
	@Override
	public String makeSbjNum(int teaNum) {
		return enrollMapper.makeSbjNum(teaNum);
	}
	
	/**
	 * 강의개설 insert
	 * @param param : Subject, Subject_Plan, Subject_Index 테이블에 insert할 데이터
	 * @param : insert 할때 넘어오는 param에 spNum값 추가
	 */
	@Override
	public void insertSubject(Map<String, Object> param) {
		// 개설과목 insert
		enrollMapper.insertSubject(param);
		
		// spNum이 없으면 insert
		if(param.get("spNum") == null || "".equals(param.get("spNum"))) {
			// 강의계획서 insert
			int res = enrollMapper.insertSubjectPlan(param);
		}else {	// 있으면 update
			enrollMapper.updateSubjectPlan(param);
		}
		
		// 학습목차 insert
		List<SubjectIndexVO> siVOList = new ArrayList<>();
		for(int i = 1; i < 16; i++) {
			SubjectIndexVO siVO = new SubjectIndexVO();
			siVO.setSiNum(i + "");
			siVO.setSpNum((String) param.get("spNum"));
			siVO.setSbjNum((String) param.get("sbjNum"));
			siVO.setSiTarget((String) param.get("slTarget_" + i));
			siVOList.add(siVO);
		}
		enrollMapper.insertSubjectIndex(siVOList);
		
	}
	
	/**
	 * 강의 계획서 보기
	 * @param sbjNum 보기를 누른 과목번호
	 * @return 개설과목, 강의계획서, 학습목차가 모두 담긴 map
	 */
	@Override
	public Map<String, Object> getSubjectAjax(String sbjNum) {
		
		Map<String, Object> map = new HashMap<>();
		
		SubjectVO subjectVO = enrollMapper.getSubject(sbjNum);
		SubjectPlanVO spVO = enrollMapper.getSubjectPlan(sbjNum);
		List<SubjectIndexVO> siVOList = enrollMapper.getSubjectIndexList(spVO.getSpNum());
		
		map.put("subjectVO", subjectVO);
		map.put("spVO", spVO);
		map.put("siVOList", siVOList);
		
		return map;
	}
	
	/**
	 * 개설 신청 취소(삭제)
	 * @param sbjNum : 취소한 과목 번호
	 */
	@Override
	public void deleteSubject(String sbjNum) {
		enrollMapper.deleteSubject(sbjNum);
	}
	
	/**
	 * 건물 테이블의 데이터 리스트
	 * @return
	 */
	@Override
	public List<BuildingVO> getBuilding() {
		return enrollMapper.getBuilding();
	}

	/**
	 * 선택한 건물에 속한 강의실 리스트
	 * @param buildingCode : 선택한 건물코드
	 * @return : 속한 강의실 리스트
	 */
	@Override
	public List<RoomVO> getRoomList(String buildingCode) {
		return enrollMapper.getRoomList(buildingCode);
	}

	/**
	 * 선택한 강의실에 잡혀있는 강의 리스트
	 * @param roomCode : 선택한 강의실
	 * @return : 강의 + 시간 리스트
	 */
	@Override
	public List<SubjectVO> getTimeTable(String roomCode) {
		return enrollMapper.getTimeTable(roomCode);
	}

	/**
	 * 강의시간 선택후 submit
	 * @param map : 선택한 강의 번호, 건물코드, 강의실 코드, 시간
	 * map : {sbjNum=CHE01001, sel_times=SCIENCE_BUILD-SC_101-MON1, SCIENCE_BUILD-SC_101-MON2, SCIENCE_BUILD-SC_101-MON3, }
	 */
	@Override
	public void insertTime(Map<String, Object> map) {
		List<LectureTmVO> ltVOList = new ArrayList<>();
		String[] times = ((String) map.get("sel_times")).split(", ");
		String sbjNum = (String) map.get("sbjNum");
		int count = enrollMapper.countTime(sbjNum);
		if(count > 0) {
			enrollMapper.deleteTime(sbjNum);
		}
		
		for(int i = 0; i < times.length; i++) {
			LectureTmVO ltVO = new LectureTmVO();
			String[] codes = times[i].split("-");
			ltVO.setSbjNum(sbjNum);
			ltVO.setRoomCode(codes[1]);
			ltVO.setTimeTcode(codes[2]);
			ltVOList.add(ltVO);
		}
		log.info("ltVOList : " + ltVOList);
		
		enrollMapper.mergeRoomSchedule(ltVOList);
		enrollMapper.insertTime(ltVOList);
	}

	/**
	 * 선택한 강의의 건물, 강의실, 시간 정보 가져오기
	 * @param sbjNum : 선택한 강의
	 * @return
	 */
	@Override
	public List<Map<String, Object>> getTimeData(String sbjNum) {
		return enrollMapper.getTimeData(sbjNum);
	}

	// 관리자 -------------------------------------------------------------
	/**
	 * 개설 신청한 강의 승인
	 */
	@Override
	public void updateSubjectOk(String sbjNum) {
		enrollMapper.updateSubjectOk(sbjNum);
	}

	/**
	 * 반려한 강의 사유 update
	 * @param subjectVO : 반려한 강의의 과목번호, 반려사유
	 * @return
	 */
	@Override
	public void updateSubjectCom(SubjectVO subjectVO) {
		enrollMapper.updateSubjectCom(subjectVO);
	}


}
