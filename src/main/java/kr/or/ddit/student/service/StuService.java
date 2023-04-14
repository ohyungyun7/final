package kr.or.ddit.student.service;


import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.StudentVO;

public interface StuService {
	
	/**
	 * 등록된 학생 목록을 불러오는 최초의 메소드 
	 * @return 학생 목록
	 */
	public List<StudentVO> stuList();

	/**
	 * 다수의 학생을 DB에 추가
	 * @param stuList 
	 * @return 실행 결과 (성공:1, 실패0)
	 */
	public int insertMany(List<StudentVO> stuList);

	
	/**
	 * 학과 정보 가져오기
	 * @return List<DepartmentVO>
	 */
	public List<DepartmentVO> getDeptList();

	/**
	 * 총 학생 수 가져오기
	 * @return Map<String,Integer>
	 */
	public Map<String,Integer> totalStu();

	/**
	 * 총 학생 목록 가져오기 + 카테고리 선택
	 * @param selectKey
	 * @return List<StudentVO>
	 */
	public List<StudentVO> stuList(int selectKey);


}
