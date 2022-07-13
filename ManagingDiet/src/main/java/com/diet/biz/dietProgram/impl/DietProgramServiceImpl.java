package com.diet.biz.dietProgram.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.diet.biz.dietProgram.DietProgramService;
import com.diet.biz.dietProgram.DietProgramVO;

@Service
public class DietProgramServiceImpl implements DietProgramService{
	@Autowired
	private DietProgramDAOSpring dietProgramDAO;

	@Override
	public double insertInfo(DietProgramVO vo) {
		return dietProgramDAO.insertInfo(vo);
		
	}

}