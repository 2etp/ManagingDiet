package com.diet.biz.user;

//VO(Value Object)
public class UserVO {
	private String id;
	private String password;
	private String name;
	private String mobile;
	private int stampCnt;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	public int getStampCnt() {
		return stampCnt;
	}

	public void setStampCnt(int stampCnt) {
		this.stampCnt = stampCnt;
	}

	@Override
	public String toString() {
		return "UserVO [id=" + id + ", password=" + password + ", name=" + name + ", mobile=" + mobile + ", stampCnt="
				+ stampCnt + "]";
	}
}