package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ConsultVO;
import kr.or.ddit.vo.TeacherVO;

public interface ConsultMapper {

	public List<TeacherVO> getTeaList(int deptNum);

	public List<Map<String, Object>> getTimeTable(int teaNum);

	public List<Map<String, Object>> getConsultTime(int teaNum);

	public int appConsult(ConsultVO consultVO);

	public List<Map<String, Object>> getConsultList(int stuNum);

	public int deleteConsult(int crNum);

	public List<Map<String, Object>> getConsultListByTea(Map<String, Integer> param);

	public int modifyConsult(ConsultVO consultVO);

	public List<Map<String, Object>> forMain(int stuNum);

}
