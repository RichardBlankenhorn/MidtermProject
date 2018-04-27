package com.skilldistillery.mvcbeer.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jpabeer.entities.User;
import com.skilldistillery.mvcbeer.data.UserDAO;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO dao;
	
	@RequestMapping(path = "login.do", method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/views/login.jsp");
		return mv;
	}

	@RequestMapping(path = "loginUser.do", method = RequestMethod.GET)
	public ModelAndView loginUser(@RequestParam(name = "username") String username,
			@RequestParam(name = "password") String password, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		// Implement DAO to obtain user by username and password
		User u = dao.retrieveByUsername(username);
		if (u != null && u.getPassword().equals(password)) {
			session.setAttribute("user", u);
			mv.setViewName("WEB-INF/views/profile.jsp");
		}
		else {
			mv.addObject("failed", "Invalid credentials");
			mv.setViewName("WEB-INF/views/login.jsp");
			
		}
		return mv;
	}

	@RequestMapping(path = "logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		session.removeAttribute("user");
		mv.setViewName("WEB-INF/views/index.jsp");
		return mv;
	}

	@RequestMapping(path = "createAccount.do", method = RequestMethod.POST)
	public ModelAndView createAccount(@RequestParam(name = "username") String username,
			@RequestParam(name = "password") String password) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", username);
		mv.setViewName("WEB-INF/views/accountCreated.jsp");

		return mv;
	}

}
