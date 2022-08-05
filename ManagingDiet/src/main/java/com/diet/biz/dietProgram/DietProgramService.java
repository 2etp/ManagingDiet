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
	
	// 칼로리에 앚는 음식 리스트 추천(수정하기 경로로)
	List<FoodVO> getFoodList(Criteria cri);
	
	/*
	 * // 유저의 칼로리 및 탄단지 가져오기 String getUserInfo();
	 */
	
	// 음식 총 개수
	int getTotalFood1(KcalVO vo);
	
	// 음식 총 개수(수정하기 경로로)
	int getTotalFood2();
	
	// 유저가 선택한 음식 리스트 DB에 넣기
	public void insertDiet(UserDietVO vo);
	
	// 유저가 선택한 음식 리스트 수정하기
	public void updateDiet(UserDietVO vo);
	
	// tbldiet의 유저 정보 유무 확인하기
	//public String getDietUser(UserDietVO vo);
	
	
	// 유저가 선택한 음식 리스트 확인하기
	public String dietListChk(UserVO vo);
	
	// 확인된 음식 리스트 화면에 출력
	List<FoodVO> getDietList(String[] dietArr);
	
	// 달의 일수 구하기
	int getLengthOfMon();
	
	// 현재 달(월) 구하기
	int getMonth();
	
	// stamp_date 데이터 가져오기
	List<StampVO> getStampDate();
	
	// stamp_date 데이터 중복확인
	int checkStampDate(String stampDate);
	
	// 일일 미션 도장 찍기(월별 기록)
	void monthlyStampMission(String stampCnt);
	
	// 일일 미션 도장 찍기(일일 기록)
	void dailyStampMission(String stampDate);
	
	// DB stampCnt 컬럼 가져오기
	String getStampCnt();

}
