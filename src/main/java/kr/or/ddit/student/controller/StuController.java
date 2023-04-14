package kr.or.ddit.student.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.student.service.StuService;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@PreAuthorize("hasRole('ROLE_ADMIN')")
@RequestMapping("/stuList")
public class StuController {

	@Autowired
	StuService stuService;
	
	//요청URI : /stuList/list
	@GetMapping("/list")
	public String stuList(HttpSession session, Model model, @RequestParam(value = "selectKey", defaultValue="all" )String selectKey) {
		
//		UserVO userVO = (UserVO) session.getAttribute("userVO");
//		int userNum = userVO.getUsername();
//		log.info("세션 : " + userNum);
		log.info("------------------------혹시 왔을까? "+ selectKey );
		
		List<StudentVO> list=null;
		if(selectKey.equals("all")) {
			list = this.stuService.stuList();
		}else {
			int keyword = Integer.parseInt(selectKey);
			list = this.stuService.stuList(keyword);
			model.addAttribute("keyword", keyword);
		}
		
		
		for(StudentVO stuVO : list) {
			if(stuVO.getStuStatus() == 0) {
				stuVO.setStustat("재학");
			}else if(stuVO.getStuStatus() == 1){
				stuVO.setStustat("휴학");
			}else if(stuVO.getStuStatus() == 2){
				stuVO.setStustat("자퇴");
			}else if(stuVO.getStuStatus() == 3){
				stuVO.setStustat("졸업");
			}else {
				stuVO.setStustat("제적");
			}
		}
		
		model.addAttribute("data", list);
		
		log.info("list(학생) : " + list);
		
		return "student/stuList";
	}
	
	/**
	 * 요청 : /stuList/listt
	 * @param model
	 * @return List<StudentVO>
	 */
	@GetMapping("/listt")
	public List<StudentVO> listt(Model model) {
		log.info("ajax로 왔다");
		return this.stuService.stuList();
		
	}
	
	/**
	 * 요청URL : /stuList/deptList
	 * @param model
	 * @return List<DepartmentVO>
	 */
	@ResponseBody
	@PostMapping("/deptList.do")
	public List<DepartmentVO> getDeptList(Model model){
		log.info("getDeptList에 왔다!!!!");
		List<DepartmentVO> list = this.stuService.getDeptList();
		log.info("controller : list : "+list);
		return list;
	}
	
	/**
	 * 요청URL : /stuList/totalStu.do
	 * @param model
	 * @return Integer
	 */
	@ResponseBody
	@GetMapping("/totalStu.do")
	public Map<String,Integer> totalStu(Model model){
		log.info("totalStu에 왔다!!!!");
		return this.stuService.totalStu();
	}
	
}
