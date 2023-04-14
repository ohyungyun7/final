package kr.or.ddit.course.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.course.service.CourseService;
import kr.or.ddit.vo.CourseDetailVO;
import kr.or.ddit.vo.CourseNoticeVO;
import kr.or.ddit.vo.CourseReferenceVO;
import kr.or.ddit.vo.CourseVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/course2")
public class CourseController2 {
	
	@Autowired
	CourseService courseService;
	
	//요청URI : /attendStu
	@GetMapping("/attendStu")
	public String attendStu(Model model) {
		return "course/attend_stu";
	}
	
	//요청URI : /report
	@GetMapping("/report")
	public String reportStu(Model model) {
		return "course/report_stu";
	}
	
	//요청URI : /reportSubmit
	@GetMapping("/reportSubmit")
	public String reportSubmit(Model model) {
		return "course/reportSubmit_stu";
	}
		
	//요청URI : /attendTea.jsp
	@GetMapping("/attendTea")
	public String attendTea(Model model) {
		return "course/attend_tea";
	}
	
}








