package kr.or.ddit.study.general.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.StudyGeneralMapper;
import kr.or.ddit.study.general.service.StudyGeneralService;
import kr.or.ddit.vo.StudyReportVO;
import kr.or.ddit.vo.StudyVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class StudyGeneralServiceImpl implements StudyGeneralService {

	@Autowired
	StudyGeneralMapper sgMapper;
	
	/**
	 * 스터디 전체 리스트 가져오기
	 * @param studyVO : 로그인한 학생 학번이 담긴 VO
	 * @return
	 */
	@Override
	public List<StudyVO> getStudyList(StudyVO studyVO) {
		return sgMapper.getStudyList(studyVO);
	}

	/**
	 * 스터디 신청 취소, 초대 수락, 거절
	 * @param studyVO : 선택한 스터디 번호, sGrade( -1 : 거절/취소, 0 : 수락), 대상 학번
	 */
	@Override
	public int modiStudyGrade(StudyVO studyVO) {
		if(studyVO.getsGrade() == -1) {
			return sgMapper.deleteStudy(studyVO);
		}else if(studyVO.getsGrade() == 0) {
			return sgMapper.updateStudy(studyVO);
		}
		return sgMapper.insertStudy(studyVO);
	}

	/**
	 * 입장을 누른 스터디의 정보를 ajax로 세션에 담음
	 * @param studyVO : 입장한 스터디 번호가 담긴 VO
	 */
	@Override
	public StudyVO getStudy(StudyVO studyVO) {
		return sgMapper.getStudy(studyVO);
	}

	/**
	 * 스터디에 참여, 초대, 신청한 모든 학생들 리스트
	 * @param studyVO : 스터디 번호가 담긴 VO
	 */
	@Override
	public List<Map<String, Object>> getStudentList(StudyVO studyVO) {
		return sgMapper.getStudentList(studyVO);
	}

	@Override
	public List<Map<String, Object>> inviteList(int sNum) {
		List<Map<String, Object>> inviteListMap = sgMapper.inviteList(sNum);
		for(Map<String, Object> map : inviteListMap) {
			map.put("button", "<button type='button' class='btn btn-primary btnInvite'>초대</button>");
		}
		
		return inviteListMap;
	}

	@Override
	public void reportStudy(StudyVO studyVO, StudyReportVO srVO) {
		sgMapper.reportStudy(srVO);
		sgMapper.deleteStudy(studyVO);
	}

	@Override
	public List<Map<String, Object>> wholeStudyList(int stuNum) {
		return sgMapper.wholeStudyList(stuNum);
	}

	@Override
	public List<Map<String, Object>> studentList() {
		return sgMapper.studentList();
	}

	@Override
	public void openStudy(int openStu, String sNm, String[] stuNumArr) {
		StudyVO open = new StudyVO();
		open.setsNm(sNm);
		open.setStuNum(openStu);
		open.setsGrade(1);
		int res = sgMapper.openStudy(open);
		
		if(stuNumArr.length < 1) return;
		
		for(String stuNum : stuNumArr) {
			StudyVO studyVO = new StudyVO();
			studyVO.setsNum(open.getsNum());
			studyVO.setsNm(sNm);
			studyVO.setStuNum(Integer.parseInt(stuNum));
			studyVO.setsGrade(3);
			sgMapper.insertStudy(studyVO);
		}
	}

	@Override
	public List<Map<String, Object>> banStudyList() {
		return sgMapper.banStudyList();
	}

	@Override
	public Map<String, Object> manageReportStudy(StudyVO studyVO, boolean history) {
		sgMapper.manageReportStudy(studyVO);
		
		// 정지
		if(studyVO.getsGrade() == -4) {
			return sgMapper.banStudyOne(studyVO);
		}
		
		// 취소
		// 내역 삭제
		if(history) {
			sgMapper.deleteHistory(studyVO);
		}
		return sgMapper.afterBanCancel(studyVO);
	}

	@Override
	public List<Map<String, Object>> reportedStudyList() {
		return sgMapper.reportedStudyList();
	}

	@Override
	public Map<String, Object> getReasonList(int sNum) {
		List<Map<String, Object>> reasonList = sgMapper.getReasonList(sNum);
		Map<String, Object> map = new HashMap<>();
		map.put("data", reasonList);
		
		return map;
	}

}
