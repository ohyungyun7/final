package kr.or.ddit.graph.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.graph.service.GraphService;
import kr.or.ddit.vo.ColleageVO;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.StudentVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/graph")
@Slf4j
@Controller
public class GraphController {

	@Inject
	GraphService graphservice;

	@GetMapping("/colleageGraph")
	public String colleageGraph() {


		return "graph/colleageGraph";
	}


	@ResponseBody
	@PostMapping("/colleageCount")
	public Map<String,Object> colleageCount(){
		List<ColleageVO> colleageList = graphservice.colleageList();//단과대 리스트 가져오기
		List<ColleageVO> sumPeopleList = graphservice.sumPeopleList();//단과대 리스트 가져오기

		Map<String,Object> map = new HashMap<>();
		map.put("colleageList", colleageList);
		map.put("sumPeopleList", sumPeopleList);
		return map;
	}


	@ResponseBody
	@PostMapping("/departmentCount")
	public Map<String,Object> departmentCount(){

		List<ColleageVO> departSumPeople = graphservice.departSumPeople();//학과별 정원
		Map<String,Object> map = new HashMap<>();
		log.info("departSumPeople : "+departSumPeople);
		map.put("departSumPeople", departSumPeople);
		return map;
	}

	@ResponseBody
	@PostMapping("/maleAndFemale")
	public Map<String,Object> maleAndFemale(){


		List<StudentVO> yearList = graphservice.yearList();//학년 중복제거
		List<StudentVO> mealFemale = graphservice.mealFemale();//학년별 성별 총합

		log.info("yearList : "+yearList);
		log.info("mealFemale : "+mealFemale);

		Map<String,Object> map = new HashMap<>();
		map.put("yearList", yearList);
		map.put("mealFemale", mealFemale);
		return map;
	}

	@ResponseBody
	@PostMapping("/colleageMaleFemale")
	public Map<String,Object> colleageMaleFemale(){

		List<DepartmentVO> departList = graphservice.departList();//학과 리스트 가져오기
		List<StudentVO> departMaleFemale = graphservice.departMaleFemale();//학과별 성비 가져오기

		Map<String, Object> map = new HashMap<>();
		map.put("departList", departList);
		map.put("departMaleFemale", departMaleFemale);
		return map;
	}

}
