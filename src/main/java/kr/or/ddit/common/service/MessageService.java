package kr.or.ddit.common.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AdminVO;
import kr.or.ddit.vo.NoteVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.TeacherVO;
import kr.or.ddit.vo.UserVO;

/**
 * @author PC-10
 *
 */
public interface MessageService {

	/**
	 * 사용자가 받은 쪽지 목록 전체 불러오기
	 * @param userVO
	 * @return List<NoteVO>
	 */
	public List<NoteVO> getNoteList(UserVO userVO);

	/**
	 * 받은 메시지 수, 보낸 메시지 수, 안 읽은 메시지 수 불러오기
	 * @param userVO
	 * @return Map T:String, V:Integer
	 */
	public Map<String, Integer> msgCount(UserVO userVO);

	/**
	 * 학생 목록 가져오기
	 * @return List StudentVO
	 */
	public List<StudentVO> stuList();

	/**
	 * 교수 목록 가져오기
	 * @return List TeacherVO
	 */
	public List<TeacherVO> teaList();

	/**
	 * 직원 목록 가져오기
	 * @return List AdminVO
	 */
	public List<AdminVO> empList();

	/**
	 * 쪽지 보내기
	 * @param noteVO
	 * @return 성공 : 1, 실패 : 0
	 */
	public int insertMsg(NoteVO noteVO);

	/**
	 * 편지 하나의 값 가져오기
	 * @param noteVO
	 * @return NoteVO
	 */
	public NoteVO getNote(NoteVO noteVO,int userId);

	/**
	 * 안 읽은 메시지 수 구하기
	 * @param userId
	 * @return integer
	 */
	public int countUnread(int userId);

	/**
	 * 안 읽은 메시지 목록 가져오기
	 * @param parseInt
	 * @return List NoteVO
	 */
	public List<NoteVO> unreadList(int userId);

	/**
	 * 받은 메시지 목록(ajax)
	 * @param parseInt
	 * @return List NoteVO 
	 */
	public List<NoteVO> revList(int userId);

	/**
	 * 보낸 메시지 목록(ajax)
	 * @param parseInt
	 * @return List NoteVO 
	 */
	public List<NoteVO> sendList(int userId);

	/**
	 * 삭제하기
	 * @param noteNum
	 * @param username
	 * @return int
	 */
	public int deleteMsg(int noteNum, int username);

	/**
	 * 삭제 메시지 목록(ajax)
	 * @param userId
	 * @return List NoteVO 
	 */
	public List<NoteVO> delList(int userId);

	/**
	 * 내게 쓴 메시지 목록
	 * @param userId
	 * @return List NoteVO
	 */
	public List<NoteVO> selfList(int userId); 

}
