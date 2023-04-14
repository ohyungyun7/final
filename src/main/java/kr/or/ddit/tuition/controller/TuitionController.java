package kr.or.ddit.tuition.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.tuition.service.SmsService;
import kr.or.ddit.tuition.service.TuitionService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.CourseListVO;
import kr.or.ddit.vo.TuitionVO;
import lombok.extern.slf4j.Slf4j;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Slf4j
@RequestMapping("/tuition")
@Controller
public class TuitionController {

	@Autowired
	TuitionService tuitionService;
	@Autowired
	SmsService smsService;
//
//	/**
//	 * 등록금 납부 내역 조회 학생
//	 */
//	@GetMapping("/tuition")
//	public String stuTuitionList(@Valid @ModelAttribute SmsVO smsVO, @RequestParam Map<String, Object> map,
//			HttpServletRequest request, Model model) {
//
//		HttpSession session = request.getSession();
//		UserVO userVO = (UserVO) session.getAttribute("userVO");
//
//		map.put("stuNum", userVO.getUsername() + "");
//
//		log.info("map : " + map);
//		List<TuitionVO> stuTuitionList = this.tuitionService.stuTuitionList(map);
//		model.addAttribute("stuTuitionList", stuTuitionList);
//
//		return "tuition/tuition";
//	}


	@GetMapping("/tuition_admin")
	public String admTuitionList(Model model,
			@RequestParam(value="year",required = false, defaultValue ="전체")String year,
			@RequestParam(value="semester",required = false , defaultValue ="전체")String semester,
			@RequestParam(value="tpYn",required = false  , defaultValue ="전체")String tpYn,
			@RequestParam(value="currentPage",required = false, defaultValue ="1")int currentPage,
			@RequestParam (value = "size", required = false, defaultValue = "10") int size){



		Map<String,Object> map = new HashMap<>();
		map.put("currentPage", currentPage);
		map.put("size", size);
		map.put("year", year);
		map.put("semester", semester);
		map.put("tpYn", tpYn);

		if(map.get("year").equals("전체")) {
			map.put("year",null);
		}
		if(map.get("semester").equals("전체")) {
			map.put("semester",null);
		}

		if(map.get("tpYn").equals("전체")) {
			map.put("tpYn",null);
		}
		else if(map.get("tpYn").equals("미납")) {
			map.put("tpYn",0+"");
		}
		else if(map.get("tpYn").equals("완납")) {
			map.put("tpYn",1+"");
		}
		log.info("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
		log.info("tuition_admin에서 map의 값 : "+map);
		log.info("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");


		int total = this.tuitionService.getTotal(map);	//게시물 총 개수 뽑아오는거  13EA

		log.info("=========================================================");
		log.info("total의 개수 : "+total);
		log.info("=========================================================");
		List<TuitionVO> admTuitionList  = null;
		if(total<size) {
			admTuitionList = this.tuitionService.admTuitionList2(map);	//게시물 총 개수의 상세리스트 vo로 뽑아오는거
		}else {
			admTuitionList = this.tuitionService.admTuitionList(map);	//게시물 총 개수의 상세리스트 vo로 뽑아오는거
		}

		model.addAttribute("data", new ArticlePage<TuitionVO>(total, currentPage, size, admTuitionList));
		model.addAttribute("tpYN", map.get("tpYn"));
		model.addAttribute("semester", map.get("semester"));
		return "tuition/tuition_admin";

	}

	@ResponseBody
	@PostMapping("/showStuNum")
	public Map<String, Object> showStuNum(@RequestBody Map<String, Object> map, HttpServletRequest request) {


		log.info("tuitionNum에서 map의 값 : " + map);
		TuitionVO tuitionNum = this.tuitionService.tuitionNum(map);
		log.info("tuitionNum : " + tuitionNum);

		Map<String, Object> map2 = new HashMap<>();
		map2.put("tuitionNum", tuitionNum);
		return map2;
	}

	@PostMapping("/createPost")
	public String sendSms(@RequestParam ("smsContent") String smsContent,
						  @RequestParam ("smsNm") String smsNm,
						  @RequestParam ("smsPn") String smsPn,
						  @RequestParam ("smsDt") String smsDt,
			HttpServletRequest request
			) throws Exception {
		log.info("/createPost에서 넘어온 smsContent의 값 : " + smsContent);
		log.info("/createPost에서 넘어온 smsDt의 값 : " + smsDt);
		log.info("/createPost에서 넘어온 smsPn의 값 : " + smsPn);
		log.info("/createPost에서 넘어온 smsNm의 값 : " + smsNm);

		// 이거는 coolsms 마이페이지에서 받아야됨
		String api_key = "NCSR3NDLGLJQCLI5";
		String api_secret = "FRAHZ5CICQTZUTWIHQNBN14Y78O5WR9F";

		Message coolsms = new Message(api_key, api_secret);
		request.setCharacterEncoding("utf-8");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("to", (String) request.getParameter("smsPn")); // 수신번호

		map.put("from", (String) request.getParameter("from")); // 발신번호
		map.put("text", (String) request.getParameter("smsContent")); // 문자내용
		map.put("type", "sms"); // 문자 타입
		map.put("app_version", "test app 1.2");

		System.out.println(map);
		try {
			JSONObject result = coolsms.send(map); // 보내기&전송결과받기

			System.out.println(result.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}

		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("smsContent", smsContent);
		map2.put("smsDt", smsDt);
		map2.put("smsPn", smsPn);
		map2.put("smsNm", smsNm);


		log.info("map2 : " + map2);
		int result = smsService.insertSms(map2);
		log.info("result : " + result);
		return "redirect:/tuition/tuition_admin";
	}

	// 등록금 전체 조회 시 연도 가져오기
	@ResponseBody
	@PostMapping("/getTuitionYear")
	public Map<String,Object> getTuitionYear() {
		log.info("========================");
		log.info("getTuitionYear에 들어옴!!!");
		log.info("========================");

		List<CourseListVO> getTuitionYearList = tuitionService.getTuitionYear();

		log.info("getTuitionYearList 리스트의 값 : "+getTuitionYearList);
		Map<String,Object> map = new HashMap<>();

		map.put("data", getTuitionYearList);
		return map;
	}

}
