package kr.or.ddit.academic;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import kr.or.ddit.academic.service.AcademicService;
import kr.or.ddit.vo.AcaColleageVO;
import kr.or.ddit.vo.AcaDeptVO;
import kr.or.ddit.vo.AcademicVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/academic")
@PreAuthorize("isAuthenticated()")
public class academicController {

	@Autowired
	AcademicService academicService;

	/**
	 * (학생)학적변동 신청 목록 출력
	 * @param session
	 * @param model
	 * @return
	 */
	//요청URI : /academic/acaListStu
	@GetMapping("/acaListStu")
	public String acaListStu(HttpSession session, Model model) {
		//학생 정보 조회
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int stuNum = userVO.getUsername();
		log.info("acaListStu의 stuNum : " + stuNum);

		Map<String, Object> stuInfoMap = this.academicService.getStuInfo(stuNum);
		log.info("leaveReturnStu의 stuInfoMap : " + stuInfoMap);

		//학적변동 신청 목록 출력
		List<Map<String, Object>> acChgList = this.academicService.getAcChgList(stuNum);
		log.info("acaChgList : " + acChgList);

		//복수전공/부전공 신청 목록 출력
		List<Map<String, Object>> acDMList = this.academicService.getDMList(stuNum);
		log.info("acDMList : " + acDMList);

		//전과 신청 목록 출력
		List<Map<String, Object>> acTranList = this.academicService.getTranList2(stuNum);
		log.info("acTranList : " + acTranList);

		model.addAttribute("stuInfo", stuInfoMap);
		model.addAttribute("acChgList", acChgList);
		model.addAttribute("acDMList", acDMList);
		model.addAttribute("acTranList", acTranList);

		return "academic/acaList_stu";
	}

	/**
	 * 학적변동 신청 반려사유 조회
	 * @param chgMap
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getChgRejectReason")
	public Map<String, Object> getChgRejectReason(@RequestBody Map<String, Object> chgMap){
		log.info("getChgRejectReason의 chgMap : " + chgMap);

		int acNum = Integer.parseInt(String.valueOf(chgMap.get("acNum")));

		Map<String, Object> resultMap = this.academicService.getChgRejectReason(acNum);
		log.info("getChgRejectReason의 resultMap : " + resultMap);

		return resultMap;
	}

	/**
	 * 복수전공,부전공 신청 반려사유 조회
	 * @param dmMap
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getDMRejectReason")
	public Map<String, Object> getDMRejectReason(@RequestBody Map<String, Object> dmMap){
		log.info("dmMap : " + dmMap);

		int dmNum = Integer.parseInt(String.valueOf(dmMap.get("dmNum")));

		Map<String, Object> resultMap = this.academicService.getDMRejectReason(dmNum);
		String dmComre = String.valueOf(resultMap.get("DM_COMRE"));
		log.info("dmComre : " + dmComre);

		if(dmComre == null || dmComre.equals("")) {
			resultMap.put("result", "none");
			return resultMap;
		}
		log.info("getDMRejectReason의 resultMap : " + resultMap);

		return resultMap;
	}

	/**
	 * 전과 신청 반려사유 조회
	 * @param trMap
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getTRRejectReason")
	public Map<String, Object> getTRRejectReason(@RequestBody Map<String, Object> trMap){
		log.info("trMap : " + trMap);

		int trNum = Integer.parseInt(String.valueOf(trMap.get("trNum")));

		Map<String, Object> resultMap = this.academicService.getTRRejectReason(trNum);
		log.info("getTRRejectReason의 resultMap : " + resultMap);

		String tdComre = String.valueOf(resultMap.get("TD_COMRE"));
		log.info("tdComre : " + tdComre);
		log.info("tdComre.length : " + tdComre.length());

		if(tdComre.equals("nodata")) {
			resultMap.put("result", "nd");

			return resultMap;
		}

		return resultMap;

	}

	/**
	 * (관리자)학적변동, 복수전공/부전공, 전과 신청내역 조회
	 * @param model
	 * @return
	 */
	//요청URI : /academic/acaListAdm
	@GetMapping("/acaListAdm")
	public String acaListAdm(Model model) {
		//학적변동 + 졸업유예 신청내역 조회
		List<Map<String, Object>> acaList = this.academicService.getAcGpList();
		log.info("acaListAdm의 acaList : " + acaList);

		//학적변동 + 졸업유예 신청 건수 조회
		int acGpCnt = this.academicService.getAcGpCnt();
		log.info("acaListAdm의 acGpCnt : " + acGpCnt);

		//복수전공/부전공 신청내역 조회
		List<Map<String, Object>> dmList = this.academicService.getDMListAdm();
		log.info("acaListAdm의 dmList : " + dmList);

		//전과 신청내역 조회
		List<Map<String, Object>> trList = this.academicService.getTRListAdm();
		log.info("acaListAdm의 trList : " + trList);

		//복수전공/부전공 신청 건수 조회
		int dmCnt = this.academicService.getDMCnt();
		log.info("acaListAdm의 dmCnt : " + dmCnt);

		//전과 신청 건수 조회
		int tdCnt = this.academicService.getTDCnt();
		log.info("acaListAdm의 tdCnt : " + tdCnt);

		model.addAttribute("tdCnt", tdCnt);
		model.addAttribute("dmCnt", dmCnt);
		model.addAttribute("trList", trList);
		model.addAttribute("dmList", dmList);
		model.addAttribute("acGpCnt", acGpCnt);
		model.addAttribute("acaList", acaList);

		return "academic/acaList_adm";
	}

	/**
	 * 졸업유예 승인처리
	 * @param session
	 * @param infoMap
	 * @return
	 */
	@ResponseBody
	@PostMapping("/processGp")
	public int processGp(HttpSession session, @RequestBody Map<String, Object> infoMap) {
		int stuNum = Integer.parseInt(String.valueOf(infoMap.get("stuNum")));
		log.info("stuNum : " + stuNum);

		int gpNum = Integer.parseInt(String.valueOf(infoMap.get("gpNum")));
		log.info("gpNum : " + gpNum);

		//졸업유예 승인처리
		int gpResult = this.academicService.processGp(gpNum);
		log.info("processGp의 gpResult : " + gpResult);

		if(gpResult > 0) {	//승인처리 성공 시


			Map<String, Object> updateMap = new HashMap<String, Object>();
			updateMap.put("stuStatus", "5");
			updateMap.put("stuNum", stuNum);

			//학생 학적상태 '졸업유예'로 변경
			int result = this.academicService.updateStuStatus(updateMap);
			log.info("processGp의 result : " + result);

			if(result > 0) {	//학적상태 변경 성공 시

				return result;

			}else {				//학적상태 변경 실패 시

				return 0;
			}

		}	//승인처리 실패 시

		return 0;
	}

	/**
	 * (관리자)학적변동 승인 처리
	 * @param infoMap
	 * @return
	 */
	@ResponseBody
	@PostMapping("/processAcChg")
	public int processAcChg(@RequestBody Map<String, Object> infoMap) {
		log.info("processAcChg의 infoMap : " + infoMap);

		//학번
		int stuNum = Integer.parseInt(String.valueOf(infoMap.get("stuNum")));
		log.info("stuNum : " + stuNum);

		//학적변동 번호
		int acChgNum = Integer.parseInt(String.valueOf(infoMap.get("acChgNum")));
		log.info("acChgNum : " + acChgNum);

		//학적변동 종류
		String cont = String.valueOf(infoMap.get("cont"));
		log.info("cont : " + cont);

		//학적변동 승인처리
		int acChgResult = this.academicService.processAcChg(acChgNum);
		log.info("processAcChg의 acChgResult : " + acChgResult);


		Map<String, Object> updateMap = new HashMap<String, Object>();
		updateMap.put("stuNum", stuNum);
		if(acChgResult > 0) {	//승인처리 성공 시

			if(cont.equals("복학")) {			//학적변동 신청 종류가 '복학'인 경우
				updateMap.put("stuStatus", 0);

			}else if(cont.equals("휴학")) {	//학적변동 신청 종류가 '휴학'인 경우
				updateMap.put("stuStatus", 1);

			}else if(cont.equals("자퇴")) {	//학적변동 신청 종류가 '자퇴'인 경우
				updateMap.put("stuStatus", 2);

			}else if(cont.equals("조기졸업")) {//학적변동 신청 종류가 '조기졸업'인 경우
				updateMap.put("stuStatus", 3);

			}else {
				return 0;

			}
				//학적상태 변경
				int result = this.academicService.updateStuStatus(updateMap);
				log.info("processAcChg의 result : " + result);

			return result;	// 성공 시 result값: 1, 실패 시 result값: 0
		}
		//	승인처리 실패 시
		return 0;
	}

	/**
	 * (관리자)개별 졸업유예 신청 건 조회
	 * @param numMap
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getSingleGp")
	public Map<String, Object> getSingleGp(@RequestBody Map<String, Object> numMap){
		//학적변동 번호
		int num = Integer.parseInt(String.valueOf(numMap.get("num")));
		log.info("getSingleGp의 num : " + num);

		//학적종류 신청 종류
		String cont = String.valueOf(numMap.get("cont"));
		log.info("cont : " + cont);

		Map<String, Object> ahMap = new HashMap<String, Object>();
		ahMap.put("num", num);
		ahMap.put("cont", cont);
		log.info("getSingleGp의 ahMap : " + ahMap);

		//졸업유예 신청 건 조회
		Map<String, Object> resultMap = this.academicService.getSingleAppHistory(ahMap);
		log.info("getSingleGp의 resultMap : " + resultMap);

		return resultMap;
	}

	/**
	 * (관리자)졸업유예 신청 반려처리
	 * @param rjGpMap
	 * @return
	 */
	@ResponseBody
	@PostMapping("/rejectGp")
	public int rejectGp(@RequestBody Map<String, Object> rjGpMap) {
		log.info("rjGpMap : " + rjGpMap);

		//졸업유예 반려사유
		String gpComre = String.valueOf(rjGpMap.get("gpComre"));
		//졸업유예 번호
		int gpNum = Integer.parseInt(String.valueOf(rjGpMap.get("gpNum")));
		log.info("gpComre : " + gpComre);
		log.info("gpNum : " + gpNum);

		Map<String, Object> rjMap = new HashMap<String, Object>();
		rjMap.put("gpComre", gpComre);
		rjMap.put("gpNum", gpNum);
		log.info("rejectGp의 rjMap : " + rjMap);

		//졸업유예 신청 반려처리
		int rjResult = this.academicService.rejectGp(rjMap);
		log.info("rejectGp의 rjResult : " + rjResult);

		return rjResult;
	}

	/**
	 * (관리자)학적변동 신청 반려처리
	 * @param rqMap
	 * @return
	 */
	@ResponseBody
	@PostMapping("/rejectAcChg")
	public int acChgMap(@RequestBody Map<String, Object> rqMap) {
		log.info("rejectAcChg의 rqMap : " + rqMap);

		//학적변동 번호
		int acNum = Integer.parseInt(String.valueOf(rqMap.get("acNum")));
		log.info("rejectAcChg의 acNum : " + acNum);

		//학적변동 반려사유
		String acComre = String.valueOf(rqMap.get("acComre"));
		log.info("rejectAcChg의 acComre : " + acComre);

		Map<String, Object> acChgMap = new HashMap<String, Object>();
		acChgMap.put("acNum", acNum);
		acChgMap.put("acComre", acComre);

		log.info("rejectAcChg의 acChgMap : " + acChgMap);

		//학적변동 신청 반려처리
		int acChgResult = this.academicService.rejectAcChg(acChgMap);
		log.info("acChgResult : " + acChgResult);

		return acChgResult;
	}

	/**
	 * (관리자)복수전공/부전공 신청 승인처리
	 * @param dmMap
	 * @return
	 */
	@ResponseBody
	@PostMapping("/approveDM")
	public int approveDM(@RequestBody Map<String, Object> dmMap) {
		log.info("approveDM의 dmMap : " + dmMap);

		//신청번호
		int dmNum = Integer.parseInt(String.valueOf(dmMap.get("dmNum")));
		log.info("dmNum : " + dmNum);

		//학번
		int stuNum = Integer.parseInt(String.valueOf(dmMap.get("stuNum")));
		log.info("stuNum : " + stuNum);

		//복수전공/부전공 신청 구분
		int stuDmajor = Integer.parseInt(String.valueOf(dmMap.get("stuDmajor")));
		log.info("stuDmajor : " + stuDmajor);

		//복수전공/부전공 신청 승인처리
		int dmResult = this.academicService.approveDM(dmNum);
		log.info("approveDM의 dmResult : " + dmResult);

		Map<String, Object> stuInfoMap = new HashMap<String, Object>();
		if(dmResult > 0) {	//승인처리 성공 시
			stuInfoMap.put("stuNum", stuNum);
			stuInfoMap.put("stuDmajor", stuDmajor);
			log.info("stuInfoMap : " + stuInfoMap);

			int result = this.academicService.updateStuInfo(stuInfoMap);
			log.info("approveDM의 result : " + result);
			return result;
		}
		//승인처리 실패 시
		return 0;
	}

	/**
	 * (관리자) 복수전공/부전공 개별 신청내역 조회
	 * @param singleDMMap
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getSingleDMHistory")
	public Map<String, Object> getSingleDMHistory(@RequestBody Map<String, Object> singleDMMap) {

		log.info("singleDMMap : " + singleDMMap);

		int dmNum = Integer.parseInt(String.valueOf(singleDMMap.get("dmNum")));

		Map<String, Object> singleDMHistory = this.academicService.getSingleDMHistory(dmNum);
		log.info("singleDMMap : " + singleDMHistory);

		return singleDMHistory;
	}

	/**
	 * (관리자)복수전공/부전공 신청 반려처리
	 * @param dmMap
	 * @return
	 */
	@ResponseBody
	@PostMapping("/rejectDM")
	public int rejectDM(@RequestBody Map<String, Object> dmMap) {
		log.info("rejectDM의 dmMap : " + dmMap);
		int dmNum = Integer.parseInt(String.valueOf(dmMap.get("dmNum")));
		log.info("dmNum : " + dmNum);
		String rjReason = String.valueOf(dmMap.get("rjReason"));
		log.info("rjReason : " + rjReason);

		Map<String, Object> dmRjMap = new HashMap<String, Object>();
		dmRjMap.put("dmNum", dmNum);
		dmRjMap.put("dmComre", rjReason);

		int result = this.academicService.rejectDM(dmRjMap);
		log.info("rejectDM의 result : " + result);

		return result;
	}

	/**
	 * (관리자)전과 신청 승인처리
	 * @param tdMap
	 * @return
	 */
	@ResponseBody
	@PostMapping("/approveTD")
	public int approveTD(@RequestBody Map<String, Object> tdMap) {
		log.info("tdMap : " + tdMap);

		int stuNum = Integer.parseInt(String.valueOf(tdMap.get("stuNum")));
		log.info("stuNum : " + stuNum);

		//appDeptNum	tdNum
		int tdNum = Integer.parseInt(String.valueOf(tdMap.get("tdNum")));
		log.info("tdNum : " + tdNum);
		int appDeptNum = Integer.parseInt(String.valueOf(tdMap.get("appDeptNum")));
		log.info("appDeptNum : " + appDeptNum);


		//전과 신청 승인처리
		int tdResult = this.academicService.approveTD(tdNum);
		log.info("tdResult : " + tdResult);

		if(tdResult > 0) {	//승인처리 성공 시
			//학생정보 업데이트(dept_num수정)
			Map<String, Object> tdAppMap = new HashMap<String, Object>();
			tdAppMap.put("deptNum", appDeptNum);
			tdAppMap.put("stuNum", stuNum);

			int result = this.academicService.updateStuInfoByTD(tdAppMap);
			log.info("approveTD의 result : " + result);

			return result;

		}

		return 0;
	}

	/**
	 * 개별 전과 신청내역 조회
	 * @param singleTDMap
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getSingleTDHistory")
	public Map<String, Object> getSingleTDHistory(@RequestBody Map<String, Object> singleTDMap){

		int tdNum = Integer.parseInt(String.valueOf(singleTDMap.get("tdNum")));

		Map<String, Object> singleTDHistory = this.academicService.getSingleTDHistory(tdNum);

		return singleTDHistory;
	}

	/**
	 * (관리자)전과 신청 반려처리
	 * @param tdRejectMap
	 * @return
	 */
	@ResponseBody
	@PostMapping("/rejectTD")
	public int rejectTD(@RequestBody Map<String, Object> tdRejectMap) {

		int result = this.academicService.rejectTD(tdRejectMap);

		return result;
	}

	/**
	 * (학생)휴학/복학 신청화면 출력
	 * @param session
	 * @param model
	 * @return
	 */
	//요청URI : /academic/leaveReturnStu
	@GetMapping("/leaveReturnStu")
	public String leaveReturnStu(HttpSession session,
								 Model model) {

		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int stuNum = userVO.getUsername();

		Map<String, Object> stuInfoMap = this.academicService.getStuInfo(stuNum);

		List<AcademicVO> LHVOList = this.academicService.getLeaveHistory(stuNum);
		if(LHVOList != null) {
			model.addAttribute("LHVOList", LHVOList);
		}
		model.addAttribute("stuInfo", stuInfoMap);

		return "academic/leaveReturn_stu";
	}

	/**
	 * 휴학신청
	 * @param session
	 * @param academicVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/leaveStu")
	public Map<String,Object> leaveStu(HttpSession session
					 , @RequestBody AcademicVO academicVO) {

		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int stuNum =userVO.getUsername();
		academicVO.setStuNum(stuNum);

		//학생 학적상태 조회
		int num = this.academicService.getStuStatus(stuNum);
		if(num != 0) {
			Map<String, Object> stMap = new HashMap<String, Object>();
			stMap.put("stResult", -2);
			return stMap;
		}

		Map<String, Object> cntMap = new HashMap<String, Object>();
		//stuNum, acList
		cntMap.put("stuNum", stuNum);
		cntMap.put("acList", academicVO.getAcList());
		int resultCnt = this.academicService.getAcCnt(cntMap);
		Map<String,Object> map = new HashMap<>();
		int result = 0;

		if(resultCnt > 0) {
			result = -1;
		}else {
			result = this.academicService.appLeave(academicVO);

		}

		map.put("result", result);
		return map;
	}

	/**
	 * 학적상태 조회
	 * @param session
	 * @return
	 */
	@ResponseBody
	@PostMapping("/searchLeave")
	public int searchLeave(HttpSession session) {

		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int stuNum = userVO.getUsername();

		int num = this.academicService.getStuStatus(stuNum);
		int result = 0;

		if(num == 1) {
			result = 1;
		}else {
			result = -1;
		}

		return result;
	}

	/**
	 * (학생)복학 신청
	 * @param session
	 * @param acSdt
	 * @return
	 */
	@ResponseBody
	@PostMapping("/appReturn")
	public int appReturn(HttpSession session, @RequestBody Map<String, Object> dataMap) {
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int stuNum = userVO.getUsername();

		String acSdt = (String) dataMap.get("acSdt");

		Map<String, Object> cntMap = new HashMap<String, Object>();
		cntMap.put("stuNum", stuNum);
		cntMap.put("acList", 0);
		int resultCnt = this.academicService.getAcCnt(cntMap);

		if(resultCnt > 0) {
			return -1;
		}

		Map<String, Object> reMap = new HashMap<String, Object>();
		reMap.put("stuNum", stuNum);
		reMap.put("acSdt", acSdt);

		int result = this.academicService.appReturn(reMap);

		return result;
	}

	/**
	 * (학생)복수전공/부전공 신청화면 출력
	 * @param session
	 * @param model
	 * @return
	 */
	//요청URI : /academic/acaDMStu
	@GetMapping("/acaDMStu")
	public String acaDMStu(HttpSession session, Model model,
			@RequestParam(value="collNum",required=false,defaultValue="2") String collNum) {

		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int stuNum = userVO.getUsername();

		Map<String, Object> stuInfoMap = this.academicService.getStuInfo(stuNum);

		List<AcaDeptVO> collNDeptList = this.academicService.getCollNDeptList();

		List<Map<String, Object>> cndMapList = this.academicService.getCnDList(collNum);

		model.addAttribute("cndMapList", cndMapList);
		model.addAttribute("CNDList", collNDeptList);
		model.addAttribute("stuInfo", stuInfoMap);
		return "academic/acaDM_stu";
	}

	/**
	 * 단과대학 내 학과목록 조회
	 * @param acaColleageVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getDeptList")
	public List<AcaDeptVO> getDeptList(@RequestBody AcaColleageVO acaColleageVO){
		String collNm = acaColleageVO.getCollNm();
		List<AcaDeptVO> deptList = this.academicService.getDeptList(collNm);

		return deptList;
	}

	/**
	 * 복수전공/부전공 신청
	 * @param session
	 * @param dataMap
	 * @return
	 */
	@ResponseBody
	@PostMapping("/appDM")
	public Map<String, Object> appDM(HttpSession session
									, @RequestBody Map<String, Object> dataMap){
		//학과번호
		int deptNo = Integer.parseInt(String.valueOf(dataMap.get("deptNo")));
		//복수전공/부전공 구분
		int dmDivision = Integer.parseInt(String.valueOf(dataMap.get("dmDivision")));

		UserVO userVO = (UserVO) session.getAttribute("userVO");
		//학번
		int stuNum = userVO.getUsername();

		Map<String, Object> resultMap = new HashMap<String, Object>();

		//복수전공/부전공 신청 요건 조회(이수학기, 평균평점, 전공과목 이수학점)
		Map<String, Object> qualMap = this.academicService.getStuQual(stuNum);

		//이수학기
		int semester = Integer.parseInt(String.valueOf(qualMap.get("STU_SEMESTER")));
		//평균평점
		double ar = Double.parseDouble(String.valueOf(qualMap.get("AR")));
		//전공과목 이수학점
		int sumMajor = Integer.parseInt(String.valueOf(qualMap.get("SUM_MAJOR")));

		if(dmDivision == 0 && (semester < 2 || ar < 3 || sumMajor < 20)) {	//복수전공 조건 불충족 시
			resultMap.put("result", "Dfail");
			resultMap.put("semester", semester);
			resultMap.put("ar", ar);
			resultMap.put("sumMajor", sumMajor);

 			return resultMap;
		}

		if(dmDivision == 1 && (semester < 2 || ar < 2)) {	//부전공 조건 불충족 시
			resultMap.put("result", "Mfail");
			resultMap.put("semester", semester);
			resultMap.put("ar", ar);

			return resultMap;
		}

		//승인 대기 중인 복수전공/부전공 신청 내역 조회
		//승인 대기 중인 복수전공 신청 건수 조회)

		// 0 : 복수전공
		int cDmDivision = 0;
		// 0 : 승인 대기 상태
		int cDmCheck = 0;

		Map<String, Object> checkMap = new HashMap<String, Object>();
		checkMap.put("stuNum", stuNum);
		checkMap.put("dmCheck", cDmCheck);
		checkMap.put("dmDivision", cDmDivision);

		//복수전공 신청내역 조회
		int DcheckResult = this.academicService.getDMHistory(checkMap);


		if(DcheckResult > 0) {	//승인대기 중인 복수전공 신청 내역 존재
			resultMap.put("result", "de");

			return resultMap;
		}


		//승인 대기 중인 부전공 신청 건수 조회)
		// 1 : 부전공
		cDmDivision = 1;
		// 0 : 승인 대기 상태
		cDmCheck = 0;

		checkMap.put("dmCheck", cDmCheck);
		checkMap.put("dmDivision", cDmDivision);

		//부전공 신청내역 조회
		int McheckResult = this.academicService.getDMHistory(checkMap);

		if(McheckResult > 0) {	//승인대기 중인 부전공 신청 내역 존재
			resultMap.put("result", "me");

			return resultMap;
		}



		// 0 : 복수전공
		cDmDivision = 0;
		// 1 : 승인 완료 상태
		cDmCheck = 1;

		checkMap.put("stuNum", stuNum);
		checkMap.put("dmCheck", cDmCheck);
		checkMap.put("dmDivision", cDmDivision);

		//승인 완료된 복수전공 신청 건수 조회
		int DcheckResultOK = this.academicService.getDMHistory(checkMap);


		if(DcheckResultOK > 0) {	//승인완료된 복수전공 신청 내역 존재
			resultMap.put("result", "deOK");
			return resultMap;
		}

		// 1 : 부전공
		cDmDivision = 1;
		// 1 : 승인 완료 상태
		cDmCheck = 1;

		checkMap.put("stuNum", stuNum);
		checkMap.put("dmCheck", cDmCheck);
		checkMap.put("dmDivision", cDmDivision);

		//승인 완료된 부전공 신청 건수 조회
		int McheckResultOK = this.academicService.getDMHistory(checkMap);

		if(McheckResultOK > 0) {	//승인완료된 복수전공 신청 내역 존재
			resultMap.put("result", "meOK");
			return resultMap;
		}


		Map<String, Object> dmMap = new HashMap<String, Object>();
		dmMap.put("stuNum", stuNum);
		dmMap.put("deptNo", deptNo);
		dmMap.put("dmDivision", dmDivision);

		int checkResult = this.academicService.appDM(dmMap);
		if(checkResult == 1) {
			resultMap.put("result", checkResult);

			return resultMap;
		}else {
			resultMap.put("result", "fail");

			return resultMap;
		}

		//return  resultMap;
	}

	/**
	 * 전과 신청화면 출력
	 * @param session
	 * @param model
	 * @return
	 */
	//요청URI : /academic/acaTRStu
	@GetMapping("/acaTRStu")
	public String acaTRStu(HttpSession session, Model model
						 , @RequestParam(value="collNum",required=false,defaultValue="2") String collNum) {

		//학생정보 조회
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int stuNum = userVO.getUsername();

		Map<String, Object> stuInfoMap = this.academicService.getStuInfo(stuNum);

		List<AcaDeptVO> collNDeptList = this.academicService.getCollNDeptList();

		List<Map<String, Object>> cndMapList = this.academicService.getCnDList(collNum);

		model.addAttribute("cndMapList", cndMapList);
		model.addAttribute("CNDList", collNDeptList);
		model.addAttribute("stuInfo", stuInfoMap);

		return "academic/acaTR_stu";
	}

	/**
	 * (학생)전과신청
	 * @param appMap
	 * @return
	 */
	@ResponseBody
	@PostMapping("/appTR")
	public Map<String, Object> appTR(@RequestBody Map<String, Object> appMap){

		Map<String, Object> resultMap = new HashMap<String, Object>();

		int tranDeptNum = Integer.parseInt(String.valueOf(appMap.get("tranDeptNum")));
		int preDeptNum = Integer.parseInt(String.valueOf(appMap.get("preDeptNum")));
		int stuNum = Integer.parseInt(String.valueOf(appMap.get("stuNum")));

		Map<String, Object> rqhMap = new HashMap<String, Object>();
		int tdCheck = 0;	// 승인대기 상태
		rqhMap.put("tdCheck", tdCheck);
		rqhMap.put("stuNum", stuNum);
		int trcResult = this.academicService.getTRHistory(rqhMap);

		if(trcResult > 0) {	//승인대기 상태인 전과신청 내역이 존재하는 경우
			resultMap.put("result", "wait");
			return resultMap;
		}

		tdCheck = 1;
		rqhMap.put("tdCheck", tdCheck);
		trcResult = this.academicService.getTRHistory(rqhMap);
		if(trcResult > 0) {	//승인완료된 전과신청 내역이 존재하는 경우
			resultMap.put("result", "exist");
			return resultMap;
		}

		//전과 신청 조건 조회
		Map<String, Object> conMap = this.academicService.getTRCon(tranDeptNum);

		int deptNumber = Integer.parseInt(String.valueOf(conMap.get("DEPT_NUMBER")));
		int cntAL = Integer.parseInt(String.valueOf(conMap.get("CNT_AL")));


		Map<String, Object> trMap = new HashMap<String, Object>();
		trMap.put("tranDeptNum", tranDeptNum);
		trMap.put("preDeptNum", preDeptNum);
		trMap.put("stuNum", stuNum);

		if(deptNumber <= cntAL) {	//학과정원 <= 해당 학과의 재학생 수 + 휴학생 수  : 전과신청이 불가한 경우
			resultMap.put("result", "over");

			return resultMap;
		}else {		//전과신청이 가능한 경우

			 int result  = this.academicService.appTR(trMap);

			 if(result > 0) {
				 resultMap.put("result", "success");

				 return resultMap;
			 }else {
				 resultMap.put("result", "error");

				 return resultMap;
			 }

		}

	}

	/**
	 * 추가 등록금 계산
	 * @param feeMap
	 * @return
	 */
	@ResponseBody
	@PostMapping("/addFee")
	public Map<String, Object> addFee(@RequestBody Map<String, Object> feeMap){
		//Map<String, Object> resultMap = new HashMap<String, Object>();

		Map<String, Object> addFeeMap = this.academicService.getAddFee(feeMap);

		return addFeeMap;

	}

	/**
	 * (학생)자퇴 신청화면 출력
	 * 요청URI : /academic/acaDropout
	 * @param model
	 * @return
	 */
	@GetMapping("/acaDropout")
	public String acaDropout(HttpSession session, Model model) {

		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int stuNum = userVO.getUsername();

		Map<String, Object> stuInfoMap = this.academicService.getStuInfo(stuNum);

		model.addAttribute("stuInfo", stuInfoMap);

		return "academic/acaDropout_stu";
	}

	/**
	 * (학생)자퇴 신청
	 * @param session
	 * @param academicVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/appDropout")
	public Map<String, Object> appDropout(HttpSession session, @RequestBody AcademicVO academicVO) {

		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int stuNum = userVO.getUsername();
		String acSdt = academicVO.getAcSdt();
		String acReason = academicVO.getAcReason();

		int result = 0;
		Map<String, Object> resultMap = new HashMap<String, Object>();

		//학생 학적상태 조회
		int num = this.academicService.getStuStatus(stuNum);
		if(num != 0 && num != 1 && num != 5) {
			resultMap.put("result", -2);

			return resultMap;
		}

		Map<String, Object> cntMap = new HashMap<String, Object>();
		//stuNum, acList
		cntMap.put("stuNum", stuNum);
		cntMap.put("acList", 2);
		int resultCnt = this.academicService.getAcCnt(cntMap);


		if(resultCnt > 0) {

			result = -1;
			resultMap.put("result", -1);

			return resultMap;

		}else {

			Map<String, Object> dropMap = new HashMap<String, Object>();
			dropMap.put("stuNum", stuNum);
			dropMap.put("acSdt", acSdt);
			dropMap.put("acReason", acReason);

			result = this.academicService.appDropout(dropMap);
			resultMap.put("result", result);

			return resultMap;
		}


	}

	/**
	 * 휴학신청 내역 조회
	 * @param session
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getLeaveHistory")
	public List<AcademicVO> getLeaveHistory(HttpSession session){

		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int stuNum = userVO.getUsername();

		List<AcademicVO> academicVOList = this.academicService.getLeaveHistory(stuNum);

		return academicVOList;
	}


	/**
	 * 학적변동 + 졸업유예 신청목록 중 학생명으로 검색한 결과 출력
	 * @param infoMap
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getAcGpListIncSearchStuNum")
	public Map<String, Object> getAcGpListIncSearch(@RequestBody Map<String, Object> infoMap) {

		Map<String, Object> resultMap = new HashMap<String, Object>();

		List<Map<String, Object>> AcGppListIncSearch = this.academicService.getAcGpListIncSearch(infoMap);

		resultMap.put("gpListIncSearch", AcGppListIncSearch);

		//검색결과 count
		int cnt = this.academicService.getAcGpListIncSearchCNT(infoMap);

		resultMap.put("cnt", cnt);

		return resultMap;
	}

	/**
	 * 학적변동 + 졸업유예 신청목록 중 학과명으로 검색한 결과 출력
	 * @param infoMap
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getAcGpListIncSearchDept")
	public Map<String, Object> getAcGpListIncSearchDept(@RequestBody Map<String, Object> infoMap){

		Map<String, Object> resultMap = new HashMap<String, Object>();

		List<Map<String, Object>> AcGppListIncSearchDept = this.academicService.getAcGpListIncSearchDept(infoMap);

		resultMap.put("AcGppListIncSearchDept", AcGppListIncSearchDept);

		//검색결과 count
		int cnt = this.academicService.getAcGpListIncSearchDeptCNT(infoMap);

		resultMap.put("cnt", cnt);

		return resultMap;
	}

	/**
	 * 복수전공&부전공 신청목록 중 학생명으로 검색한 결과 출력
	 * @param infoMap
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getDMListIncSearch")
	public Map<String, Object> getDMListIncSearch(@RequestBody Map<String, Object> infoMap){

		Map<String, Object> resultMap = new HashMap<String, Object>();

		List<Map<String, Object>> dmListIncSearch = this.academicService.getDMListIncSearch(infoMap);

		resultMap.put("dmListIncSearch", dmListIncSearch);

		//검색결과 count
		int cnt = this.academicService.getDMListIncSearchCNT(infoMap);

		resultMap.put("cnt", cnt);

		return resultMap;
	}

	/**
	 * 복수전공&부전공 신청목록 중 학과명으로 검색한 결과 출력
	 * @param infoMap
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getDMListIncSearchDept")
	public Map<String, Object> getDMListIncSearchDept(@RequestBody Map<String, Object> infoMap){

		Map<String, Object> resultMap = new HashMap<String, Object>();

		List<Map<String, Object>> dmListIncSearchDept = this.academicService.getDMListIncSearchDept(infoMap);

		resultMap.put("dmListIncSearchDept", dmListIncSearchDept);

		int cnt = this.academicService.getDMListIncSearchDeptCNT(infoMap);
		resultMap.put("cnt", cnt);

		return resultMap;
	}

	/**
	 * 전과 신청목록 중 학생명으로 검색한 결과 출력
	 * @param infoMap
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getTDListIncSearch")
	public Map<String, Object> getTDListIncSearch(@RequestBody Map<String, Object> infoMap){

		Map<String, Object> resultMap = new HashMap<String, Object>();

		List<Map<String, Object>> tdListIncSearch = this.academicService.getTDListIncSearch(infoMap);

		resultMap.put("tdListIncSearch", tdListIncSearch);

		int cnt = this.academicService.getTDListIncSearchCNT(infoMap);

		resultMap.put("cnt", cnt);

		return resultMap;
	}

	/**
	 * 전과 신청목록 중 학과명으로 검색한 결과 출력
	 * @param infoMap
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getTDListIncSearchDept")
	public Map<String, Object> getTDListIncSearchDept(@RequestBody Map<String, Object> infoMap){

		Map<String, Object> resultMap = new HashMap<String, Object>();

		List<Map<String, Object>> tdListIncSearchDept = this.academicService.getTDListIncSearchDept(infoMap);

		resultMap.put("tdListIncSearchDept", tdListIncSearchDept);

		int cnt = this.academicService.getTDListIncSearchDeptCNT(infoMap);

		resultMap.put("cnt", cnt);

		return resultMap;
	}


}

































