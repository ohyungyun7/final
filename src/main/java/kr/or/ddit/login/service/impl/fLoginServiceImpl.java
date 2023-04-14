package kr.or.ddit.login.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.login.service.fLoginService;
import kr.or.ddit.mapper.fLoginMapper;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class fLoginServiceImpl implements fLoginService {

	@Autowired
	fLoginMapper loginMapper;

	@Override
	public String getAuth(UserVO userVO) {
		return loginMapper.getAuth(userVO);
	}

	@Override
	public UserVO getStudent(UserVO userVO) {
		return loginMapper.getStudent(userVO);
	}

	@Override
	public UserVO getTeacher(UserVO userVO) {
		return loginMapper.getTeacher(userVO);
	}

	@Override
	public UserVO getAdmin(UserVO userVO) {
		return loginMapper.getAdmin(userVO);
	}

	@Override
	public String findId(Map<String, String> map) {
		
		String username = loginMapper.findId(map);
		if(username == null || username.equals("")) {
			return "x";
		}else {
			return loginMapper.findId(map);
		}
	}

	@Override
	public int serachUser(Map<String, Object> map) {
		return loginMapper.serachUser(map);
	}

	@Override
	public int pwUpdate(Map<String, Object> map) {
		return loginMapper.pwUpdate(map);
	}

}
