package kr.or.ddit.mypage.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.MypageMapper;
import kr.or.ddit.mypage.service.IAdmMypageService;
import kr.or.ddit.vo.AdminVO;
import kr.or.ddit.vo.UserVO;

@Service
public class AdmMypageServiceImpl implements IAdmMypageService{

	@Autowired
	MypageMapper mapper;

	@Override
	public AdminVO admInfo(int username) {
		return mapper.admInfo(username);
	}

	@Override
	public int admMypageUpdate(AdminVO admVO) {
		return mapper.admMypageUpdate(admVO);
	}

	@Override
	public int pwUpdate(UserVO userVO) {
		return mapper.pwUpdate(userVO);
	}

	@Override
	public List<Map<String, Integer>> statistics() {
		return mapper.statistics();
	}

	@Override
	public Map<String, Integer> mainInfo() {
		return mapper.mainInfo();
	}
}
