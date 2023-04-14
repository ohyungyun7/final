package kr.or.ddit.util;

import java.io.UnsupportedEncodingException;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class DownloadFileController {
	
	// 요청URI : http://localhost/download?
	// 요청 파라미터 : fileName=/2023/01/30/922035f6-e453-434e-9d69-dd68588308f7_nullPointer.jpg
	@ResponseBody
	@GetMapping("/downloadFile")
	public ResponseEntity<Resource> download(@RequestParam String fileName){
		log.info("fileName : " + fileName);
		
		// resource : 다운로드 받을 파일(자원)
		Resource resource = new FileSystemResource(
				"C:\\eGovFrameDev-3.10.0-64bit\\workspace\\sik\\src\\main\\webapp\\resources\\upload\\"
				+ fileName
				);
		
		// 경로를 제외한 파일 이름만 가져옴 : 922035f6-e453-434e-9d69-dd68588308f7_nullPointer.jpg
		String resourceName = resource.getFilename();
		
		// header : 인코딩 정보, 파일명 정보
		HttpHeaders headers = new HttpHeaders();
		try {
			headers.add("Content-Disposition", "attachment;filename=" 
					+ new String(resourceName.getBytes("UTF-8"), "ISO-8859-1"));
		} catch (UnsupportedEncodingException e) {
			log.info(e.getMessage());
		}
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	
}
