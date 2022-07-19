package com.diet.biz.dietProgram;

import java.util.List;

public interface DietProgramService {
	
	// 사용자 스펙을 기반으로 한 기초대사량 계산
	double dietStep1(KcalVO vo);
	
	// 기초대사량에 근거한 칼로리 계산
	int dietStep2(KcalVO vo);
	
	// 영양소대로 칼로리 구성
	List<Integer> dietStep3(KcalVO vo);
	
	// 칼로리에 맞는 음릭 리스트 추천
	List<String> dietStep4(FoodVO vo);
}
