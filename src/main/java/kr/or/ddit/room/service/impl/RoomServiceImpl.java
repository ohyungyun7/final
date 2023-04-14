package kr.or.ddit.room.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.RoomMapper;
import kr.or.ddit.room.service.RoomService;
import kr.or.ddit.vo.BuildingVO;
import kr.or.ddit.vo.RoomVO;

@Service
public class RoomServiceImpl implements RoomService {
	
	@Autowired
	RoomMapper roomMapper;

	@Override
	public List<RoomVO> getList() {
		return roomMapper.getList();
	}

	@Override
	public List<BuildingVO> getBldgList() {
		return roomMapper.getBldgList();
	}

}
