package kr.or.ddit.consult.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.consult.service.ConsultService;
import kr.or.ddit.vo.ConsultVO;
import kr.or.ddit.vo.TeacherVO;
import kr.or.ddit.vo.UserVO;

@Controller
@RequestMapping("/consult")
public class ConsultController {
	
	@Autowired
	ConsultService consultService;

	@GetMapping("/index/tea")
	public String indexTea() {
		return "/consult/indexTea";
	}
	
	@GetMapping("/index/stu")
	public String indexStu() {
		return "/consult/indexStu";
	}
	
	@GetMapping("/consultStuMain")
	public String consultStuMain(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		List<TeacherVO> teaList = consultService.getTeaList(userVO.getDeptNum());
		
		model.addAttribute("teaList", teaList);
		
		return "consult/consultStuMain";
	}
	
	@ResponseBody
	@PostMapping("/getTimeTable")
	public List<Map<String, Object>> getTimeTable(int teaNum){
		return consultService.getTimeTable(teaNum);
	}
	
	@ResponseBody
	@PostMapping("/getConsultTime")
	public List<Map<String, Object>> getConsultTime(int teaNum){
		return consultService.getConsultTime(teaNum);
	}
	
	@ResponseBody
	@PostMapping("/appConsult")
	public int appConsult(ConsultVO consultVO, HttpServletRequest request){
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		consultVO.setStuNum(userVO.getUsername());
		
		return consultService.appConsult(consultVO);
	}
	
	@GetMapping("/historyConsult")
	public String historyConsult(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		List<Map<String, Object>> consultMapList = consultService.getConsultList(userVO.getUsername());
		
		model.addAttribute("consultMapList", consultMapList);
		
		return "consult/historyConsult";
	}
	
	@ResponseBody
	@PostMapping("/deleteConsult")
	public int deleteConsult(int crNum) {
		return consultService.deleteConsult(crNum);
	}
	
	@GetMapping("/consultTeaMain")
	public String consultTeaMain(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		Map<String, Integer> param = new HashMap<>();
		param.put("teaNum", userVO.getUsername());
		param.put("type", 0);
		
		List<Map<String, Object>> consultMapList = consultService.getConsultListByTea(param);
		
		model.addAttribute("consultMapList", consultMapList);
		
		return "consult/consultTeaMain";
	}
	
	@GetMapping("/consultHistory")
	public String consultHistory(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		Map<String, Integer> param = new HashMap<>();
		param.put("teaNum", userVO.getUsername());
		param.put("type", 1);
		
		List<Map<String, Object>> consultMapList = consultService.getConsultListByTea(param);
		
		model.addAttribute("consultMapList", consultMapList);
		
		return "consult/consultHistory";
	}
	
	@ResponseBody
	@PostMapping("/modifyConsult")
	public int modifyConsult(ConsultVO consultVO) {
		return consultService.modifyConsult(consultVO);
	}
	
	
	
	@ResponseBody
	@PostMapping("/forMain")
	public List<Map<String, Object>> forMain(HttpServletRequest request){
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		
		return consultService.forMain(userVO.getUsername());
	}
}
