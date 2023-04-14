package kr.or.ddit.cm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.cm.service.CmService;
import kr.or.ddit.vo.SubjectVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
@Slf4j
@Controller
@RequestMapping("/cm")
public class CmController {
	
	@Autowired
	CmService cmService;

	@RequestMapping("/classList")
	public String getAll(Model model, HttpSession session) {

		UserVO userVO = (UserVO) session.getAttribute("userVO");
		
		List<SubjectVO> cmAllList = cmService.getAll();
		model.addAttribute("list", cmAllList);
		
		return "cm/classList";
	}
	
	/**
	 * 강의 개강유무 승인(1)
	 * @param sbjNum
	 * @return int
	 */
	@ResponseBody
	@RequestMapping("/approval.do")
	public int approval(@RequestParam String sbjNum) {
		
		int res = cmService.approval(sbjNum);
		log.info("ap res : " + res);
		return res;
	}
	
	/**
	 * 강의 개강유무 거절(0)
	 * @param sbjNum
	 * @return int
	 */
	@ResponseBody
	@RequestMapping("/declined.do")
	public int declined(@RequestParam String sbjNum) {
		
		int res = cmService.declined(sbjNum);
		log.info("de res : " + res);
		return res;
	}
	
	/**
	 * 강의 개강유무 폐강(2)
	 * @param sbjNum
	 * @return int
	 */
	@ResponseBody
	@RequestMapping("/closed.do")
	public int closed(@RequestParam String sbjNum) {
		
		int res = cmService.closed(sbjNum);
		log.info("cl res : " + res);
		return res;
	}

}
