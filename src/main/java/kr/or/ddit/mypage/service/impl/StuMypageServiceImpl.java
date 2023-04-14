package kr.or.ddit.mypage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.MypageMapper;
import kr.or.ddit.mypage.service.IStuMypageService;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class StuMypageServiceImpl implements IStuMypageService{
	
	@Autowired
	MypageMapper mapper;
	
	@Override
	public StudentVO stuInfo(int username) {
		return mapper.stuInfo(username);
	}

	@Override
	public int stuMypageUpdate(StudentVO stuVO) {
		return mapper.stuMypageUpdate(stuVO);
	}

	@Override
	public int pwUpdate(UserVO userVO) {
		return mapper.pwUpdate(userVO);
	}

}
