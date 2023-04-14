package kr.or.ddit.mypage.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AdminVO;
import kr.or.ddit.vo.UserVO;

public interface IAdmMypageService {

	public AdminVO admInfo(int username);

	public int admMypageUpdate(AdminVO admVO);

	public int pwUpdate(UserVO userVO);

	public List<Map<String, Integer>> statistics();

	public Map<String, Integer> mainInfo();

}
