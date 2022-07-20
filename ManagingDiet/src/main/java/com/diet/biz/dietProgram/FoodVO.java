package com.diet.biz.dietProgram;

public class FoodVO {

	private String foodName;
	private int foodCalorie;
	private double foodCarbs;
	private double foodProtein;
	private double foodFat;
	
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public int getFoodCalorie() {
		return foodCalorie;
	}
	public void setFoodCalorie(int foodCalorie) {
		this.foodCalorie = foodCalorie;
	}
	public double getFoodCarbs() {
		return foodCarbs;
	}
	public void setFoodCarbs(double foodCarbs) {
		this.foodCarbs = foodCarbs;
	}
	public double getFoodProtein() {
		return foodProtein;
	}
	public void setFoodProtein(double foodProtein) {
		this.foodProtein = foodProtein;
	}
	public double getFoodFat() {
		return foodFat;
	}
	public void setFoodFat(double foodFat) {
		this.foodFat = foodFat;
	}
	
	@Override
	public String toString() {
		return "FoodVO [foodName=" + foodName + ", foodCalorie=" + foodCalorie + ", foodCarbs=" + foodCarbs
				+ ", foodProtein=" + foodProtein + ", foodFat=" + foodFat + "]";
	}
	
	
}
