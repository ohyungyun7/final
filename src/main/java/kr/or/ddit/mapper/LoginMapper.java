package kr.or.ddit.mapper;

import kr.or.ddit.vo.AdminVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.TeacherVO;
import kr.or.ddit.vo.UserVO;

public interface LoginMapper {
	
		// user(아이디)의 권한 가져오기
		public String checkAuth(int user);

		// user(아이디)의 비밀번호 가져오기	
		public String chcekPW(int user);

		// user(아이디)의 학생VO 가져오기
		public StudentVO stuLogin(StudentVO stuVO);
		
		// user(아이디)의 교수VO 가져오기
		public TeacherVO teaLogin(TeacherVO teaVO);

		// user(아이디)의 교직원VO 가져오기
		public AdminVO admLogin(AdminVO admVO);
		
		
		public UserVO getStudent(int user);

		public UserVO getTeacher(int user);

		public UserVO getAdmin(int user);

		public String getAuth(int user);


}
