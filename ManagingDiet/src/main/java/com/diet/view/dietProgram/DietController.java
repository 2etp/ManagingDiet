package com.diet.view.dietProgram;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.diet.biz.dietProgram.Criteria;
import com.diet.biz.dietProgram.DietProgramService;
import com.diet.biz.dietProgram.KcalVO;
import com.diet.biz.dietProgram.PageMakerDTO;
import com.diet.biz.dietProgram.UserDietVO;
import com.diet.biz.user.UserVO;

@Controller
public class DietController {
	@Autowired
	private DietProgramService dietProgramService;
	
	@RequestMapping(value = "/index.do", method=RequestMethod.GET)
	public String index() {
		System.out.println("index 화면으로 이동...");
		return "index.jsp";
	}
	
	@RequestMapping("/dietStep1.do")
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
	public String dietStep2(KcalVO vo, Model model, HttpSession session) {
		session.setAttribute("kcal", dietProgramService.dietStep2(vo));
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
	
	// 유저가 선택한 음식 리스트 DB에 넣기
	@RequestMapping("/insertFood.do")
	public String insertFood(UserDietVO vo, RedirectAttributes redirectAttributes) {
		String result = dietProgramService.getDietUser(vo);
		System.out.println(dietProgramService.getDietUser(vo));
		if(result.equals(null)) {
			System.out.println("insertFood의 false");
			dietProgramService.insertFood(vo);
			redirectAttributes.addFlashAttribute("msg", "insertFood");
		} else if(!result.equals(null)) {
			System.out.println("insertFood의 true");
			dietProgramService.updateFood(vo);
			redirectAttributes.addFlashAttribute("msg", "updateFood");
		}
		return "redirect:index.do";
	}
	
	// 유저가 선택한 음식 리스트 확인하기
	@RequestMapping("/myDiet.do")
	public String getDietList(UserVO vo, Model model) {
		String dietChk = dietProgramService.dietListChk(vo);
		String[] dietArr = dietChk.split(",");
		System.out.println(Arrays.toString(dietArr));
		model.addAttribute("dietList", dietProgramService.getDietList(dietArr));
		System.out.println("컨트롤러 getDietList 발동!!!");
		return "myDiet.jsp";
	}
		
	// 일일 미션 체크 화면 보여주기
	@RequestMapping(value = "/stampMission.do", method=RequestMethod.GET)
	public String stampMissionView(Model model, HttpSession session) {
		session.setAttribute("lengthOfMon", dietProgramService.getLengthOfMon());
		//model.addAttribute("lengthOfMon", dietProgramService.getLengthOfMon());
		System.out.println("이번 달의 일수 :" + dietProgramService.getLengthOfMon());
		return "stampMission.jsp";
	}
	
	// 일일 미션 도장 찍기
	@RequestMapping(value = "/stampMission.do", method=RequestMethod.POST)
	public String stampMission() {
		dietProgramService.stampMission();
		return "stampMission.jsp";
	}
	
	// DB stampCnt 컬럼 가져오기
	@RequestMapping("/statistics.do")
	public String getStampCnt(Model model, HttpSession session) {
		session.setAttribute("lengthOfMon", dietProgramService.getLengthOfMon());
		model.addAttribute("stampCnt", dietProgramService.getStampCnt());
		return "statistics.jsp";
	}
}
