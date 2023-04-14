package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.AdminVO;

@Repository
public interface EmployeeMapper {
	// (관리자) 리스트 조회
	//	public List<AdminVO> admList();

	// (관리자) 페이징
	public List<AdminVO> admList(Map<String, Object> map);

	// (관리자) 1명 상세조회
	public AdminVO empNum(Map<String, Object> map);

	// (관리자) 삭제
	public int deleteNum(Map<String, Object> map);

	// (관리자) 모달창 수정
	public int updatePost(Map<String, Object> map);

	public int getTotal(Map<String, Object> map);

	// (관리자) 사번 자동생성
	public int getEmpNum();

	// (관리자) 교직원 등록
	public int createPost(Map<String, Object> map);

	// (관리자) 유저 아이디 등록
	public int createUsers();

	// (관리자) 유저 아이디 등록 후 권한 부여
	public int createAuth();

	// (관리자) 유저 아이디 삭제
	public int deleteUsers(Map<String, Object> map);

	// (관리자) 유저 권한 삭제
	public int deleteAuth(Map<String, Object> map);
	
}
