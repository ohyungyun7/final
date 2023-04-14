package kr.or.ddit.grade;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.GradeMapper;
import kr.or.ddit.vo.CourseListVO;
import kr.or.ddit.vo.StudentVO;

@Service
public class GradeServiceImpl implements GradeService {

	@Inject
	GradeMapper gradeMapper;

	/**
	 * 해당 학생의 전체 성적 조회
	 * @param stuNum
	 * @return
	 */
	@Override
	public StudentVO getStudentInfo(int stuNum) {
		return gradeMapper.getStudentInfo(stuNum);
	}

	/***
	 * 현재까지의 평균 학점 가져오기
	 * @param stuNum
	 * @return
	 */
	@Override
	public CourseListVO avgScore(int stuNum) {
		return gradeMapper.avgScore(stuNum);
	}

	/***
	 * 해당 학생의 교양 학점 가져오기
	 * @param stuNum
	 * @return
	 */
	@Override
	public CourseListVO kyoYangScore(int stuNum) {
		return gradeMapper.kyoYangScore(stuNum);
	}

	/***
	 * 해당 학생의 수강과목과 성적 및 학기를 가져옴
	 * @param stuNum
	 * @return
	 */
	@Override
	public List<CourseListVO> myCourseListtt(int stuNum) {
		return gradeMapper.myCourseListtt(stuNum);
	}

	/**
	 * 내가 수강한 학기 중복제거로 학기만 가져오기
	 * @param stuNum
	 * @return
	 */
	@Override
	public List<CourseListVO> myClsemesterList(int stuNum) {
		return gradeMapper.myClsemesterList(stuNum);
	}

	/***
	 * 학생의 총 평점 가져오기
	 * @param stuNum
	 * @return
	 */
	@Override
	public CourseListVO totalAvg(int stuNum) {
		return gradeMapper.totalAvg(stuNum);
	}

	/**
	 * 교양을 제외한 현 학기 수강할 총 학점
	 * @param stuNum
	 * @return
	 */
	@Override
	public CourseListVO willMajor(int stuNum) {
		return gradeMapper.willMajor(stuNum);
	}

	/**
	 * 교양 현 학기 수강할 총점
	 * @param stuNum
	 * @return
	 */
	@Override
	public CourseListVO willKyoYang(int stuNum) {
		return gradeMapper.willKyoYang(stuNum);
	}

	/**
	 * 금학기 성적 조회
	 * 학번, 이름, 과목갯수, 과목의 총 취득학점, 해당학기 평점
	 */
	@Override
	public CourseListVO getThisStudentInfo(int stuNum) {
		return gradeMapper.getThisStudentInfo(stuNum);
	}

	/***
	 * 학생의 과목 수강 정보들 가져오기
	 * @param stuNum
	 * @return
	 */
	@Override
	public List<CourseListVO> getThisCourseList(int stuNum) {
		return gradeMapper.getThisCourseList(stuNum);
	}
}
