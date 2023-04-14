package kr.or.ddit.employee;

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

import kr.or.ddit.employee.service.EmployeeService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.AdminVO;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

@Slf4j
@RequestMapping("/manage")
@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeService employeeService; 
	
	/**
	 * 교직원 조회
	 * 관리자
	 */
	@GetMapping("/empManage")
	public String admList(Model model,
			@RequestParam(value="currentPage",required = false, defaultValue ="1")int currentPage,
			@RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam (value = "size", required = false, defaultValue = "10") int size) {
		
			Map<String,Object> map = new HashMap<>();
			map.put("keyword", keyword);
			map.put("category", category);
			
			int total = employeeService.getTotal(map);		
			map.put("size", size);
			map.put("currentPage", currentPage);
			
			log.info("total : " + total); //게시글 총 갯수 확인해보자
			
			List<AdminVO> admList = this.employeeService.admList(map);
			
			model.addAttribute("data",new ArticlePage<AdminVO>(total, currentPage, size,admList ));
			return "manage/empManage";
	}
	
	
	/**
	 * 교직원 상세조회
	 * 관리자
	 */
	@ResponseBody
	@PostMapping("/empNum")
	public Map<String, Object> empNum(@RequestBody Map<String, Object> map) {
		
		log.info("empNum에서 empNum의 값 : " + map);
		AdminVO admVO = this.employeeService.empNum(map);
		log.info("admVO : " + admVO);
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("admVO", admVO);
		return map2;
	}
	
	/**
	 * 교직원 삭제
	 * 관리자
	 */
	@ResponseBody
	@PostMapping("/deleteEmp")
	public Map<String, Object> deleteEmp(@RequestBody Map<String, Object> map) {
		
		log.info("deleteEmp에서 넘겨 받은 map의 값 : "+map);
		
		int result = this.employeeService.deleteNum(map);
		int deleteAuth = this.employeeService.deleteAuth(map);
		int deleteUsers = this.employeeService.deleteUsers(map);
		Map<String,Object> map2 = new HashMap<>();
		
		map2.put("result", result);
		
		return map2;
	}
	
	/**
	 * 교직원 수정
	 * 관리자 
	 */
	@ResponseBody
	@PostMapping("/updatePost")
	public Map<String, Object> updatePost(@RequestParam Map<String, Object> map){
			log.info("updatePost에서 넘겨받은 map의 값 : " + map);
			
			int result = this.employeeService.updatePost(map);
			
			log.info("result : " + result);
			
			Map<String, Object> map2 = new HashMap<String, Object>();
			AdminVO admVO = this.employeeService.empNum(map);
			log.info("admVO : " + admVO);
			 
			map2.put("admVO", admVO);
					
		return map2;
	}
	
	/**
	 * 사번 자동생성
	 * 관리자
	 */
	@ResponseBody
	@PostMapping("/getEmpNum")		
	public Map<String,Object> getEmpNum(){
		log.info("getEmpNum에 들어옴!!");
		
		
		int empNum = this.employeeService.getEmpNum();
		Map<String ,Object> map = new HashMap<>();
		map.put("empNum", empNum);
		return map;
	}
	
	/**
	 * 교직원 등록
	 * 관리자
	 */
	@ResponseBody
	@PostMapping("/createPost")
	public Map<String, Object> createPost(@RequestParam Map<String, Object> map){
		
		log.info("createPost에서 넘어온 data : " + map);
		
		int createUsers= this.employeeService.createUsers();	//유저 아이디 등록
		int createAuth = this.employeeService.createAuth();		//유저 아이디 등록 후 권한 부여
		int result = this.employeeService.createPost(map);		//관리자 등록
		log.info("result : ", result);
		Map<String, Object> map2 = new HashMap<String, Object>();
		
		map2.put("createUsers",createUsers);
		map2.put("createAuth",createAuth);
		map2.put("result",result);
		
		return map2;
	}
	
	
	/**
	 * 총 지표
	 * 관리자
	 */
	@GetMapping("/graph")
	public String graph() {
		return "manage/graph";
	}
	
}
