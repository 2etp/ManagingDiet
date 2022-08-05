package com.diet.view.dietProgram;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
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
		int totalFood = dietProgramService.getTotalFood1(vo);
		PageMakerDTO pageMake = new PageMakerDTO(cri, totalFood);
		model.addAttribute("pageMaker", pageMake);
		System.out.println("dietStep4 발동!!!");
		return "dietStep5.jsp";
	}
	
	// 유저가 선택한 음식 리스트 DB에 넣기
	@RequestMapping("/insertFood.do")
	public String insertDiet(UserDietVO vo, RedirectAttributes redirectAttributes) {
		dietProgramService.insertDiet(vo);
		redirectAttributes.addFlashAttribute("msg", "insertDiet");
		return "redirect:index.do";
	}
	
	// 식단 수정페이지로 이동하기
	@RequestMapping(value="/updateDiet.do", method=RequestMethod.GET)
	public String updateDietView(Model model, Criteria cri, HttpServletRequest request) {
		String food = request.getParameter("food");
		String[] foodArr = food.split(",");
		//System.out.println(Arrays.toString(foodArr));
		model.addAttribute("foodArr", foodArr);
		model.addAttribute("foodList", dietProgramService.getFoodList(cri));
		int totalFood = dietProgramService.getTotalFood2();
		PageMakerDTO pageMake = new PageMakerDTO(cri, totalFood);
		model.addAttribute("pageMaker", pageMake);
		return "updateDiet.jsp";
	}
	
	// 식단 수정하기
	@RequestMapping(value="/updateDiet.do", method=RequestMethod.POST)
	public String updateDiet(UserDietVO vo, RedirectAttributes redirectAttributes) {
		dietProgramService.updateDiet(vo);
		redirectAttributes.addFlashAttribute("msg", "updateDiet");
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
	@RequestMapping(value="/stampMission.do", method=RequestMethod.GET)
	 public String stampMissionView(Model model, HttpSession session) {
		 session.setAttribute("lengthOfMon", dietProgramService.getLengthOfMon());
		 model.addAttribute("stampDate", dietProgramService.getStampDate());
		 
		 return "stampMission.jsp"; 
	}
	 
	// 일일 미션 도장 찍기
	@RequestMapping(value="/stampMission.do", method=RequestMethod.POST)
	@ResponseBody
	public int StampMission(Model model, @RequestParam Map<String, Object> param) {
		String stampDate = (String) param.get("parsedDate");
		// DB의 stampCnt 데이터를 가져와서 String 배열로 변환
		String[] stringArr = dietProgramService.getStampCnt().split(",");
		// stringArr 배열을 int형 배열로 변환
		int[] intArr = Arrays.stream(stringArr).mapToInt(Integer::parseInt).toArray();
		int monthValue = dietProgramService.getMonth();
		// intArr 배열 중 현재 달에 해당되는 인덱스 값 +1 하기
		intArr[monthValue-1] += 1;
		// intArr을 다시 문자열로 변환
		String stampCnt = Arrays.toString(intArr).replace(", ",",").replace("[","").replace("]","");
		int flag = dietProgramService.checkStampDate(stampDate);
		if(flag == 0) {			
			dietProgramService.monthlyStampMission(stampCnt);
			dietProgramService.dailyStampMission(stampDate);
		}
		return flag;
	}
	
	// DB stampCnt 컬럼 가져오기
	@RequestMapping("/statistics.do")
	public String getStampCnt(Model model) {
		String[] stringArr = dietProgramService.getStampCnt().split(",");
		int[] intArr = Arrays.stream(stringArr).mapToInt(Integer::parseInt).toArray();
		int monthValue = dietProgramService.getMonth();
		model.addAttribute("stampCnt", intArr);
		model.addAttribute("thisMonthCnt", intArr[monthValue-1]);
		model.addAttribute("lengthOfMon", dietProgramService.getLengthOfMon());
		return "statistics.jsp";
	}
}
