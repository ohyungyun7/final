package kr.or.ddit.subject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.subject.service.impl.SubjectService;
import kr.or.ddit.subject.util.ArticlePage;
import kr.or.ddit.vo.ShoppingBasketVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.SubjectVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/shopping")
@Controller
public class ShoppingBasketController {

	@Inject
	SubjectService subjectService;
	
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
			
			List<SubjectVO> list = subjectService.subjectList(map);//과목리스트 뿌리기
			List<SubjectVO> allList = subjectService.allSubjectList();//과목리스트 뿌리기
			List<ShoppingBasketVO> list2 = subjectService.shoppingList(id);//장바구니함 가져오는거
			log.info("total : "+total);
			log.info("list : "+list);
			log.info("list2 : "+list2);
			
			Map<String, Object> realMap = new HashMap<String, Object>();
			
			realMap.put("subjectList", new ArticlePage<SubjectVO>(total/3, currentPage, size, list));
			realMap.put("allList", allList);
			realMap.put("basketList", list2);
			return realMap;
		}
		
		@GetMapping("/shoppingList")
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
			
			return "subject/shoppingBasket";
		}
}
