package kr.or.ddit.graduation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.academic.academicController;
import kr.or.ddit.graduation.service.GraduationService;
import kr.or.ddit.vo.AcademicVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/grad")
@PreAuthorize("isAuthenticated()")
public class GraduationController {

	@Autowired
	GraduationService graduationService;

	/**
	 * (학생)졸업-자가진단 화면 출력
	 * 요청URI : /grad/selfTest
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping("/selfTest")
	public String selfTest(HttpSession session, Model model) {
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		log.info("selfTest의 userVO : " + userVO);
		int stuNum = userVO.getUsername();
		log.info("selfTest의  stuNum : " + stuNum);

		//전공필수, 교양필수 이수학점 조회
		int sbjRs = 1;

		Map<String, Object> infoMap = new HashMap<String, Object>();
		//map에 학생학번, 필수여부 담기(1: 필수, 2: 선택)
		infoMap.put("stuNum", stuNum);
		infoMap.put("sbjRs", sbjRs);
		log.info("selfTest의 infoMap(put 이후) : " + infoMap);

		//전체학기 전공필수 이수학점 조회
		int sumMrRecode = this.graduationService.getSumMRecode(infoMap);
		log.info("sumMrRecode(전필 합계) : " + sumMrRecode);

		//금학기 전공필수 이수학점 조회
		int sumThisMrRecode = this.graduationService.getThisSumMRecode(infoMap);
		log.info("sumThisMrRecode(금학기 전필 합계) : " + sumThisMrRecode);

		//전체학기 교양필수 이수학점 조회
		int sumErRecode = this.graduationService.getSumERecode(infoMap);
		log.info("sumErRecode(교필 합계) : " + sumErRecode);

		//금학기 교양필수 이수학점 조회
		int sumThisErRecode = this.graduationService.getThisSumERecode(infoMap);
		log.info("sumThisErRecode(금학기 교필 합계) : " + sumThisErRecode);

		//전공선택, 교양선택 이수학점 조회
		sbjRs = 2;
		//map에 담긴 필수여부 값을 '선택'으로 변경
		infoMap.put("sbjRs", sbjRs);
		log.info("infoMap(전공선택) : " + infoMap);

		//전체학기 전공선택 이수학점 조회
		int sumMsRecode = this.graduationService.getSumMRecode(infoMap);
		log.info("sumMsRecode(전선 합계) : " + sumMsRecode);

		//금학기 전공선택 이수학점 조회
		int sumThisMsRecode = this.graduationService.getThisSumMRecode(infoMap);
		log.info("sumThisMsRecode(금학기 전선 합계) : " + sumThisMsRecode);

		//전체학기 교양선택 이수학점 조회
		int sumEsRecode = this.graduationService.getSumERecode(infoMap);
		log.info("sumEsRecode(교선 합계) : " + sumEsRecode);

		//금학기 교양선택 이수학점 조회
		int sumThisEsRecode = this.graduationService.getThisSumERecode(infoMap);
		log.info("sumThisEsRecode(금학기 교선 합계) : " + sumThisEsRecode);

		//전필, 전선, 교필, 교선 합계 Map에 담기
		Map<String, Object> recordMap = new HashMap<String, Object>();
		recordMap.put("sumMrRecode", sumMrRecode);
		recordMap.put("sumThisMrRecode", sumThisMrRecode);

		recordMap.put("sumErRecode", sumErRecode);
		recordMap.put("sumThisErRecode", sumThisErRecode);

		recordMap.put("sumMsRecode", sumMsRecode);
		recordMap.put("sumThisMsRecode", sumThisMsRecode);

		recordMap.put("sumEsRecode", sumEsRecode);
		recordMap.put("sumThisEsRecode", sumThisEsRecode);

		log.info("recordMap : " + recordMap);

		model.addAttribute("recordMap", recordMap);


		return "graduation/selfTest";
	}

	/**
	 * (학생)졸업-조기졸업 신청 화면 출력
	 * 요청URI : /grad/earlyGraduation
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping("/earlyGraduation")
	public String earlyGraduation(HttpSession session, Model model) {

		//학생 기본정보 조회
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int stuNum = userVO.getUsername();
		log.info("leaveReturnStu의 stuNum : " + stuNum);

		Map<String, Object> stuInfoMap = this.graduationService.getStuInfo(stuNum);
		log.info("delayGraduation의 stuInfoMap : " + stuInfoMap);

		//조기졸업 신청목록 조회
		List<AcademicVO> appEGList = this.graduationService.getAppEG(stuNum);
		log.info("earlyGraduation의 appEGList : " + appEGList);

		model.addAttribute("appEGList", appEGList);
		model.addAttribute("stuInfo", stuInfoMap);

		return "graduation/earlyGraduation";
	}

	/**
	 * (학생)조기졸업 신청 등록
	 * @param session
	 * @return
	 */
	@ResponseBody
	@PostMapping("/earlyGraduation")
	public Map<String, Object> earlyGraduation(HttpSession session){

		//userVO에 담긴 session의 학생학번을 stuNum 변수에 담기
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int stuNum = userVO.getUsername();
		log.info("earlyGraduation의 stuNum : " + stuNum);

		//승인대기 상태인 조기졸업 신청 건 조회
		Map<String, Object> eghMap = new HashMap<String, Object>();

		eghMap.put("acCheck", 0);
		eghMap.put("stuNum", stuNum);

		int wResult = this.graduationService.getEGHistory(eghMap);
		log.info("ealryGraduation의 wResult : " + wResult);

		//승인완료 상태인 조기졸업 신청 건 조회
		eghMap.put("acCheck", 1);

		int aResult = this.graduationService.getEGHistory(eghMap);
		log.info("earlyGraduation의 aResult : " + aResult);


		Map<String, Object> resultMap = new HashMap<String, Object>();

		//평균평점 조회
		Map<String, Object> avgMap = this.graduationService.getAvgFscore(stuNum);
		log.info("earlyGraduation의 avgMap : " + avgMap);
		double avgFscore = Double.parseDouble(String.valueOf(avgMap.get("AVG_FSCORE")));

		if(avgFscore < 4) {
			resultMap.put("result", "lowScore");
			resultMap.put("avgFscore", avgFscore);
			return resultMap;
		}

		//F학점 갯수 조회
		int fCnt = this.graduationService.getFCnt(stuNum);
		log.info("earlyGraduation의 fCnt : " + fCnt);

		if(fCnt > 0) {	//F학점이 존재하는 경우
			resultMap.put("result", "fExist");
			return resultMap;
		}

		//조기졸업 신청 등록
		int result = this.graduationService.appEG(avgMap);
		log.info("earlyGraduation의 result : " + result);


		if(result > 0) {	//등록 성공
			resultMap.put("result", "success");
			return resultMap;
		}else {				//등록 실패
			resultMap.put("reuslt", "fail");
			return resultMap;
		}

	}

	/**
	 * (학생)졸업-졸업유예 신청화면 출력
	 * 요청URI : /grad/delayGraduation
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping("/delayGraduation")
	public String delayGraduation(HttpSession session ,Model model) {

		//userVO에 담긴 session의 학생학번을 stuNum 변수에 담기
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int stuNum = userVO.getUsername();
		log.info("leaveReturnStu의 stuNum : " + stuNum);

		//학생정보 조회하여 map에 담기
		Map<String, Object> stuInfoMap = this.graduationService.getStuInfo(stuNum);
		log.info("delayGraduation의 stuInfoMap : " + stuInfoMap);

		//졸업유예 신청목록 조회
		List<Map<String, Object>> appGDList = this.graduationService.getAppGD(stuNum);
		log.info("delayGraduation의 appGDList : " + appGDList);

		model.addAttribute("appGDList", appGDList);
		model.addAttribute("stuInfo", stuInfoMap);

		return "graduation/delayGraduation";
	}

	/**
	 * 졸업유예 반려사유 조회
	 * @param gpMap
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getSingleAppGP")
	public Map<String, Object> getSingleAppGP(@RequestBody Map<String, Object> gpMap){
		log.info("getSingleAppGP의 gpMap : " + gpMap);

		//졸업유예 반려사유 조회하여 map에 담기
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = this.graduationService.getSingleAppGd(gpMap);
		log.info("getSingleAppGP의 resultMap : " + resultMap);

		return resultMap;
	}

	/**
	 * 졸업유예 신청 등록
	 * @param session
	 * @return
	 */
	@ResponseBody
	@PostMapping("/appGP")
	public Map<String, Object> appGP(HttpSession session){
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int stuNum = userVO.getUsername();
		log.info("appGP의 stuNum : " + stuNum);

		//졸업유예 신청내역 조회
		int gpResult = this.graduationService.getGPHistory(stuNum);
		log.info("appGP의 gpResult : " + gpResult);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(gpResult > 0) {	//신청내역이 존재하는 경우
			resultMap.put("result", "exist");
			return resultMap;
		}else {	//신청내역이 존재하지 않는 경우
			//졸업유예 신청 등록처리
			int appGP = this.graduationService.appGP(stuNum);
			log.info("appGP의 appGP : " + appGP);

			if(appGP > 0) {	//등록 성공
				resultMap.put("result", "success");
				return resultMap;
			}else {	//등록 실패
				resultMap.put("result", "fail");
				return resultMap;
			}

		}


	}

	/**
	 * 조기졸업 반려사유 조회
	 * @param rqMap
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getSingleAppEG")
	public Map<String, Object> getSingleAppEG(@RequestBody Map<String, Object> rqMap) {
		log.info("getSingleAppEG의 rqMap : " + rqMap);

		//반려사유 조회
		AcademicVO singleAppEG = this.graduationService.getSingleAppEg(rqMap);
		log.info("getSingleAppEG의 singleAppEG : " + singleAppEG);

		//조회한 반려사유를 map에 담기
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", singleAppEG);

		return resultMap;
	}



}
