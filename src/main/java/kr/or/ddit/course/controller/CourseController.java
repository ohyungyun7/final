package kr.or.ddit.course.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.academic.service.AcademicService;
import kr.or.ddit.course.service.CourseService;
import kr.or.ddit.vo.CourseAssignmentVO;
import kr.or.ddit.vo.CourseAtVO;
import kr.or.ddit.vo.CourseAttendanceVO;
import kr.or.ddit.vo.CourseDetailVO;
import kr.or.ddit.vo.CourseNoticeVO;
import kr.or.ddit.vo.CourseReferenceVO;
import kr.or.ddit.vo.CourseVO;
import kr.or.ddit.vo.SubjectIndexVO;
import kr.or.ddit.vo.SubmitVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@PreAuthorize("isAuthenticated()")
@Slf4j
@Controller
@RequestMapping("/course")
public class CourseController {

	@Autowired
	CourseService courseService;

	/**
	 * (학생)금학기 수강과목 목록 출력
	 * @param session
	 * @param model
	 * @param sbjNum
	 * @return
	 */
	@GetMapping("/list")
	public String list(HttpSession session, Model model, String sbjNum) {

		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int stuNum = userVO.getUsername();
		log.info("list(학생)의 stuNum : " + stuNum);

		List<CourseVO> courseVOList = this.courseService.getCourseList(stuNum);
		model.addAttribute("data", courseVOList);
		log.info("courseVOList(학생) : " + courseVOList);

		return "course/list_stu";
	}

	/**
	 * (교수)금학기 강의목록 출력
	 * @param session
	 * @param sbjNum
	 * @param model
	 * @return
	 */
	@GetMapping("/list_pro")
	public String list_pro(HttpSession session, String sbjNum, Model model) {

		UserVO userVO = (UserVO) session.getAttribute("userVO");

		int teaNum = userVO.getUsername();

		log.info("session의 userVO : " + userVO );
		log.info("userVO의 getUsername(teaNum) : " + teaNum);

		List<CourseVO> courseVOList = this.courseService.getCourseListPro(teaNum);
		log.info("courseVOList(교수) : " + courseVOList);

		model.addAttribute("data", courseVOList);

		List<Map<String, Object>> courseList = this.courseService.getCourseListProByMap(teaNum);
		log.info("courseList(Map : " + courseList);

		return "course/list_pro";
	}

	/**
	 * (학생)주차별 목차 조회
	 * @param courseVO
	 * @param sbjNum
	 * @param sbjTitle
	 * @param model
	 * @return
	 */
	@GetMapping("/detail")
	public String detail(@ModelAttribute CourseVO courseVO
						, String sbjNum
						, String sbjTitle
						, Model model) {
		log.info("detail의 courseVO : " + courseVO);
		log.info("detail의 sbjTitle : " + sbjTitle);

		List<CourseDetailVO> courseDetailVOList = this.courseService.detail(courseVO);
		log.info("detail의 courseDetailVOList : " + courseDetailVOList);

		model.addAttribute("sbjNum", sbjNum);
		model.addAttribute("sbjTitle", sbjTitle);
		model.addAttribute("data", courseDetailVOList);

		return "course/week_stu";
	}


	/**
	 * (교수)주차별 목차 조회
	 * @param courseVO
	 * @param sbjNum
	 * @param sbjTitle
	 * @param model
	 * @return
	 */
	@GetMapping("/detailTea")
	public String detailTea(@ModelAttribute CourseVO courseVO
						, String sbjNum
						, String sbjTitle
						, Model model) {
		log.info("detail의 courseVO : " + courseVO);
		log.info("detail의 sbjTitle : " + sbjTitle);

		List<CourseDetailVO> courseDetailVOList = this.courseService.detail(courseVO);
		log.info("detail의 courseDetailVOList : " + courseDetailVOList);

		model.addAttribute("sbjNum", sbjNum);
		model.addAttribute("sbjTitle", sbjTitle);
		model.addAttribute("data", courseDetailVOList);

		return "course/week_tea";
	}


	/**
	 * (학생&교수)강의 공지사항 목록 출력
	 * @param courseVO
	 * @param sbjNum
	 * @param sbjTitle
	 * @param model
	 * @return
	 */
	@GetMapping("/notice")
	public String notice(@ModelAttribute CourseVO courseVO
						, String sbjNum
						, String sbjTitle
						, Model model) {
		log.info("notice의 courseVO : " + courseVO);
		log.info("notice의 sbjNum : " + sbjNum);
		log.info("notice의 sbjTitle : " + sbjTitle);

		List<CourseNoticeVO> courseNoticeVOList = this.courseService.getNoticeList(courseVO);
		log.info("notice의 courseNoticeVOList : " + courseNoticeVOList);

		model.addAttribute("data", courseNoticeVOList);
		model.addAttribute("sbjNum", sbjNum);
		model.addAttribute("sbjTitle", sbjTitle);

		return "course/notice_stu";
	}

	/**
	 * (학생&교수)강의 자료 목록 출력
	 * @param courseVO
	 * @param model
	 * @param sbjNum
	 * @param sbjTitle
	 * @return
	 */
	@GetMapping("/reference")
	public String reference(@ModelAttribute CourseVO courseVO
						, Model model
						, String sbjNum
						, String sbjTitle) {
		log.info("reference의 courseVO : " + courseVO);

		List<CourseReferenceVO> courseReferenceVOList = this.courseService.getReferenceList(courseVO);
		log.info("reference의 courseReferenceVOList : " + courseReferenceVOList);
		log.info("reference의 sbjTitle : " + sbjTitle);


		model.addAttribute("data", courseReferenceVOList);
		model.addAttribute("sbjNum", sbjNum);
		model.addAttribute("sbjTitle", sbjTitle);

		return "course/reference_stu";
	}

	@GetMapping("/noticeForm")
	public void courseNoticeForm() {}


	/**
	 * (학생&교수)강의 공지사항 상세내용 조회
	 * @param courseNoticeVO
	 * @param snNum
	 * @param sbjNum
	 * @param sbjTitle
	 * @param model
	 * @return
	 */
	@GetMapping("/noticeDetail")
	public String courseNoticeDetail(@ModelAttribute CourseNoticeVO courseNoticeVO
									, int snNum
									, String sbjNum
									, String sbjTitle
								    , Model model) {
		log.info("noticeDetail의 courseNoticeVO : " + courseNoticeVO);

		this.courseService.increaseNoticeHit(courseNoticeVO);

		CourseNoticeVO noticeDetailVO = this.courseService.noticeDetail(courseNoticeVO);
		log.info("noticeDetail의 noticeDetailVO : " + noticeDetailVO);

		model.addAttribute("data", noticeDetailVO);
		model.addAttribute("sbjNum", sbjNum);
		model.addAttribute("sbjTitle", sbjTitle);

		log.info("noticeDetail의 sbjTitle : " + sbjTitle);

		return "course/noticeDetail";

	}

	/**
	 * (교수)(수정 후)공지사항 상세내용 조회
	 * @param courseNoticeVO
	 * @param snNum
	 * @param sbjNum
	 * @param sbjTitle
	 * @param model
	 * @return
	 */
	@GetMapping("/goDetail")
	public String goDetail(@ModelAttribute CourseNoticeVO courseNoticeVO
						 , int snNum
						 , String sbjNum
						 , String sbjTitle
					     , Model model) {

		CourseNoticeVO noticeDetailVO = this.courseService.noticeDetail(courseNoticeVO);
		log.info("noticeDetail의 noticeDetailVO : " + noticeDetailVO);

		model.addAttribute("data", noticeDetailVO);
		model.addAttribute("sbjNum", sbjNum);
		model.addAttribute("sbjTitle", sbjTitle);

		log.info("goDetail의 sbjTitle : " + sbjTitle);

		return "course/noticeDetail";
	}

	/**
	 * (학생)출석현황 조회 페이지로 이동
	 * @param session
	 * @param sbjNum
	 * @param sbjTitle
	 * @param model
	 * @return
	 */
	@GetMapping("/attendStu")
	public String attendStu(HttpSession session
						  , String sbjNum
						  , String sbjTitle
					      , Model model) {

		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int stuNum = userVO.getUsername();
		log.info("attendStu의 stuNum : " + stuNum);

		Map<String, Object> infoMap = new HashMap<String, Object>();


		infoMap.put("sbjNum", sbjNum);
		infoMap.put("stuNum", stuNum);

		//주차별 강의 횟수 카운트
		List<Map<String, Object>> countMapList = this.courseService.countLecture(sbjNum);
		log.info("attendStu의 countMapList : " + countMapList);
		Map<String, Object> countMap = (Map<String, Object>) this.courseService.countLectureMap(sbjNum);

		//주차별 강의 횟수 조회
		int count = Integer.parseInt(String.valueOf(countMap.get("COUNT")));
		log.info("attendStu의 count : " + count);

		//주차별 강의 요일 출력
		List<Map<String, Object>> dayList = this.courseService.getCourseDay(sbjNum);
		log.info("attendStu의 dayList : " + dayList);

		//개별 학생 출석현황 조회
		List<CourseAttendanceVO> stuAtList = this.courseService.getStuAttendList(infoMap);
		log.info("attendStu의 stuAtList : " + stuAtList);

		Map<String, Object> seMap = new HashMap<String, Object>();

		//학생정보 담기
		seMap.put("sbjNum", sbjNum);
		seMap.put("stuNum", stuNum);

		//개별 학생 출석현황 조회(1주차~5주차)
		seMap.put("start", 1);
		seMap.put("end", 5);
		log.info("attendStu의 seMap1 : " + seMap);
		List<Map<String, Object>> stuAtList1 = this.courseService.getStuAtList(seMap);
		log.info("attendStu의  stuAtList1 : " + stuAtList1);

		//개별 학생 출석현황 조회(6주차~10주차)
		seMap.put("start", 6);
		seMap.put("end", 10);
		log.info("attendStu의 seMap2 : " + seMap);
		List<Map<String, Object>> stuAtList2 = this.courseService.getStuAtList(seMap);
		log.info("attendStu의 stuAtList2 : " + stuAtList2);

		//개별 학생 출석현황 조회(11주차~15주차)
		seMap.put("start", 11);
		seMap.put("end", 15);
		log.info("attendStu의 seMap3 : " + seMap);
		List<Map<String, Object>> stuAtList3 = this.courseService.getStuAtList(seMap);
		log.info("attendStu의 stuAtList3 : " + stuAtList3);

		//학생 기본정보 조회
		Map<String, Object> basicStuInfoMap = this.courseService.basicStuInfo(stuNum);
		log.info("basicStuInfoMap : " + basicStuInfoMap);

		model.addAttribute("count", count);
		model.addAttribute("stuAtList1", stuAtList1);
		model.addAttribute("stuAtList2", stuAtList2);
		model.addAttribute("stuAtList3", stuAtList3);
		model.addAttribute("countMapList", countMapList);
		model.addAttribute("dayList", dayList);
		model.addAttribute("stuAtList", stuAtList);
		model.addAttribute("sbjNum", sbjNum);
		model.addAttribute("sbjTitle", sbjTitle);
		model.addAttribute("basicInfo", basicStuInfoMap);

		return "course/attend_stu";
	}


	/**
	 * (교수)출석현황 조회, 입력 페이지로 이동
	 * @param sbjNum
	 * @param sbjTitle
	 * @param model
	 * @return
	 */
	@GetMapping("/attendTea")
	public String attendTea(String sbjNum
						  , String sbjTitle
					      , Model model) {

		//주차별 강의 횟수 조회
		Map<String, Object> countMap = (Map<String, Object>) this.courseService.countLectureMap(sbjNum);

		//count 변수에 담기
		int count = Integer.parseInt(String.valueOf(countMap.get("COUNT")));

		//주차별 강의 요일 출력
		List<Map<String, Object>> dayList = this.courseService.getCourseDay(sbjNum);

		//과목별 수강생 목록 + 출석현황 조회
		List<CourseAttendanceVO> atList = this.courseService.getAtList(sbjNum);

		model.addAttribute("atList", atList);
		model.addAttribute("dayList", dayList);
		model.addAttribute("count", count);
		model.addAttribute("sbjNum", sbjNum);
		model.addAttribute("sbjTitle", sbjTitle);

		return "course/attend_tea";
	}

	/**
	 * (학생&교수)강의 과제목록 출력
	 * @param session
	 * @param sbjNum
	 * @param sbjTitle
	 * @param model
	 * @return
	 */
	@GetMapping("/assignment")
	public String getAssignmentList(HttpSession session, String sbjNum, String sbjTitle, Model model) {
		log.info("assignment의 sbjNum : " + sbjNum);


		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int stuNum = userVO.getUsername();
		log.info("stuNum : " + stuNum);

		//학생번호, 과목번호 담기
		Map<String, Object> asMap = new HashMap<String, Object>();
		asMap.put("stuNum", stuNum);
		asMap.put("sbjNum", sbjNum);

		//과제목록 조회
		List<CourseAssignmentVO> courseAssignmentVOList = this.courseService.getAssignmentList(asMap);
		log.info("courseAssignmentVOList : " + courseAssignmentVOList);

		model.addAttribute("data", courseAssignmentVOList);
		model.addAttribute("sbjNum", sbjNum);
		model.addAttribute("sbjTitle", sbjTitle);

		return "course/assignment_stu";
	}

	/**
	 * (학생&교수)강의 과제 상세 화면 출력
	 * @param session
	 * @param courseAssignmentVO
	 * @param submitVO
	 * @param asNum
	 * @param sbjNum
	 * @param sbjTitle
	 * @param model
	 * @return
	 */
	@GetMapping("/assignmentDetail")
	public String assignmentDetail(HttpSession session
								 , @ModelAttribute CourseAssignmentVO courseAssignmentVO
								 , SubmitVO submitVO
								 , int asNum
								 , String sbjNum
								 , String sbjTitle
								 , Model model) {


		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int stuNum = userVO.getUsername();
		log.info("assignmentDetail의 username : " + stuNum);
		log.info("assignmentDetail의 sbjTitle : " + sbjTitle);

		log.info("assignmnetDetail의 courseAssignmentVO : " + courseAssignmentVO);

		//과제 상세내용 조회
		CourseAssignmentVO assignmentVO = this.courseService.assignmentDetail(courseAssignmentVO);
		log.info("assignmentDetail의 assignmentVO : " + assignmentVO);

		log.info("assignmentDetail의 submitVO : " + submitVO);
		submitVO.setSbmAnum(asNum);
		submitVO.setStuNum(stuNum);
		log.info("assignmentDetail의 submitVO : " + submitVO);
		SubmitVO submitCheckVO = this.courseService.submitCheck(submitVO);
		log.info("assignmentDetail의 submitCheckVO : " + submitCheckVO);


		if(submitCheckVO != null) {	//과제제출 내역이 존재하는 경우
			model.addAttribute("submitData", submitCheckVO);
			String fnIdx =  submitCheckVO.getSbmFilename();
			String fn = fnIdx.substring(12);
			model.addAttribute("fn", fn);

			log.info("fn : " + fn);
			log.info("assignmentDetail의 submitCheckVO : " + submitCheckVO);
		}

		if(submitCheckVO == null) {	//과제제출 내역이 존재하지 않는 경우
			int sbmNum = this.courseService.getSbmNum();
			log.info("assignmentDetail의 sbmNum : " + sbmNum);

			model.addAttribute("sbmNum", sbmNum);
		}

		model.addAttribute("data", assignmentVO);
		model.addAttribute("sbjNum", sbjNum);
		model.addAttribute("sbjTitle", sbjTitle);

		return "course/reportSubmit_stu";
	}

	/**
	 * (학생)과제 제출
	 * @param submitVO
	 * @param sbjNum
	 * @param sbjTitle
	 * @param sbmAnum
	 * @param model
	 * @param uploadFile
	 * @return
	 */
	@PostMapping("/submitAssignment")
	public String submitAssignment(@ModelAttribute SubmitVO submitVO
								 , String sbjNum
								 , String sbjTitle
								 , int sbmAnum
								 , Model model
								 , MultipartFile uploadFile) {
				log.info("submitAssignment의 submitVO : " + submitVO);
				log.info("submitAssignment의 sbmAnum : " + sbmAnum);
				log.info("!!----------------------sbjNum : " + sbjNum);

				//파일저장 시작
				//1) 파일이 저장되는 경로 세팅(/resources/upload)
				String uploadFolder
				= "C:\\eGovFrameDev-3.10.0-64bit\\workspace\\sik\\src\\main\\webapp\\resources\\upload";

				//2) 연/월/일 폴더가 없으면 생성
				File uploadPath = new File(uploadFolder, getFolder());
				log.info("uploadPath : " + uploadPath);

				if(uploadPath.exists()==false) {
					uploadPath.mkdirs();
				}
				//make folder 끝--------------------------------------------------------


				//파일명
				String uploadFileName = uploadFile.getOriginalFilename();

				log.info("----------------");
				log.info("이미지 명 : " + uploadFileName);
				log.info("파일 크기 : " + uploadFile.getSize());

				//------------파일명 중복 방지 시작-----------------
				//java.util.UUID => 랜덤값을 생성
				UUID uuid = UUID.randomUUID();
				//ERASDFERASDFA_개똥이.jpg
				uploadFileName = uuid.toString() + "_" + uploadFileName;
				//------------파일명 중복 방지 끝-----------------

				//(어디에, 무엇을)
				//계획을 세움
				//C:\\upload\\2023\\01\\27\\ad61a88e-8519-4de9-9c67-c5732adcb10e_가트몬1.jpg
				File saveFile = new File(uploadPath,uploadFileName);

				//계획 실행. 파일 복사됨(클라이언트의 파일을 서버의 공간으로 복사)
				try {

					uploadFile.transferTo(saveFile);

				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}

				//1) filename : /2023/01/27/ad61a88e-8519-4de9-9c67-c5732adcb10e_가트몬1.jpg
				String filename = "/" + getFolder().replace("\\", "/") + "/" +
						uploadFileName;

				submitVO.setSbmFilename(filename);
				log.info("(set 후)createNotice의 submitVO : " + submitVO);
				log.info("filename : " + filename);


				int result = this.courseService.submitAssignment(submitVO);

				log.info("submitAssignment의 result : " + result);
				//파일저장 끝

				if(result > 0 ) {	//저장 성공 시

					try {
						sbjTitle= URLEncoder.encode(sbjTitle, "UTF-8");
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}

					return "redirect:/course/assignmentDetail?sbjNum="+sbjNum+"&&asNum="+sbmAnum+"&&sbjTitle="+sbjTitle;
				}else {	//저장 실패 시
					model.addAttribute("asNum", submitVO.getSbmNum());
					model.addAttribute("sbjTitle", sbjTitle);
					model.addAttribute("sbjNum", sbjNum);
					return "redirect:/course/assignment";
				}
	}

	/**
	 * (교수)금학기 수강생 목록 조회
	 * @param sbjNum
	 * @param sbjTitle
	 * @param model
	 * @return
	 */
	@GetMapping("/studentList")
	public String getStudentList(String sbjNum, String sbjTitle, Model model) {

		//수강생 목록 조회
		List<Map<String, Object>> studentList = this.courseService.getStudentList(sbjNum);

		model.addAttribute("sbjNum", sbjNum);
		model.addAttribute("sbjTitle", sbjTitle);
		model.addAttribute("data", studentList);

		return "course/studentList";
	}

	/**
	 * (교수)개별 학생 정보 조회(for 모달)
	 * @param getMap
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getStuInfo")
	public Map<String, Object> getStuInfo(@RequestBody Map<String, Object> getMap){
		String sbjNum = String.valueOf(getMap.get("sbjNum"));
		int stuNum = Integer.parseInt(String.valueOf(getMap.get("stuNum")));

		Map<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("sbjNum", sbjNum);
		infoMap.put("stuNum", stuNum);

		//개별 학생정보 조회
		Map<String, Object> getInfoMap = (Map<String, Object>) this.courseService.getStuInfo(infoMap);

		return getInfoMap;
	}

	/**
	 * (교수)강의 공지사항 등록화면 출력
	 * @param sbjTitle
	 * @param sbjNum
	 * @param model
	 * @return
	 */
	@GetMapping("/createNotice")
	public String createNotice(String sbjTitle, String sbjNum
			 				 , Model model) {

		model.addAttribute("sbjTitle", sbjTitle);
		model.addAttribute("sbjNum", sbjNum);

		return "course/noticeForm";
	}

	/**
	 * (교수)강의 공지사항 등록(insert)
	 * @param courseNoticeVO
	 * @param sbjTitle
	 * @param sbjNum
	 * @param model
	 * @param uploadFile
	 * @return
	 */
	@PostMapping("/createNotice")
	public String createNotice(@ModelAttribute CourseNoticeVO courseNoticeVO
							 , String sbjTitle
							 , String sbjNum
							 , Model model
							 , MultipartFile uploadFile) {

		if(uploadFile.getOriginalFilename() != null && !uploadFile.getOriginalFilename().equals("")) {	//파일을 등록한 경우에만 실행하기 위함

		//파일저장 시작
		//1) 파일이 저장되는 경로 세팅(/resources/upload)
		String uploadFolder
			= "C:\\eGovFrameDev-3.10.0-64bit\\workspace\\sik\\src\\main\\webapp\\resources\\upload";

		//2) 연/월/일 폴더가 없으면 생성
		File uploadPath = new File(uploadFolder, getFolder());

		if(uploadPath.exists()==false) {
			uploadPath.mkdirs();
		}
		//make folder 끝--------------------------------------------------------


		//파일명
		String uploadFileName = uploadFile.getOriginalFilename();

		//------------파일명 중복 방지 시작-----------------
		//java.util.UUID => 랜덤값을 생성
		UUID uuid = UUID.randomUUID();
		//ERASDFERASDFA_개똥이.jpg
		uploadFileName = uuid.toString() + "_" + uploadFileName;
		//------------파일명 중복 방지 끝-----------------

		//(어디에, 무엇을)
		//계획을 세움
		//C:\\upload\\2023\\01\\27\\ad61a88e-8519-4de9-9c67-c5732adcb10e_가트몬1.jpg
		File saveFile = new File(uploadPath,uploadFileName);

		//계획 실행. 파일 복사됨(클라이언트의 파일을 서버의 공간으로 복사)
		try {

			uploadFile.transferTo(saveFile);

		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		//1) filename : /2023/01/27/ad61a88e-8519-4de9-9c67-c5732adcb10e_가트몬1.jpg
		String filename = "/" + getFolder().replace("\\", "/") + "/" +
				uploadFileName;

		courseNoticeVO.setSnFilename(filename);

		}else {	//파일을 등록하지 않은 경우
			courseNoticeVO.setSnFilename("");
		}

		int result = this.courseService.createNotice(courseNoticeVO);

		//파일저장 끝

		if(result > 0 ) {	//파일저장 성공 시

			model.addAttribute("sbjTitle", sbjTitle);
			model.addAttribute("sbjNum", sbjNum);

			return "redirect:/course/notice";	//과목공지 목록화면으로 이동
		}else {	//파일저장 실패 시
			model.addAttribute("sbjTitle", sbjTitle);
			model.addAttribute("sbjNum", sbjNum);
			return "redirect:/course/notice";	//과목공지 목록화면으로 이동
		}
	}


	/**
	 * (교수)강의 공지사항 수정
	 * @param courseNoticeVO
	 * @param sbjNum
	 * @param sbjTitle
	 * @param model
	 * @return
	 */
	@GetMapping("/noticeModify")
	public String noticeModify(@ModelAttribute CourseNoticeVO courseNoticeVO
							 , String sbjNum
							 , String sbjTitle
							 , Model model) {

		//공지사항 상세정보 조회
		CourseNoticeVO noticeDetailVO = this.courseService.noticeDetail(courseNoticeVO);

		model.addAttribute("data", noticeDetailVO);
		model.addAttribute("sbjNum", sbjNum);
		model.addAttribute("sbjTitle", sbjTitle);

		return "course/noticeModifyForm";
	}

	/**
	 * (교수)공지사항 삭제(delete)
	 * @param courseNoticeVO
	 * @param sbjNum
	 * @param sbjTitle
	 * @param model
	 * @return
	 */
	@GetMapping("/deleteNotice")
	public String deleteNotice(@ModelAttribute CourseNoticeVO courseNoticeVO
						  	 , String sbjNum
							 , String sbjTitle
							 , Model model) {
		//공지사항 삭제 요청
		int result = this.courseService.deleteNotice(courseNoticeVO);


		if(result > 0) {	//삭제 성공 시
			model.addAttribute("sbjNum", sbjNum);
			model.addAttribute("sbjTitle", sbjTitle);

			return "redirect:/course/notice";
		}else {	//삭제 실패 시
			model.addAttribute("snNum", courseNoticeVO.getSnNum());
			model.addAttribute("sbjNum", sbjNum);
			model.addAttribute("sbjTitle", sbjTitle);
			return "course/noticeDetail";
		}
	}

	/**
	 * (교수)강의 공지사항 수정
	 * @param courseNoticeVO
	 * @param sbjNum
	 * @param sbjTitle
	 * @param model
	 * @return
	 */
	@PostMapping("/noticeModify")
	public String noticeModify2(@ModelAttribute CourseNoticeVO courseNoticeVO
								, String sbjNum
								, String sbjTitle
								, Model model) {
		int snNum = courseNoticeVO.getSnNum();

		//공지사항 수정 요청
		int result = this.courseService.noticeModify(courseNoticeVO);

		if(result > 0) {	//수정 성공 시
			model.addAttribute("snNum", snNum);
			model.addAttribute("sbjNum", sbjNum);
			model.addAttribute("sbjTitle", sbjTitle);

			return "redirect:/course/noticeDetail";
		}else {		//수정 실패 시
			model.addAttribute("snNum", snNum);
			model.addAttribute("sbjTitle", sbjTitle);
			model.addAttribute("sbjNum", sbjNum);
			return "course/notice_stu";
		}
	}


	/**
	 * (교수)강의 과제 등록 화면 출력
	 * @param sbjNum
	 * @param sbjTitle
	 * @param model
	 * @return
	 */
	@GetMapping("/createAssignment")
	public String createAssignment(String sbjNum
								 , String sbjTitle
								 , Model model) {

		//강의과제 목록 조회
		List<SubjectIndexVO> subjectIndexVOList = this.courseService.getSiList(sbjNum);

		model.addAttribute("siList", subjectIndexVOList);
		model.addAttribute("sbjTitle", sbjTitle);
		model.addAttribute("sbjNum", sbjNum);

		return "course/assignmentForm";
	}


	/**
	 * (교수)강의 과제 등록
	 * @param courseAssignmentVO
	 * @param asSdt
	 * @param asEdt
	 * @param spNum
	 * @param sbjNum
	 * @param sbjTitle
	 * @param model
	 * @return
	 */
	@PostMapping("/createAssignment")
	public String createAssignment(@Valid @ModelAttribute CourseAssignmentVO courseAssignmentVO
								 , @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date asSdt
								 , @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date asEdt
								 , String spNum
								 , String sbjNum
								 , String sbjTitle
								 , Model model) {

		//강의과제 등록 요청
		int result = this.courseService.createAssignment(courseAssignmentVO);

		if(result > 0) {	//등록 성공 시
			model.addAttribute("sbjNum", sbjNum);
			model.addAttribute("sbjTitle", sbjTitle);
			return "redirect:/course/assignment";	//과목과제 목록 화면으로 이동
		}else {				//등록 실패 시
			model.addAttribute("sbjNum", sbjNum);
			model.addAttribute("sbjTitle", sbjTitle);
			return "redirect:/course/createAssignment";	//과목과제 등록 화면으로 이동
		}

	}

	//(교수)강의 과제 수정 화면 출력
	@GetMapping("/assignmentModify")
	public String assignmentModify(@ModelAttribute CourseAssignmentVO courseAssignmentVO
								 , String sbjNum
			 					 , String sbjTitle
			 					 , Model model) {
		List<SubjectIndexVO> subjectIndexVOList = this.courseService.getSiList(sbjNum);

		CourseAssignmentVO assignmentVO = this.courseService.assignmentDetail(courseAssignmentVO);

		model.addAttribute("siList", subjectIndexVOList);
		model.addAttribute("data", assignmentVO);
		model.addAttribute("sbjNum", sbjNum);
		model.addAttribute("sbjTitle", sbjTitle);

		return "course/assignmentModify";
	}

	//(교수)강의 과제 수정
	@PostMapping("/updateAssignment")
	public String updateAssignment(@Valid @ModelAttribute CourseAssignmentVO courseAssignmentVO
								 , Model model
								 , String sbjNum
			 					 , String sbjTitle) {

		int result = this.courseService.updateAssignment(courseAssignmentVO);

		model.addAttribute("asNum", courseAssignmentVO.getAsNum());
		model.addAttribute("sbjNum", sbjNum);
		model.addAttribute("sbjTitle", sbjTitle);

		return "redirect:/course/assignmentDetail";		//강의 과제 상세화면으로 이동
	}

	/**
	 * (교수)강의 과제 삭제
	 * @param courseAssignmentVO
	 * @param asNum
	 * @param sbjNum
	 * @param sbjTitle
	 * @param model
	 * @return
	 */
	@GetMapping("/deleteAssignment")
	public String deleteAssignment(@ModelAttribute CourseAssignmentVO courseAssignmentVO
								 , int asNum
								 , String sbjNum
			 					 , String sbjTitle
			 					 , Model model) {
		//강의과제 삭제 요청
		int result = this.courseService.deleteAssignment(asNum);

		if(result > 0) {	//삭제 성공 시
			model.addAttribute("sbjNum", sbjNum);
			model.addAttribute("sbjTitle", sbjTitle);

			return "redirect:/course/assignment";	//강의과제 목록 화면으로 이동
		}else {	//삭제 실패 시
			model.addAttribute("asNum", courseAssignmentVO.getAsNum());
			model.addAttribute("sbjNum", sbjNum);
			model.addAttribute("sbjTitle", sbjTitle);
			return "redirect:/course/assignmentDetail";	//강의과제 상세 화면으로 이동
		}
	}


	/**
	 * (교수)자료 게시글 등록
	 * @param courseReferenceVO
	 * @param sbjNum
	 * @param sbjTitle
	 * @param uploadFile
	 * @param model
	 * @return
	 */
	@PostMapping("/createReference")
	public String createReference(@ModelAttribute CourseReferenceVO courseReferenceVO
								, String sbjNum
								, String sbjTitle
								, MultipartFile uploadFile
								, Model model) {

		//파일저장 시작
		//1) 파일이 저장되는 경로 세팅(/resources/upload)
			String uploadFolder
				= "C:\\eGovFrameDev-3.10.0-64bit\\workspace\\sik\\src\\main\\webapp\\resources\\upload";

		//2) 연/월/일 폴더가 없으면 생성
			File uploadPath = new File(uploadFolder, getFolder());

			if(uploadPath.exists()==false) {
				uploadPath.mkdirs();
			}
			//make folder 끝--------------------------------------------------------


			//파일명
			String uploadFileName = uploadFile.getOriginalFilename();

			//------------파일명 중복 방지 시작-----------------
			//java.util.UUID => 랜덤값을 생성
			UUID uuid = UUID.randomUUID();
			//ERASDFERASDFA_개똥이.jpg
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			//------------파일명 중복 방지 끝-----------------

			//(어디에, 무엇을)
			//계획을 세움
			//C:\\upload\\2023\\01\\27\\ad61a88e-8519-4de9-9c67-c5732adcb10e_가트몬1.jpg
			File saveFile = new File(uploadPath,uploadFileName);

			//계획 실행. 파일 복사됨(클라이언트의 파일을 서버의 공간으로 복사)
			try {

				uploadFile.transferTo(saveFile);

			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

			//1) filename : /2023/01/27/ad61a88e-8519-4de9-9c67-c5732adcb10e_가트몬1.jpg
			String filename = "/" + getFolder().replace("\\", "/") + "/" +
					uploadFileName;

			courseReferenceVO.setRrNm(filename);


			int result = this.courseService.createReference(courseReferenceVO);
			//파일저장 끝

			if(result > 0) {	//파일저장 성공 시
				model.addAttribute("sbjNum", sbjNum);
				model.addAttribute("sbjTitle", sbjTitle);
				return "redirect:/course/reference";	//강의자료 목록 화면으로 이동
			}else {				//파일저장 실패 시
				model.addAttribute("sbjNum", sbjNum);
				model.addAttribute("sbjTitle", sbjTitle);
				return "redirect:/course/reference";	//강의자료 목록 화면으로 이동
			}

	}

	/**
	 * 연/월/일 폴더 생성
	 * @return
	 */
	public static String getFolder() {
		//2023-01-27 형식(format) 지정
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		//날짜 객체 생성(java.util 패키지)
		Date date = new Date();
		//2023-01-27=>2023\\01\\27
		String str = sdf.format(date);
		//단순 날짜 문자를 File객체의 폴더 타입으로 바꾸기
		//2023\\01\\27
		return str.replace("-", File.separator);
	}

	/**
	 * (교수)자료 게시글 삭제
	 * @param courseReferenceVO
	 * @param sbjNum
	 * @param sbjTitle
	 * @param model
	 * @return
	 */
	@GetMapping("/deleteReference")
	public String deleteReference(@ModelAttribute CourseReferenceVO courseReferenceVO
								, String sbjNum
								, String sbjTitle
								, Model model) {

		//자료 게시글 삭제 요청
		int result = this.courseService.deleteReference(courseReferenceVO);

		if(result > 0) {	//삭제 성공 시
			model.addAttribute("sbjNum", sbjNum);
			model.addAttribute("sbjTitle", sbjTitle);
			return "redirect:/course/reference";

		}else {				//삭제 실패 시
			model.addAttribute("sbjNum", sbjNum);
			model.addAttribute("sbjTitle", sbjTitle);
			return "redirect:/course/noticeDetail";
		}

	}

	/**
	 * (교수)수강생 출석 입력/수정
	 * @param atMap
	 * @return
	 */
	@ResponseBody
	@PostMapping("/updateAttendance")
	public List<CourseAttendanceVO> updateAttendance(@RequestBody Map<String, Object> atMap) {
		List<CourseAttendanceVO> updateAtList = new ArrayList<CourseAttendanceVO>();


		String timeTcode = (String) atMap.get("timeTcode");
		int atStuNum = Integer.parseInt(String.valueOf(atMap.get("atStuNum")));
		int atWeek = Integer.parseInt(String.valueOf(atMap.get("atWeek")));
		double atCheck = Double.parseDouble(String.valueOf(atMap.get("atCheck")));

		String sbjNum = String.valueOf(atMap.get("sbjNum"));
		log.info("sbjNum : " + sbjNum);

		log.info("timeTcode : " + timeTcode);
		log.info("atStuNum : " + atStuNum);
		log.info("atWeek : " + atWeek);
		log.info("atCheck : " + atCheck);

		Map<String, Object> tMap = new HashMap<String, Object>();
		tMap.put("sbjNum", sbjNum);
		tMap.put("timeTcode", timeTcode);

		//강의번호 조회
		List<Map<String, Object>> ltNumList = this.courseService.getLtNum(tMap);
		log.info("updateAttendance의 ltNumList : " + ltNumList);

		int size = ltNumList.size();
		log.info("ltNumList size : " + size);


		List<CourseAtVO> upAtList = new ArrayList<CourseAtVO>();
		for(Map<String, Object> map : ltNumList) {
			CourseAtVO atVO = new CourseAtVO();
			atVO.setAtStuNum(atStuNum);
			atVO.setAtWeek(atWeek);
			atVO.setAtCheck(atCheck);
			log.info("atVO : " + atVO);
			atVO.setLtNum(Integer.parseInt(String.valueOf(map.get("LT_NUM"))));
			log.info("반복문 내의 atVO2 : " + atVO);
			upAtList.add(atVO);
			log.info("반복문 내의 atList : " + upAtList);
		}
		log.info("(atVO 추가 후)atList : " + upAtList);

		//출석 입력, 수정 요청
//		int result = this.courseService.updateAttendance(upAtList);
		this.courseService.updateAttendance(upAtList);

		//출석 입력, 수정 후 출석현황 조회
		List<CourseAttendanceVO> newAtList = this.courseService.getAtList(sbjNum);
		log.info("updateAttendance의 atList : " + newAtList);


		return newAtList;
	}


}








