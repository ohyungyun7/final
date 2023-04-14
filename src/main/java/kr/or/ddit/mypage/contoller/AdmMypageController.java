package kr.or.ddit.mypage.contoller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.annotation.Target;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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

import kr.or.ddit.mypage.service.IAdmMypageService;
import kr.or.ddit.vo.AdminVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/admin")
@Slf4j
@Controller
public class AdmMypageController {

	@Autowired
	IAdmMypageService service;

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

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/admMypage")
	public String admMypage(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		int username = userVO.getUsername();
		String pw = userVO.getPassword();

		AdminVO admVO = service.admInfo(username);

		admVO.setPassword(pw);

		int bir = admVO.getEmpReg1();
		String birth = bir + "";
		birth = birth.substring(0, 2) + "년 " + birth.substring(2, 4) + "월 " + birth.substring(4) + "일";
		admVO.setBirth(birth);

		model.addAttribute("admVO", admVO);

		return "mypage/admMypage";
	}

	@ResponseBody
	@PostMapping("/mainAdmInfo")
	public Object mainAdmInfo(@RequestParam int admNum) {
		AdminVO admVO = service.admInfo(admNum);
		return admVO;
	}

	@ResponseBody
	@PostMapping("/mainInfo")
	public Object mainInfo() {
		Map<String, Integer> map = service.mainInfo();
		return map;
	}

	@ResponseBody
	@GetMapping("/statistics")
	public Object statistics() {
		List<Map<String, Integer>> mapList = service.statistics();
		return mapList;
	}

	@PostMapping("/myPageUpdate")
	public String stuUpdate(@ModelAttribute AdminVO admVO, Model model) {

		log.info("admVO! : " + admVO);

		if(admVO.getImage().getOriginalFilename() != null && !admVO.getImage().getOriginalFilename().equals("")) {
			String uploadFolder
			= "C:\\eGovFrameDev-3.10.0-64bit\\workspace\\sik\\src\\main\\webapp\\resources\\upload";

			File uploadPath = new File(uploadFolder, getFolder());

			if(uploadPath.exists() == false) {
				uploadPath.mkdirs();
			}

			MultipartFile productImage = admVO.getImage();
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
			admVO.setEmpPhoto("/" + getFolder().replace("\\", "/") + "/" + uploadFileName);
		}

		int result = service.admMypageUpdate(admVO);

		if(result < 0 ) {
			return "redirect:/admin/mypagePWcheck";
		}else {
			return "redirect:/admin/admMypage";
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
//		UserVO(username=201801010, password=alal0808~!, enabled=null, auth=ROLE_STU, name=홍효미, photo=null, deptNum=1, status=0, major=null)

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
