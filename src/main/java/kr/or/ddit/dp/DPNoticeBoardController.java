package kr.or.ddit.dp;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
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

import kr.or.ddit.dp.service.IDPNotieBoardService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.DepartmentFileVO;
import kr.or.ddit.vo.DepartmentNoticeVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/dpNotieBoard")
@Slf4j
@Controller
public class DPNoticeBoardController {

	@Autowired
	IDPNotieBoardService service;

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/dpNoticeBoardList")
	public String dpNoticeBoardList(HttpServletRequest request, Model model,
				@RequestParam (value = "currentPage", required = false, defaultValue = "1") int currentPage,
				@RequestParam (value = "size", required = false, defaultValue = "10") int size,
				@RequestParam(value = "keyword", required = false) String keyword,
				@RequestParam(value = "category", required = false) String category
			) {

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int deptNum = userVO.getDeptNum();
		int username = userVO.getUsername();

		// 검색 조건
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("category", category);
		map.put("deptNum", deptNum);

		int total = service.getTotal(map);

		map.put("size", size);
		map.put("currentPage", currentPage);

		List<DepartmentNoticeVO> dpNoticeList = service.getDPNoticeList(map);
		model.addAttribute("data",
				new ArticlePage<DepartmentNoticeVO>(total, currentPage, size, dpNoticeList));
		model.addAttribute("username", username);

		return "dp/DPNoticeBoardList";
	}

	@ResponseBody
	@PostMapping("/dpNoticeList")
	public Object dpNoticeList(@RequestParam int dpNum) {
		log.info("dpNoticeList에 옴");
		List<DepartmentNoticeVO> dpList = service.mainDPNoticeList(dpNum);
		log.info("dpList :" + dpList);
		return dpList;
	}



	@PreAuthorize("hasRole('ROLE_TEA')")
	@GetMapping("/dpNoticeBoardForm")
	public String dpNoticeBoardForm(Model model) {

		int dnNum = service.getDnNum();

		model.addAttribute("dnNum", dnNum);

		return "dp/dpNoticeBoardForm";
	}

	@PostMapping("/createPost")
	public String createPost(@ModelAttribute DepartmentNoticeVO dnVO, Model model, HttpServletRequest request) {

		if(dnVO.getFiles()[0].getOriginalFilename() != null && !dnVO.getFiles()[0].getOriginalFilename().equals("")) {
			String uploadFolder
			= "C:\\eGovFrameDev-3.10.0-64bit\\workspace\\sik\\src\\main\\webapp\\resources\\upload";

			// make folder 시작 ------------------------
			File uploadPath = new File(uploadFolder, getFolder());
			log.info("uploadPath : " + uploadPath);

			// 만약 연/월/일 해당 폴더가 없다면 생성
			if (uploadPath.exists() == false) {
				uploadPath.mkdirs();
			}
			// make folder 종료 ------------------------

			log.info("dnVO : " + dnVO);

			MultipartFile[] multipartFiles = dnVO.getFiles();
			log.info("mltipartFile : " + multipartFiles);

			List<DepartmentFileVO> voList = new ArrayList<DepartmentFileVO>();
			int seq = 1;
			// uploadFile 정보를 통해서 attachVOList에 값들을  setting 해줘야 함
			// 배열로부터 하나씩 파일을 꺼내오자
			for (MultipartFile multipartFile : multipartFiles) {
				log.info("-----------------------------");
				DepartmentFileVO vo = new DepartmentFileVO();

				// 실제 파일 명
				String uploadFileName = multipartFile.getOriginalFilename();


				// ------ 같은 날 같은 이미지를 업로드 시 파일 중복 방지 시작 ---------------------
				// java.util.UUID >> 랜덤값 생성
				UUID uuid = UUID.randomUUID(); // 임의의 값을 생성
				// 원래 파일 이름과 구분하기 위해 _를 붙임
				uploadFileName = uuid.toString() + "_" + uploadFileName;
				// ------ 같은 날 같은 이미지를 업로드 시 파일 중복 방지 종료 ---------------------

				// 파일 객체 설계(복사할 대상 경로, 파일명)
				File saveFile = new File(uploadPath, uploadFileName);

				try {
					// 파일 복사가 일어남
					multipartFile.transferTo(saveFile);

				} catch (IllegalStateException e) {
					log.error(e.getMessage());
					return "0";
				} catch (IOException e) {
					log.error(e.getMessage());
					return "0";
				}

				vo.setDfNum(seq++);
				vo.setDfNm("/" + getFolder().replace("\\", "/") + "/" + uploadFileName);
				vo.setDeNum(dnVO.getDnNum());
				voList.add(vo);
			}
			dnVO.setDfVOList(voList);
		}

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int teaNum = userVO.getUsername();
		int deptNum = userVO.getDeptNum();

		dnVO.setTeaNum(teaNum);
		dnVO.setDeptNum(deptNum);

		log.info("(after) dnVO : " + dnVO);

		int result = service.createPost(dnVO);

		if(result > 0) {
			return "redirect:/dpNotieBoard/detailView?dnNum=" + dnVO.getDnNum();
		}else {
			model.addAttribute("dnVO", dnVO);
			return "dp/dpNoticeBoardForm";
		}
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/detailView")
	public String dpNoticeBoardDetail(int dnNum, Model model, HttpServletRequest request) {

		log.info("dnNum : " + dnNum);

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int username = userVO.getUsername();

		DepartmentNoticeVO dnVO = service.detail(dnNum);

		model.addAttribute("data", dnVO);
		model.addAttribute("username", username);

		return "dp/dpNoticeBoardDetail";
	}

	@GetMapping("/delete")
	public String delete(int dnNum) {
		int result = service.delete(dnNum);

		if(result > 0) {
			return "redirect:/dpNotieBoard/dpNoticeBoardList";
		}else {
			return "redirect:/dpNotieBoard/dpNoticeBoardList";
		}
	}

	@PreAuthorize("hasRole('ROLE_TEA')")
	@GetMapping("/update")
	public String update(int dnNum, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int username = userVO.getUsername();

		DepartmentNoticeVO dnVO = service.detail(dnNum);

		model.addAttribute("data", dnVO);
		model.addAttribute("username", username);

		return "dp/dpNoticeBoardUpdate";
	}

	@ResponseBody
	@PostMapping("/delteFile")
	public int delteFile(@RequestParam int dfNum) {
		log.info("dfNum : " + dfNum);

		int result = service.deleteFile(dfNum);

		return result;
	}

	@PostMapping("/updatePost")
	public String updatePost(DepartmentNoticeVO dnVO, Model modeal) {

		if(dnVO.getFiles()[0].getOriginalFilename() != null && !dnVO.getFiles()[0].getOriginalFilename().equals("")) {
			String uploadFolder
			= "C:\\eGovFrameDev-3.10.0-64bit\\workspace\\sik\\src\\main\\webapp\\resources\\upload";

			// make folder 시작 ------------------------
			File uploadPath = new File(uploadFolder, getFolder());
			log.info("uploadPath : " + uploadPath);

			// 만약 연/월/일 해당 폴더가 없다면 생성
			if (uploadPath.exists() == false) {
				uploadPath.mkdirs();
			}
			// make folder 종료 ------------------------

			log.info("dnVO : " + dnVO);

			MultipartFile[] multipartFiles = dnVO.getFiles();
			log.info("mltipartFile : " + multipartFiles);

			List<DepartmentFileVO> voList = new ArrayList<DepartmentFileVO>();
			int seq = 1;
			// uploadFile 정보를 통해서 attachVOList에 값들을  setting 해줘야 함
			// 배열로부터 하나씩 파일을 꺼내오자
			for (MultipartFile multipartFile : multipartFiles) {
				log.info("-----------------------------");
				DepartmentFileVO vo = new DepartmentFileVO();

				// 실제 파일 명
				String uploadFileName = multipartFile.getOriginalFilename();


				// ------ 같은 날 같은 이미지를 업로드 시 파일 중복 방지 시작 ---------------------
				// java.util.UUID >> 랜덤값 생성
				UUID uuid = UUID.randomUUID(); // 임의의 값을 생성
				// 원래 파일 이름과 구분하기 위해 _를 붙임
				uploadFileName = uuid.toString() + "_" + uploadFileName;
				// ------ 같은 날 같은 이미지를 업로드 시 파일 중복 방지 종료 ---------------------

				// 파일 객체 설계(복사할 대상 경로, 파일명)
				File saveFile = new File(uploadPath, uploadFileName);

				try {
					// 파일 복사가 일어남
					multipartFile.transferTo(saveFile);

				} catch (IllegalStateException e) {
					log.error(e.getMessage());
					return "0";
				} catch (IOException e) {
					log.error(e.getMessage());
					return "0";
				}

				vo.setDfNum(seq++);
				vo.setDfNm("/" + getFolder().replace("\\", "/") + "/" + uploadFileName);
				vo.setDeNum(dnVO.getDnNum());
				voList.add(vo);
			}
			dnVO.setDfVOList(voList);
		}

		int result = service.updatePost(dnVO);

		return "redirect:/dpNotieBoard/detailView?dnNum=" + dnVO.getDnNum();
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
