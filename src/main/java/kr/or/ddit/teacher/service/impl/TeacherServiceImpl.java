package kr.or.ddit.teacher.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.employee.service.EmployeeService;
import kr.or.ddit.mapper.EmployeeMapper;
import kr.or.ddit.mapper.TeacherMapper;
import kr.or.ddit.teacher.service.TeacherService;
import kr.or.ddit.vo.AdminVO;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.TeacherVO;
import lombok.extern.slf4j.Slf4j;

@Service
public class TeacherServiceImpl implements TeacherService {

	@Autowired
	TeacherMapper teacherMapper;

	@Override
	public List<TeacherVO> proList(Map<String, Object> map) {
		return teacherMapper.proList(map);
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		return teacherMapper.getTotal(map);
	}

	@Override
	public TeacherVO teaNum(Map<String, Object> map) {
		return teacherMapper.teaNum(map);
	}

	@Override
	public int deleteTea(Map<String, Object> map) {
		return teacherMapper.deleteTea(map);
	}

	@Override
	public int deleteUsers(Map<String, Object> map) {
		return teacherMapper.deleteUsers(map);
	}

	@Override
	public int deleteAuth(Map<String, Object> map) {
		return teacherMapper.deleteAuth(map);
	}

	@Override
	public int getTeaNum() {
		return teacherMapper.getTeaNum();
	}

	@Override
	public int createPost(Map<String, Object> map) {
		return teacherMapper.createPost(map);
	}

	@Override
	public int createUsers() {
		return teacherMapper.createUsers();
	}

	@Override
	public int createAuth() {
		return teacherMapper.createAuth();
	}

	@Override
	public int updateTeacher(Map<String, Object> map) {
		return teacherMapper.updateTeacher(map);
	}

	@Override
	public List<DepartmentVO> getDepartMentNm() {
		return teacherMapper.getDepartMentNm();
	}

	@Override
	public List<TeacherVO> getTeacher() {
		return teacherMapper.getTeacher();
	}

	@Override
	public Map<String, Integer> total() {
		Map<String,Integer> map = new HashedMap();
		int res1 = teacherMapper.total();
		int res2 = teacherMapper.teaTitle();
		map.put("total", res1);
		map.put("teaTitle", res2);
		return map;
	}

	@Override
	public Map<String, Integer> totalEmp() {
		Map<String,Integer> map = new HashedMap();
		int res1 = teacherMapper.totalEmp();
		map.put("total",res1);
		return map;
	}



}
