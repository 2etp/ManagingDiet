package com.diet.biz.dietProgram.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import com.diet.biz.dietProgram.FoodVO;

public class GetFoodListRowMapper implements RowMapper<FoodVO> {
	public FoodVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		FoodVO foodList = new FoodVO();
		foodList.setFoodName(rs.getString("음식명"));
		foodList.setFoodCalorie(rs.getInt("1인분칼로리(kcal)"));
		foodList.setFoodCarbs(rs.getInt("탄수화물(g)"));
		foodList.setFoodProtein(rs.getInt("단백질(g)"));
		foodList.setFoodFat(rs.getInt("지방(g)"));
		foodList.setImgPath(rs.getString("이미지경로"));
		
		return foodList;
	}
}