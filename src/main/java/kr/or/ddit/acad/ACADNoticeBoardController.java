package kr.or.ddit.acad;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.acad.service.IACADNoticeBoardService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.NoticeBoardFileVO;
import kr.or.ddit.vo.NoticeBoardVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/acadNotice")
@Controller
public class ACADNoticeBoardController {

	@Autowired
	IACADNoticeBoardService service;

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/list")
	public String acadNoticeList(HttpServletRequest request, Model model,
			@RequestParam (value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam (value = "size", required = false, defaultValue = "10") int size,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "cate", required = false, defaultValue = "일반") String cate
		) {

		log.info("keyword : " + keyword);
		log.info("category : " + category);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("category", category);
		map.put("cate", cate);

		int total = service.getTotal(map);

		map.put("size", size);
		map.put("currentPage", currentPage);

		List<NoticeBoardVO> noticeList = service.getNoticeList(map);

		model.addAttribute("data",
				new ArticlePage<NoticeBoardVO>(total, currentPage, size, noticeList));

		log.info("noticeList : " + noticeList);

		model.addAttribute("cate", cate);

		return "acad/acadNoticeBoardList";
	}

	@ResponseBody
	@GetMapping("/mainAcadNoticeList")
	public Object mainAcadNoticeList() {
		List<NoticeBoardVO> acadList = service.mainAcadNoticeList();

		return acadList;
	}


	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/noticeForm")
	public String noticeForm(Model model) {

		int nbNum = service.getNbNum();

		model.addAttribute("nbNum", nbNum);

		return "acad/acadNoticeForm";
	}

	@PostMapping("/createPost")
	public String createPost(NoticeBoardVO nbVO, HttpServletRequest request) {

		if(nbVO.getFiles()[0].getOriginalFilename() != null && !nbVO.getFiles()[0].getOriginalFilename().equals("")) {
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

			MultipartFile[] multipartFiles = nbVO.getFiles();
			log.info("mltipartFile : " + multipartFiles);

			List<NoticeBoardFileVO> voList = new ArrayList<NoticeBoardFileVO>();
			int seq = 1;
			// uploadFile 정보를 통해서 attachVOList에 값들을  setting 해줘야 함
			// 배열로부터 하나씩 파일을 꺼내오자
			for (MultipartFile multipartFile : multipartFiles) {
				log.info("-----------------------------");
				NoticeBoardFileVO vo = new NoticeBoardFileVO();

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

					if(checkImageType(saveFile)) {
						vo.setNbfCate(2);
					}else {
						vo.setNbfCate(1);
					}

				} catch (IllegalStateException e) {
					log.error(e.getMessage());
					return "0";
				} catch (IOException e) {
					log.error(e.getMessage());
					return "0";
				}

				vo.setNbfNum(seq++);
				vo.setNbfFilenm("/" + getFolder().replace("\\", "/") + "/" + uploadFileName);
				vo.setNNum(nbVO.getNbNum());
				voList.add(vo);
			}
			nbVO.setFileVOList(voList);
		}

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		int username = userVO.getUsername();
		nbVO.setEmpNum(username);

		log.info("filesList : " + nbVO.getFileVOList());

		int result = service.createPost(nbVO);

		return "redirect:/acadNotice/detailView?nbNum=" + nbVO.getNbNum();
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/detailView")
	public String detailView(int nbNum, Model model, HttpServletRequest request) {

		log.info("detailView에 왔다.");

		NoticeBoardVO nbVO = service.detail(nbNum);
		model.addAttribute("data", nbVO);

		log.info("nbVO.list : " + nbVO.getFileVOList());

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		String auth = userVO.getAuth();
		model.addAttribute("auth", auth);

		return "acad/acadNoticeBoardDetail";
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/update")
	public String update(int nbNum, Model model) {

		NoticeBoardVO nbVO = service.detail(nbNum);
		model.addAttribute("data", nbVO);

		return "acad/acadNoticeBordUpdate";

	}

	@ResponseBody
	@PostMapping("/delteFile")
	public int delteFile(@RequestParam int nbfNum) {

		log.info("nfNum : " + nbfNum);

		int result = service.deleteFile(nbfNum);
		return result;

	}

	@ResponseBody
	@PostMapping("/delete")
	public int delete(@RequestParam int nbNum) {

		log.info("nbNum : " + nbNum);

		int result = service.delete(nbNum);

		return result;
	}

	@PostMapping("/updatePost")
	public String updatePost(NoticeBoardVO nbVO, HttpServletRequest request) {

		log.info("updatePost에 왔다.");
		log.info("nbVO : " + nbVO);

		if(nbVO.getFiles()[0].getOriginalFilename() != null && !nbVO.getFiles()[0].getOriginalFilename().equals("")) {
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

			MultipartFile[] multipartFiles = nbVO.getFiles();
			log.info("mltipartFile : " + multipartFiles);

			List<NoticeBoardFileVO> voList = new ArrayList<NoticeBoardFileVO>();
			int seq = 1;
			// uploadFile 정보를 통해서 attachVOList에 값들을  setting 해줘야 함
			// 배열로부터 하나씩 파일을 꺼내오자
			for (MultipartFile multipartFile : multipartFiles) {
				log.info("-----------------------------");
				NoticeBoardFileVO vo = new NoticeBoardFileVO();

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

					if(checkImageType(saveFile)) {
						vo.setNbfCate(2);
					}else {
						vo.setNbfCate(1);
					}

				} catch (IllegalStateException e) {
					log.error(e.getMessage());
					return "0";
				} catch (IOException e) {
					log.error(e.getMessage());
					return "0";
				}

				vo.setNbfNum(seq++);
				vo.setNbfFilenm("/" + getFolder().replace("\\", "/") + "/" + uploadFileName);
				vo.setNNum(nbVO.getNbNum());
				voList.add(vo);
			}
			nbVO.setFileVOList(voList);
		}

		log.info("fileList : " + nbVO.getFileVOList());

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		int username = userVO.getUsername();
		nbVO.setEmpNum(username);

		int result = service.updatePost(nbVO);

		return "redirect:/acadNotice/detailView?nbNum=" + nbVO.getNbNum();

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

	public static boolean checkImageType(File file) {
		/*
		.jpeg / .jpg(JPEG 이미지)의 MIME 타입 : iamge / jpeg
		*/
		// MIME 타입을 통해 이미지 여부 확인
		try {
			// file.toPath() : 파일 객체를 path객체로 변환
			String contentType = Files.probeContentType(file.toPath());
			log.info("contnetType : " + contentType);
			// MIME 타입 정보가 image로 시작하는지 여부를 return
			return contentType.startsWith("image");
		} catch (IOException e) {
			log.error(e.getMessage());
		}
		// 이 파일이 이미지가 아닐 경우
		return false;
	}


}
