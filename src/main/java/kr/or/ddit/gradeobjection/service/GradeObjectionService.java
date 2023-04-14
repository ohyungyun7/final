package kr.or.ddit.gradeobjection.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CourseListVO;
import kr.or.ddit.vo.GradeObjectVO;
import kr.or.ddit.vo.ReportCardVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.TeacherVO;

public interface GradeObjectionService {

	// (학생) 수강내역 리스트
	public List<CourseListVO> gradeObjectionList(Map<String, Object> map);

	// (학생) 학생정보
	public StudentVO getStuInfo(Map<String, Object> map);

	// (학생) 상세내역
	public List<ReportCardVO> detail(Map<String, Object> map);

	/**
	 * 이의신청 내용 insert
	 *
	 * @param map
	 * @param request
	 * @return
	 */
	public int create(Map<String, Object> map);

	/**
	 * 이의신청 내용이 이미 작성을 했는지 안했는지 체크 작성이 있을 시 클릭 이벤트 막음
	 *
	 * @param map
	 * @param request
	 * @return
	 */
	public int check(Map<String, Object> map);

	// (교수) 교수정보
	public TeacherVO getTeaInfo(Map<String, Object> map);

	// (교수) 성적이의신청 리스트
	public List<GradeObjectVO> teacherObjList(Map<String, Object> map);

	// (교수) 성적이의신청 승인
	public int updateState(Map<String, Object> map);

	// (교수) 성적이의신청 반려
	public int updateState1(Map<String, Object> map);
}
