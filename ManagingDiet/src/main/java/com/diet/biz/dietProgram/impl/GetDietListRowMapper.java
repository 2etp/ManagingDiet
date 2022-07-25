package com.diet.biz.dietProgram.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.diet.biz.dietProgram.UserDietVO;

public class GetDietListRowMapper implements RowMapper<UserDietVO> {
	public UserDietVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		UserDietVO dietList = new UserDietVO();
		dietList.setFood(rs.getString("food"));
		
		return dietList;
	}

}
