package com.diet.biz.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.diet.biz.user.UserService;
import com.diet.biz.user.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAOSpring userDAO;

	// 로그인
	public UserVO login(UserVO vo) {
		return userDAO.login(vo);
	}
	
	// 회원가입
	public void insertMember(UserVO vo) {
		userDAO.insertMember(vo);
	}
}
