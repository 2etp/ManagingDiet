package com.diet.biz.user.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Repository;

import com.diet.biz.common.JDBCUtil;
import com.diet.biz.user.UserVO;

// DAO(Data Access Object)
@Repository("userDAO")
public class UserDAO {
	// JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	// SQL 명령어들
	private final String USER_GET = "select * from tblmember where id=? and password=?";
	private final String USER_INSERT = "insert tblmember(id, password, name, mobile) values(?, ?, ?, ?)";

	// CRUD 기능의 메소드 구현
	// 회원 등록
	public UserVO getUser(UserVO vo) {
		UserVO user = null;
		try {
			System.out.println("===> JDBC로 getUser() 기능 처리");
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_GET);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPassword());
			rs = stmt.executeQuery();
			if (rs.next()) {
				user = new UserVO();
				user.setId(rs.getString("id"));
				user.setPassword(rs.getString("password"));
				user.setName(rs.getString("name"));
				user.setMobile(rs.getString("mobile"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return user;
	}
	
	// 회원가입
	public boolean insertMember(UserVO vo) {
		boolean flag = false;
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_INSERT);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPassword());
			stmt.setString(3, vo.getName());
			stmt.setString(4, vo.getMobile());
			
			if(stmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return flag;
		
	}
}