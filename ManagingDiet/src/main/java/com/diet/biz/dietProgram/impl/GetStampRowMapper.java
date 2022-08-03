package com.diet.biz.dietProgram.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.diet.biz.dietProgram.StampVO;

public class GetStampRowMapper implements RowMapper<StampVO> {
	public StampVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		StampVO stampList = new StampVO();
		stampList.setStampDate(rs.getString("stamp_date"));
	
		return stampList;
	}

}
