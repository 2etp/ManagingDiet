package com.diet.view.dietProgram;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.diet.biz.dietProgram.DietProgramService;
import com.diet.biz.dietProgram.DietProgramVO;

@Controller
public class DietController {
	@Autowired
	private DietProgramService dietProgramService;
	
	@RequestMapping(value = "/insertInfo.do")
	public String insertInfo(DietProgramVO vo, Model model) {
		model.addAttribute("bmr", dietProgramService.insertInfo(vo));
		return "dietProgram1.do";
	}
}
