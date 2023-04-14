package kr.or.ddit.dp;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.dp.service.IDPNotieBoardService;
import kr.or.ddit.vo.SubjectVO;
import kr.or.ddit.vo.TeacherVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@PreAuthorize("isAuthenticated()")
@Slf4j
@RequestMapping("/dp")
@Controller
public class DPTeachersController {
	
	@Autowired
	IDPNotieBoardService service;
	
	@GetMapping("/teachers")
	public String teachers(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int deptNum = userVO.getDeptNum();
		
		List<TeacherVO> teachersList = service.getTeachers(deptNum);
		model.addAttribute("teachersList", teachersList);
		
		return "dp/dpTeachers";
	}
	
	@GetMapping("/subjects")
	public String subjects(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int deptNum = userVO.getDeptNum();
		
		List<SubjectVO> subList = service.getSubjects(deptNum);
		
		List<SubjectVO> g1List = new ArrayList<SubjectVO>();
		List<SubjectVO> g2List = new ArrayList<SubjectVO>();
		List<SubjectVO> g3List = new ArrayList<SubjectVO>();
		List<SubjectVO> g4List = new ArrayList<SubjectVO>();
		for(SubjectVO subVO : subList) {
			if(subVO.getSbjGrade() == 1) {
				g1List.add(subVO);
			}else if(subVO.getSbjGrade() == 2) {
				g2List.add(subVO);
			}else if(subVO.getSbjGrade() == 3) {
				g3List.add(subVO);
			}else {
				g4List.add(subVO);
			}
		}
		
		log.info("g1List : " + g1List);
		log.info("g2List : " + g2List);
		log.info("g3List : " + g3List);
		log.info("g4List : " + g4List);
		
		
		model.addAttribute("g1List", g1List);
		model.addAttribute("g2List", g2List);
		model.addAttribute("g3List", g3List);
		model.addAttribute("g4List", g4List);
		
		return "dp/dpSubjects";
	}
}
