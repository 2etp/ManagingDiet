package com.diet.biz.dietProgram;

public class UserDietVO {
	
	private String id;
	private String food;
	private String regdate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFood() {
		return food;
	}
	public void setFood(String food) {
		this.food = food;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "UserDietVO [id=" + id + ", food=" + food + ", regdate=" + regdate + "]";
	}
}
