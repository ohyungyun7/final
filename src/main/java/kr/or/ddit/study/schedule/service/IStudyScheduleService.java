package kr.or.ddit.study.schedule.service;

import org.json.simple.JSONArray;

import kr.or.ddit.vo.StudyScheduleVO;

public interface IStudyScheduleService {

	public int addEvent(StudyScheduleVO ssVO);

	public JSONArray ssDataList(int roomNumber);

	public int updateEvent(StudyScheduleVO ssVO);

	public int removeEvent(StudyScheduleVO ssVO);


}
