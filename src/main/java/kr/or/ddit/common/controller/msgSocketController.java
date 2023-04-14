package kr.or.ddit.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class msgSocketController {
	
//	@RequestMapping("/mychatt")
	@GetMapping("/mychatt")
	public String chatt() {
		log.info("여기는 msgSocketController");
		return "common/msg";
	}

}
