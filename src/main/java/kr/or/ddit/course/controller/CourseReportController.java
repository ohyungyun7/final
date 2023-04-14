package kr.or.ddit.course.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.course.service.CourseService;
import kr.or.ddit.vo.CourseListVO;
import kr.or.ddit.vo.ReportCardVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.SubjectVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/course")
@Controller
public class CourseReportController {

	@Inject
	CourseService courseService ;


	@ResponseBody
	@PostMapping("/getReportScore")
	public Map<String,Object> getReportScore(@RequestBody Map<String,Object> map){
		log.info("getReportScore에서 넘겨받은 값 : "+map);

		List<ReportCardVO> getCourseInfo = courseService.getCourseInfo(map);//해당 클릭한 성적 값 가져오기
		StudentVO studentVO = courseService.studentInfo(map);


		log.info("============================================");
		log.info("getCourseInfo : "+getCourseInfo);
		log.info("============================================");
		Map<String,Object> map2 = new HashMap<>();
		map2.put("getCourseInfo", getCourseInfo);
		map2.put("studentVO", studentVO);
		return map2;
	}

	/***
	 * 성적 입력창으로 넘어 올 시
	 * 메인/강의목록/${강의정보}
	 * 강의정보 값 가져오기
	 * @param sbjNum
	 * @param sbjTitle
	 */
	@GetMapping("/reportCard")
	public void reportCard(@RequestParam("sbjNum") String sbjNum ,
						   @RequestParam("sbjTitle") String sbjTitle,
						   Model model) {

		log.info("==========================================");
		log.info("sbjNum : "+sbjNum);
		log.info("sbjTitle : "+sbjTitle);

		String getSubjectInfo = courseService.getSubjectInfo(sbjNum);//해당 과목 상세 정보 가져오기
		List<CourseListVO> getCourseListInfo = courseService.getCourseListInfo(sbjNum);//해당 과목을 듣는 현재학기 학생 목록 가져오기

		log.info("getSubjectInfo: "+getSubjectInfo);
		log.info("getCourseListInfo: "+getCourseListInfo);

		model.addAttribute("getSubjectInfo", getSubjectInfo);
		model.addAttribute("getCourseListInfo", getCourseListInfo);
		model.addAttribute("sbjNum", sbjNum);
	}

	/***
	 * 해당 과목의 출석 즉 45점 만점 중 몇점인지 소계를 가져옴
	 * @param map
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getWeekSum")
	public Map<String,Object> getWeekSum(@RequestBody Map<String,Object> map){
		log.info("getWeekSum에서 넘어온 값 : "+map);

		StudentVO studentVO = courseService.studentInfo(map);
		SubjectVO getWeekSum = courseService.getWeekSum(map);


		log.info("getWeekSum : "+getWeekSum);

		Map<String,Object> map2 = new HashMap<>();
			map2.put("studentVO", studentVO);
		if(getWeekSum == null) {
			map2.put("getWeekSum",0);
		}else {
			map2.put("getWeekSum", getWeekSum);
		}

		return map2;
	}

	/***
	 * REPORT_CARD 와 COURSE_LIST에 최종성적 넣음
	 * @param map
	 * @return
	 */
	@ResponseBody
	@PostMapping("/insertReportCardAndCsfscore")
	public Map<String,Object> insertReportCardAndCsfscore(@RequestBody Map<String,Object> map){

		log.info("insertClFscore에서 넘어온 값 : "+map);
		int reportCardResult = courseService.insertReportCardAndCsfscore(map);//REPORT_CARD에 데이터 넣음

		int fscore = (int) map.get("fscore");
		double finalScore = 0.0;
		if(fscore>=95) {
			finalScore =4.5;
		}else if(fscore>= 90 && fscore<=94) {
			finalScore = 4.0;
		}else if(fscore>= 85 && fscore<=89) {
			finalScore = 3.5;
		}else if(fscore>= 80 && fscore<=84) {
			finalScore = 3.0;
		}else if(fscore>= 75 && fscore<=79) {
			finalScore = 2.5;
		}else if(fscore>= 70 && fscore<=74) {
			finalScore = 2.0;
		}else if(fscore>= 65 && fscore<=69) {
			finalScore = 1.5;
		}else if(fscore>= 60 && fscore<=64) {
			finalScore = 1.0;
		}else {
			finalScore = 0.0;
		}
		log.info("finalScore : "+finalScore);
		Map<String, Object> map3 = new HashMap<>();

		map3.put("finalScore", (finalScore));
		map3.put("sbjNum", map.get("sbjNum"));
		map3.put("stuNum", Integer.parseInt(map.get("stuNum")+""));

		log.info("===========================================");
		int updateClFscore = courseService.updateClFscore(map3);
		log.info("updateClFscore : "+updateClFscore);

		Map<String,Object> map2 = new HashMap<>();
		map2.put("result", reportCardResult+updateClFscore);
		return map2;
	}

	/***
	 * REPORT_CARE의 기본값을 가져옴 MERGE INTO 사용할려고
	 * @param map
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getRcNum")
	public Map<String,Object> getRcNum(@RequestBody Map<String,Object> map){

		log.info("getRcNum에서 넘어온 값 : "+map);
		map.put("stuNum", Integer.parseInt(map.get("stuNum")+""));
		String rcNum = courseService.getRcNum(map);
		log.info("=================================================");
		log.info("rcNum : "+rcNum);
		log.info("=================================================");
		if(rcNum == null || rcNum.equals("")) {
			rcNum = "0";
		}
		Map<String,Object> map2 = new HashMap<>();
		map2.put("rcNum", rcNum);

		return map2;
	}
	/***
	 * 성적이의신청에서 승인 후 성적 바꾸기 위한 Rcnum 가져옴
	 * @param map
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getRcNum2")
	public Map<String,Object> getRcNum2(@RequestBody Map<String,Object> map){

		log.info("getRcNum에서 넘어온 값 : "+map);
		map.put("stuNum", Integer.parseInt(map.get("stuNum")+""));
		String rcNum = courseService.getRcNum2(map);
		log.info("=================================================");
		log.info("rcNum : "+rcNum);
		log.info("=================================================");
		if(rcNum == null || rcNum.equals("")) {
			rcNum = "0";
		}
		Map<String,Object> map2 = new HashMap<>();
		map2.put("rcNum", rcNum);

		return map2;
	}


	/***
	 * 이의 신청 한 후 성적을 최종으로 바꿔줌
	 * @param map
	 * @return
	 */
	@ResponseBody
	@PostMapping("/insertReportCardAndCsfscore2")
	public Map<String,Object> insertReportCardAndCsfscore2(@RequestBody Map<String,Object> map){

		log.info("insertReportCardAndCsfscore2에서 map : "+map);
		int reportCardResult = courseService.insertReportCardAndCsfscore2(map);//성적 바꿔줌

		Map<String,Object> map2 = new HashMap<>();
		map2.put("reportCardResult", reportCardResult);
		return map2;
	}
}