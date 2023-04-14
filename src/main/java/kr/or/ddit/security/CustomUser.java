package kr.or.ddit.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.or.ddit.vo.AdminVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.TeacherVO;

//User : 스프링 시큐리티가 제공하고 있는 사용자 정보 클래스
public class CustomUser extends User {
	
	//이 memVO 객체는 JSP에서 사용할 수 있음
	private StudentVO stuVO;
	private TeacherVO teaVO;
	private AdminVO admVO;
	
	public CustomUser(String username, String password, 
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	
	public CustomUser(StudentVO stuVO) {
		super(stuVO.getStuNum() + "", stuVO.getPassword(), getCollect(stuVO.getAuth()));
		this.stuVO = stuVO;
	}

	public CustomUser(TeacherVO teaVO) {
		super(teaVO.getTeaNum() + "", teaVO.getPassword(), getCollect(teaVO.getAuth()));
		this.teaVO = teaVO;
	}

	public CustomUser(AdminVO admVO) {
		super(admVO.getEmpNum() + "", admVO.getPassword(), getCollect(admVO.getAuth()));
		this.admVO = admVO;
	}
	
	public static List<SimpleGrantedAuthority> getCollect(String auth){
		List<SimpleGrantedAuthority> authorities 
			= new ArrayList<SimpleGrantedAuthority>();
		
			// memAuthVO.getAuth() : ROLE_ADMIN
			SimpleGrantedAuthority authority = 
					new SimpleGrantedAuthority(auth);
			authorities.add(authority);
		return authorities;
	}
	
	public StudentVO getStuVO() {
		return stuVO;
	}
	public void setStuVO(StudentVO stuVO) {
		this.stuVO = stuVO;
	}

	public TeacherVO getTeaVO() {
		return teaVO;
	}
	public void setTeaVO(TeacherVO teaVO) {
		this.teaVO = teaVO;
	}

	public AdminVO getAdmVO() {
		return admVO;
	}
	public void setAdmVO(AdminVO admVO) {
		this.admVO = admVO;
	}
	
}







