package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.ReadCountVO;
import kr.or.ddit.vo.StudyChatVO;

public interface StudyChatMapper {

	//  채팅 전체 리스트
	public List<StudyChatVO> getChatList(StudyChatVO paramVO);

	// 채팅 안읽은 사람 카운트
	public List<ReadCountVO> readCount(StudyChatVO paramVO);

	public int getMsgCount(StudyChatVO paramVO);

	public void updateLast(StudyChatVO paramVO);

	public void insertChat(StudyChatVO chatVO);

	public int getStuCount(int sNum);

	public int getScNumAsRowNum(StudyChatVO chatVO);

}
