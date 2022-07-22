package com.diet.view.dietProgram;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.diet.biz.dietProgram.Criteria;
import com.diet.biz.dietProgram.DietProgramService;
import com.diet.biz.dietProgram.KcalVO;
import com.diet.biz.dietProgram.PageMakerDTO;
import com.diet.biz.dietProgram.UserDietVO;

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
	public String dietStep3(KcalVO vo, Model model, HttpSession session) {
		session.setAttribute("session", dietProgramService.dietStep3(vo));
		model.addAttribute("nutrients", dietProgramService.dietStep3(vo));
		System.out.println("dietStep3 발동!!!");
		System.out.println(dietProgramService.dietStep3(vo));
		return "dietStep4.jsp";
	}
	
	// 음식 추천 리스트 불러오기
	@RequestMapping("/dietStep4.do")
	public String dietStep4(KcalVO vo, Model model, Criteria cri) {
		model.addAttribute("foodList", dietProgramService.dietStep4(vo, cri));
		int totalFood = dietProgramService.getTotalFood(vo);
		PageMakerDTO pageMake = new PageMakerDTO(cri, totalFood);
		model.addAttribute("pageMaker", pageMake);
		System.out.println("dietStep4 발동!!!");
		return "dietStep5.jsp";
	}
	
	// 음식 리스트 DB에 넣기
	@RequestMapping("/insertFood.do")
	public String insertFood(UserDietVO vo) {
		dietProgramService.insertFood(vo);
		return "dietStep5.jsp";
	}
	
}
