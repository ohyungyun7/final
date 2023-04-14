package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.StudyScheduleVO;

public interface StudyScheduleMapper {

	public int addEvent(StudyScheduleVO ssVO);

	public List<StudyScheduleVO> ssDataList(int roomNumber);

	public int updateEvent(StudyScheduleVO ssVO);

	public int removeEvent(StudyScheduleVO ssVO);

}
