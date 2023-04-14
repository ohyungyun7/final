package kr.or.ddit.study.chat.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.StudyChatMapper;
import kr.or.ddit.study.chat.service.StudyChatService;
import kr.or.ddit.vo.ReadCountVO;
import kr.or.ddit.vo.StudyChatVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class StudyChatServiceImpl implements StudyChatService {

	@Autowired
	StudyChatMapper studyChatMapper;
	
	@Override
	public List<StudyChatVO> getChatList(StudyChatVO paramVO) {
		List<StudyChatVO> chatVOList = studyChatMapper.getChatList(paramVO);
		List<ReadCountVO> rcList = studyChatMapper.readCount(paramVO);
		
		for(ReadCountVO rcVO : rcList) {
			for(StudyChatVO chatVO : chatVOList) {
				if(chatVO.getScNum() > rcVO.getSCount()) {
					chatVO.setReadCount(chatVO.getReadCount() + rcVO.getPlus());
				}
			}
		}
		return chatVOList;
	}

	@Override
	public int getMsgCount(StudyChatVO paramVO) {
		return studyChatMapper.getMsgCount(paramVO);
	}

	@Override
	public void updateLast(StudyChatVO paramVO) {
		studyChatMapper.updateLast(paramVO);
	}

	@Override
	public int insertChat(StudyChatVO chatVO) {
		studyChatMapper.insertChat(chatVO);
		return studyChatMapper.getScNumAsRowNum(chatVO);
	}

	@Override
	public int getStuCount(int sNum) {
		return studyChatMapper.getStuCount(sNum);
	}

}
