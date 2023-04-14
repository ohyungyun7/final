package kr.or.ddit.controller;

import java.util.Date;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class WelcomeController {
	
	//요청URI : /home
//	@PreAuthorize("isAuthenticated()")
	@GetMapping("/home")
	public String home() {
//		String CT = getCurrentTime();
//		
//		model.addAttribute("greeting", "Welcome to BookMarket");
//		model.addAttribute("strapline", "Welcome to Web Shopping Mall!!");
//		model.addAttribute("CT", CT);
//		
//		//forwarding
//		// /views/welcome.jsp
		return "home";
	}
	
	//요청URI : /home
	@GetMapping("/table")
	public String table(Model model) {
		return "table";
	}
	//요청URI : /home
	@GetMapping("/table2")
	public String table2(Model model) {
		return "table2";
	}
	
	//요청URI : /findId
	@GetMapping("/findId")
	public String findId(Model model) {
		return "login/findId";
	}
	
	//요청URI : /findPw
	@GetMapping("/findPw")
	public String findPw(Model model) {
		return "login/findPw";
	}
	//요청URI : /login2
	@GetMapping("/login2")
	public String login2(Model model) {
		return "login/login2";
	}
	//요청URI : /changePw
	@GetMapping("/changePw")
	public String changePw(Model model) {
		return "login/changePw";
	}
	
	
	/**
	 * 요청URI : /getCurrentTime
	 */
	//현재 시각을 json 데이터로 리턴(비동기 처리)
	@ResponseBody
	@GetMapping("/getCurrentTime")
	public String getCurrentTime() {
		Date day = new Date();
		
		String am_pm;
		
		int hour = day.getHours();
		int minute = day.getMinutes();
		int second = day.getSeconds();
		
		if(hour / 12 == 0) {
			am_pm = "AM";
		}else {
			am_pm = "PM";
			hour = hour - 12;
		}
		
		String CT = hour + " : " + minute + " : " + second + " " + am_pm;
		
		return CT;
	}
	
	@GetMapping("/login/login")
	public void login() {}
	
}


