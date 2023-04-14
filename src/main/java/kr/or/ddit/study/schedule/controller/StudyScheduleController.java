package kr.or.ddit.study.schedule.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.study.schedule.service.IStudyScheduleService;
import kr.or.ddit.vo.StudyScheduleVO;
import kr.or.ddit.vo.StudyVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/study")
public class StudyScheduleController {

	@Autowired
	IStudyScheduleService service;

	@GetMapping("/scheduleMain")
	public String scheduleMain(HttpServletRequest request){
		HttpSession session = request.getSession();
		StudyVO studyVO = (StudyVO) session.getAttribute("studyVO");
		return "study/scheduleMain";
	}

	@ResponseBody
	@PostMapping("/addEvent")
	public Object addEvent(@RequestBody StudyScheduleVO ssVO) {

		log.info("AddEvent에 왔다");
		log.info("ssVO : " + ssVO);

		int result = service.addEvent(ssVO);

		return result;
	}

	@ResponseBody
	@PostMapping("/ssDataList")
	public JSONArray ssDataList(int roomNumber) {

		log.info("ssDataList에 왔ㅁ다.");
		log.info("roomNumber : " + roomNumber);
		log.info("result : " + service.ssDataList(roomNumber));

		return service.ssDataList(roomNumber);
	}

	@ResponseBody
	@PostMapping("/updateEvent")
	public int updateEvent(@RequestBody StudyScheduleVO ssVO) {

		log.info("updateEvent에 왔따.");
		log.info("ssVO :" + ssVO);

		int result = service.updateEvent(ssVO);

		return result;
	}

	@ResponseBody
	@PostMapping("/removeEvent")
	public int removeEvent(@RequestBody StudyScheduleVO ssVO) {

		log.info("removeEvent에 와ㅣㅆ따");
		log.info("ssVO : " + ssVO);

		int result = service.removeEvent(ssVO);

		return result;
	}
}
