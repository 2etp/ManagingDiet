package com.diet.biz.dietProgram;

public class UserDietVO {
	
	private String id;
	private String breakfast;
	private String lunch;
	private String dinner;
	private String regdate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBreakfast() {
		return breakfast;
	}
	public void setBreakfast(String breakfast) {
		this.breakfast = breakfast;
	}
	public String getLunch() {
		return lunch;
	}
	public void setLunch(String lunch) {
		this.lunch = lunch;
	}
	public String getDinner() {
		return dinner;
	}
	public void setDinner(String dinner) {
		this.dinner = dinner;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "UserDietVO [id=" + id + ", breakfast=" + breakfast + ", lunch=" + lunch + ", dinner=" + dinner
				+ ", regdate=" + regdate + "]";
	}
	
}
