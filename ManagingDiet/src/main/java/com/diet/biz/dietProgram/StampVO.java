package com.diet.biz.dietProgram;

public class StampVO {

	private int stampNum;
	private String id;
	private String stampDate;
	
	public int getStampNum() {
		return stampNum;
	}
	public void setStampNum(int stampNum) {
		this.stampNum = stampNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStampDate() {
		return stampDate;
	}
	public void setStampDate(String stampDate) {
		this.stampDate = stampDate;
	}
	
	@Override
	public String toString() {
		return "StampVO [stampNum=" + stampNum + ", id=" + id + ", stampDate=" + stampDate + "]";
	}
}
