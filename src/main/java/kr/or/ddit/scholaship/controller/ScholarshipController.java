package kr.or.ddit.scholaship.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.scholaship.service.ScholarshipService;
import kr.or.ddit.tuition.service.TuitionService;
import kr.or.ddit.vo.ScholarshipVO;
import kr.or.ddit.vo.TuitionVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/scholarship")
@Controller
public class ScholarshipController {
	@Autowired
	ScholarshipService scholarShipService;

	@Autowired
	TuitionService tuitionService;
	/**
	 * 장학금 목록
	 * 학생
	 */
	@GetMapping("/list")
	public String scholarshipList(@RequestParam Map<String, Object> map ,HttpServletRequest request ,Model model
			) {

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");

		map.put("stuNum", userVO.getUsername()+"");

		log.info("==========================");
		log.info("map : " + map);
		log.info("==========================");

		List<ScholarshipVO> scholarshipList = this.scholarShipService.stuScholarshipList(map);
		List<TuitionVO> stuTuitionList = this.tuitionService.stuTuitionList(map);
		model.addAttribute("stuTuitionList", stuTuitionList);
		model.addAttribute("scholarshipList", scholarshipList);

		return "scholarship/list";
	}


//	/**
//	 * 등록금 납부 내역 조회 학생
//	 */
//	@GetMapping("/list")
//	public String stuTuitionList(@ModelAttribute @RequestParam Map<String, Object> map, HttpServletRequest request, Model model) {
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
//		return "scholarship/list";
//	}

	/**
	 * 장학금 추천 받은 리스트
	 * 교수
	 */
	@GetMapping("/recommendation")
	public String recommendation(@RequestParam Map<String, Object> map
			,HttpServletRequest request
			,Model model) {

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int deptNum = userVO.getDeptNum();

		map.put("deptNum", deptNum);
		map.put("teaNum", userVO.getUsername()+"");
		log.info("===================");
		log.info("map : " + map);
		log.info("===================");

		List<ScholarshipVO> deptStudentList = this.scholarShipService.deptStudentList(map); // 학과의 학생 전체 리스트
		List<ScholarshipVO> deptProList = this.scholarShipService.deptProList(map); // 학과의 장학금 추천 대기 리스트
		model.addAttribute("deptStudentList", deptStudentList);
		model.addAttribute("deptProList", deptProList);
		return "scholarship/recommendation";
	}

	/**
	 *  학과 학생 장학금 추천
	 *  교수
	 */

	@GetMapping("/recommendInsert")
	public String recommendInsert(@RequestParam int stuNum,
			                      @RequestParam("sreYsemester") String sreYsemester,
			                      @RequestParam("recommendReason") String recommendReason,
			                      HttpServletRequest request) {

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");


		log.info("/recommendInsert에서 stuNum의 값 : "+stuNum);
		log.info("/recommendInsert에서 sreYsemester의 값 : "+sreYsemester);
		log.info("/recommendInsert에서 recommendReason의 값 : "+recommendReason);

		Map<String, Object> map = new HashMap<>();
//		String contents = ((String)commandMap.get("CONTENTS")).replace("\r\n","<br>");
		map.put("stuNum", stuNum);
		map.put("sreYsemester", sreYsemester);
		map.put("recommendReason", recommendReason);
		map.put("teaNum", Integer.parseInt(userVO.getUsername()+""));

		log.info("map : " + map  );
		int result = scholarShipService.insertRecommend(map);


		log.info("/recommendInsert에서  수혜내역에 업뎃 된 결과 : "+result);

		return "redirect:/scholarship/recommendation";
	}

	/**
	 * 장학금 추천 승인
	 * 관리자
	 */
	@GetMapping("/recommendation_admin")
	public String recommendation_admin(Model model) {
		List<ScholarshipVO> scholarshipList = this.scholarShipService.admScholarshipList();
		List<ScholarshipVO> paymentsList = this.scholarShipService.paymentsList();

		log.info("scholarshipList 여기에 sreNum이 있어야함: " + scholarshipList);
		model.addAttribute("scholarshipList", scholarshipList);
		model.addAttribute("paymentsList", paymentsList);

		return "scholarship/recommendation_admin";

	}

	/**
	 * 장학금 승인
	 * 관리자
	 */
	@GetMapping("/updateState")
	public String updateState(@RequestParam int stuNum, @RequestParam int status, @RequestParam("slNum") int slNum,
							  @RequestParam("sreYsemester") String sreYsemester,@RequestParam("nowDate")String nowDate) {
//							  @RequestParam("sreNum") int sreNum

		log.info("/updateState에서 stuNum의 값 : "+stuNum);
		log.info("/updateState에서 status의 값 : "+status);
		log.info("/updateState에서 slNum의 값 : "+slNum);
		log.info("/updateState에서 sreYsemester의 값 : "+sreYsemester);
//		log.info("/updateState에서 sreNum의 값 : "+sreNum);
		log.info("/updateState에서 nowDate의 값 : "+nowDate);

		Map<String, Object> map = new HashMap<>();
		map.put("stuNum", stuNum);
		map.put("status", status);
		map.put("slNum", slNum);
		map.put("sreYsemester", sreYsemester);
		map.put("nowDate", nowDate);

		log.info("map : "+map);
		int result = scholarShipService.updateState(map);
		int result2 = scholarShipService.insertRedetail(map);//수혜내역에 데이터 넣음
//		int result3 = scholarShipService.deleteRecomm(sreNum);//승인 및 반려 후 추천 테이블에서 삭제!



		log.info("/updateState에서 상태값 update된 결과 : "+result);
		log.info("/updateState에서  수혜내역에 업뎃 된 결과 : "+result2);
//		log.info("/updateState에서 승인 및 반려 후 추천 테이블에서 삭제 한 결과 : "+result3);
		return "redirect:/scholarship/recommendation_admin";
	}



	/**
	 * 장학금 반려
	 * 관리자
	 */
	@GetMapping("/updateState2")
	public String updateState2(@RequestParam int stuNum, @RequestParam int status, @RequestParam("sreComre") String sreComre) {

		log.info("/updateState2에서 stuNum의 값 : "+stuNum);
		log.info("/updateState2에서 status의 값 : "+status);
		log.info("/updateState2에서 sreComre의 값 : "+sreComre);


		Map<String, Object> map = new HashMap<>();
		map.put("stuNum", stuNum);
		map.put("status", status);
		map.put("sreComre", sreComre);
		log.info("map : "+map);
		int result = scholarShipService.updateState2(map);

		log.info("/updateState에서 상태값 update된 결과 : "+result);
		return "redirect:/scholarship/recommendation_admin";
	}

	/**
	 * 장학금 지급
	 * 관리자
	 */
	@GetMapping("/updateState3")
	public String updateState3(@RequestParam int stuNum1, @RequestParam int status) {
		log.info("/updateState3에서 stuNum의 값 : " + stuNum1);
		log.info("/updateState3에서 status의 값 : " + status);

		Map<String, Object> map = new HashMap<>();
		map.put("stuNum1", stuNum1);
		map.put("status", status);
		log.info("map : " + map);
		int result = scholarShipService.updateState3(map);
		log.info("updateState3에서 상태값 update된 결과 : " + result);
		return "redirect:/scholarship/recommendation_admin";

	}


	@ResponseBody
	@PostMapping("/countRecomm")
	public Map<String,Object> countRecomm(@RequestBody Map<String,Object> map){

		log.info("countRecomm에서 넘어온 학번 값 : "+map);

		int stuNum = Integer.parseInt(map.get("stuNum")+"");
		log.info("stuNum의 값 : "+stuNum);
		//map에서 받아온 학번이 추천테이블에 있는지 없는지 결과값을 받아오는 쿼리



		int result = scholarShipService.countRecomm(stuNum);


		log.info("countRecomm에서 추천테이블에 학번이 있는지 확인 결과값 : "+result);

		Map<String,Object> map2 = new HashMap<>();

		map2.put("result", result);

		return map2;
	}


	/**
	 * 모달 클릭 시 상세보기
	 * 관리자
	 */
	@ResponseBody
	@PostMapping("/showStuNum")
	public Map<String,Object> showStuNum(@RequestBody Map<String,Object> map, HttpServletRequest request) {

	    HttpSession session = request.getSession();
	    UserVO userVO = (UserVO) session.getAttribute("userVO");

		log.info("showStuNum에서 map의 값 : "+map);

		ScholarshipVO paymentNum= this.scholarShipService.paymentNum(map);      //모달 클릭 시 상세보기(관리자)

		log.info("paymentNum : " + paymentNum);

		Map<String,Object> map2 = new HashMap<>();
		map2.put("paymentNum", paymentNum);
		return map2;
	}



	/**
	 * 장학생 추천받은 리스트 상세보기
	 * 관리자
	 */
	@ResponseBody
	@PostMapping("/showNum")
	public Map<String,Object> paymentNum(@RequestBody Map<String,Object> map, HttpServletRequest request) {

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");

		log.info("showNum에서 map의 값 : "+map);

		ScholarshipVO ScholarshipListVO = this.scholarShipService.showNum(map); //장학생 추천받은 리스트 상세보기(관리자)			해결완료
		log.info("ScholarshipListVO : " + ScholarshipListVO);

		Map<String,Object> map2 = new HashMap<>();
		map2.put("ScholarshipListVO", ScholarshipListVO);
		return map2;
	}

	/**
	 * 장학생 추천받은 리스트 상세보기
	 * 관리자
	 */
	@ResponseBody
	@PostMapping("/waitNum")
	public Map<String,Object> waitNum(@RequestBody Map<String,Object> map, HttpServletRequest request) {

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");

		log.info("waitNum에서 map의 값 : "+map);

		ScholarshipVO waitNum= this.scholarShipService.waitNum(map);	    //학과의 학생 상세보기(교수)
		log.info("waitNum : " + waitNum);
		Map<String,Object> map2 = new HashMap<>();
		map2.put("waitNum", waitNum);

		return map2;
	}


	/**
	 * 모달 클릭 시 상세보기
	 * 관리자
	 */
	@ResponseBody
	@PostMapping("/deptNum")
	public Map<String,Object> deptNum(@RequestBody Map<String,Object> map, HttpServletRequest request) {

	    HttpSession session = request.getSession();
	    UserVO userVO = (UserVO) session.getAttribute("userVO");

		log.info("deptNum에서 map의 값 : "+map);

		ScholarshipVO ScholarshipVO = this.scholarShipService.deptNum(map);	    //학과의 학생 상세보기(교수)

		log.info("ScholarshipVO : " + ScholarshipVO);

		Map<String,Object> map2 = new HashMap<>();
		map2.put("ScholarshipVO", ScholarshipVO);
		return map2;
	}


}
