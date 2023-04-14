package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.CourseListVO;
import kr.or.ddit.vo.TuitionVO;

@Repository
public interface TuitionMapper {
	// 등록금 전체 조회 - 학생
	public List<TuitionVO> stuTuitionList(Map<String, Object> map);
	
	// 등록금 전체 조회 - 관리자(페이징)
	public List<TuitionVO> admTuitionList(Map<String, Object>map);

	// 등록금 받은 학생 1명 상세보기
	public TuitionVO tuitionNum(Map<String, Object> map);
	
	//전체 행의 수(total)
	public int getTotal(Map<String, Object> map);

	// 등록금 전체 조회 시 연도 가져오기
	public List<CourseListVO> getTuitionYear();

	// 
	public int checkRnum(Map<String, Object> map);

	// 페이징 안되는 리스트 구현
	public List<TuitionVO> admTuitionList2(Map<String, Object> map);

}
