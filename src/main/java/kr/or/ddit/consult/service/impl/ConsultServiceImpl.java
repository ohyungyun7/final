package kr.or.ddit.consult.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.consult.service.ConsultService;
import kr.or.ddit.mapper.ConsultMapper;
import kr.or.ddit.vo.ConsultVO;
import kr.or.ddit.vo.TeacherVO;

@Service
public class ConsultServiceImpl implements ConsultService {

	@Autowired
	ConsultMapper consultMapper;
	
	@Override
	public List<TeacherVO> getTeaList(int deptNum) {
		return consultMapper.getTeaList(deptNum);
	}

	@Override
	public List<Map<String, Object>> getTimeTable(int teaNum) {
		return consultMapper.getTimeTable(teaNum);
	}

	@Override
	public List<Map<String, Object>> getConsultTime(int teaNum) {
		return consultMapper.getConsultTime(teaNum);
	}

	@Override
	public int appConsult(ConsultVO consultVO) {
		return consultMapper.appConsult(consultVO);
	}

	@Override
	public List<Map<String, Object>> getConsultList(int stuNum) {
		return consultMapper.getConsultList(stuNum);
	}

	@Override
	public int deleteConsult(int crNum) {
		return consultMapper.deleteConsult(crNum);
	}

	@Override
	public List<Map<String, Object>> getConsultListByTea(Map<String, Integer> param) {
		return consultMapper.getConsultListByTea(param);
	}

	@Override
	public int modifyConsult(ConsultVO consultVO) {
		return consultMapper.modifyConsult(consultVO);
	}

	@Override
	public List<Map<String, Object>> forMain(int stuNum) {
		return consultMapper.forMain(stuNum);
	}
	
}
