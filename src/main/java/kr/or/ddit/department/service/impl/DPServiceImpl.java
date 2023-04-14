package kr.or.ddit.department.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.department.service.DPService;
import kr.or.ddit.mapper.DPMapper;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.TeacherVO;

@Service
public class DPServiceImpl implements DPService{

	@Autowired
	DPMapper dpMapper;

	@Override
	public List<DepartmentVO> deptList() {
		return dpMapper.deptList();
	}

	@Override
	public DepartmentVO deptNm(Map<String, Object> map) {
		return dpMapper.deptNm(map);
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		return dpMapper.getTotal(map);
	}

	@Override
	public List<DepartmentVO> getCollNm() {
		return dpMapper.getCollNm();
	}

	@Override
	public int deleteNum(Map<String, Object> map) {
		return dpMapper.deleteNum(map);
	}

	@Override
	public int createDeptNm(Map<String, Object> map) {
		return dpMapper.createDeptNm(map);
	}

	@Override
	public List<TeacherVO> getProNum(Map<String, Object> map2){
		return dpMapper.getProNum(map2);
	}

	@Override
	public int createCollNm(Map<String, Object> map) {
		return dpMapper.createCollNm(map);
	}

	@Override
	public DepartmentVO deptNum(Map<String, Object> map) {
		return dpMapper.deptNum(map);
	}

	@Override
	public int update(Map<String, Object> map) {
		return dpMapper.update(map);
	}


}
