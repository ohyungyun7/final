package kr.or.ddit.department;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.department.service.DPService;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.TeacherVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/manage")
@Controller
public class DPController {

	@Autowired
	DPService dpService;

	/**
	 * 학과 조회
	 * 관리자
	 */
	@GetMapping("/deptManage")
	public String deptList(Model model) {

		List<DepartmentVO> deptList = this.dpService.deptList();
		model.addAttribute("data", deptList);
		return "manage/deptManage";
	}

	/**
	 * 모달에서 단과대학 출력
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getCollNm")
	public Map<String, Object> getCollNm(){

		log.info("getCollNm에 왔다");

		List<DepartmentVO> getCollNmList = this.dpService.getCollNm();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", getCollNmList);
		return map;
	}

	/**
	 * 학과 삭제
	 * @return
	 */
	@ResponseBody
	@PostMapping("/deleteNum")
	public Map<String, Object> deleteNum(@RequestParam Map<String, Object> map){

		log.info("deleteNum에서 넘겨받은 map의 값 : " + map);

		int result = this.dpService.deleteNum(map);

		Map<String, Object>map2 = new HashMap<String, Object>();

		map2.put("result", result);

		return map2;
	}


	/**
	 * 학과 등록
	 */
	@ResponseBody
	@PostMapping("/getProNum")
	public Map<String, Object> getProNum(@RequestBody Map<String, Object> map2){
		log.info("getProNum에 왔다");
		log.info("map : "+map2);
		List<TeacherVO> getProNumList = this.dpService.getProNum(map2);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data",getProNumList);
		return map;
	}

	@ResponseBody
	@PostMapping("/createCollNm")
	public Map<String, Object> createCollNm(@RequestBody Map<String, Object>map){
		log.info("createCollNm 에서 넘어온 map : " + map);
		int createCollNm = this.dpService.createCollNm(map);

		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("result", createCollNm);

		return map2;
	}

	@ResponseBody
	@PostMapping("/deptNum")
	public Map<String, Object> deptNum(@RequestBody Map<String, Object>map){
		log.info("deptNum에서 온 번호" + map);
		DepartmentVO departmentVO = this.dpService.deptNum(map);
		log.info("departmentVO : " + departmentVO);
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("data", departmentVO);
		return map2;
	}

	@ResponseBody
	@PostMapping("/updateForm")
	public Map<String, Object> updateForm(@RequestBody Map<String, Object>map){
		log.info("updateForm에서 온 번호" + map);

		String[] split=(map.get("university1")+"").split(",");
//		map.put("university1", split[0]);
		map.put("deptNum", split[1]);


		log.info("==================================================");
		log.info("변환 후 updateForm에서 넘어온 data : " + map);
		log.info("==================================================");
		int result = this.dpService.update(map);

		log.info("result : " + result);

		Map<String, Object> map2 = new HashMap<String, Object>();
		DepartmentVO departmentVO = this.dpService.deptNum(map);
		log.info("departmentVO : " + departmentVO);

		map2.put("data", departmentVO);

		return map2;

	}
}

