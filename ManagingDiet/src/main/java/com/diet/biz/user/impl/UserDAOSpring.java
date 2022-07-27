package com.diet.biz.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.diet.biz.user.UserVO;

// DAO(Data Access Object)
@Repository
public class UserDAOSpring {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// SQL 명령어들
	private final String USER_GET = "select * from tblmember where id=? and password=?";
	private final String USER_INSERT = "insert tblmember(id, password, name, mobile) values(?, ?, ?, ?)";

	// 로그인 
	public UserVO login(UserVO vo) {
		try {	
			UserVO user = null;
			Object[] args = {vo.getId(), vo.getPassword()};
			user = jdbcTemplate.queryForObject(USER_GET, args, new UserRowMapper());
			return user;
			
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	// 회원가입
	public void insertMember(UserVO vo) {
		jdbcTemplate.update(USER_INSERT, vo.getId(), vo.getPassword(), vo.getName(), vo.getMobile());
	}
}