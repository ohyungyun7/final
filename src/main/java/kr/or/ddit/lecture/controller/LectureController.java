package kr.or.ddit.lecture.controller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.lecture.service.LectureService;
import kr.or.ddit.vo.CourseListVO;
import kr.or.ddit.vo.LectureEvaVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.SubjectVO;
import kr.or.ddit.vo.TeacherVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/le")
@Controller
public class LectureController {
	@Autowired
	LectureService lectureService;
	/***
	 * 강의평가
	 * 학생
	 */
	@GetMapping("/leStuList")
	public String stuLectureList(@RequestParam Map<String, Object> map,
			HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		
		map.put("stuNum", Integer.parseInt(userVO.getUsername()+""));
		
		
		List<LectureEvaVO> stuLectureList = this.lectureService.stuLectureList(map);
		List<LectureEvaVO> lectureList = this.lectureService.lectureListList();//항목리스트 가져오기
		StudentVO student = this.lectureService.studentVO(map);
		log.info("++++++++++++++++++++++++++++++++++");
		log.info("stuLectureList : " + stuLectureList);
		log.info("++++++++++++++++++++++++++++++++++");
		
		model.addAttribute("data", stuLectureList);
		model.addAttribute("lectureList", lectureList);
		model.addAttribute("student", student);
		return "le/leStuList";
	}
	
	/***
	 * LECTURE_EVA에 필요한 CL_NUM 값 가져오기
	 * @param map
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getClNum")
	public Map<String,Object> getClNum(@RequestBody Map<String,Object> map) {
		
		log.info("CL_NUM가져오기 위한 필요한 정보 : "+map);
		
		String clNum = this.lectureService.getClNum(map);//clNum가져오기
		
		Map<String, Object> map2 = new HashMap<>();
		map2.put("clNum", clNum);
		return map2;
	}
	
	/***
	 * LeNum이 있는지 먼저 확인
	 * @param map
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getLeNum")
	public Map<String,Object> getLeNum(@RequestBody Map<String,Object> map) {
		
		log.info("insertLecEva에 필요한 정보 : "+map);
		
		String leNum = this.lectureService.getLeNum(map);//leNum가져오기
		
		if(leNum == null) {
			leNum = "0";
		}
		log.info("leNum의 값 : "+leNum);
		
		Map<String,Object> map2 = new HashMap<>();
		map2.put("leNum", leNum);
		return map2;
	}
//    let data2 = {
//		 "lelNum" : $("#textarea").attr("name"),	//맞음
//		 "clNum" : clNum,							//맞음
//		 "sbjNum" : sbjNum,							//맞음
//		 "stuNum" : parseInt(stuNum),				//맞음
//		 "answer" : $("#textarea").val(),			//이게 LE_REPLY값 들어가야함
//		 "leNum" : leNum,							//맞음
//		 "raNum" : $("#textarea").attr("name")		//맞음
//		 };
//   
	/***
	 * 주관식 답 가져오기
	 * @param map
	 * @return
	 */
    @ResponseBody
	@PostMapping("/insertLecEva2")
	public Map<String,Object> insertLecEva2(@RequestBody Map<String,Object> map) {
		
		log.info("insertLecEva2에 필요한 정보 : "+map);
		
		int result = this.lectureService.insertLecEva2(map);//LECTURE_EVA에 데이터 넣기
		
		log.info("결과값 : "+result);
		Map<String, Object> map2 = new HashMap<>();
		map2.put("result", result);
		
		return map2;
	}
    
	@ResponseBody
	@PostMapping("/insertLecEva")
	public Map<String,Object> insertLecEva(@RequestBody Map<String,Object> map) {
		
		log.info("insertLecEva에 필요한 정보 : "+map);
		
		int result = this.lectureService.insertLecEva(map);//LECTURE_EVA에 데이터 넣기
		
		log.info("결과값 : "+result);
		Map<String, Object> map2 = new HashMap<>();
		map2.put("result", result);
		
		return map2;
	}
	
	@GetMapping("/leCheck")
	public String leCheck(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		
		Map<String,Object> map = new HashMap<>();
		map.put("teaNum", userVO.getUsername());
		
		
		TeacherVO teaVO = this.lectureService.getTeaVO(map);//교수 정보 가져오기
		List<SubjectVO> myLectureCheckList = this.lectureService.myLectureCheckList(map);//교수의 강의평가 한 인원수 적용
		
		log.info("myLectureCheckList : "+myLectureCheckList);
		model.addAttribute("teaVO", teaVO);
		model.addAttribute("data", myLectureCheckList);
		return "le/leCheck";
	}
	
	//각 과목의 각 항목 리스트 선택 비율을 가져옴
	@ResponseBody
	@PostMapping("/getRatioLecture")
	public Map<String,Object> getRatioLecture(@RequestBody Map<String,Object> map) {
		
		log.info("getRatioLecture의 map : "+map);
		
		List<LectureEvaVO> getRatioLecture = lectureService.getRatioLecture(map);
		List<LectureEvaVO> replyAnswer = lectureService.replyAnswer(map);
		
		log.info("getRatioLecture : "+getRatioLecture);
		log.info("replyAnswer : "+replyAnswer);
		
		Map<String,Object> map2 = new HashMap<>();
		map2.put("getRatioLecture", getRatioLecture);
		map2.put("replyAnswer", replyAnswer);
		
		return map2;
	}
	
	/***
	 * 해당 학생의 수강학기 가져오기
	 * @param map
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getStuLecture")
	public Map<String,Object> getStuLecture(@RequestBody Map<String,Object> map) {
		
		log.info("getStuLecture의 map : "+map);
		
		List<CourseListVO> myLectureList = lectureService.myLectureList(map);//수강한 학기 가져오기
		
		log.info("학기 가져오기 : "+myLectureList);
		
		Map<String,Object> map2 = new HashMap<>();
		map2.put("myLectureList", myLectureList);
		return map2;
	}
	
	/***
	 * 해당 학생의 수강학기 가져오기
	 * @param map
	 * @return
	 */
	@ResponseBody
	@PostMapping("/searchSemester")
	public Map<String,Object> searchSemester(@RequestBody Map<String,Object> map, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		map.put("stuNum", Integer.parseInt(userVO.getUsername()+""));
		
		log.info("getStuLecture의 map : "+map);
		if((map.get("year")+"").equals("년도")) {
			map.put("year", null);
			map.put("semester", null);
		}
		
		List<LectureEvaVO> stuLectureList2 = this.lectureService.stuLectureList2(map);//원하는 연도와 학기를 키워드에 넣어서 해당 항목 불러오기
		log.info("stuLectureList2 : "+stuLectureList2);
		Map<String,Object> map2 = new HashMap<>();
		map2.put("stuLectureList2", stuLectureList2);
		return map2;
	}
}
