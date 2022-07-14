package com.diet.view.dietProgram;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.diet.biz.dietProgram.DietProgramService;
import com.diet.biz.dietProgram.KcalVO;

@Controller
public class DietController {
	@Autowired
	private DietProgramService dietProgramService;
	
	@RequestMapping(value = "/dietStep1.do")
	public String dietStep1(KcalVO vo, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", vo.getType());
		map.put("bmr", dietProgramService.dietStep1(vo));
		model.addAttribute("dietStep1", map);
		System.out.println("dietStep1 발동!!!");
		System.out.println(dietProgramService.dietStep1(vo));
		return "dietStep2.jsp";
	}
	
	@RequestMapping("/dietStep2.do")
	public String dietStep2(KcalVO vo, Model model) {
		model.addAttribute("kcal", dietProgramService.dietStep2(vo));
		System.out.println("dietStep2 발동!!!");
		System.out.println(dietProgramService.dietStep2(vo));
		return "dietStep3.jsp";	
	}
	
	@RequestMapping("/dietStep3.do")
	public String dietStep3(KcalVO vo, Model model) {
		model.addAttribute("nutrients", dietProgramService.dietStep3(vo));
		System.out.println("dietStep3 발동!!!");
		System.out.println(dietProgramService.dietStep3(vo));
		return "dietStep4.jsp";
	}
	
}
