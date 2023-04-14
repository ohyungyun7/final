package kr.or.ddit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.grade.GradeService;
import kr.or.ddit.vo.CourseListVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/grade")
@Controller
public class Yg_gradeController {

	@Inject
	GradeService gradeService;

	/**
	 * 금학기 성적 조회
	 * 학번, 이름, 과목갯수, 과목의 총 취득학점, 해당학기 평점
	 * ==========================================
	 * 금학기에 수강했던 과목의 정보들과 해당 과목들의 학점 및 이수 구분 가져옴
	 */

	@GetMapping("/gradeCheck")
	public String gradeCheck(HttpServletRequest request , Model model) {
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int stuNum = userVO.getUsername();

		CourseListVO courseListVO = gradeService.getThisStudentInfo(stuNum);//학생의 정보 가져오기
		List<CourseListVO> myCourseList = gradeService.getThisCourseList(stuNum);//학생의 수강과목 정보들 가져오기

		model.addAttribute("courseListVO", courseListVO);
		model.addAttribute("myCourseList", myCourseList);
		return "grade/gradeCheck";
	}

	/**
	 * 전체 성적 조회
	 */
	@GetMapping("/gradeList")
	public String gradeList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int stuNum = userVO.getUsername();
		//필요한거
		//1. 전공인지 비전공인지 (확인)
		//2. 교양 총 학점

		StudentVO studentVO = gradeService.getStudentInfo(stuNum);		//전공만 들을건지 부전공 및 복수전공인지 확인
		CourseListVO avgScore = gradeService.avgScore(stuNum);			//현재까지의 평균 학점 가져오기
		CourseListVO kyoYangScore = gradeService.kyoYangScore(stuNum);	//교양학점 가져오기
		List<CourseListVO> myCourseListtt = gradeService.myCourseListtt(stuNum);//내 수강과목과 성적 가져오기
		List<CourseListVO> myClsemesterList = gradeService.myClsemesterList(stuNum);//내가 수강한 학기 중복제거로 가져옥이
		CourseListVO totalAvg = gradeService.totalAvg(stuNum);		//학생의 총 평점 가져오기
		CourseListVO willMajor = gradeService.willMajor(stuNum);	//교양을 제외한 현 학기 들을려고 하는거
		CourseListVO willKyoYang = gradeService.willKyoYang(stuNum);	//교양 현 학기 들을려고 하는거

		log.info("=========== 학생의 총 학점 =================");
		log.info("totalAvg : "+totalAvg);
		log.info("===========================================");

		log.info("myCourseListtt : " + myCourseListtt);

		model.addAttribute("studentVO", studentVO);
		model.addAttribute("avgScore", avgScore);
		model.addAttribute("kyoYangScore", kyoYangScore);
		model.addAttribute("myCourseListtt", myCourseListtt);
		model.addAttribute("myClsemesterList", myClsemesterList);
		model.addAttribute("totalAvg", totalAvg);
		model.addAttribute("willMajor", willMajor);
		model.addAttribute("willKyoYang", willKyoYang);

		return "grade/gradeList";
	}

	//myStuHomeScore
	@ResponseBody
	@PostMapping("/myStuHomeScore")
	public Map<String, Object> myStuHomeScore(@RequestBody Map<String, Object> map){

		int stuNum = Integer.parseInt(map.get("stuNum")+"");
		log.info("myStuHomeScore : 의 값 : "+stuNum);

		StudentVO studentVO = gradeService.getStudentInfo(stuNum);		//전공만 들을건지 부전공 및 복수전공인지 확인
		CourseListVO avgScore = gradeService.avgScore(stuNum);			//현재까지의 평균 학점 가져오기
		CourseListVO kyoYangScore = gradeService.kyoYangScore(stuNum);	//교양학점 가져오기
		List<CourseListVO> myCourseListtt = gradeService.myCourseListtt(stuNum);//내 수강과목과 성적 가져오기
		List<CourseListVO> myClsemesterList = gradeService.myClsemesterList(stuNum);//내가 수강한 학기 중복제거로 가져옥이
		CourseListVO totalAvg = gradeService.totalAvg(stuNum);		//학생의 총 평점 가져오기
		CourseListVO willMajor = gradeService.willMajor(stuNum);	//교양을 제외한 현 학기 들을려고 하는거
		CourseListVO willKyoYang = gradeService.willKyoYang(stuNum);	//교양 현 학기 들을려고 하는거


		log.info("===============================");
		log.info("avgScore:  "+avgScore);
		log.info("===============================");

		log.info("===============================");
		log.info("kyoYangScore:  "+kyoYangScore);
		log.info("===============================");

		log.info("===============================");
		log.info("totalAvg:  "+totalAvg);
		log.info("===============================");

		Map<String,Object> map2 = new HashMap<>();
		map2.put("avgScore", avgScore);
		map2.put("kyoYangScore", kyoYangScore);
		map2.put("totalAvg", totalAvg);

		return map2;
	}
}
