package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.BuildingVO;
import kr.or.ddit.vo.RoomVO;

public interface RoomMapper {
	
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
