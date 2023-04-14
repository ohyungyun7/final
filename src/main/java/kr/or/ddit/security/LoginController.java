package kr.or.ddit.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {

	//<security:form-login login-page="/login" />
	//요청URI : /login
	//요청방식 : get
	//오류 메시지와 로그아웃 메시지를 파라미터로 사용해보자(없을 수도 있음)
	@GetMapping("/login")
	public String loginForm(String error, String logout, Model model, HttpServletRequest request) {

		log.info("error : " + error);
		log.info("logout : " + logout);


		if(error != null) {
//			model.addAttribute("error", "Login Error");
			log.info("login error");

			int count = 0;
			HttpSession session = request.getSession();
			if(session.getAttribute("failCount") == null) {
				count = 1;
				session.setAttribute("failCount", count);
			}else {
				count = (int)session.getAttribute("failCount");
				count += 1;
				session.removeAttribute("failCount");
				session.setAttribute("failCount", count);
			}
			model.addAttribute("msg", "아이디와 비밀번호를 확인해주세요.");

			log.info("count : " + count);
		}


		if(logout != null) {
			model.addAttribute("logout", "Logout!!");
		}

		//forwarding
		return "login/login";
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/main")
	public String home(HttpServletRequest request) {
		String goPage = "";
		goPage = "home";

		HttpSession session = request.getSession();
		UserVO userVO =(UserVO) session.getAttribute("userVO");

		if(userVO.getAuth().equals("ROLE_STU")) {
			goPage ="stuHome";
		}else if(userVO.getAuth().equals("ROLE_TEA")) {
			goPage ="teaHome";
		}else {
			goPage ="admHome";
		}
		return goPage;
	}
}
