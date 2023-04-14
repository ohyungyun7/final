package kr.or.ddit.mapper;

import java.util.Map;

import kr.or.ddit.vo.UserVO;

public interface fLoginMapper {

	public String getAuth(UserVO userVO);

	public UserVO getStudent(UserVO userVO);

	public UserVO getTeacher(UserVO userVO);

	public UserVO getAdmin(UserVO userVO);

	public String findId(Map<String, String> map);

	public int serachUser(Map<String, Object> map);

	public int pwUpdate(Map<String, Object> map);




}
