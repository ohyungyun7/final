package kr.or.ddit.teacher;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.teacher.service.TeacherService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.TeacherVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/manage")
@Controller
public class TeacherController {

	@Autowired
	TeacherService teacherService;

	/**
	 * 교수 조회
	 * 관리자
	 */
	@GetMapping("/proManage")
	public String proList(Model model,
			@RequestParam(value="currentPage",required = false, defaultValue ="1")int currentPage,
			@RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam (value = "size", required = false, defaultValue = "10") int size) {

		Map<String,Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("category", category);

		int total = teacherService.getTotal(map);
		map.put("size", size);
		map.put("currentPage", currentPage);

		log.info("total : " + total); //게시글 총 갯수 확인해보자

		List<TeacherVO> proList = this.teacherService.proList(map);


		model.addAttribute("data",new ArticlePage<TeacherVO>(total, currentPage, size,proList ));
		return "manage/proManage";
	}


	/**
	 * 교수 상세조회
	 * 관리자
	 */
	@ResponseBody
	@PostMapping("/teaNum")
	public Map<String, Object> teaNum(@RequestBody Map<String, Object> map) {

		log.info("teaNum에서 teaNum의 값 : " + map);
		TeacherVO teaVO = this.teacherService.teaNum(map);
		log.info("teaVO : " + teaVO);

		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("teaVO", teaVO);
		return map2;
	}

	/**
	 * 교수 삭제
	 * 관리자
	 */
	@ResponseBody
	@PostMapping("/deleteTea")
	public Map<String, Object> deleteTea(@RequestBody Map<String, Object> map) {

		log.info("deleteTea에서 넘겨 받은 map의 값 : "+map);

		int result = this.teacherService.deleteTea(map);
		int deleteAuth = this.teacherService.deleteAuth(map);
		int deleteUsers = this.teacherService.deleteUsers(map);
		Map<String,Object> map2 = new HashMap<>();

		map2.put("result", result);

		return map2;
	}

	/**
	 * 교직원 수정
	 * 관리자
	 */
	@ResponseBody
	@PostMapping("/updateTeacher")
	public Map<String, Object> updateTeacher(@RequestParam Map<String, Object> map){

			log.info("updatePost에서 넘겨받은 map의 값 : " + map);

			String[] split=(map.get("deptNm")+"").split(",");
			map.put("deptNm", split[0]);
			map.put("deptNum", split[1]);

			log.info("==================================================");
			log.info("변환 후 updatePost에서 넘어온 data : " + map);
			log.info("==================================================");
			int result = this.teacherService.updateTeacher(map);

			log.info("result : " + result);

			Map<String, Object> map2 = new HashMap<String, Object>();
			TeacherVO teaVO = this.teacherService.teaNum(map);
			log.info("teaVO : " + teaVO);

			map2.put("teaVO", teaVO);

		return map2;
	}

	/**
	 * 교번 자동생성
	 * 관리자
	 */
	@ResponseBody
	@PostMapping("/getTeaNum")
	public Map<String,Object> getTeaNum(){
		log.info("getEmpNum에 들어옴!!");


		int getTeaNum = this.teacherService.getTeaNum();
		Map<String ,Object> map = new HashMap<>();
		map.put("getTeaNum", getTeaNum);
		return map;
	}

	/**
	 * 교수 등록
	 * 관리자
	 */
	@ResponseBody
	@PostMapping("/createTeacher")
	public Map<String, Object> createTeacher(@RequestParam Map<String, Object> map){

		log.info("createPost에서 넘어온 data : " + map);

		String[] split=(map.get("deptNm1")+"").split(",");
		map.put("deptNm", split[0]);
		map.put("deptNum", split[1]);

		log.info("==================================================");
		log.info("변환 후 createPost에서 넘어온 data : " + map);
		log.info("==================================================");

		int createUsers= this.teacherService.createUsers();	//유저 아이디 등록
		int createAuth = this.teacherService.createAuth();		//유저 아이디 등록 후 권한 부여
		int result = this.teacherService.createPost(map);		//관리자 등록
		log.info("result : ", result);
		Map<String, Object> map2 = new HashMap<String, Object>();

		map2.put("createUsers",createUsers);
		map2.put("createAuth",createAuth);
		map2.put("result",result);

		return map2;
	}

	@ResponseBody
	@PostMapping("/getDepartMentNm")
	public Map<String, Object> getDepartMentNm(){

		List<DepartmentVO> getDepartMentNmList = teacherService.getDepartMentNm();

		log.info("getDepartMentNmList 리스트의 값 : " + getDepartMentNmList);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", getDepartMentNmList);
		return map;

	}

	@ResponseBody
	@PostMapping("/getTeacher")
	public Map<String, Object> getTeacher(){

		log.info("getTeacher에서 넘어옴");
		List<TeacherVO> getTeacherList = teacherService.getTeacher();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", getTeacherList);
		return map;
	}

	/**
	 * 요청URL : /stuList/totalStu.do
	 * @param model
	 * @return Integer
	 */
	@ResponseBody
	@GetMapping("/total.do")
	public Map<String,Integer> totalTea(Model model){
		log.info("total에 왔다!!!!");
		return this.teacherService.total();
	}

	/**
	 * 요청URL : /stuList/totalStu.do
	 * @param model
	 * @return Integer
	 */
	@ResponseBody
	@GetMapping("/emptotal.do")
	public Map<String,Integer> totalEmp(Model model){
		log.info("total에 왔다!!!!");
		return this.teacherService.totalEmp();
	}


}
