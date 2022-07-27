package com.diet.biz.user;

public interface UserService {
	
	// 로그인
	UserVO login(UserVO vo);
	
	// 회원가입
	void insertMember(UserVO vo);
}
