package kr.or.ddit.acad;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.acad.service.IACADCalendarService;
import kr.or.ddit.vo.ACADCalendarVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/acadCal")
@Controller
public class ACADCalendarController {

	@Autowired
	IACADCalendarService service;

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/acadCal")
	public String acadCalendar() {
		return "acad/acadCalendar";
	}

	@ResponseBody
	@GetMapping("/acadDataList")
	public JSONArray calDataList() {
		log.info("acadDataList에 왔다.");

		log.info("acadDataList :" + service.acadDataList());

		return service.acadDataList();
	}

	@ResponseBody
	@PostMapping("/addEvent")
	public int AddEvent(@RequestBody ACADCalendarVO acVO) {

		log.info("AddEvent에 왔다");
		log.info("acVO : " + acVO);

		int result = service.addEvent(acVO);
		log.info("result : " + result);

		return result;
	}

	@ResponseBody
	@PostMapping("/updateEvent")
	public int updateEvent(@RequestBody ACADCalendarVO acVO) {

		log.info("updateEvent에 왔다");
		log.info("acVO : " + acVO);

		int result = service.updateEvent(acVO);
		log.info("result : " + result);

		return result;
	}

	@ResponseBody
	@PostMapping("/removeEvent")
	public int removeEvent(@RequestBody ACADCalendarVO acVO) {

		log.info("removeEvent에 왔다");
		log.info("acVO : " + acVO);

		int result = service.removeEvent(acVO);
		log.info("result : " + result);

		return result;
	}

	@ResponseBody
	@PostMapping("/getEventText")
	public Object getEventText(@RequestParam int month) {

		log.info("month : " + month);

		List<ACADCalendarVO> calList = service.getEventText(month);
		log.info("calList : " + calList);

		List<ACADCalendarVO> dataList = new ArrayList<ACADCalendarVO>();
		for(ACADCalendarVO acVO : calList) {
			ACADCalendarVO VO = new ACADCalendarVO();
			if(acVO.getStart().equals(acVO.getEnd())) {
				String date = acVO.getStart();
				String[] arr = date.split("-");
				date = arr[1] + "월 " + arr[2] + "일";
				VO.setStart(date);
			}else {
				String[] arr1 = acVO.getStart().split("-");
				String[] arr2 = acVO.getEnd().split("-");
				String date = arr1[1] + "월 " + arr1[2] + "일 ~ " + arr2[1] + "월 " + arr2[2] + "일";
				VO.setStart(date);
			}

			if(acVO.getCalendar().equals("Business")) {
				VO.setCalendar("primary");
			}else if(acVO.getCalendar().equals("Personal")) {
				VO.setCalendar("danger");
			}else {
				VO.setCalendar("info");
			}

			VO.setTitle(acVO.getTitle());
			dataList.add(VO);
		}

		return dataList;
	}

}
