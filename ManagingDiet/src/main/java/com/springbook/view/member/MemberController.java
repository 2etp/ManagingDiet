package com.springbook.view.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.springbook.biz.user.UserVO;
import com.springbook.biz.user.impl.UserDAO;

@Controller
public class MemberController {
	
	@RequestMapping(value= "/signup.do", method=RequestMethod.GET)
	public String signupView(UserVO vo) {
		System.out.println("회원가입 페이지로 이동...");
		return "signup.jsp";
	}
	
	@RequestMapping(value= "/signup.do", method=RequestMethod.POST)
	public String signup(UserVO vo, UserDAO userDAO,  RedirectAttributes redirectAttributes) {
		System.out.println("회원가입 인증 처리...");
		userDAO.insertMember(vo);
		redirectAttributes.addFlashAttribute("msg", "REGISTERED");
		return "redirect:login.do";
	}
}
