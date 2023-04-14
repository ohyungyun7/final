package kr.or.ddit.academic;

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
@RequestMapping("/academic2")
public class academicController2 {
	
	@Autowired
	CourseService courseService;
	
	//요청URI : /academic/acaListStu
	@GetMapping("/acaListStu")
	public String acaListStu(Model model) {
		return "academic/acaList_stu";
	}
	
	//요청URI : /academic/acaListAdm
	@GetMapping("/acaListAdm")
	public String acaListAdm(Model model) {
		return "academic/acaList_adm";
	}
	
	//요청URI : /academic/leaveReturnStu
	@GetMapping("/leaveReturnStu")
	public String leaveReturnStu(Model model) {
		return "academic/leaveReturn_stu";
	}
	
	//요청URI : /academic/acaTRStu
	@GetMapping("/acaTRStu")
	public String acaTRStu(Model model) {
		return "academic/acaTR_stu";
	}
	
	//요청URI : /academic/acaDropout
	@GetMapping("/acaDropout")
	public String acaDropout(Model model) {
		return "academic/acaDropout_stu";
	}
	
	
}








