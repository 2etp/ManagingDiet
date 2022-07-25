package com.diet.biz.dietProgram.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.diet.biz.dietProgram.Criteria;
import com.diet.biz.dietProgram.DietProgramService;
import com.diet.biz.dietProgram.FoodVO;
import com.diet.biz.dietProgram.KcalVO;
import com.diet.biz.dietProgram.UserDietVO;

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
	public List<UserDietVO> getDietList(UserDietVO dietvo) {
		return dietProgramDAO.getDietList(dietvo);
	}

}
