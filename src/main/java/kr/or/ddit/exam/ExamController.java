package kr.or.ddit.exam;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.subject.service.impl.SubjectService;
import kr.or.ddit.vo.AnswerVO;
import kr.or.ddit.vo.ExamQue;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.SubjectVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/exam")
@Controller
public class ExamController {

	@Inject
	SubjectService subjectService;
	@Inject
	ExamService examService;

	//온라인 시험 추가
	@GetMapping("/exam")
	public String examAdd(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int teaNum = Integer.parseInt(userVO.getUsername()+"");

		List<SubjectVO> subjectVO =  subjectService.examAdd(teaNum);

		model.addAttribute("subjectVO", subjectVO);
		return "exam/examAdd";
	}

	@ResponseBody
	@PostMapping("/examCheck")
	public Map<String,Object> examCheck(@RequestBody Map<String,Object> map){

		log.info("examCheck에서 넘어온 과목코드 값 : "+map);
		int count = examService.examCheck(map.get("sbjNum")+"");//미리 시험문제를 냈는지 아니면 아예없는지 체크

		log.info("시험문제를 미리 냈는지 안냈는지 확인 : "+count);
		Map<String,Object> map2 = new HashMap<>();
		map2.put("result", count);
		return map2;
	}

	@GetMapping("/examMake")
	public String examMake(@RequestParam("sbjNum") String sbjNum, HttpServletRequest request, Model model) {
		SubjectVO subjectVO = examService.subjectDetail(sbjNum);//과목 상세정보 가져오기

		model.addAttribute("subjectVO", subjectVO);
		return "exam/examMake";
	}

	//exam테이블에 데이터 넣기 - 첫번째
	@ResponseBody
	@PostMapping("/examTable")
	public Map<String,Object> examTable(@RequestBody Map<String,Object> map){
		log.info("examMake에서 sbjNum의 값 : "+map.get("sbjNum"));
		String sbjNum = map.get("sbjNum")+"";
		int result = examService.examMake(sbjNum);//exam테이블에 시험 데이터를 넣음
		log.info("examMake에서 결과값 : "+result);

		int exmNum = examService.getExamNum(sbjNum);//시험과목에 대한 시험번호 가져옴


		Map<String,Object> map2 = new HashMap<>();
		map2.put("result", result);//시험테이블에 넣은 성공유무
		map2.put("examNum", exmNum);//해당 과목이 exam테이블에서 등록번호가져옴
		return map2;
	}


	//examQue 테이블에 데이터 넣기 - 두번째
	@ResponseBody
	@PostMapping("/examQue")
	public Map<String,Object> examQue(@RequestBody Map<String,Object> map){
//		let data2 = {"examNum" : examNum ,
//				 "sbjNum" : sbjNum,
//				 "question" : question,
//				 "queAns" : queAns
//				}

		log.info("examQue 에서 map의 값 : "+map);

		int result = examService.examQue(map);//examQue 테이블에 데이터 넣기
		int exmqueNum = examService.getExamqueNum(map);//해당 과목의 examQue테이블 등록번호가져옴

		Map<String,Object> map2 = new HashMap<>();
		map2.put("exmqueNum", exmqueNum);
		return map2;
	}

	//examSel 테이블에 데이터 넣기 - 마지막
		@ResponseBody
		@PostMapping("/examSel")
		public Map<String,Object> examSel(@RequestBody Map<String,Object> map){

			log.info("examSel 에서 map의 값 : "+map);
			int result = examService.examSel(map);

			log.info("examSel 에서 result의 값 : " + result);
			Map<String,Object> map2 = new HashMap<>();
			map2.put("result", result);
			return map2;
		}

		//examUpdate
		@GetMapping("/examUpdate")
		public String examUpdate(@RequestParam("sbjNum") String sbjNum, Model model){

			log.info("examUpdate에서 sbjNum의 값 : "+sbjNum);
			int exmNum = examService.getExamNum(sbjNum);//시험과목에 대한 시험번호 가져옴

			SubjectVO subjectVO = examService.subjectDetail(sbjNum);//과목 상세정보 가져오기

			model.addAttribute("subjectVO", subjectVO);

			return "exam/updateExam";
		}


		/**
		 * 학생이 시험을 보기 위한 시험 리스트 뽑는거
		 * @param map
		 * @param request
		 * @return
		 */
		@ResponseBody
		@PostMapping("/examAllList")
		public Map<String,Object> examAllList(@RequestBody Map<String,Object> map, HttpServletRequest request){

			HttpSession session = request.getSession();

			UserVO userVO = (UserVO) session.getAttribute("userVO");
			int stuNum = userVO.getUsername();

			StudentVO studentVO = examService.getStuInfo(stuNum); //학생의 정보를 가져옴
			log.info("☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆");
			log.info("시험볼놈 정보 : "+studentVO);
			log.info("☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆");

			String sbjNum = map.get("sbjNum")+"";
			int exmNum = examService.getExamNum(sbjNum);//시험과목에 대한 시험번호 가져옴
			log.info("=============================");
			log.info("exmNum : "+exmNum);
			log.info("=============================");
			Map<String, Object> map2 = new HashMap<>();
			map2.put("sbjNum", sbjNum);
			map2.put("exmNum", exmNum);

			List<ExamQue> examAllList = examService.getExamQueList(map2);//테이블 EXAM_QUE 항목과 EXAM_SEL 항목을 동시에 가져옴 1:N 쿼리

			Map<String,Object> map3 = new HashMap<>();
			map3.put("examAllList", examAllList);
			map3.put("studentVO", studentVO);
			return map3;
		}

		//업데이트를 완벽하게 해야하는데 너무 까다로워서 그냥 기존에 있었던거 싹다 지우고 새로운거로 뒤덮음
		@ResponseBody
		@PostMapping("/examDelete")
		public Map<String,Object> examDelete(@RequestBody Map<String,Object> map){
			log.info("examDeleteInsert에서 map의 값 : "+map);

			int result1 = examService.deleteExamSel(map);//EXAM_SEL 테이블의 과목번호를 전체삭제
			int result2 = examService.deleteExamQue(map);//EXAM_QUE 테이블의 과목번호를 전체삭제
			int result3 = examService.deleteExam(map);  //EXAM 테이블의 과목번호를 전체삭제

			log.info("EXAM_SEL 테이블 전체 삭제의 값 : "+result1);
			log.info("EXAM_QUE 테이블 전체 삭제의 값 : "+result2);
			log.info("EXAM 테이블 전체 삭제의 값 : "+result3);

			Map<String,Object> map2 = new HashMap<>();
			map2.put("result1", result1);
			map2.put("result2", result2);
			map2.put("result3", result3);

			return map2;
		}
		// /

		@GetMapping("/examStudent")
		public String onlineList(HttpServletRequest request, Model model,
								@RequestParam("sbjTitle") String sbjTitle,
								@RequestParam("sbjNum") String sbjNum) {

			HttpSession session = request.getSession();
			UserVO userVO = (UserVO) session.getAttribute("userVO");

			log.info("examStudent에서 sbjTitle : "+sbjTitle);
			log.info("examStudent에서 sbjNum : "+sbjNum);
			log.info("examStudent에서 학번 : "+userVO.getName());

			model.addAttribute("stuName", userVO.getName());
			model.addAttribute("sbjTitle", sbjTitle);
			model.addAttribute("sbjNum", sbjNum);

			return "exam/examStudent";
		}

		@ResponseBody
		@PostMapping("/submitExamStudent")
		public Map<String,Object> submitExamStudent(@RequestBody Map<String,Object> map){

			log.info("submitExamStudent에서 sbjNum의 값 : "+map.get("sbjNum"));
			String sbjNum = map.get("sbjNum")+"";
			int exmNum = examService.getExamNum(sbjNum);//시험과목에 대한 시험번호 가져옴
			log.info("EXAM테이블의 기본키 EXM_NUM의 값 : "+exmNum);

			Map<String,Object> map2 = new HashMap<>();
			map2.put("exmNum", exmNum);
			return map2;
		}

		//EXMQUE의 1:N 관계 아닌 그냥 1:1가져옴
		@ResponseBody
		@PostMapping("/getExamQue")
		public Map<String,Object> getExamQue(@RequestBody Map<String,Object> map){

			log.info("getExamQue에서 map의 값 : "+map);
			List<ExamQue> examQueList = examService.getExamQue(map);

			Map<String,Object> map2 = new HashMap<>();
			map2.put("examQueList", examQueList);
			log.info("EXMQUE의 테이블 값 : "+examQueList);
			return map2;
		}

		//submitMyAnswer
		@ResponseBody
		@PostMapping("/submitMyAnswer")
		public Map<String,Object> submitMyAnswer(@RequestBody Map<String,Object> map, HttpServletRequest request){


			HttpSession session = request.getSession();
			UserVO userVO = (UserVO) session.getAttribute("userVO");

			map.put("stuNum", userVO.getUsername());
			log.info("submitMyAnswer에서 map의 값 : "+map);

			int result = examService.submitMyAnswer(map);
			log.info("학생이 제출한 후 결과값 : "+result);
			Map<String,Object> map2 = new HashMap<>();
			map2.put("result", result);

			return map2;
		}

		//submitMyAnswer
		@ResponseBody
		@PostMapping("/compareExam")
		public Map<String,Object> compareExam(@RequestBody Map<String,Object> map, HttpServletRequest request){

			log.info("compareExam : "+map);

			HttpSession session = request.getSession();
			UserVO userVO = (UserVO) session.getAttribute("userVO");

			Map<String,Object> map2 = new HashMap<>();
			map2.put("sbjNum", map.get("sbjNum"));
			map2.put("stuNum", (int)userVO.getUsername());

			List<ExamQue> examQueList = examService.examQueList(map2);//교수가 출제한 문제와 답
			List<AnswerVO> answerVOList = examService.answerVOList(map2);//내가 제출한 문제와 답
			log.info("교수가 출제한 문제와 답 : "+examQueList);
			log.info("내가 제출한 문제와 답 : "+answerVOList);

			map2.put("examQueList", examQueList);
			map2.put("answerVOList", answerVOList);
			return map2;
		}

		//sbjNum, trueCount, falseCount , totalCount
		@GetMapping("/detail")
		public String detail(@RequestParam("sbjNum") String sbjNum,
							 @RequestParam("trueCount") int trueCount,
							 @RequestParam("falseCount") int falseCount,
							 @RequestParam("totalCount") int totalCount,
							 @RequestParam("minute") int minute,
							 @RequestParam("second") int second,
							 Model model,
							 HttpServletRequest request) {


			HttpSession session = request.getSession();
			UserVO userVO = (UserVO) session.getAttribute("userVO");

			Map<String,Object> map2 = new HashMap<>();
			map2.put("sbjNum", sbjNum);
			map2.put("stuNum", (int)userVO.getUsername());

			List<ExamQue> examQueListAndAns = examService.examQueListAndAns(map2);//교수가 출제한 문제와 답과 학생의 답

			totalCount = 100/totalCount;

			log.info("☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆");
			log.info("sbjNum : "+sbjNum);
			log.info("trueCount : "+trueCount);
			log.info("falseCount : "+falseCount);
			log.info("totalCount : "+totalCount);
			log.info("examQueListAndAns : "+examQueListAndAns);
			log.info("☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆");



			model.addAttribute("examQueListAndAns", examQueListAndAns);
			model.addAttribute("sbjNum", sbjNum);
			model.addAttribute("trueCount", trueCount);
			model.addAttribute("falseCount", falseCount);
			model.addAttribute("totalCount", totalCount);
			model.addAttribute("minute", minute);
			model.addAttribute("second", second);
			return "exam/examDetail";
		}
}
