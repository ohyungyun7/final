package kr.or.ddit.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value = "readCountVO")
public class ReadCountVO {
	private int plus;
	private int sCount;
	private int stuCount;
	
	public int getSCount() {
		return sCount;
	}
	public void setSCount(int sCount) {
		this.sCount = sCount;
	}
	
}
