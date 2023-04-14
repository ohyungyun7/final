package kr.or.ddit.lecture.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.lecture.service.LectureService;
import kr.or.ddit.mapper.LectureMapper;
import kr.or.ddit.vo.CourseListVO;
import kr.or.ddit.vo.LectureEvaVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.SubjectVO;
import kr.or.ddit.vo.TeacherVO;

@Service
public class LectureServiceImpl implements LectureService {
	
	@Autowired
	LectureMapper lectureMapper;
	
	// (학생) 강의평가 조회
	@Override
	public List<LectureEvaVO> stuLectureList(Map<String, Object> map) {
		return lectureMapper.stuLectureList(map);
	}

	// (관리자) 강의평가 조회
	@Override
	public List<LectureEvaVO> lectureList() {
		return lectureMapper.lectureList();
	}

	//강의평가 항목 가져오기
	@Override
	public List<LectureEvaVO> lectureListList() {
		return lectureMapper.lectureListList();
	}

	@Override
	public StudentVO studentVO(Map<String, Object> map) {
		return lectureMapper.studentVO(map);
	}

	//clNum 가져오기
	@Override
	public String getClNum(Map<String, Object> map) {
		return lectureMapper.getClNum(map);
	}

	//LECTURE_EVA 데이터 넣기
	@Override
	public int insertLecEva(Map<String, Object> map) {
		return lectureMapper.insertLecEva(map);
	}

	//LECTURE_EVA가 있는지 확인
	@Override
	public String getLeNum(Map<String, Object> map) {
		return lectureMapper.getLeNum(map);
	}

	//교수 정보 가져오기
	@Override
	public TeacherVO getTeaVO(Map<String, Object> map) {
		return lectureMapper.getTeaVO(map);
	}

	//교수의 강의평가 한 인원수 적용
	@Override
	public List<SubjectVO> myLectureCheckList(Map<String, Object> map) {
		return lectureMapper.myLectureCheckList(map);
	}

	//주관식 교수에게 하고싶은말
	@Override
	public int insertLecEva2(Map<String, Object> map) {
		return lectureMapper.insertLecEva2(map);
	}

	//각 과목의 각 항목 리스트 선택 비율을 가져옴
	@Override
	public List<LectureEvaVO> getRatioLecture(Map<String, Object> map) {
		return lectureMapper.getRatioLecture(map);
	}

	//해당 과목의 교수에게 하고싶은말 가져옴
	@Override
	public List<LectureEvaVO> replyAnswer(Map<String, Object> map) {
		return lectureMapper.replyAnswer(map);
	}

	//수강한 학기 가져오기
	@Override
	public List<CourseListVO> myLectureList(Map<String, Object> map) {
		return lectureMapper.myLectureList(map);
	}

	//원하는 연도와 학기를 추가해서 불러오기
	@Override
	public List<LectureEvaVO> stuLectureList2(Map<String, Object> map) {
		return lectureMapper.stuLectureList2(map);
	}
}
