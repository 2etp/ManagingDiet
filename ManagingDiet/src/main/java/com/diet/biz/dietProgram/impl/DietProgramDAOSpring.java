package com.diet.biz.dietProgram.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.diet.biz.dietProgram.KcalVO;

@Repository
public class DietProgramDAOSpring {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// 사용자 스펙을 통한 기초대사량 계산
	public double dietStep1(KcalVO vo) {
		
		double bmr = 0;
		
		// 해리스 베네딕트 방정식 이용
		if(vo.getSex().equals("남")) {
			bmr = 66 + (13.7 * vo.getWeight() + (5 * vo.getHeight()) - (6.8 * vo.getAge()));
			System.out.println("남자용 방적식 결과");
			
		} else if(vo.getSex().equals("여")) {
			bmr = 655 + (9.6 * vo.getWeight() + (1.7 * vo.getHeight()) - (4.7 * vo.getAge()));
			System.out.println("여자용 방적식 결과");
		}
		
		return bmr;
	}
	
	// 기초대사량에 근거한 칼로리 계산
	public int dietStep2(KcalVO vo) {
		
		int kcal = 0;
		
		if(vo.getType().equals("diet")) {
			
			switch(vo.getActivityAmount()) {
				case "few":
					kcal = (int) Math.round(vo.getBmr() * 1.2 * 0.8);
					break;
				case "aFew":
					kcal = (int) Math.round(vo.getBmr() * 1.375 * 0.8);
					break;
				case "normal":
					kcal = (int) Math.round(vo.getBmr() * 1.55 * 0.8);
					break;
				case "quite":
					kcal = (int) Math.round(vo.getBmr() * 1.725 * 0.8);
					break;
				case "aLot":
					kcal = (int) Math.round(vo.getBmr() * 1.9 * 0.8);
					break;
				}
			
		} else if(vo.getType().equals("bulkup")) {
			
			switch(vo.getActivityAmount()) {
				case "few":
					kcal = (int) Math.round(vo.getBmr() * 1.2 * 1.2);
					break;
				case "aFew":
					kcal = (int) Math.round(vo.getBmr() * 1.375 * 1.2);
					break;
				case "normal":
					kcal = (int) Math.round(vo.getBmr() * 1.55 * 1.2);
					break;
				case "quite":
					kcal = (int) Math.round(vo.getBmr() * 1.725 * 1.2);
					break;
				case "aLot":
					kcal = (int) Math.round(vo.getBmr() * 1.9 * 1.2);
					break;
				}
		}
		
		return kcal;				
	}
	
	// 영양소에 맞는 칼로리 구성
	public List<Integer> dietStep3(KcalVO vo) {
		
		ArrayList<Integer> list = new ArrayList<Integer>();
		int carbs = 0;
		int protein = 0;
		int fat = 0;
		
		carbs = (int)Math.round(vo.getKcal() * 0.5);
		protein = (int)Math.round(vo.getKcal() * 0.3);
		fat = (int)Math.round(vo.getKcal() * 0.2);
		
		list.add(carbs);
		list.add(protein);
		list.add(fat);
		
		return list;
	}
}
