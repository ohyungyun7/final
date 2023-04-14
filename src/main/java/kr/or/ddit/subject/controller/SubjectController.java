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
import kr.or.ddit.vo.CourseListVO;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.ShoppingBasketVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.SubjectVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@PreAuthorize("isAuthenticated()")
@RequestMapping("/student")
@Slf4j
@Controller
public class SubjectController {

	@Inject
	SubjectService subjectService;

//	@PreAuthorize("hasAnyRole('ROLE_STU')")
//	@GetMapping("/studentMain")
//	public String StudentMain() {
//		return "student/student";
//	}

	//단과대 , 학과 , 검색어 선택 후 출력
	@ResponseBody
	@PostMapping("/subjectAjax2")
	public Map<String,Object> subjectAjax2 (Model model,
										  HttpServletRequest request,
										  @RequestBody Map<String,String> map){

		int size = 10;
		log.info("================================");
		log.info("2subjectAjax2로 들어옴");
		log.info("================================");
		log.info("currentPage : "+map.get("currentPage"));

		if(map.get("currentPage")==null || map.get("currentPage").equals("")) {
			map.put("currentPage", 1+"");
		}

		if(map.get("show")==null || ((String) map.get("show")).length()<1) {
			map.put("show", "30");
		}

		log.info("map의 최종값 : "+map);

		int total = this.subjectService.getTotal(map);

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int id= userVO.getUsername();

		List<CourseListVO> coursList = subjectService.coursList(id);//기존에 수강했던 과목들 불러옴(수강완료를 표시하기 위해)
		List<SubjectVO> list = subjectService.subjectList(map);//과목리스트 뿌리기
		List<ShoppingBasketVO> list2 = subjectService.shoppingList(id);//장바구니함 가져오는거
		log.info("total : "+total);
		log.info("list : "+list);
		log.info("coursList : "+coursList);

		Map<String, Object> realMap = new HashMap<String, Object>();

		realMap.put("subjectList", new ArticlePage<SubjectVO>(total/3, Integer.parseInt(map.get("currentPage")) , size, list));
		realMap.put("basketList", list2);
		realMap.put("coursList", coursList);
		return realMap;
	}

	//비동기로 초기수강리스트 띄운 후 비동기로 과목과 장바구니 띄우기 비동기!!!
	@ResponseBody
	@GetMapping("/subjectAjax")
	public Map<String,Object> subjectAjax (Model model,
										  HttpServletRequest request,
										  Map<String,String> map,
										  @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage,
										  @RequestParam(value="show",required=false,defaultValue="10") int size){

		log.info("================================");
		log.info("subjectAjax로 들어옴");
		log.info("================================");
		log.info("currentPage : "+currentPage);
		map.put("currentPage", currentPage+"");

		currentPage = Integer.parseInt(map.get("currentPage"+""));

		if(map.get("show")==null || ((String) map.get("show")).length()<1) {
			map.put("show", "30");
		}

		log.info("map의 최종값 : "+map);

		int total = this.subjectService.getTotal(map);
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int id= userVO.getUsername();


		List<CourseListVO> coursList = subjectService.coursList(id);//기존에 수강했던 과목들 불러옴(수강완료를 표시하기 위해)
		List<SubjectVO> list = subjectService.subjectList(map);//과목리스트 뿌리기
		List<SubjectVO> allList = subjectService.allSubjectList();//과목리스트 뿌리기
		List<ShoppingBasketVO> list2 = subjectService.shoppingList(id);//장바구니함 가져오는거
		log.info("내가 들었던 과목 : "+coursList);
		log.info("total : "+total);
		log.info("list : "+list);
		log.info("list2 : "+list2);

		Map<String, Object> realMap = new HashMap<String, Object>();

		realMap.put("subjectList", new ArticlePage<SubjectVO>(total/3, currentPage, size, list));
		realMap.put("allList", allList);
		realMap.put("basketList", list2);
		realMap.put("endPage", total/30);
		realMap.put("coursList", coursList);
		return realMap;
	}

	//초기 리스트 띄우기(학생정보만)
	@GetMapping("/subjectList")
	public String subjectList(Model model,
							  HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");

		int id= userVO.getUsername();



		//int resultResult = subjectService.resetCurrentData();//새로운 학기가 되었으니 기존에 넣었던 currentData를 초기화함
		int result = subjectService.updateSemester(id);//학기로 학년 업데이트하기

		//log.info("resultResult 초기화 : "+resultResult);
		log.info("학기 업데이트 : "+result);

		StudentVO student = subjectService.getStudentInfo(id);

		int currentRecode = subjectService.currentRecode(id);
		String recode = subjectService.limitRecode(id);

		log.info("초기 subjectList에서 직전학기 평점 : "+recode);
		log.info("초기 subjectList에서 직전학기 평점(int로바꿈) : "+Double.parseDouble(recode));


		int finalRecode = 0;

		if(0<=Double.parseDouble(recode) && Double.parseDouble(recode)<3.0) {
			finalRecode = 18;
		}else if (3.0<=Double.parseDouble(recode) && Double.parseDouble(recode)<4.0){
			finalRecode = 21;
		}else if (4.0<=Double.parseDouble(recode)){
			finalRecode = 24;
		}

		log.info("최대수강학점 : "+finalRecode);


		model.addAttribute("student", student);
		model.addAttribute("currentRecode", currentRecode);
		model.addAttribute("finalRecode", finalRecode);
		model.addAttribute("recode", Double.parseDouble(recode));

		return "subject/subject";
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

		@GetMapping("/shoppingList")
		public String shoppingList(Model model,
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

			return "subject/shoppingBasket";
		}

		@ResponseBody
		@PostMapping("/insertCourseList")
		public Map<String , Object> insertCourseList(@RequestBody Map<String,Object> map,HttpServletRequest request){

			HttpSession session = request.getSession();
			UserVO userVO = (UserVO) session.getAttribute("userVO");
			int id= userVO.getUsername();


			log.info("insertCourseList의 map : "+map);
			List<ShoppingBasketVO> list2 = subjectService.shoppingList(id);//장바구니함 가져오는거
			log.info("insertCourseList에서 shoppingBasket의 리스트 : "+list2);

			int count = 0;
			for(int i=0; i<list2.size(); i++) {
				Map<String,Object> map2 = new HashMap<>();
				map2.put("stuNum", list2.get(i).getStuNum());
				map2.put("sbjNum", list2.get(i).getSbjNum());
				map2.put("semester", map.get("semester"));

				int result = subjectService.insertCourseList(map2);

				if(result>0) {
					count++;
				}
			}

			int result2 = subjectService.deleteShppingList(id);//수강목록에 넣어졌으면 장바구니 지움

			log.info("course_list 테이블에 넣어진 결과값 : "+count);
			log.info("장바구니에 해당 학생의 추가 목록 지운 결과값 : "+result2);

			map.put("count", count);
			return map;
		}

		/**
		 * 해당 클릭한 과목이 3.0이상인지 이하인지
		 * 이거에 따라 재수강이 되는지 재수강이 안되는지가 결정됨
		 * @param map
		 * @param request
		 * @return
		 */
		@ResponseBody
		@PostMapping("/subject/check3dat0")
		public Map<String , Object> check3dat0(@RequestBody Map<String,Object> map,HttpServletRequest request){

			HttpSession session = request.getSession();
			UserVO userVO = (UserVO) session.getAttribute("userVO");
			int id= userVO.getUsername();
			map.put("stuNum", id);

			List<CourseListVO> check3dat0 =  subjectService.check3dat0(map);//3.0이상인지 이하인지 확인
			log.info("check3dat0의 값 : "+check3dat0);
			Map<String,Object> map2 = new HashMap<>();
			map2.put("check3dat0", check3dat0);
			return map2;
		}
}
