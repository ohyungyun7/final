package kr.or.ddit.gradeobjection;

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

import kr.or.ddit.course.service.CourseService;
import kr.or.ddit.gradeobjection.service.GradeObjectionService;
import kr.or.ddit.vo.CourseListVO;
import kr.or.ddit.vo.GradeObjectVO;
import kr.or.ddit.vo.ReportCardVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.TeacherVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@RequestMapping("/grade")
@Controller
public class GradeObjectionController {

	@Autowired
	GradeObjectionService gradeService;
	@Autowired
	CourseService courseService;

	/**
	 * 성적이의 신청
	 * 학생 : 수강중인 강의 리스트
	 * 교수 : 이의신청한 학생 리스트
	 */
	@GetMapping("/gradeObjc")
	public String gradeObjc(HttpServletRequest request,Model model, Map<String, Object> map) {

		log.info("맵으로 넘겨받은값 : "+map);

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		map.put("stuNum", Integer.parseInt(userVO.getUsername()+""));

		StudentVO student = this.gradeService.getStuInfo(map);

		List<CourseListVO> gradeObjectionList = this.gradeService.gradeObjectionList(map);
		model.addAttribute("data", gradeObjectionList);
		model.addAttribute("student",student);
		return "grade/gradeObjc";
	}

	/**
	 * 학생 : 내 성적 리스트
	 */
	@ResponseBody
	@PostMapping("/detail")
	public Map<String,Object> detail(@RequestBody Map<String, Object> map,
									HttpServletRequest request){
		log.info("detail에서 넘어온  sbjNum : "+ map);

		List<ReportCardVO> reportCardVO = this.gradeService.detail(map);
		log.info("reportCardVO : " + reportCardVO);
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("reportCardVO", reportCardVO);
		return map2;
	}

	/**
	 * 이의신청 내용 insert
	 * @param map
	 * @param request
	 * @return
	 */
	@ResponseBody
	@PostMapping("/create")
	public Map<String,Object> create(@RequestBody Map<String, Object> map,
			HttpServletRequest request){
		log.info("create에서 넘어온  sbjNum : "+ map);

		int insertResult = gradeService.create(map);
		log.info("insertResult 의 결과값 : "+insertResult);
		Map<String,Object> map2 = new HashMap<>();
		map2.put("insertResult", insertResult);

		return map2;
	}

	/**
	 * 이의신청 내용이 이미 작성을 했는지 안했는지 체크
	 * 작성이 있을 시 클릭 이벤트 막음
	 * @param map
	 * @param request
	 * @return
	 */
	@ResponseBody
	@PostMapping("/check")
	public Map<String, Object> check( @RequestBody Map<String, Object> map){


		log.info("check : "+map);
		int checkResult = gradeService.check(map);

		log.info("체크 한 후 db에 몇개있는지 값 : "+checkResult);
		Map<String,Object> map2 = new HashMap<>();
		map2.put("result", checkResult);

		return map2;
	}


	/**
	 * 성적이의 신청
	 * 교수 : 이의신청한 학생 리스트
	 */
	@GetMapping("/gradeObjcCheck")
	public String gradeObjcCheck(HttpServletRequest request,Model model, Map<String, Object> map) {


		log.info("gradeObjcCheck에서 map 값 : "+map);

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		map.put("teaNum", Integer.parseInt(userVO.getUsername()+""));

		TeacherVO teacher = this.gradeService.getTeaInfo(map);

		List<GradeObjectVO> teacherObjList = this.gradeService.teacherObjList(map);
		model.addAttribute("data", teacherObjList);
		model.addAttribute("teacher",teacher);
		return "grade/gradeObjcCheck";
	}
	//stuNum="+stuNum+"&goCheck="+goCheck+"&goReply="+textarea2+"&sbjNum="+sbjNum;
	@GetMapping("/updateGoCheck")
	public String update(@RequestParam int stuNum,
						 @RequestParam int goCheck,
						 @RequestParam("goReply") String goReply,
						 @RequestParam("sbjNum") String sbjNum) {
		log.info("updateGoCheck에서 넘어온 stuNum 의 값 : " + stuNum);
		log.info("updateGoCheck에서 넘어온 goCheck 의 값 : " + goCheck);
		log.info("updateGoCheck에서 넘어온 goReply 의 값 : " + goReply);
		log.info("updateGoCheck에서 넘어온 sbjNum 의 값 : " + sbjNum);




		Map<String, Object> map = new HashMap<>();
		map.put("stuNum", stuNum);
		map.put("goCheck", goCheck);
		map.put("goReply", goReply);
		map.put("sbjNum", sbjNum);
		log.info("map : " + map);

		int result = gradeService.updateState(map);
		log.info("updateGoCheck 에서 상태값 update된 결과 : " + result);


		return "redirect:/grade/updateObjc?sbjNum="+sbjNum+"&stuNum="+stuNum;
	}

	@GetMapping("/updateGoCheck2")
	public String update2(@RequestParam int stuNum,
					 	  @RequestParam int goCheck,
					 	  @RequestParam ("textarea2")String goReply) {
		log.info("updateGoCheck2에서 넘어온 stuNum 의 값 : " + stuNum);
		log.info("updateGoCheck2에서 넘어온 goCheck 의 값 : " + goCheck);
		log.info("updateGoCheck2에서 넘어온 goCheck 의 값 : " + goReply);
		Map<String, Object> map = new HashMap<>();
		map.put("stuNum", stuNum);
		map.put("goCheck", goCheck);
		map.put("goReply", goReply);
		log.info("map : " + map);
		int result = gradeService.updateState1(map);
		log.info("updateGoCheck2 에서 상태값 update된 결과 : " + result);
		return "redirect:/grade/gradeObjcCheck";
	}

	@GetMapping("/updateObjc")
	public String updateObjc(@RequestParam("sbjNum") String sbjNum,
			   			     @RequestParam("stuNum") int stuNum,
			   			     Model model,
			   			     HttpServletRequest request) {

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int teaNum = userVO.getUsername();

		log.info("teaNum : "+teaNum);


		Map<String,Object> map = new HashMap<>();//detail 가는 맵
		map.put("sbjNum", sbjNum);
		map.put("stuNum", stuNum);

		Map<String, Object> map2 = new HashMap<>();//teacherObjList로 가는 맵
		map2.put("teaNum", teaNum);

		String getSubjectInfo = courseService.getSubjectInfo(sbjNum);//해당 과목 상세 정보 가져오기
		List<CourseListVO> getCourseListInfo = courseService.getCourseListInfo(sbjNum);//해당 과목을 듣는 현재학기 학생 목록 가져오기
		List<ReportCardVO> reportCardVO = this.gradeService.detail(map);
		//List<GradeObjectVO> teacherObjList = this.gradeService.teacherObjList(map2);
		model.addAttribute("reportCardVO", reportCardVO);
		model.addAttribute("getCourseListInfo", getCourseListInfo);
		model.addAttribute("getSubjectInfo", getSubjectInfo);
		//model.addAttribute("teacherObjList", teacherObjList);
		return "course/reportCardUpdate";
	}
}
