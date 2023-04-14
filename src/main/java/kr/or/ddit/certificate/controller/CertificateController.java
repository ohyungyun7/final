package kr.or.ddit.certificate.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.certificate.service.CertificateService;
import kr.or.ddit.vo.IssueCertificateVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@PreAuthorize("hasRole('ROLE_STU')")
@RequestMapping("/certificate")
public class CertificateController {
	
	@Autowired
	CertificateService certificateSerivce;

	@GetMapping("/issueCertificate")
	public String issueCertificate(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		Map<String, Object> stuInfo = certificateSerivce.getStuInfo(userVO.getUsername());
		model.addAttribute("stuInfo", stuInfo);
		
		return "certificate/issueCertificate";
	}

	@GetMapping("/lokerCertificate")
	public String lokerCertificate(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		List<Map<String, Object>> icMapList = certificateSerivce.getIcList(userVO.getUsername());
		
		model.addAttribute("icMapList", icMapList);
		return "certificate/lokerCertificate";
	}
	
	@ResponseBody
	@GetMapping("/getPrice")
	public int getPrice(String ctSnum) {
		return certificateSerivce.getPrice(ctSnum);
	}
	
//	@ResponseBody
//	@PostMapping("/getStuInfo")
//	public Map<String, Object> getStuInfo(HttpServletRequest request) {
//		HttpSession session = request.getSession();
//		UserVO userVO = (UserVO) session.getAttribute("userVO");
//		
//		return certificateSerivce.getStuInfo(userVO.getUsername());
//	}
	
	@ResponseBody
	@PostMapping("/issuedCertificate")
	public int issuedCertificate(IssueCertificateVO icVO, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		icVO.setStuNum(userVO.getUsername());
		
		return certificateSerivce.issuedCertificate(icVO);
	}
	
	@GetMapping("/downLoad/{ctSnum}")
	public String downLoad(@PathVariable String ctSnum, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		Map<String, Object> info = certificateSerivce.getInfoForFile(ctSnum, userVO.getUsername());
		
		model.addAttribute("info", info);
		
		return "certificate/files/" + ctSnum;
	}
}
