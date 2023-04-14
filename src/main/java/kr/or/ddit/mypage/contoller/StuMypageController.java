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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.mypage.service.IStuMypageService;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/student")
@Slf4j
@Controller
public class StuMypageController {

	@Autowired
	IStuMypageService service;

	@PreAuthorize("isAuthenticated()")
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


	@PreAuthorize("hasRole('ROLE_STU')")
	@GetMapping("/stuMypage")
	public String stuMypage(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		int username = userVO.getUsername();
		String pw = userVO.getPassword();

		StudentVO stuVO = service.stuInfo(username);

		stuVO.setPassword(pw);

		int semester = Integer.parseInt(stuVO.getStuSemester());
		double grade = semester / 2.0;

		if(grade <= 1) {
			stuVO.setGrade("1학년");
		}else {
			int a = (int) Math.round(grade);
			stuVO.setGrade(a + "학년");
		}

		if(stuVO.getStuStatus() == 0) {
			stuVO.setStustat("재학");
		}else if(stuVO.getStuStatus() == 1){
			stuVO.setStustat("휴학");
		}else if(stuVO.getStuStatus() == 2){
			stuVO.setStustat("자퇴");
		}else if(stuVO.getStuStatus() == 3){
			stuVO.setStustat("졸업");
		}else {
			stuVO.setStustat("제적");
		}

		int bir = stuVO.getStuReg1();
		String birth = bir + "";
		birth = birth.substring(0, 2) + "년 " + birth.substring(2, 4) + "월 " + birth.substring(4) + "일";
		stuVO.setBirth(birth);

		model.addAttribute("stuVO", stuVO);

		return "mypage/stuMypage";
	}

	@ResponseBody
	@GetMapping("/myPage")
	public Object myPage(HttpServletRequest request) {

		log.info("myPage에 왔다");

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		int username = userVO.getUsername();
		String pw = userVO.getPassword();

		StudentVO stuVO = service.stuInfo(username);

		stuVO.setPassword(pw);

		int semester = Integer.parseInt(stuVO.getStuSemester());
		double grade = semester / 2.0;

		if(grade < 1) {
			stuVO.setGrade("1학년");
		}else {
			int a = (int) Math.round(grade);
			stuVO.setGrade(a + "학년");
		}

		if(stuVO.getStuStatus() == 0) {
			stuVO.setStustat("재학");
		}else if(stuVO.getStuStatus() == 1){
			stuVO.setStustat("휴학");
		}else if(stuVO.getStuStatus() == 2){
			stuVO.setStustat("자퇴");
		}else if(stuVO.getStuStatus() == 3){
			stuVO.setStustat("졸업");
		}else {
			stuVO.setStustat("제적");
		}

		log.info("stuVO : " + stuVO);

		return stuVO;

	}



	@ResponseBody
	@PostMapping("/myPageUpdate")
	public Object myPageUpdate(StudentVO stuVO, HttpServletRequest request) {
		log.info("myPageUpdate 에 왔따.");
		log.info("stuVO :" + stuVO);

		if(stuVO.getImage().getOriginalFilename() != null && !stuVO.getImage().getOriginalFilename().equals("")) {

				String uploadFolder
				= "C:\\eGovFrameDev-3.10.0-64bit\\workspace\\sik\\src\\main\\webapp\\resources\\upload";
				
				String realPath = 
						"C:\\eGovFrameDev-3.10.0-64bit\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\sik\\resources\\upload";
				
				File uploadPath = new File(uploadFolder, getFolder());
				File uploadRealPath= new File(realPath, getFolder());

				if(!uploadPath.exists()) {
					uploadPath.mkdirs();
				}
				
				if(!uploadRealPath.exists()) {
					uploadRealPath.mkdirs();
				}
				

				MultipartFile productImage = stuVO.getImage();
				String uploadFileName = productImage.getOriginalFilename();

				UUID uuid = UUID.randomUUID();

				uploadFileName = uuid.toString() + "_" + uploadFileName;

				File saveFile = new File(uploadPath, uploadFileName);
				File saveRealFile = new File(uploadRealPath, uploadFileName);

				try {
					productImage.transferTo(saveFile);
					productImage.transferTo(saveRealFile);
				} catch (IllegalStateException e) {
					log.error(e.getMessage());
					return "0";
				} catch (IOException e) {
					log.error(e.getMessage());
					return "0";
				}
				stuVO.setStuPhoto("/" + getFolder().replace("\\", "/") + "/" + uploadFileName);

				HttpSession session = request.getSession();
				UserVO userVO = (UserVO)session.getAttribute("userVO");
				userVO.setPhoto(stuVO.getStuPhoto());
			}

			int result = service.stuMypageUpdate(stuVO);

			
			if(result > 0) {
				HttpSession session = request.getSession();
				UserVO userVO = (UserVO)session.getAttribute("userVO");
				int username = userVO.getUsername();
				String pw = userVO.getPassword();

				stuVO = service.stuInfo(username);

				stuVO.setPassword(pw);

				int semester = Integer.parseInt(stuVO.getStuSemester());
				double grade = semester % 2;

				if(grade < 1) {
					stuVO.setGrade("1학년");
				}else {
					int a = (int) Math.floor(grade);
					stuVO.setGrade(a + "학년");
				}

				if(stuVO.getStuStatus() == 0) {
					stuVO.setStustat("재학");
				}else if(stuVO.getStuStatus() == 1){
					stuVO.setStustat("휴학");
				}else if(stuVO.getStuStatus() == 2){
					stuVO.setStustat("자퇴");
				}else if(stuVO.getStuStatus() == 3){
					stuVO.setStustat("졸업");
				}else {
					stuVO.setStustat("제적");
				}

				int bir = stuVO.getStuReg1();
				String birth = bir + "";
				birth = birth.substring(0, 2) + "년 " + birth.substring(2, 4) + "월 " + birth.substring(4) + "일";
				stuVO.setBirth(birth);
			}
			return stuVO;
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
	public String getFolder() {
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
