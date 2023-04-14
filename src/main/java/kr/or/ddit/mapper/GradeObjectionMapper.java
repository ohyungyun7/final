package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.CourseListVO;
import kr.or.ddit.vo.GradeObjectVO;
import kr.or.ddit.vo.ReportCardVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.TeacherVO;

@Repository
public interface GradeObjectionMapper {

	// (학생) 수강내역 리스트
	public List<CourseListVO> gradeObjectionList(Map<String, Object> map);

	// (학생) 학생정보
	public StudentVO getStuInfo(Map<String, Object> map);

	// (학생) 상세내역
	public List<ReportCardVO> detail(Map<String, Object> map);

	// (학생) 성적이의신청
	public int create(Map<String, Object> map);

	// (학생) 성적이의신청이 있는지 없는지 체크
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
