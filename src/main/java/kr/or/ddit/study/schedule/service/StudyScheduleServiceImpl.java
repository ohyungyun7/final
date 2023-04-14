package kr.or.ddit.study.schedule.service;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.StudyScheduleMapper;
import kr.or.ddit.vo.StudyScheduleVO;

@Service
public class StudyScheduleServiceImpl implements IStudyScheduleService{
	
	@Autowired
	StudyScheduleMapper mapper;

	@Override
	public int addEvent(StudyScheduleVO ssVO) {
		return mapper.addEvent(ssVO);
	}

	@Override
	public JSONArray ssDataList(int roomNumber) {
		
		List<StudyScheduleVO> list = mapper.ssDataList(roomNumber);
		
		JSONArray ssArr = new JSONArray();
		
		for(StudyScheduleVO VO : list) {
			ssArr.add(makeJson(VO));
		}
		
		return ssArr;
	}
	
	private JSONObject makeJson(StudyScheduleVO ssVO) {
		JSONObject data = new JSONObject();
		JSONObject calendar = new JSONObject();
		
		
		data.put("id", ssVO.getId());
		data.put("srNum", ssVO.getSrNum());
		data.put("stuNum", ssVO.getStuNum());
		data.put("title", ssVO.getTitle());
		data.put("description", ssVO.getDescription());
		data.put("start", ssVO.getStart());
		data.put("end", ssVO.getEnd());
		if(ssVO.getAllDay().equals("false")) {
			data.put("allDay", false);
		}else {
			data.put("allDay", true);
		}
		calendar.put("calendar", ssVO.getCalendar());
		data.put("extendedProps", calendar);
		
		return data;
	}

	@Override
	public int updateEvent(StudyScheduleVO ssVO) {
		return mapper.updateEvent(ssVO);
	}

	@Override
	public int removeEvent(StudyScheduleVO ssVO) {
		return mapper.removeEvent(ssVO);
	}

}
