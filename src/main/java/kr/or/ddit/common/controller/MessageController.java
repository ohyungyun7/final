package kr.or.ddit.common.controller;



import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

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

import kr.or.ddit.common.service.MessageService;
import kr.or.ddit.vo.AdminVO;
import kr.or.ddit.vo.NoteVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.TeacherVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@PreAuthorize("isAuthenticated()")
@Slf4j
@Controller
@RequestMapping("/msg")
public class MessageController {
	
	@Autowired
	MessageService msgService;
	
	/**
	 * 요청URI : /msg/messageList
	 * 받은 쪽지함
	 * @param session
	 * @param model
	 * @return common/messageList
	 */
	@GetMapping("/messageList")
	public String messageList(HttpSession session, Model model, @RequestParam(required=false) String write) {
		
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		List<NoteVO> noteVO = msgService.getNoteList(userVO);
		model.addAttribute("list", noteVO);
		model.addAttribute("user", userVO);
		
		//메시지 수 불러오기
		Map<String, Integer> msgCnt = msgService.msgCount(userVO);
		log.info("msgCnt : "+ msgCnt);
		model.addAttribute("msgCnt", msgCnt);
		
		//학생 리스트
		List<StudentVO> stuList = msgService.stuList();
		log.info("stuList : "+ stuList);
		model.addAttribute("stuList", stuList);
		
		//교수 리스트
		List<TeacherVO> teaList = msgService.teaList();
		log.info("teaList : "+ teaList);
		model.addAttribute("teaList", teaList);
		
		//교직원 리스트
		List<AdminVO> empList = msgService.empList();
		log.info("empList : "+ empList);
		model.addAttribute("empList", empList);
		
		model.addAttribute("write", write);
		
		return "common/messageList";
	}
	
	@PostMapping("/writeANote")
	public String writeANote(@Valid @ModelAttribute NoteVO noteVO,
							 HttpSession session, @RequestParam(required=false) int[] noteRev,  Model model) {
		log.info("noteVO : " + noteVO );
		log.info("revArr[] : " + Arrays.toString(noteRev) );
		List<NoteVO> noteArr = new ArrayList<NoteVO>();
		
		for(int i=0; i< noteRev.length; i++) {
			NoteVO vo = new NoteVO(noteVO);
			vo.setNoteRev(noteRev[i]);
			noteArr.add(vo);
		}
		//log.info("noteArr : " + noteArr.toString());
		int res =0;
		for(int i=0; i<noteArr.size(); i++) {
			res += msgService.insertMsg(noteArr.get(i));
		}
		log.info("성공 결과 : "+res+"");
		if(res>0) {
			if(noteVO.getNoteSend()==noteVO.getNoteRev()) {
				return "redirect:/msg/messageList?write=my";
			}else {
				return "redirect:/msg/messageList?write=success";
			}
		}else {
			return "redirect:/msg/messageList?write=fail";
		}
	}
	
	@ResponseBody
	@PostMapping("/detail.do")
	public NoteVO detail(@RequestBody Map<String, Object> data) {
		
		log.info("detail 왔냐");
		String noteNum = (String) data.get("noteNum");
		int userId = Integer.parseInt((String) data.get("userId"));
		
		NoteVO noteVO = new NoteVO();
		noteVO.setNoteNum(Integer.parseInt(noteNum));
		log.info("note vo (bf): " + noteVO);
		noteVO = msgService.getNote(noteVO, userId);
		log.info("note vo (af): " + noteVO);
		return noteVO;
	}
	
	@ResponseBody
	@PostMapping("/replyMsg.do")
	public int reply(@RequestBody NoteVO noteVo) {
		log.info("답장하기 도착!!");
		log.info("noteVo : "+noteVo);
		log.info("note vo (bf): " + noteVo);
		int res = msgService.insertMsg(noteVo);
		log.info("note vo (af): " + noteVo);
		return res;
	}

	
	@ResponseBody
	@RequestMapping("/alarm.do")
	public int alarm(String userId) {
//		log.info("안 읽음 메시지 구하기 도착!!");
//		log.info("userId: " + userId);
		
		int res = msgService.countUnread(Integer.parseInt(userId));
//		log.info("res: " + res);
		
		return res;
	}
	
	@ResponseBody
	@RequestMapping("/alarmList.do")
	public List<NoteVO> alarmList(String userId) {
//		log.info("안 읽음 목록 도착!!");
//		log.info("userId: " + userId);
		
		List<NoteVO> result = msgService.unreadList(Integer.parseInt(userId));
//		log.info("result : " + result);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping(value="/revList.do")
	public List<NoteVO> revList(@RequestParam String userId) {
		log.info("ajax 받은 메시지 목록 도착!!");
//		log.info("userId: " + userId);
		
		List<NoteVO> result = msgService.revList(Integer.parseInt(userId));
		log.info("result : " + result);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/sendList.do")
	public List<NoteVO> sendList(@RequestParam String userId) {
		log.info("ajax 보낸 메시지 도착!!");
//		log.info("userId: " + userId);
		
		List<NoteVO> result = msgService.sendList(Integer.parseInt(userId));
		log.info("result : " + result);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/delList.do")
	public List<NoteVO> delList(@RequestParam String userId) {
		log.info("ajax 삭제 메시지 도착!!");
		log.info("userId: " + userId);
		
		List<NoteVO> result = msgService.delList(Integer.parseInt(userId));
		log.info("result : " + result);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/deleteMsg.do")
	public int deleteMsg(@RequestParam String delNum, @RequestParam String userId) {
		log.info("노트 삭제 컨트롤러 도착!!");
		log.info("delNum: " + delNum + "userId : "+ userId);
		
		int result = msgService.deleteMsg(Integer.parseInt(delNum), Integer.parseInt(userId));
		log.info("result : " + result);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/selfList.do")
	public List<NoteVO> selfList(@RequestParam String userId) {
		log.info("selfList 컨트롤러 도착!!");
		log.info("userId : "+ userId);
		
		List<NoteVO> result = msgService.selfList(Integer.parseInt(userId));
		log.info("result : " + result);
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
}















