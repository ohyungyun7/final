package kr.or.ddit.study.general.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.study.general.service.StudyGeneralService;
import kr.or.ddit.vo.StudyReportVO;
import kr.or.ddit.vo.StudyVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/study")
@PreAuthorize("hasRole('ROLE_STU')")
public class StudyGeneralController {
	
	@Autowired
	StudyGeneralService sgService;
	
	/**
	 * 스터디 전체 리스트 페이지
	 * @param request
	 * @return
	 */
	@GetMapping("/myStudyList")
	public String myStudyList(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		StudyVO studyVO = new StudyVO();
		studyVO.setStuNum(userVO.getUsername());
		List<StudyVO> studyVOList = sgService.getStudyList(studyVO);
		
		model.addAttribute("studyVOList", studyVOList);
		
		return "study/myStudyList";
	}
	
	/**
	 * 입장을 누른 스터디의 정보를 ajax로 세션에 담음
	 * @param studyVO : 입장한 스터디 번호가 담긴 VO
	 * @param request
	 * @return
	 */
	@ResponseBody
	@PostMapping("/setSNum")
	public int setSNum(StudyVO studyVO, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		studyVO.setStuNum(userVO.getUsername());
		
		studyVO = sgService.getStudy(studyVO);
		session.setAttribute("studyVO", studyVO);
		return 1;
	}
	
	/**
	 * 선택한 스터디 상세 페이지 이동
	 * @return
	 */
	@RequestMapping("/studyMain")
	public String enterStudy(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		StudyVO studyVO = (StudyVO) session.getAttribute("studyVO");

		List<Map<String, Object>> studyStudentList = sgService.getStudentList(studyVO);
		model.addAttribute("data", studyStudentList);
		
		return "study/enterStudy";
	}
	
	/**
	 * 스터디 나가기
	 * @param studyVO : 선택한 스터디 번호, sGrade( -1 : 거절/취소, 0 : 수락)
	 * @param request : 세션에서 stuNum 가져오기 위함
	 * @return
	 */
	@GetMapping("/exitStudy")
	public String exitStudy(HttpServletRequest request) {
		HttpSession session = request.getSession();
		StudyVO studyVO = (StudyVO) session.getAttribute("studyVO");
		studyVO.setsGrade(-1);
		sgService.modiStudyGrade(studyVO);
		return "redirect:/study/myStudyList";
	}
	
	@GetMapping("/reportStudy")
	public String reportStudy(StudyReportVO srVO, HttpServletRequest request) {
		HttpSession session = request.getSession();
		StudyVO studyVO = (StudyVO) session.getAttribute("studyVO");
		srVO.setSNum(studyVO.getsNum());
		srVO.setStuNum(studyVO.getStuNum());
		
		sgService.reportStudy(studyVO, srVO);
		return "redirect:/study/myStudyList";
	}
	
	/**
	 * 스터디 나가기, 내보내기, 초대취소
	 * @param stuNum
	 * @param request
	 * @return
	 */
	@ResponseBody
	@PostMapping("/modiStudyGrade")
	public int modiStudyGrade(StudyVO studyVO, HttpServletRequest request) {
		log.info("studyVO : " + studyVO);
		
		return sgService.modiStudyGrade(studyVO);
	}
	
	/**
	 * 초대를 위해 해당 스터디에 속해있지 않은 학생 리스트 뽑아오기 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@GetMapping("/inviteList")
	public Map<String, Object> inviteList(HttpServletRequest request){
		HttpSession session = request.getSession();
		StudyVO studyVO = (StudyVO) session.getAttribute("studyVO");
		
		List<Map<String, Object>> inviteList = sgService.inviteList(studyVO.getsNum());
		log.info("inviteList : " + inviteList);
		
		Map<String, Object> map = new HashMap<>();
		map.put("data", inviteList);
		
		return map;
	}
	
	@GetMapping("/wholeStudyList")
	public String wholeStudyList(int stuNum, Model model) {
		List<Map<String, Object>> wholeStudyList = sgService.wholeStudyList(stuNum);
		List<Map<String, Object>> studentList = sgService.studentList();
		
		model.addAttribute("stuNum", stuNum);
		model.addAttribute("wholeStudyList", wholeStudyList);
		model.addAttribute("studentList", studentList);
		return "/study/wholeStudyList";
	}
	
	@PostMapping("/openStudy")
	public String openStudy(String sNm, String stuNumStr, int openStu) {
		String[] stuNumArr = (stuNumStr.length() > 0)? stuNumStr.split(",") : new String[0];
		sgService.openStudy(openStu, sNm, stuNumArr);
		
		return "redirect:/study/wholeStudyList?stuNum=" + openStu;
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/manageStudy")
	public String manageStudy(Model model) {
		List<Map<String, Object>> studyList = sgService.wholeStudyList(-1);
		model.addAttribute("studyList", studyList);

		return "study/manageStudy";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/manageReportStudy")
	public String manageReportStudy(Model model) {
		List<Map<String, Object>> studyList = sgService.reportedStudyList();
		List<Map<String, Object>> banList = sgService.banStudyList();
		model.addAttribute("studyList", studyList);
		model.addAttribute("banList", banList);
		
		return "study/reportStudy";
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@ResponseBody
	@PostMapping("/manageReportStudy")
	public Map<String, Object> manageReportStudy(StudyVO studyVO, boolean history) {
		log.info("studyVO : " + studyVO);
		log.info("history : " + history);
		
		return sgService.manageReportStudy(studyVO, history);
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@ResponseBody
	@PostMapping("/getReasonList")
	public Map<String, Object> getReasonList(int sNum) {
		return sgService.getReasonList(sNum);
	}
}
