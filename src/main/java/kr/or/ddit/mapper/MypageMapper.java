package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AdminVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.TeacherVO;
import kr.or.ddit.vo.UserVO;

public interface MypageMapper {

	public StudentVO stuInfo(int username);

	public int stuMypageUpdate(StudentVO stuVO);

	public int pwUpdate(UserVO userVO);

	public TeacherVO teaInfo(int username);

	public int teaMypageUpdate(TeacherVO teaVO);

	public AdminVO admInfo(int username);

	public int admMypageUpdate(AdminVO admVO);

	public List<Map<String, Integer>> statistics();

	public Map<String, Integer> mainInfo();

	public Map<String, Integer> getCount(int teaNum);


}
