package kr.or.ddit.vo;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import lombok.Data;

@Data
public class StudyScheduleVO {
	
	private int id;
	private int srNum;
	private int stuNum;
	private String title;
	private String description;
	private String start;
	private String end;
	private String calendar;
	private String allDay;
	
	private int ssKind;
	
	private String ssBground;
	
	public void setExtendedProps(Object extendedProps) {
		JsonParser jparser = new JsonParser();
		JsonElement jsonElement = jparser.parse(extendedProps.toString());
	    JsonObject jsonObject = jsonElement.getAsJsonObject();
	    this.calendar = jsonObject.get("calendar").getAsString();
	}

}

