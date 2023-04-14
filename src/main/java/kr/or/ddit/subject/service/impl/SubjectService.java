package kr.or.ddit.subject.service.impl;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CourseListVO;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.ShoppingBasketVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.SubjectVO;

public interface SubjectService {

	public List<SubjectVO> subjectList(Map<String, String> map);

	public int incrementCurrent(String claNum);

	public int insertSubjectList(Map<String, Object> map333);

	public int minusCurrent(String claNum);

	public int deleteSubjectList(Map<String, Object> map333);

	//public List<CourseListVO> courseList(String id);

	public List<SubjectVO> mySubjectList(Map<String, Object> map);

	//내가 장바구니에 넣은게 몇개인지 뽑음
	public int myListCount(Map<String, Object> map);

	//장바구니 리스트
	public List<ShoppingBasketVO> shoppingList(int id);

	//학생 정보 가져오기 상단메뉴
	public StudentVO getStudentInfo(int id);

	//부서명 가져오기
	public List<DepartmentVO> departmentList(String deptName);

	//페이지네이션을 위한 총 과목 개수
	public int getTotal(Map<String, String> map);

	//최근 내가 넣은 학점 가져오기
	public int currentRecode(int parseInt);

	//내 직전학기 성적을 비교하여 수강최대학점 가져오기
	public String limitRecode(int parseInt);

	//내가 추가한 과목 리스트
	public List<SubjectVO> allSubjectList();

	//장바구니 추가
	public SubjectVO addBasketVO(Map<String, Object> map333);

	//장바구니에 DENSE_RANK함수로 내기
	public List<ShoppingBasketVO> shoppingRank();

	//온라인 시험 문제내기
	public List<SubjectVO> examAdd(int parseInt);

	//해당하는 과목이 온라인 시험인지 아닌지 확인
	public SubjectVO sbjOnlineTitle(Map<String, Object> map);

	//학기로 학년 업데이트하기
	public int updateSemester(int id);

	//course_list에 장바구니함 다 넣기
	public int insertCourseList(Map<String, Object> map2);

	//course_list에 장바구니함 넣은 후 shopping_basket의 로그인 정보로 되어있는 추가목록 지우기
	public int deleteShppingList(int id);

	//학기가 시작되면 기존에있던 subject테이블의 current_를 초기화 시켜야함
	public int resetCurrentData();

	//기존에 수강했던 과목들 불러옴(수강완료를 표시하기 위해)
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
