package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CourseListVO;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.ShoppingBasketVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.SubjectVO;


public interface SubjectMapper {

	public List<SubjectVO> subjectList(Map<String, String> map);

	public int incrementCurrent(String claNum);

	public int insertSubjectList(Map<String, Object> map333);

	public int minusCurrent(String claNum);

	public int deleteSubjectList(Map<String, Object> map333);

	//public List<CourseListVO> courseList(String id);

	public List<SubjectVO> mySubjectList(Map<String, Object> map);

	public int myListCount(Map<String, Object> map);

	public List<ShoppingBasketVO> shoppingList(int id);

	public StudentVO getStudentInfo(int id);

	public List<DepartmentVO> departmentList(String deptName);

	public int getTotal(Map<String, String> map);

	public int currentRecode(int currentRecode);

	public String limitRecode(int parseInt);

	public List<SubjectVO> allSubjectList();

	public SubjectVO addBasketVO(Map<String, Object> map333);

	public List<ShoppingBasketVO> shoppingRank();

	public List<SubjectVO> examAdd(int parseInt);

	public SubjectVO sbjOnlineTitle(Map<String, Object> map);

	public int updateSemester(int id);

	public int insertCourseList(Map<String, Object> map2);

	public int deleteShppingList(int id);

	public int resetCurrentData();

	public List<CourseListVO> coursList(int id);

	/**
	 * 해당 클릭한 과목이 3.0이상인지 이하인지
	 * 이거에 따라 재수강이 되는지 재수강이 안되는지가 결정됨
	 * @param map
	 * @param request
	 * @return
	 */
	public List<CourseListVO> check3dat0(Map<String, Object> map);

}
