package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.TeacherVO;

@Repository
public interface DPMapper {

	// (관리자) 학과 전체조회
	public List<DepartmentVO> deptList();

	// (관리자) 학과 상세조회
	public DepartmentVO deptNm(Map<String, Object> map);

	// (관리자) 학과 총 갯수
	public int getTotal(Map<String, Object> map);

	// (관리자) 단과대학 가져오기
	public List<DepartmentVO> getCollNm();

	// (관리자) 학과명 삭제
	public int deleteNum(Map<String, Object> map);

	// (관리자) 학과명 추가
	public int createDeptNm(Map<String, Object> map);

	// (관리자) 모달에서 교수 리스트조회
	public List<TeacherVO> getProNum(Map<String, Object> map2);

	// (관리자) 학과 추가
	public int createCollNm(Map<String, Object> map);

	// (관리자) 학과 상세조회
	public DepartmentVO deptNum(Map<String, Object> map);

	// (관리자) 학과 수정
	public int update(Map<String, Object> map);
}
