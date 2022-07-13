package com.diet.biz.dietProgram.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.diet.biz.dietProgram.DietProgramVO;

@Repository
public class DietProgramDAOSpring {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// 사용자 스펙을 통한 칼로리 계산
	public double insertInfo(DietProgramVO vo) {
		System.out.println("===> 칼로리 계산 위한 스펙 넣기 성공");
		
		double bmr = 0;
		
		// 해리스 베네딕트 방정식 이용
		if(vo.getSex() == "남자") {
			bmr = 66 + (13.7 * vo.getWeight() + (5 * vo.getHeight()) - (6.8 * vo.getAge()));
			
		} else if(vo.getSex() == "여자") {
			bmr = 655 + (9.6 * vo.getWeight() + (1.7 * vo.getHeight()) - (4.7 * vo.getAge()));
		}
		
		return bmr;
	}
}
