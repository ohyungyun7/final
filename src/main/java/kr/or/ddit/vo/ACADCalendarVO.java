package kr.or.ddit.vo;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import lombok.Data;

@Data
public class ACADCalendarVO {
	
	// 일정 기본키
	public int id;
	
	// 일정 제목
	public String title;
	
	// 일정 시작날짜
	public String start;
	
	// 일정 종료날짜
	public String end;
	
	public String allDay;
	public String calendar;
	
	// empNum 저장
	public int username1;
	
	
	public int username2;

	public void setExtendedProps(Object extendedProps) {
		JsonParser jparser = new JsonParser();
		JsonElement jsonElement = jparser.parse(extendedProps.toString());
	    JsonObject jsonObject = jsonElement.getAsJsonObject();
	    this.calendar = jsonObject.get("calendar").getAsString();
	}	

}
