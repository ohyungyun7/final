package kr.or.ddit.study.timetable.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.study.timetable.service.IStudyTimetableService;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.StudyVO;
import kr.or.ddit.vo.TimeVO;
import kr.or.ddit.vo.VoteVO;
import kr.or.ddit.vo.VotersVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/study")
public class StudyTimetableController {

	@Autowired
	IStudyTimetableService service;

	@PreAuthorize("hasRole('ROLE_STU')")
	@ResponseBody
	@PostMapping("/stuTimetable")
	public Object stuTimetable(@RequestParam int stuNum) {
		List<TimeVO> timeList = service.stuTimetable(stuNum);
		return timeList;
	}

	@PreAuthorize("hasRole('ROLE_TEA')")
	@ResponseBody
	@PostMapping("/teaTimetable")
	public Object teaTimetable(@RequestParam int teaNum) {
		List<TimeVO> timeList = service.teaTimetable(teaNum);
		return timeList;
	}

	@ResponseBody
	@PostMapping("/studyList")
	public Object studyList(@RequestParam int stuNum) {
		List<String> studyList = service.studyList(stuNum);
		return studyList;
	}

	@PreAuthorize("hasRole('ROLE_STU')")
	@GetMapping("/timeTableMain")
	public String timeTableMain(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		StudyVO studyVO = (StudyVO) session.getAttribute("studyVO");
		int roomNumber = studyVO.getsNum();

		List<StudentVO> stuList = service.getStuList(roomNumber);
		List<VoteVO> voteList = service.getVoteList(roomNumber);
		log.info("voteList :", voteList);

		model.addAttribute("stuList", stuList);
		model.addAttribute("voteList", voteList);

		return "study/timeTableMain";
	}

	@PreAuthorize("hasRole('ROLE_STU')")
	@ResponseBody
	@PostMapping("/getTimeTableData")
	public Object getTimeTableData(int stuNum) {

		List<TimeVO> timeList = service.getTimeTableData(stuNum);

		return timeList;
	}

	@ResponseBody
	@PostMapping("/addVote")
	public Object addVote(@RequestBody VoteVO voteVO, HttpServletRequest request) {

		HttpSession session = request.getSession();
		StudyVO studyVO = (StudyVO) session.getAttribute("studyVO");
		int roomNumber = studyVO.getsNum();

		int voteNum = service.getVoteNum();
		voteVO.setVoteNum(voteNum);
		voteVO.setSNum(roomNumber);
		log.info("voteVO2 :" + voteVO);


		int num = 1;
		List<VotersVO> votersList = new ArrayList<VotersVO>();
		String[] votersNames = voteVO.getVoters();
		for(String name : votersNames) {
			VotersVO vo = new VotersVO();
			vo.setVotersNum(num++);
			vo.setVoteNum(voteNum);

			int stuNum = Integer.parseInt(name);
			vo.setVotersStu(stuNum);
			votersList.add(vo);
		}
		voteVO.setVotersList(votersList);

		int result = service.addVote(voteVO);

		return result;
	}

	@ResponseBody
	@PostMapping("/checkVoters")
	public Object checkVoters(@RequestBody VotersVO votersVO) {

		log.info("checkVoters:");
		log.info("checkVoters:" + votersVO);

		int checkNum = service.checkVoters(votersVO);

		return checkNum;
	}

	@ResponseBody
	@PostMapping("/voteDetail")
	public Object voteDetail(@RequestBody VotersVO votersVO) {

		VoteVO voteVO = service.voteDetail(votersVO);

		log.info("voteVO :" + voteVO);

		return voteVO;
	}

	@ResponseBody
	@PostMapping("/delVote")
	public int delVote(@RequestBody int delNum) {
		log.info("delVote: " + delNum);
		int result = service.delVote(delNum);
		log.info("result: " + result);

		return result;
	}

	@ResponseBody
	@PostMapping("/voteUpdate")
	public int voteUpdate(@RequestBody VotersVO votersVO) {
		int result = service.voteUpdate(votersVO);
		return result;
	}
}
