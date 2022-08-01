package com.diet.biz.dietProgram.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.diet.biz.dietProgram.Criteria;
import com.diet.biz.dietProgram.DietProgramService;
import com.diet.biz.dietProgram.FoodVO;
import com.diet.biz.dietProgram.KcalVO;
import com.diet.biz.dietProgram.StampVO;
import com.diet.biz.dietProgram.UserDietVO;
import com.diet.biz.user.UserVO;

@Service
public class DietProgramServiceImpl implements DietProgramService{
	@Autowired
	private DietProgramDAOSpring dietProgramDAO;

	@Override
	public double dietStep1(KcalVO vo) {
		return dietProgramDAO.dietStep1(vo);
	}
	
	public int dietStep2(KcalVO vo) {
		return dietProgramDAO.dietStep2(vo);
	}
	
	public List<Integer> dietStep3(KcalVO vo) {
		return dietProgramDAO.dietStep3(vo);
	}
	
	public List<FoodVO> dietStep4(KcalVO vo, Criteria cri) {
		return dietProgramDAO.dietStep4(vo, cri);
	}
	
	public int getTotalFood(KcalVO vo) {
		return dietProgramDAO.getTotalFood(vo);
	}
	
	// 유저가 선택한 음식 리스트 DB에 넣기
	public void insertFood(UserDietVO vo) {
		dietProgramDAO.insertFood(vo);
	}
	
	// 유저가 선택한 음식 리스트 수정하기
	public void updateFood(UserDietVO vo) {
		dietProgramDAO.updateFood(vo);
	}
	
	// tbldiet의 유저 정보 유무 확인하기
	public String getDietUser(UserDietVO vo) {
		return dietProgramDAO.getDietUser(vo);
	}
	
	// 유저가 선택한 음식 리스트 확인하기
	public String dietListChk(UserVO vo) {
		return dietProgramDAO.dietListChk(vo);
	}
	
	// 확인된 음식 리스트 화면에 출력
	public List<FoodVO> getDietList(String[] dietArr) {
		return dietProgramDAO.getDietList(dietArr);
	}

	// 달의 일수 구하기
	public int getLengthOfMon() {
		return dietProgramDAO.getLengthOfMon();
	}
	
	// 현재 달(월) 구하기
	public int getMonth() {
		return dietProgramDAO.getMonth();
	}
	
	// stamp_date 데이터 가져오기
	public List<StampVO> getStampDate() {
		return dietProgramDAO.getStampDate();
	}
	
	// 일일 미션 도장 찍기(월별 기록)
	public void monthlyStampMission(String stampCnt) {
		dietProgramDAO.monthlyStampMission(stampCnt);
	}
	
	// 일일 미션 도장 찍기(일일 기록)
	public void dailyStampMission() {
		dietProgramDAO.dailyStampMission();
	}
	
	
	// DB stampCnt 컬럼 가져오기
	public String getStampCnt() {
		return dietProgramDAO.getStampCnt();
	}
}
