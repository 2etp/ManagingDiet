/*
 * package com.diet.view.user;
 * 
 * import javax.servlet.http.HttpSession;
 * 
 * import org.springframework.stereotype.Controller; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestMethod;
 * 
 * import com.diet.biz.user.UserVO; import com.diet.biz.user.impl.UserDAOSpring;
 * 
 * @Controller public class LoginController {
 * 
 * @RequestMapping(value= "/login.do", method=RequestMethod.GET) public String
 * loginView(UserVO vo) { System.out.println("로그인 화면으로 이동..."); return
 * "login.jsp"; }
 * 
 * @RequestMapping(value="/login.do", method=RequestMethod.POST) public String
 * login(UserVO vo, UserDAOSpring userDAO, HttpSession session){
 * session.setAttribute("idKey", userDAO.getUser(vo));
 * System.out.println("로그인 인증 처리..."); if(userDAO.getUser(vo) != null) return
 * "index.jsp"; else return "login.jsp"; } }
 */