package kr.or.ddit.subject.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.SubjectMapper;
import kr.or.ddit.vo.CourseListVO;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.ShoppingBasketVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.SubjectVO;

@Service
public class SubjectServiceImpl implements SubjectService {

	@Autowired
	SubjectMapper subjectMapper;

	@Override
	public List<SubjectVO> subjectList(Map<String, String> map) {
		return subjectMapper.subjectList(map);
	}

	@Override
	public int incrementCurrent(String claNum) {
		return subjectMapper.incrementCurrent(claNum);
	}

	@Override
	public int insertSubjectList(Map<String, Object> map333) {
		return subjectMapper.insertSubjectList(map333);
	}

	@Override
	public int minusCurrent(String claNum) {
		return subjectMapper.minusCurrent(claNum);
	}

	@Override
	public int deleteSubjectList(Map<String, Object> map333) {
		return subjectMapper.deleteSubjectList(map333);
	}

//	@Override
//	public List<CourseListVO> courseList(String id) {
//		return subjectMapper.courseList(id);
//	}

	@Override
	public List<SubjectVO> mySubjectList(Map<String, Object> map) {
		return subjectMapper.mySubjectList(map);
	}

	@Override
	public int myListCount(Map<String, Object> map) {
		return subjectMapper.myListCount(map);
	}

	@Override
	public List<ShoppingBasketVO> shoppingList(int id) {
		return subjectMapper.shoppingList(id);
	}

	@Override
	public StudentVO getStudentInfo(int id) {
		return subjectMapper.getStudentInfo(id);
	}

	@Override
	public List<DepartmentVO> departmentList(String deptName) {
		return subjectMapper.departmentList(deptName);
	}

	@Override
	public int getTotal(Map<String, String> map) {
		return subjectMapper.getTotal(map);
	}

	@Override
	public int currentRecode(int currentRecode) {
		return subjectMapper.currentRecode(currentRecode);
	}

	@Override
	public String limitRecode(int parseInt) {
		return subjectMapper.limitRecode(parseInt);
	}

	@Override
	public List<SubjectVO> allSubjectList() {
		return subjectMapper.allSubjectList();
	}

	@Override
	public SubjectVO addBasketVO(Map<String, Object> map333) {
		return subjectMapper.addBasketVO(map333);
	}

	@Override
	public List<ShoppingBasketVO> shoppingRank() {
		return subjectMapper.shoppingRank();
	}

	@Override
	public List<SubjectVO> examAdd(int parseInt) {
		return subjectMapper.examAdd(parseInt);
	}

	@Override
	public SubjectVO sbjOnlineTitle(Map<String, Object> map) {
		return subjectMapper.sbjOnlineTitle(map);
	}

	//학기로 학년 업데이트하기
	@Override
	public int updateSemester(int id) {
		return subjectMapper.updateSemester(id);
	}

	//course_list에 넣기
	@Override
	public int insertCourseList(Map<String, Object> map2) {
		return subjectMapper.insertCourseList(map2);
	}

	//course_list에 장바구니함 넣은 후 shopping_basket의 로그인 정보로 되어있는 추가목록 지우기
	@Override
	public int deleteShppingList(int id) {
		return subjectMapper.deleteShppingList(id);
	}

	//학기가 시작되면 기존에있던 subject테이블의 current_를 초기화 시켜야함
	@Override
	public int resetCurrentData() {
		return subjectMapper.resetCurrentData();
	}

	//기존에 수강했던 과목들 불러옴(수강완료를 표시하기 위해)
	@Override
	public List<CourseListVO> coursList(int id) {
		return subjectMapper.coursList(id);
	}

	/**
	 * 해당 클릭한 과목이 3.0이상인지 이하인지
	 * 이거에 따라 재수강이 되는지 재수강이 안되는지가 결정됨
	 * @param map
	 * @param request
	 * @return
	 */
	@Override
	public List<CourseListVO> check3dat0(Map<String, Object> map) {
		return subjectMapper.check3dat0(map);
	}


}
