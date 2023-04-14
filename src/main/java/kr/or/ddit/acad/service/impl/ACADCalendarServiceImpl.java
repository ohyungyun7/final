package kr.or.ddit.acad.service.impl;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.acad.service.IACADCalendarService;
import kr.or.ddit.mapper.ACADCalendarMapper;
import kr.or.ddit.vo.ACADCalendarVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ACADCalendarServiceImpl implements IACADCalendarService{

	@Autowired
	ACADCalendarMapper mapper;
	
	@Override
	public JSONArray acadDataList() {
		
		List<ACADCalendarVO> list = mapper.acadDataList();
		
		log.info("list " + list);
		
		JSONArray calArr = new JSONArray();
		
		for(ACADCalendarVO acVO : list) {
			calArr.add(makeJson(acVO));
		}
		
		return calArr;
	}
	

	@Override
	public int addEvent(ACADCalendarVO acVO) {
		
		int result = mapper.addEvent(acVO);
		
		return result;
	}
	
	@Override
	public int updateEvent(ACADCalendarVO acVO) {
		int result = mapper.updateEvent(acVO);
		return result;
	}
	
	
	private JSONObject makeJson(ACADCalendarVO acVO) {
		JSONObject data = new JSONObject();
		JSONObject calendar = new JSONObject();
		
		
		data.put("id", acVO.getId());
		data.put("title", acVO.getTitle());
		data.put("start", acVO.getStart());
		
		if(!acVO.getStart().equals(acVO.getEnd())) {
			String[] arr = acVO.getEnd().split("-");
			int day = Integer.parseInt(arr[2]) + 1;
			String end = arr[0] + "-" + arr[1] + "-" + day;
			data.put("end", end);
		}else {
			data.put("end", acVO.getEnd());
		}
		
//		data.put("end", acVO.getEnd());
		data.put("allDay", "false");
		data.put("username2", acVO.getUsername2());
		
		calendar.put("calendar", acVO.getCalendar());
		data.put("extendedProps", calendar);
		
		return data;
	}


	@Override
	public int removeEvent(ACADCalendarVO acVO) {
		return mapper.removeEvent(acVO);
	}


	@Override
	public List<ACADCalendarVO> getEventText(int month) {
		return mapper.getEventText(month);
	}



}
