package kr.or.ddit.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.or.ddit.mapper.LoginMapper;
import kr.or.ddit.vo.AdminVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.TeacherVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomUserDetailsService implements UserDetailsService {
	
	//DI(의존성 주입)
	@Autowired
	LoginMapper loginMapper;
	
	//요청파라미터 : <input type="text" name="username"...
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		log.info("costumUserDetail");
		
		int user = Integer.parseInt(username);
		
		String auth = loginMapper.checkAuth(user);
		String pw = loginMapper.chcekPW(user);
		
		
		if(auth.equals("ROLE_STU")) {
			StudentVO stuVO = new StudentVO();
			stuVO.setStuNum(user);
			
			stuVO = loginMapper.stuLogin(stuVO);
			stuVO.setPassword(pw);
			stuVO.setAuth(auth);
			log.warn("stuVO(after) : " + stuVO);
			
			return stuVO==null?null:new CustomUser(stuVO);
			
		}else if(auth.equals("ROLE_TEA")) {
			TeacherVO teaVO = new TeacherVO();
			teaVO.setTeaNum(user);
			teaVO.setAuth(auth);
			teaVO = loginMapper.teaLogin(teaVO);
			teaVO.setPassword(pw);
			
			log.warn("teaVO(after) : " + teaVO);
			
			return teaVO==null?null:new CustomUser(teaVO);			
		}else {
			AdminVO admVO = new AdminVO();
			admVO.setEmpNum(user);
			admVO.setAuth(auth);
			admVO = loginMapper.admLogin(admVO);
			admVO.setPassword(pw);
			
			log.warn("admVO(after) : " + admVO);
			
			return admVO==null?null:new CustomUser(admVO);			
		}
		
	}
	
}






