package com.diet.biz.dietProgram;

import java.util.List;

import com.diet.biz.user.UserVO;

public interface DietProgramService {
	
	// 사용자 스펙을 기반으로 한 기초대사량 계산
	double dietStep1(KcalVO vo);
	
	// 기초대사량에 근거한 칼로리 계산
	int dietStep2(KcalVO vo);
	
	// 영양소대로 칼로리 구성(g으로 환산)
	List<Integer> dietStep3(KcalVO vo);
	
	// 칼로리에 맞는 음릭 리스트 추천
	List<FoodVO> dietStep4(KcalVO vo, Criteria cri);
	
	// 음식 총 개수
	public int getTotalFood(KcalVO vo);
	
	// 유저가 선택한 음식 리스트 DB에 넣기
	public void insertFood(UserDietVO vo);
	
	// 유저가 선택한 음식 리스트 수정하기
	public void updateFood(UserDietVO vo);
	
	// tbldiet의 유저 정보 유무 확인하기
	public String getDietUser(UserDietVO vo);
	
	// 유저가 선택한 음식 리스트 확인하기
	public String getDietList(UserVO vo);

}
