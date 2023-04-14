package kr.or.ddit.room.service;

import java.util.List;

import kr.or.ddit.vo.BuildingVO;
import kr.or.ddit.vo.RoomVO;

public interface RoomService {

	/**
	 * 시설 목록
	 * @return List RoomVO
	 */
	public List<RoomVO> getList();

	/**
	 * 건물 목록
	 * @return List BuildingVO
	 */
	public List<BuildingVO> getBldgList();

}
