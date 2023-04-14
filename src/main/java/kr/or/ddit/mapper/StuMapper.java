package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.StudentVO;

public interface StuMapper {
	
	/**
	 * 학생 목록
	 * @return List<StudentVO>
	 */
	public List<StudentVO> stuList();

	/**
	 * 다수의 학생을 student에 추가하는 메소드
	 * @param stuList 
	 * @return 실행 결과 (성공:1, 실패0)
	 */
	public int insertMany(List<StudentVO> stuList);
	/**
	 * 다수의 학생을 users에 추가하는 메소드 (비밀번호는 주민번호 앞자리)
	 * @param stuList 
	 * @return 실행 결과 (성공:1, 실패0)
	 */
	public int insertManyUsers(List<StudentVO> stuList);
	
	/**
	 * 다수의 학생을 AUTHENTICATE에 추가하는 메소드
	 * @param stuList
	 * @return 실행 결과 (성공:1, 실패0)
	 */
	public int insertManyAuth(List<StudentVO> stuList);

	/**
	 * 한 명의 학생을 추가
	 * @param stuVO
	 * @return 실행 결과 (성공:1, 실패0)
	 */
	public int insertStu(StudentVO stuVO);

	/**
	 * 학과 정보 가져오기
	 * @return List<DepartmentVO>
	 */
	public List<DepartmentVO> getDeptList();

	/**
	 * 총 학생 수 가져오기
	 * @return int
	 */
	public int totalStu();
	/**
	 * 신입생 수 가져오기
	 * @return int
	 */
	public int newStu();
	/**
	 * 재학생 수 가져오기
	 * @return int
	 */
	public int originStu();
	/**
	 * 졸업생 수 가져오기
	 * @return int
	 */
	public int gradStu();

	public List<StudentVO> stuList(int selectKey);

}
