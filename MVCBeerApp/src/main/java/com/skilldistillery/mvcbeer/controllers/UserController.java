package com.skilldistillery.mvcbeer.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jpabeer.entities.User;

@Controller
public class UserController {
	@RequestMapping(path = "login.do", method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/views/login.jsp");
		return mv;
	}

	@RequestMapping(path = "loginUser.do", method = RequestMethod.GET)
	public ModelAndView loginUser(@RequestParam(name = "userName") String userName,
			@RequestParam(name = "password") String password, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		// Implement DAO to obtain user by username and password
		List<User> user = new ArrayList<>();
		if (user.size() > 0) {
			session.setAttribute("user", user);
			mv.setViewName("WEB-INF/views/profile.jsp");
		} else {
			String message = "Invalid Username and/or Password";
			mv.addObject("message", message);
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
}