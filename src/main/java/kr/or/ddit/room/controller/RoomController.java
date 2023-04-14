package kr.or.ddit.room.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.room.service.RoomService;
import kr.or.ddit.vo.BuildingVO;
import kr.or.ddit.vo.RoomVO;
import lombok.extern.slf4j.Slf4j;

@PreAuthorize("hasAnyRole('ROLE_STU','ROLE_ADMIN')")
@Slf4j
@Controller
@RequestMapping("/room")
public class RoomController {
	
	@Autowired
	RoomService roomService;

	@GetMapping("/list")
	public String getAll(Model model) {
		
		List<RoomVO> roomList = roomService.getList();
		model.addAttribute("roomList", roomList);
		List<BuildingVO> bldgList = roomService.getBldgList();
		model.addAttribute("bldgList", bldgList);
		
		return "room/roomList";
	}

}
