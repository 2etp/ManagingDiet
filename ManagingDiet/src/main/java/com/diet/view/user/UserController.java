package com.diet.view.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.diet.biz.user.UserService;
import com.diet.biz.user.UserVO;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping(value=	"/login.do", method=RequestMethod.GET)
	public String loginView(UserVO vo) {
		System.out.println("로그인 화면으로 이동...");
		return "login.jsp";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(UserVO vo, HttpSession session){
		session.setAttribute("idKey", userService.login(vo));
		System.out.println("로그인 인증 처리...");
		if(userService.login(vo) != null) return "index.jsp";
		else return "login.jsp";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login.jsp";
	}
	
	@RequestMapping(value= "/signup.do", method=RequestMethod.GET)
	public String signupView(UserVO vo) {
		System.out.println("회원가입 페이지로 이동...");
		return "signup.jsp";
	}
	
	@RequestMapping(value= "/signup.do", method=RequestMethod.POST)
	public String signup(UserVO vo, RedirectAttributes redirectAttributes) {
		System.out.println("회원가입 인증 처리...");
		userService.insertMember(vo);
		redirectAttributes.addFlashAttribute("msg", "REGISTERED");
		return "redirect:login.do";
	}
}
