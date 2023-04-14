package kr.or.ddit.vo;

import lombok.Data;

@Data
public class RoomVO {
	private String roomCode;		//룸 코드
	private String buildingCode;	//건물코드
	private int roomFlr;			//층
	private int roomCapacity;		//수용인원
	private String roomLect;		//호수 ROOM_LECT
	private String roomPhoto;		//사진

	private String buildingName;	//건물 이름
}
