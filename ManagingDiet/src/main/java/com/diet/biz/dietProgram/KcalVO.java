package com.diet.biz.dietProgram;

public class KcalVO {
	
	private String type;
	private String sex;
	private int height;
	private int weight;
	private int age;
	private double bmr;
	private String activityAmount;
	private int kcal;
	private int carbs;
	private int protein;
	private int fat;
	
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public double getBmr() {
		return bmr;
	}
	public void setBmr(double bmr) {
		this.bmr = bmr;
	}
	public String getActivityAmount() {
		return activityAmount;
	}
	public void setActivityAmount(String activityAmount) {
		this.activityAmount = activityAmount;
	}
	public int getKcal() {
		return kcal;
	}
	public void setKcal(int kcal) {
		this.kcal = kcal;
	}
	public int getCarbs() {
		return carbs;
	}
	public void setCarbs(int carbs) {
		this.carbs = carbs;
	}
	public int getProtein() {
		return protein;
	}
	public void setProtein(int protein) {
		this.protein = protein;
	}
	public int getFat() {
		return fat;
	}
	public void setFat(int fat) {
		this.fat = fat;
	}
	
	@Override
	public String toString() {
		return "KcalVO [type=" + type + ", sex=" + sex + ", height=" + height + ", weight=" + weight + ", age=" + age
				+ ", bmr=" + bmr + ", activityAmount=" + activityAmount + ", kcal=" + kcal + ", carbs=" + carbs
				+ ", protein=" + protein + ", fat=" + fat + "]";
	}

	
	
}
