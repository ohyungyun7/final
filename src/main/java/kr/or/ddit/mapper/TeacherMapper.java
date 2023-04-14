package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.TeacherVO;

@Repository
public interface TeacherMapper {

	// (교수조회) 페이징
	public List<TeacherVO> proList(Map<String, Object> map);

	// 글 총 갯수
	public int getTotal(Map<String, Object> map);

	// (교수) 1명 상세조회
	public TeacherVO teaNum(Map<String, Object> map);

	// (교수) 삭제
	public int deleteTea(Map<String, Object> map);

	// (교수) 유저 아이디 삭제
	public int deleteUsers(Map<String, Object> map);

	// (교수) 유저 권한 삭제
	public int deleteAuth(Map<String, Object> map);

	// (교수) 사번 자동생성
	public int getTeaNum();

	// (교수) 교직원 등록
	public int createPost(Map<String, Object> map);

	// (교수) 유저 아이디 등록
	public int createUsers();

	// (교수) 유저 아이디 등록 후 권한 부여
	public int createAuth();

	// (교수) 모달창 수정
	public int updateTeacher(Map<String, Object> map);

	// (교수) 학과명 리스트
	public List<DepartmentVO> getDepartMentNm();

	// (교수) 직함리스트
	public List<TeacherVO> getTeacher();

	// (교수) 전체 수
	public int total();

	// (교수) 학과장 수
	public int teaTitle();

	// (교수) 관리자 수
	public int totalEmp();
}
