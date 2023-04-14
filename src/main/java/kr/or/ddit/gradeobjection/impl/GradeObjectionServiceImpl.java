package kr.or.ddit.gradeobjection.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.gradeobjection.service.GradeObjectionService;
import kr.or.ddit.mapper.GradeObjectionMapper;
import kr.or.ddit.vo.CourseListVO;
import kr.or.ddit.vo.GradeObjectVO;
import kr.or.ddit.vo.ReportCardVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.TeacherVO;

@Service
public class GradeObjectionServiceImpl implements GradeObjectionService {

	@Autowired
	GradeObjectionMapper gradeObjectionMapper;

	// (학생) 수강내역 리스트
	@Override
	public List<CourseListVO> gradeObjectionList(Map<String, Object> map) {
		return gradeObjectionMapper.gradeObjectionList(map);
	}

	// (학생) 학생정보
	@Override
	public StudentVO getStuInfo(Map<String, Object> map) {
		return gradeObjectionMapper.getStuInfo(map);
	}

	// (학생) 학생상세정보
	@Override
	public List<ReportCardVO> detail(Map<String, Object> map) {
		return gradeObjectionMapper.detail(map);
	}

	// (학생) 성적이의신청
	@Override
	public int create(Map<String, Object> map) {
		return gradeObjectionMapper.create(map);
	}

	// (학생) 성적이의신청이 있는지 없는지 체크
	@Override
	public int check(Map<String, Object> map) {
		return gradeObjectionMapper.check(map);
	}

	@Override
	public TeacherVO getTeaInfo(Map<String, Object> map) {
		return gradeObjectionMapper.getTeaInfo(map);
	}

	@Override
	public List<GradeObjectVO> teacherObjList(Map<String, Object> map) {
		return gradeObjectionMapper.teacherObjList(map);
	}

	@Override
	public int updateState(Map<String, Object> map) {
		return gradeObjectionMapper.updateState(map);
	}

	@Override
	public int updateState1(Map<String, Object> map) {
		return gradeObjectionMapper.updateState1(map);
	}



}

