package kr.or.ddit.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.ColleageVO;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.StudentVO;

@Repository
public interface GraphMapper {

	/***
	 * 단과대 리스트 가져오기
	 * @return
	 */
	public List<ColleageVO> colleageList();

	/***
	 * 학과별 인원 가져오기
	 * @return
	 */
	public List<ColleageVO> sumPeopleList();


	/**
	 *	학과별 인원 가져오기
	 * @return
	 */
	public List<ColleageVO> departSumPeople();

	/**
	 * 연도 중복 제거
	 * @return
	 */
	public List<StudentVO> yearList();

	/**
	 * 연도별 성비
	 * @return
	 */
	public List<StudentVO> mealFemale();

	/**
	 * 학과 리스트 가져오기
	 * @return
	 */
	public List<DepartmentVO> departList();

	/**
	 * 학과별 성비 가져오기
	 * @return
	 */
	public List<StudentVO> departMaleFemale();

}
