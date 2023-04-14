package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.ACADCalendarVO;

public interface ACADCalendarMapper {

	public List<ACADCalendarVO> acadDataList();

	public int addEvent(ACADCalendarVO acVO);

	public int updateEvent(ACADCalendarVO acVO);

	public int removeEvent(ACADCalendarVO acVO);

	public List<ACADCalendarVO> getEventText(int month);
	
}









