package kr.or.ddit.mypage.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.MypageMapper;
import kr.or.ddit.mypage.service.ITeaMypageService;
import kr.or.ddit.vo.TeacherVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class TeaMypageServiceImpl implements ITeaMypageService{

	@Autowired
	MypageMapper mapper;

	@Override
	public TeacherVO teaInfo(int username) {
		return mapper.teaInfo(username);
	}

	@Override
	public int teaMypageUpdate(TeacherVO teaVO) {
		return mapper.teaMypageUpdate(teaVO);
	}

	@Override
	public int pwUpdate(UserVO userVO) {
		return mapper.pwUpdate(userVO);
	}

	@Override
	public Map<String, Integer> getCount(int teaNum) {
		return mapper.getCount(teaNum);
	}
}
