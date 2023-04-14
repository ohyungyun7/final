package kr.or.ddit.common.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.common.service.MessageService;
import kr.or.ddit.mapper.MessageMapper;
import kr.or.ddit.vo.AdminVO;
import kr.or.ddit.vo.NoteVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.TeacherVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	MessageMapper msgMapper;
	
	@Override
	public List<NoteVO> getNoteList(UserVO userVO) {
		List<NoteVO> vo = msgMapper.getNoteList(userVO);
		log.info("noteVO : "+ vo);
		return vo;
	}

	@Override
	public Map<String, Integer> msgCount(UserVO userVO) {
		int unread = msgMapper.unReadMsgCount(userVO);
		int send = msgMapper.sendMsgCount(userVO);
		int rev = msgMapper.revMsgCount(userVO);
		int total = msgMapper.totalCount(userVO);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("unread", unread);
		map.put("send", send);
		map.put("rev", rev);
		map.put("total", total);
		
		return map;
	}

	@Override
	public List<StudentVO> stuList() {
		List<StudentVO> stu = msgMapper.stuList();
		return stu;
	}

	@Override
	public List<TeacherVO> teaList() {
		List<TeacherVO> tea = msgMapper.teaList();
		return tea;
	}

	@Override
	public List<AdminVO> empList() {
		List<AdminVO> emp = msgMapper.empList();
		return emp;
	}

	@Override
	public int insertMsg(NoteVO noteVO) {
		
		if(noteVO.getNoteSend()==noteVO.getNoteRev()) {
			noteVO.setNoteStatus(1);
		}
		int res = 0;
		Object obj = msgMapper.insertMsg(noteVO);
		log.info("obj : "+obj);
		if(obj==null)res=1;
		return res;
	}

	@Override
	public NoteVO getNote(NoteVO noteVO,int userId) {
		noteVO = msgMapper.getNote(noteVO);
		// 상태 읽음으로 변경
		if(noteVO.getNoteSend()!=userId) {
			int res = msgMapper.reading(noteVO);
			log.info("상태 변경 "+ res);
		}
		return noteVO;
	}

	@Override
	public int countUnread(int userId) {
		UserVO userVO = new UserVO();
		userVO.setUsername(userId);
		int no = msgMapper.unReadMsgCount(userVO);
		return no;
	}

	@Override
	public List<NoteVO> unreadList(int userId) {
		List<NoteVO> vo = msgMapper.unreadList(userId);
		return vo;
	}

	@Override
	public List<NoteVO> revList(int userId) {
		List<NoteVO> vo = msgMapper.revList(userId);
		return vo;
	}

	@Override
	public List<NoteVO> sendList(int userId) {
		List<NoteVO> vo = msgMapper.sendList(userId);
		return vo;
	}

	@Override
	public int deleteMsg(int noteNum, int username) {
		NoteVO noteVO = new NoteVO();
		noteVO.setNoteNum(noteNum);
		//글 정보를 불러옴
		noteVO = msgMapper.getNote(noteVO);
		
		int res = 0;
		if(noteVO.getNoteStatus()>5) {
			noteVO.setNoteStatus(9);
			res = msgMapper.changeStat(noteVO);
		}else {
			if(noteVO.getNoteSend()==username) {
				//내가 보낸 사람이었으면 5
				noteVO.setNoteStatus(5);
				res = msgMapper.changeStat(noteVO);
			}else if(noteVO.getNoteRev()==username) {
				//내가 받는 사람이었으면 6
				noteVO.setNoteStatus(6);
				res = msgMapper.changeStat(noteVO);
			}
		}
		return res;
	}

	@Override
	public List<NoteVO> delList(int userId) {
		List<NoteVO> vo = msgMapper.delList(userId);
		return vo;
	}

	@Override
	public List<NoteVO> selfList(int userId) {
		List<NoteVO> vo = msgMapper.selfList(userId);
		return vo;
	}


}
