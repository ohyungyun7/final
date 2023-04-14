package kr.or.ddit.enroll.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.enroll.service.EnrollService;
import kr.or.ddit.vo.BuildingVO;
import kr.or.ddit.vo.RoomVO;
import kr.or.ddit.vo.SubjectVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/enroll")
public class EnrollController {
	
	@Autowired
	EnrollService enrollService;
	
	/**
	 * 강의 개설 신청 페이지 ( 교수 )
	 * @param model	강의 리스트 담아서 보냄
	 * @param req	세션에서 로그인한 유저를 가져오기 위함
	 * @return
	 */
	@PreAuthorize("hasAnyRole('ROLE_TEA', 'ROLE_ADMIN')")
	@GetMapping("/application")
	public String application(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		
		SubjectVO subjectVO = new SubjectVO();
		
		String page = "";
		if("ROLE_TEA".equals(userVO.getAuth())) {
			subjectVO.setTeaNum(userVO.getUsername());
			page = "enroll/application";
		}else {
			page = "enroll/application_admin";
		}
		
		List<SubjectVO> subjectVOList = enrollService.getSubjectList(subjectVO);
		model.addAttribute("subjectVOList", subjectVOList);
		
		return page;
	}
	
	/**
	 * 강의 insert를 위해 과목번호 만들어오기
	 * @param request  session값 가져오기 위함
	 * @return 과목번호 SBJ_NUM
	 * ajax
	 */
	@ResponseBody
	@PostMapping("/makeSbjNum")
	public String makeSbjNum(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		
		String sbjNum = enrollService.makeSbjNum(userVO.getUsername());
		
		return sbjNum;
	}
	
	/**
	 * 강의개설 insert
	 * @param Subject, Subject_Plan, Subject_Index 테이블에 insert할 데이터
	 * param : {sbjNum=CHE01003, sbjTitle=강의명입니다., sbjGrade=0, sbjRecode=2, sbjPersonnel=40, deptNum=1, sbjRs=1, spMiddleratio=20, spFinalratio=20, spHwratio=20, spAttratio=20, spEtcratio=20, spTextbook=, slTarget_1=1주차 학습목표, slTarget_2=2주차 학습목표, slTarget_3=3주차 학습목표, slTarget_4=4주차 학습목표, slTarget_5=5주차 학습목표, slTarget_6=6주차 학습목표, slTarget_7=7주차 학습목표, slTarget_8=8주차 학습목표, slTarget_9=9주차 학습목표, slTarget_10=10주차 학습목표, slTarget_11=11주차 학습목표, slTarget_12=12주차 학습목표, slTarget_13=13주차 학습목표, slTarget_14=14주차 학습목표, slTarget_15=15주차 학습목표}
	 * @param request : 로그인한 유저 정보 가져오기 위함
	 * @return : 강의개설 신청 페이지로 redirect
	 * 
	 * update도 가능하게 추가
	 * @param : insert 할때 넘어오는 param에 spNum값 추가
	 */
	@PreAuthorize("hasRole('ROLE_TEA')")
	@PostMapping("/insertSubject")
	public String insertSubject(@RequestParam Map<String, Object> param, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		param.put("teaNum", userVO.getUsername());
		
		if(Integer.parseInt((String)param.get("deptNum")) == 1) {
			param.put("deptNum", userVO.getDeptNum());
		}
		
		enrollService.insertSubject(param);
		
		return "redirect:/enroll/application";
	}
	
	/**
	 * 강의 계획서 보기
	 * @param sbjNum 보기를 누른 과목번호
	 * @return 개설과목, 강의계획서, 학습목차가 모두 담긴 map
	 */
	@ResponseBody
	@PostMapping("/getSubjectAjax")
	public Map<String, Object> getSubjectAjax(String sbjNum){
		
		Map<String, Object> map = enrollService.getSubjectAjax(sbjNum);
		
		return map;
	}
	
	/**
	 * 개설 신청 취소(삭제)
	 * @param sbjNum : 취소한 과목 번호
	 * @return 리스트 페이지로 redirect
	 */
	@PostMapping("/deleteSubject")
	public String deleteSubject(String sbjNum) {
		enrollService.deleteSubject(sbjNum);
		return "redirect:/enroll/application";
	}
	
	/**
	 * 건물 테이블의 데이터를 ajax로 가져옴
	 * @return BuildingVO 리스트를 Ajax로 리턴
	 */
	@ResponseBody
	@PostMapping("/getBuilding")
	public List<BuildingVO> getBuilding() {
		List<BuildingVO> buildingVOList = enrollService.getBuilding();
		
		return buildingVOList;
	}
	
	/**
	 * 선택한 건물에 속한 강의실 리스트
	 * @param buildingCode : 선택한 건물코드
	 * @return : 속한 강의실 리스트
	 */
	@ResponseBody
	@PostMapping("/getRoomList")
	public List<RoomVO> getRoomList(String buildingCode){
		List<RoomVO> roomVOList = enrollService.getRoomList(buildingCode);
		
		return roomVOList;
	}
	
	/**
	 * 선택한 강의실에 잡혀있는 강의 리스트
	 * @param roomCode : 선택한 강의실
	 * @return : 강의 + 시간 리스트
	 */
	@ResponseBody
	@PostMapping("/getTimeTable")
	public List<SubjectVO> getTimeTable(String roomCode){
		List<SubjectVO> sbjVOList = enrollService.getTimeTable(roomCode);
		
		return sbjVOList;
	}
	
	/**
	 * 강의시간 선택후 submit
	 * @param map : 선택한 강의 번호, 건물코드, 강의실 코드, 시간
	 * map : {sbjNum=CHE01001, sel_times=SCIENCE_BUILD-SC_101-MON1, SCIENCE_BUILD-SC_101-MON2, SCIENCE_BUILD-SC_101-MON3, }
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_TEA')")
	@PostMapping("/insertTime")
	public String insertTime(@RequestParam Map<String, Object> map) {
		enrollService.insertTime(map);
		return "redirect:/enroll/application";
	}
	
	/**
	 * 선택한 강의의 건물, 강의실, 시간 정보 가져오기
	 * @param sbjNum : 선택한 강의
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getTimeData")
	public List<Map<String, Object>> getTimeData(String sbjNum){
		List<Map<String, Object>> timeData = enrollService.getTimeData(sbjNum);
		
		return timeData;
	}
	
	// 관리자------------------------------------------------------------------------------------
	
	/**
	 * 개설 신청한 과목 승인
	 * @param sbjNum
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/updateSubjectOk")
	public String updateSubjectOk(String sbjNum) {
		enrollService.updateSubjectOk(sbjNum);
		
		return "redirect:/enroll/application";
	}
	
	/**
	 * 반려한 강의 사유 update
	 * @param subjectVO : 반려한 강의의 과목번호, 반려사유
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/updateSubjectCom")
	public String updateSubjectCom(SubjectVO subjectVO) {
		log.info("subjectVO : " + subjectVO);
		enrollService.updateSubjectCom(subjectVO);
		
		return "redirect:/enroll/application"; 
	}
}
