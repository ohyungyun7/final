package kr.or.ddit.course.exam.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.exam.ExamService;
import kr.or.ddit.subject.service.impl.SubjectService;
import kr.or.ddit.vo.SubjectVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/course")
public class CourseExamController {

	@Inject
	SubjectService subjectService;
	@Inject
	ExamService examService;
	
	
	@GetMapping("/exam")
	public String exam(String sbjNum, String sbjTitle, Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		
		log.info("현재 로그인된 기본키 : "+userVO.getUsername());
		log.info("/course/exam sbjTitle의 값 : "+sbjTitle);
		log.info("/course/exam sbjNum의 값 : "+sbjNum);
		
		Map<String,Object> map = new HashMap<>();
		map.put("stuNum", userVO.getUsername());
		map.put("sbjNum", sbjNum);
		
		SubjectVO sbjOnlineTitle = subjectService.sbjOnlineTitle(map);
		
		log.info("/course/exam에서 온라인 시험이면 값이 있고 , 온라인 시험이 아니면 null이 뜸 : "+sbjOnlineTitle);
		
		model.addAttribute("data", sbjOnlineTitle);
		return "course/exam";
	}
}
