package kr.or.ddit.study.chat.service;

import java.util.List;

import kr.or.ddit.vo.StudyChatVO;

public interface StudyChatService {

	// 전체 채팅 리스트
	public List<StudyChatVO> getChatList(StudyChatVO paramVO);

	// 첫 연결에 쌓인 채팅 알람 카운트
	public int getMsgCount(StudyChatVO paramVO);

	// 채팅창 오픈 시 읽은 채팅기록 업데이트
	public void updateLast(StudyChatVO paramVO);

	// 채팅 insert
	public int insertChat(StudyChatVO chatVO);

	public int getStuCount(int sNum);

}
