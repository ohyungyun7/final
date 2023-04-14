package kr.or.ddit.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import kr.or.ddit.mapper.LoginMapper;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomLoginSuccessHandler extends 
	SavedRequestAwareAuthenticationSuccessHandler {
	
	@Autowired
	LoginMapper loginMapper;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication auth)
			throws ServletException, IOException {
		//~했을때.로그인을.성공
		log.info("onAuthenticationSuccess");
		log.info("로그인 성공!");

		HttpSession session = request.getSession();
		
		session.removeAttribute("failCount");
		
		User costomUser = (User)auth.getPrincipal();
		
		log.info("username : " + costomUser.getUsername());
		
		
		int user = Integer.parseInt(costomUser.getUsername());
		
		String authen = loginMapper.getAuth(user);
		log.info("authen:" + authen);
		
		UserVO userVO = new UserVO();
		
		if(authen.equals("ROLE_STU")) {
			userVO = loginMapper.getStudent(user);
			session.setAttribute("userVO", userVO);
			
		}else if(authen.equals("ROLE_TEA")) {
			userVO = loginMapper.getTeacher(user);
			session.setAttribute("userVO", userVO);
			
		}else {
			userVO = loginMapper.getAdmin(user);
			session.setAttribute("userVO", userVO);
		}
		
		super.onAuthenticationSuccess(request, response, auth);
	}
	
}










