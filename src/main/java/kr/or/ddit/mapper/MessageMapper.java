package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AdminVO;
import kr.or.ddit.vo.NoteVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.TeacherVO;
import kr.or.ddit.vo.UserVO;

public interface MessageMapper {

	/**
	 * 사용자가 받은 쪽지 목록 전체 불러오기
	 * @param userVO
	 * @return List<NoteVO>
	 */
	public List<NoteVO> getNoteList(UserVO userVO);

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
	 * 안 읽은 메시지 수 불러오기
	 * @param userVO
	 * @return Integer
	 */
	public int unReadMsgCount(UserVO userVO);
	/**
	 * 보낸 메시지 수 불러오기
	 * @param userVO
	 * @return Integer
	 */
	public int sendMsgCount(UserVO userVO);
	/**
	 * 받은 메시지 수 불러오기
	 * @param userVO
	 * @return Integer
	 */
	public int revMsgCount(UserVO userVO);
	/**
	 * 총 메시지 수 불러오기
	 * @param userVO
	 * @return int
	 */
	public int totalCount(UserVO userVO);

	/**
	 * 쪽지 보내기
	 * @param noteVO
	 * @return 성공 : 1, 실패 : 0
	 */
	public Object insertMsg(NoteVO noteVO);
	
	/**
	 * 편지 하나의 값 가져오기
	 * @param noteVO
	 * @return NoteVO
	 */
	public NoteVO getNote(NoteVO noteVO);

	/**
	 * 안 읽은 메시지 목록 가져오기
	 * @param parseInt
	 * @return List NoteVO
	 */
	public List<NoteVO> unreadList(int userId);

	/**
	 * 읽은 메시지 상태변경
	 * @param noteVO
	 * @return integer
	 */
	public int reading(NoteVO noteVO);
	
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
	 * 상태 변경
	 * 삭제한 내가 보낸 사람이었으면 5
	 * 삭제한 내가 받는 사람이었으면 6
	 * 삭제를 둘 다 했으면 9
	 * @param NoteVO
	 * @return integer
	 */
	public int changeStat(NoteVO noteVO);

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
