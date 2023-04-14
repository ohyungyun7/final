package kr.or.ddit.mypage.service;

import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.UserVO;

public interface IStuMypageService {

	public StudentVO stuInfo(int username);

	public int stuMypageUpdate(StudentVO stuVO);

	public int pwUpdate(UserVO userVO);

}
