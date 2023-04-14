package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.SubjectVO;

public interface CmMapper {
	
	/**
	 * 강의목록 전체 불러오기
	 * @return List SubjectVO
	 */
	public List<SubjectVO> getAll();

	/**
	 * 강의 승인
	 * @param String sbjNum
	 * @return integer
	 */
	public int approval(String sbjNum);
	
	/**
	 * 강의 거절
	 * @param String sbjNum
	 * @return integer
	 */
	public int declined(String sbjNum);

	/**
	 * 강의 폐강
	 * @param String sbjNum
	 * @return integer
	 */
	public int closed(String sbjNum);
	
	
}
