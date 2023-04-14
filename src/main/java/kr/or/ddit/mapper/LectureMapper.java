package kr.or.ddit.mapper;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.CourseListVO;
import kr.or.ddit.vo.LectureEvaVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.SubjectVO;
import kr.or.ddit.vo.TeacherVO;

@Repository
public interface LectureMapper {
	// (학생) 강의평가 조회
	public List<LectureEvaVO> stuLectureList(Map<String, Object> map);
	
	// (학생) 강의평가 조회
	public List<LectureEvaVO> lectureList();

	//강의평가 항목 가져오기
	public List<LectureEvaVO> lectureListList();
	
	//학생 정보 가져오기
	public StudentVO studentVO(Map<String, Object> map);

	//clNum 가져오기
	public String getClNum(Map<String, Object> map);

	//LECTURE_EVA 데이터 넣기
	public int insertLecEva(Map<String, Object> map);

	//LECTURE_EVA가 있는지 확인
	public String getLeNum(Map<String, Object> map);

	//교수 정보 가져오기
	public TeacherVO getTeaVO(Map<String, Object> map);

	//교수의 강의평가 한 인원수 적용
	public List<SubjectVO> myLectureCheckList(Map<String, Object> map);

	//주관식 교수에게 하고싶은말
	public int insertLecEva2(Map<String, Object> map);

	//각 과목의 각 항목 리스트 선택 비율을 가져옴
	public List<LectureEvaVO> getRatioLecture(Map<String, Object> map);

	//해당 과목의 교수에게 하고싶은말 가져옴
	public List<LectureEvaVO> replyAnswer(Map<String, Object> map);

	//수강한 학기 가져오기
	public List<CourseListVO> myLectureList(Map<String, Object> map);

	//원하는 연도와 학기를 추가해서 불러오기
	public List<LectureEvaVO> stuLectureList2(Map<String, Object> map);
}
