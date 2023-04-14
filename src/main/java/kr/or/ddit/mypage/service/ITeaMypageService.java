package kr.or.ddit.mypage.service;

import java.util.Map;

import kr.or.ddit.vo.TeacherVO;
import kr.or.ddit.vo.UserVO;

public interface ITeaMypageService {

	public TeacherVO teaInfo(int username);

	public int teaMypageUpdate(TeacherVO teaVO);

	public int pwUpdate(UserVO userVO);

	public Map<String, Integer> getCount(int teaNum);

}
