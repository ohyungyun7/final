package kr.or.ddit.mypage.contoller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.mypage.service.ITeaMypageService;
import kr.or.ddit.vo.TeacherVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;


@RequestMapping("/teacher")
@Slf4j
@Controller
public class TeaMypageController {

	@Autowired
	ITeaMypageService service;

	@GetMapping("/mypagePWcheck")
	public String mypagePWcheck1() {
		return "mypage/stuPwCheck";
	}

	@ResponseBody
	@PostMapping("/mypagePWcheck")
	public Object mypagePWcheck2(@RequestParam("pw") String pw, HttpServletRequest request) {

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		String password = userVO.getPassword();

		Map<String, String> data = new HashMap<String, String>();

		String result = "";
		if(pw.equals(password)) {
			result = "o";
		}else {
			result = "x";
		}
		data.put("data", result);

		return data;
	}

	@PreAuthorize("hasRole('ROLE_TEA')")
	@GetMapping("/teaMypage")
	public String teaMypage(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int username = userVO.getUsername();
		String pw = userVO.getPassword();

		TeacherVO teaVO = service.teaInfo(username);
		teaVO.setPassword(pw);

		int bir = teaVO.getTeaReg1();
		String birth = bir + "";
		birth = birth.substring(0, 2) + "년 " + birth.substring(2, 4) + "월 " + birth.substring(4) + "일";
		teaVO.setBirth(birth);

		model.addAttribute("teaVO", teaVO);

		return "mypage/proMypage";
	}

	@ResponseBody
	@PostMapping("/mainTeaInfo")
	public Object mainTeaInfo(@RequestParam int teaNum) {
		TeacherVO teaVO = service.teaInfo(teaNum);
		return teaVO;
	}

	@ResponseBody
	@PostMapping("/getCount")
	public Object getCount(@RequestParam int teaNum) {
		Map<String, Integer> map = service.getCount(teaNum);
		return map;
	}

	@PostMapping("/myPageUpdate")
	public String stuUpdate(@ModelAttribute TeacherVO teaVO) {

		if(teaVO.getImage().getOriginalFilename() != null && !teaVO.getImage().getOriginalFilename().equals("")) {
			String uploadFolder
			= "C:\\eGovFrameDev-3.10.0-64bit\\workspace\\sik\\src\\main\\webapp\\resources\\upload";

			File uploadPath = new File(uploadFolder, getFolder());

			if(uploadPath.exists() == false) {
				uploadPath.mkdirs();
			}

			MultipartFile productImage = teaVO.getImage();
			String uploadFileName = productImage.getOriginalFilename();

			UUID uuid = UUID.randomUUID();

			uploadFileName = uuid.toString() + "_" + uploadFileName;

			File saveFile = new File(uploadPath, uploadFileName);

			try {
				productImage.transferTo(saveFile);
			} catch (IllegalStateException e) {
				log.error(e.getMessage());
				return "0";
			} catch (IOException e) {
				log.error(e.getMessage());
				return "0";
			}
			teaVO.setTeaPhoto("/" + getFolder().replace("\\", "/") + "/" + uploadFileName);
		}

		int result = service.teaMypageUpdate(teaVO);

		if(result < 0 ) {
			return "redirect:/teacher/mypagePWcheck";
		}else {
			return "redirect:/teacher/teaMypage";
		}
	}

	@ResponseBody
	@PostMapping("/pwCheck")
	public Object pwCheck(@RequestParam("curPw") String curPw, HttpServletRequest request) {

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		String pw = userVO.getPassword();
		curPw = curPw.trim();

		log.info("curPw : " + curPw);
		log.info("pw : " + pw);

		Map<String, String> data = new HashMap<String, String>();

		String result = "";
		if(pw.equals(curPw)) {
			result = "비밀번호가 일치합니다.";
		}else {
			result = "비밀번호가 일치하지 않습니다.";
		}

		data.put("data", result);

		return data;
	}

	@ResponseBody
	@PostMapping("/pwUpadate")
	public int pwUpadate(@RequestParam("pw") String pw, HttpServletRequest request) {

		log.info("pwUpadate에 왔다.");
		log.info("pw : " + pw);

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		log.info("username : " +userVO.getUsername());
		userVO.setPassword(pw);

		log.info("userVO : " + userVO);

		int result = service.pwUpdate(userVO);

		return result;
	}

	// 연/월/일  폴더 생성
	public static String getFolder() {
		 // make folder 시작----------------------------
	      // 2023-01-27 형식 지정
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	      // 날짜 객체 생성(java.util 패키지)
	      Date date = new Date();

	      // 2023-01-27
	      String str = sdf.format(date);

	      // 단순 날짜 문자를 File객체의 폴더타입으로 바꾸기
	      return str.replace("-", File.separator);
	}

}
