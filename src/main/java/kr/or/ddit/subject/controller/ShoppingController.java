package kr.or.ddit.subject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.subject.service.impl.SubjectService;
import kr.or.ddit.subject.util.ArticlePage;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.ShoppingBasketVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.SubjectVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/shopping")
@Slf4j
@Controller
public class ShoppingController {
	
	@Inject
	SubjectService subjectService;
	
	@ResponseBody
	@PostMapping("/shoppingRank")
	public Map<String, Object> shoppingRank(){
		
		
		List<ShoppingBasketVO> shoppingRank = subjectService.shoppingRank();
		
		Map<String, Object> map = new HashMap<>();
		map.put("shoppingRank", shoppingRank);
		return map;
	}
	
	
	//초기 리스트 띄우기(학생정보만)
	@GetMapping("/subjectList")
	public String subjectList(Model model,
							  HttpServletRequest request) { 
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		
		int id= userVO.getUsername();
		log.info("==============");
		log.info("=====id======== : "+id);
		log.info("==============");
		
		StudentVO student = subjectService.getStudentInfo(id);
		
		int currentRecode = subjectService.currentRecode(id);
		String recode = subjectService.limitRecode(id);
		
		log.info("초기 subjectList에서 직전학기 평점 : "+recode);
		log.info("초기 subjectList에서 직전학기 평점(int로바꿈) : "+Double.parseDouble(recode));
		
		
		int finalRecode = 0;
		
		if(0<=Double.parseDouble(recode) && Double.parseDouble(recode)<=2.9) {
			finalRecode = 18;
		}else if (3.0<=Double.parseDouble(recode) && Double.parseDouble(recode)<=3.9){
			finalRecode = 21;
		}else if (4.0<=Double.parseDouble(recode)){
			finalRecode = 24;
		}
		
		log.info("최대수강학점 : "+finalRecode);
		
		
		model.addAttribute("student", student);
		model.addAttribute("currentRecode", currentRecode);
		model.addAttribute("finalRecode", finalRecode);
		model.addAttribute("recode", Double.parseDouble(recode));
		
		return "shopping/shopping";
	}
	
	//현재인원 추가
	@ResponseBody
	@PostMapping("/subject/incrementCurrent")
	public Map<String, Object> incrementCurrent(@RequestBody Map<String , Object> map){
		
		log.info("/subject/incrementCurrent 에서 넘어온 map 값 : "+map);
		String claNum = map.get("claNum")+"";
		String userId = map.get("userId")+"";
		
		int result = subjectService.incrementCurrent(claNum);//현재 수강 인원 추가
		
		Map<String, Object> map333 = new HashMap<String, Object>();
		map333.put("claNum", claNum);
		map333.put("userId", userId);
		
		int result2 = subjectService.insertSubjectList(map333);
		int recodeCount = subjectService.currentRecode(Integer.parseInt(map333.get("userId")+""));
		SubjectVO subjectVO = subjectService.addBasketVO(map333);
		
		log.info("방금 추가된 과목 내용 : "+subjectVO);
		log.info("incrementCurrent에서 현재수강생 추가  : "+result);
		log.info("incrementCurrent에서 수강목록추가 : "+result2);
		log.info("==============================================");
		log.info("장바구니 총 합 recodeCount : "+recodeCount);
		log.info("==============================================");
		Map<String, Object> map1 = new HashMap<String, Object>();
		
		map1.put("result", result);
		map1.put("recodeCount", recodeCount);
		map1.put("subjectVO", subjectVO);
		return map1;
	}
	
		//현재인원 삭제
		@ResponseBody
		@PostMapping("/subject/minusCurrent")
		public Map<String, Object> minusCurrent(@RequestBody Map<String , Object> map){
			
			log.info("/subject/minusCurrent으로 넘어옴!!");
			log.info("map으로 넘어온 값 : "+map.get("claNum"));
			log.info("map으로 넘어온 값 : "+map.get("userId"));
			
			String claNum = map.get("claNum")+"";
			String userId = map.get("userId")+"";
			
			int result = subjectService.minusCurrent(claNum);//현재 수강 인원 추가
			
			Map<String, Object> map333 = new HashMap<String, Object>();
			map333.put("claNum", claNum);
			map333.put("userId", userId);
			
			int result2 = subjectService.deleteSubjectList(map333);
			int recodeCount = subjectService.currentRecode(Integer.parseInt(map333.get("userId")+""));
			
			log.info("minusCurrent에서 현재수강생 삭제  : "+result);
			log.info("minusCurrent에서 수강목록삭제 : "+result2);
			
			Map<String, Object> map1 = new HashMap<String, Object>();
			
			map1.put("result", result);
			map1.put("recodeCount", recodeCount);
			
			return map1;
		}
		
		//내 수강신청과목
		@ResponseBody
		@PostMapping("/subject/mySubjectList")
		public List<SubjectVO> mySubjectList(@RequestBody Map<String, Object> map){
			
			log.info("myList에 넘어온 값 : "+map);
			List<SubjectVO> myList = subjectService.mySubjectList(map);
			
			
			log.info("myList의 과목 : "+myList);
			return myList;
		}
		
		//이거 안씀
		@ResponseBody
		@PostMapping("/subject/myListCount")
		public Map<String, Object> myListCount(@RequestBody Map<String, Object> map){
			
			log.info("myList에 넘어온 값 : "+map);
			log.info("myListCount여기에 들어옴!!");
			int count = subjectService.myListCount(map);
			log.info("myListCount에서 카운트 값 : "+count);
			
			Map<String,Object> data = new HashMap<String, Object>();
			data.put("count", count);
			return data;
		}
		
		//단과대 select태그 선택 후 해당하는 학과명 출력
		@ResponseBody
		@PostMapping("/subject/listDepartment")
		public Map<String, Object> listDepartment(@RequestBody Map<String,Object> map){
			
			if(map.get("colleage").equals("전체")) {
				map.put("colleage", null);
			}
			
			String deptName = map.get("colleage")+"";
			log.info(deptName);
			
			List<DepartmentVO> departmentVOList = subjectService.departmentList(deptName);
			
			Map<String, Object> map2 = new HashMap<String, Object>();
			
			map2.put("departmentVOList", departmentVOList);
			log.info("map2의값 : "+map2);
			return map2;
		}
}
