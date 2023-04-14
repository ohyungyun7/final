package kr.or.ddit.acad.service;

import java.util.List;

import org.json.simple.JSONArray;

import kr.or.ddit.vo.ACADCalendarVO;

public interface IACADCalendarService {

	public JSONArray acadDataList();

	public int addEvent(ACADCalendarVO acVO);

	public int updateEvent(ACADCalendarVO acVO);

	public int removeEvent(ACADCalendarVO acVO);

	public List<ACADCalendarVO> getEventText(int month);

}
