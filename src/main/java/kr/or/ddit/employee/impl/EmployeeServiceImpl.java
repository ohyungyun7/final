package kr.or.ddit.employee.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.employee.service.EmployeeService;
import kr.or.ddit.mapper.EmployeeMapper;
import kr.or.ddit.vo.AdminVO;
import kr.or.ddit.vo.TeacherVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	EmployeeMapper employeeMapper;
	
//	@Override
//	public List<AdminVO> admList() {
//		return employeeMapper.admList();
//	}

	@Override
	public List<AdminVO> admList(Map<String, Object> map) {
		return employeeMapper.admList(map);
	}
	
	@Override
	public AdminVO empNum(Map<String, Object> map) {
		return employeeMapper.empNum(map);
	}

	@Override
	public int deleteNum(Map<String, Object> map) {
		return employeeMapper.deleteNum(map);
	}

	@Override
	public int updatePost(Map<String, Object> map) {
		return employeeMapper.updatePost(map);
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		return employeeMapper.getTotal(map);
	}

	@Override
	public int getEmpNum() {
		return employeeMapper.getEmpNum();
	}

	@Override
	public int createPost(Map<String, Object> map) {
		return employeeMapper.createPost(map);
	}

	@Override
	public int createUsers() {
		return employeeMapper.createUsers();
	}

	@Override
	public int createAuth() {
		return employeeMapper.createAuth();
	}

	@Override
	public int deleteUsers(Map<String, Object> map) {
		return employeeMapper.deleteUsers(map);
	}

	@Override
	public int deleteAuth(Map<String, Object> map) {
		return employeeMapper.deleteAuth(map);
	}


}
