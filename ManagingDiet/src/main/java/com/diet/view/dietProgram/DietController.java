package com.diet.view.dietProgram;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.diet.biz.dietProgram.DietProgramService;
import com.diet.biz.dietProgram.DietProgramVO;

@Controller
public class DietController {
	@Autowired
	private DietProgramService dietProgramService;
	
	@RequestMapping(value = "/dietStep1.do")
	public String insertInfo(DietProgramVO vo, Model model) {
		model.addAttribute("bmr", dietProgramService.dietStep1(vo));
		System.out.println("다이어트 컨트롤러 발동!!!");
		System.out.println(dietProgramService.dietStep1(vo));
		return "dietStep2.jsp";
	}
	
}
